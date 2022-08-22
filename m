Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27AEC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 11:19:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.16900.1661167141239347965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 04:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eJve0/SF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso5813330wmb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=pZjXftMJwzxrcctOfYJawsCw2LYkR1a5BWGDiuUZVCg=;
        b=eJve0/SFnYVDBmK8ZCcTpWvnwvXdEK33lvLRWNIcmTLZpN2HR2SLgCRtTlAAnF9wK7
         n408/6Iz4rfMFoBPycb4y0ilbxHEh6SjOEu9PK7gQd05GxHBat4MITduWtP4xrO2nuim
         8iLKOHgHj+KQQ6LUnrto0u2ag2zqyTYCBpmM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=pZjXftMJwzxrcctOfYJawsCw2LYkR1a5BWGDiuUZVCg=;
        b=Da32+lp905z7pGuW/UOcaeEu6RdYUwp8/Rpf3/RjkqI4Cmtjbq47vA6AUq3u+oaHJc
         PVvWAtqO517Ye4jGK6eHOj8n+qMlKGUOMyqHaitIlXWe2CRZXZEN9AO4qnDk5UfW/Fh6
         eRFymhv5krbS8VnpKh32vX81SjHW6w/7DvQbwKqDDFcrbPyJSeioxiRFjEvfE5ZNQk1W
         yvWlaV1kmG4n9qEW1HKdcunSwA4cV1ywA/BJcR4LZFlpz2wxCkbZ68hFf9zSrcs4vTZk
         jkfJvaFbAoK6Fy5AYthBQNjhgcL6fOUINswDDp3MIMFxUt0IjWwIIUfxr3lvFaDPiXz7
         GcLA==
X-Gm-Message-State: ACgBeo3+e+DPmIzKzCEOx0PKMSGoGrr0GDb0uSM5jmAJyrKJlM0DzJRT
	GobSLYWU1jAfNtM8Agd9kjezrA==
X-Google-Smtp-Source: 
 AA6agR4j+4Cg95s7JLDSDxv4DPvdbuUWrePkB5tmZ+n6d+5olzUGpVMp8HGach+UrwSKsy/AdULUHQ==
X-Received: by 2002:a7b:c453:0:b0:3a5:b42e:c4fb with SMTP id
 l19-20020a7bc453000000b003a5b42ec4fbmr11686656wmi.167.1661167139520;
        Mon, 22 Aug 2022 04:18:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4a9:e65c:bb6e:14cc?
 ([2001:8b0:aba:5f3c:a4a9:e65c:bb6e:14cc])
        by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b003a601707174sm15341243wms.33.2022.08.22.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 04:18:58 -0700 (PDT)
Message-ID: 
 <01dce5b603bc47fc195ba4ea738e7a333ac1992e.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore
 list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Wes Lindauer
	 <wesley.lindauer@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2022 12:18:58 +0100
In-Reply-To: <cf290a54-3b62-9c0d-32cc-08195f682b99@theobroma-systems.com>
References: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
	 <cf290a54-3b62-9c0d-32cc-08195f682b99@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 11:19:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169670

On Mon, 2022-08-22 at 11:28 +0200, Quentin Schulz wrote:
> Hi Wes,
>=20
> On 8/22/22 06:59, Wes Lindauer wrote:
> > It should not matter what xz/zstd parallelism and resource usage is set=
 to
> > when determining hash signatures. This allows sharing more sstate acros=
s
> > host machines with different CPU configurations.
> >=20
>=20
> It seems like it does matter in some ways, c.f.:
> https://git.openembedded.org/openembedded-core/commit/?id=3D0296dc71c01d1=
b7953d74ef37d56429e2f4fcfab
> and
> https://git.openembedded.org/openembedded-core/commit/?id=3De72c0b94554a9=
bc293844ec2bddb0c04ea19791d

As Quentin mentions, the value does matter. In particular, those
compiled with a single thread differ to those with multiple threads. As
such the proposed patch can't be accepted.

Cheers,

Richard

