Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1629C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 15:10:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.18298.1724425807338145215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 08:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dd56/TGD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42809d6e719so16281605e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724425806; x=1725030606; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3EYkbqKfN4QbVS5ZB/6rWT4AU+7bsL8UJDDbwMr5cAE=;
        b=dd56/TGDTMfMF97S18rLauSuPZ1srEvvQD5+1jmwI9l+EhMZwq0SE3LmrIXZTp8Wh6
         Z3G2p11HHVk3chLvFdUPKpl+4Ie9wVodj959xOnGm4KjOESXdjRFZTXamKhMQmmP0rQ2
         iSF44QZLNXAlGPn6UV61fCj4Mu3+SRNsP31nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724425806; x=1725030606;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3EYkbqKfN4QbVS5ZB/6rWT4AU+7bsL8UJDDbwMr5cAE=;
        b=Etw8iD+rI8aEYLD7b49YR6I4yC4Blry/71yXY7b4Fd07sv1RK3J4mXdiZqbX2H0bh/
         fR8Bno6hs7s4VsLJXQP4uaWK4lQrSzHZ0+0jg4n1AAqyuUeffsd6hTlFtYZOYg/N/AfS
         QeZK2PTy5A95mQqGoic289RXXPCUY3eDVATlD7t8K+q7qfFLU9zVIZVlSpyWF/LjyU5t
         kumYoEbNm+BVE65SgcoNfEN6eXtmkr3NHJRI4lsVsrCuGUNUjR3ZIXLydf3HD1EJn7t6
         Mxan6GoBUQvLEGOW3clVq9e6x6vPcXWNXIpynnR/u3H436XLbpUDD69xqn1JAZ9pmEaB
         bzHQ==
X-Gm-Message-State: AOJu0YxXN5ePg0OcRqJfUWd7vrKPg6g3TDrc+daFe+K/arkMby/WfP00
	Wj12LWfnwWyyqhiJ60PmTBfTq+tAxtHxwku03E3/ElDgAANFwH1srMKo8NGpC0Y=
X-Google-Smtp-Source: AGHT+IGmJD2GKHnGAJH+oABulRdhfyMOkQiI9r4epRLdlvqLp/92rgJYZ48WXuucV53+xu+clV3lQQ==
X-Received: by 2002:a05:600c:a0b:b0:427:dac4:d36 with SMTP id 5b1f17b1804b1-42acc8d0708mr16389655e9.7.1724425805560;
        Fri, 23 Aug 2024 08:10:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842? ([2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee86c8dsm99125135e9.19.2024.08.23.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:10:05 -0700 (PDT)
Message-ID: <226598c32fe28888b7b16dc9c45d32144e9ee817.camel@linuxfoundation.org>
Subject: Re: [OE-core][REQUEST FOR ASSISTANCE][PATCH] piglit: upgrade
 22eaf6a91c -> c11c9374c1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2024 16:10:04 +0100
In-Reply-To: <1e39fa29-7d54-436c-b48c-c9b3a389c67b@baylibre.com>
References: <20240822151804.4152305-1-tgamblin@baylibre.com>
	 <CANNYZj_AoQaEXkVQ3CC0zyZhZK3TZzrg_9DQT8i_HQ=ShwdrrA@mail.gmail.com>
	 <1e39fa29-7d54-436c-b48c-c9b3a389c67b@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 15:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203694

On Fri, 2024-08-23 at 10:18 -0400, Trevor Gamblin via
lists.openembedded.org wrote:
>=20
> On 2024-08-23 9:51 a.m., Alexander Kanavin wrote:
> > I just sent a patch that addresses the wayland-scanner problem
> > (marked
> > RFC as it depends on your patch applied first). Does the problem
> > and
> > the fix make sense to you?
> Thanks for sending that out. It's actually not clear to me why there=20
> isn't a need to tweak a variable or something to tell it to look at
> the=20
> native sysroot version of wayland-scanner. I'm guessing that=20
> `set(WaylandScannerPath wayland-scanner)` is picking up a path in the
> build environment?
>=20

bitbake.conf puts the native sysroot in PATH so we can rely on that to
be picked up from there as it will be set like that in the build
environment.

Cheers,

Richard

