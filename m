Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2D6C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 15:00:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.11594.1685199631009790885
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 08:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=QdCuV5Og;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so1730393f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685199629; x=1687791629;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=utHjw7T7YCzhlbec0MwJlW5GTQUstUsorkreoqRu+N4=;
        b=QdCuV5Og15vxXQht6lWJYu5qCUCYHRAoJc3pev6504LK/BVGWN6zTCMZiSeflR4sHM
         WmlSGIctOEyA2FnFe0gJ28JrDIwgDg16vUw/pCI6o5WivMjF1XZp9Pa7AK04PGulGcMs
         7AOq8BYV0oBDYND99YVnugCRM5O1F5RpVo9gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685199629; x=1687791629;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utHjw7T7YCzhlbec0MwJlW5GTQUstUsorkreoqRu+N4=;
        b=aN+ZEAG6X1tguwkjBtt55b0lscdclvFihqyUtvioGDtL+8p7pAYCazV5WdRP2UZsZw
         uSbuA01Y0EgM8NSS2pyXwM4PiVMp5kkil0R1f1UAMvGZ6Bct6wDIYUNxf2p0A0F263cB
         YfQGd8iOHST8bTD8eV8WTXc/8AC5WRnG+zIegJj2GXHN4rbbmUq5XgFcKuA21eMG0Cuk
         1vltTbHL3G1eMXwFaKefq7m9fOgGDPgIMCPeXEiFP3KqG00WGbCCEHZNQoSVIyzkZO4N
         mUC5ydXLyxW3KlD/ZWjgpU+Ohv0oRd+bje4EK0QolIN8ZfG6HRUMIdtTLrlMWbDOUOpO
         kFHg==
X-Gm-Message-State: AC+VfDzoy/zXZOuReWJqqhBMI4FvjWi6k4GEC97AFXDB87P7TzmK0QLK
	b/halYICeGE6oNBP7UoVwXUNAA==
X-Google-Smtp-Source: ACHHUZ7G4VO2EcKizr8Xy/DJXnISoP6+mGpcp6e+x9j1hfTxximhYIe0tQAA0otOnrn/CGptQ9WZaA==
X-Received: by 2002:adf:e851:0:b0:30a:b46a:a443 with SMTP id d17-20020adfe851000000b0030ab46aa443mr3751284wrn.51.1685199629238;
        Sat, 27 May 2023 08:00:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d24:65e6:bc0:7a3? ([2001:8b0:aba:5f3c:7d24:65e6:bc0:7a3])
        by smtp.gmail.com with ESMTPSA id b14-20020a5d45ce000000b0030ae54e575csm1238323wrs.59.2023.05.27.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 08:00:28 -0700 (PDT)
Message-ID: <cf01812048cf651b022875996442e5d2ead18e95.camel@linuxfoundation.org>
Subject: Re: gcc 13 merged, meta-arm, meta-intel and meta-virt issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Jon Mason
 <Jon.Mason@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Sat, 27 May 2023 16:00:27 +0100
In-Reply-To: <ZHEhlRXG8GHFCeaS@kudzu.us>
References: 
	<f7d8cdc485e3d75304bd41931292f0cb76083e14.camel@linuxfoundation.org>
	 <ZHEhlRXG8GHFCeaS@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 15:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181807

On Fri, 2023-05-26 at 17:16 -0400, Jon Mason wrote:
> On Fri, May 26, 2023 at 05:28:21PM +0100, Richard Purdie wrote:
> > I just wanted to let people know I merged gcc 13 since I think we'd got
> > as far as we were going to without the patches landing. I dropped the
> > 5.15 kernel and found ways to fix lttng-tools and glib-2.0 ptest
> > issues.
> >=20
> > This leaves a few failures on the autobuilder in other layers:
> >=20
> > meta-arm 5.15 kernel bbappend:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4038=
/steps/12/logs/stdio
>=20
> Sorry, I meant to push the fix yesterday.  It's in there now.

Thanks, that resolved that issue but allowed another to show through:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4040/ste=
ps/12/logs/stdio

in the 6.1 kernel.

Which might be fixed with:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/s=
cripts/gcc-plugins?id=3De6a71160cc145e18ab45195abf89884112e02dfb
or perhaps:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/s=
cripts/gcc-plugins?id=3D5a6b64adc18d9adfb497a529ff004d59b6df151f

Are you using up to date SRCREVs for 6.1?

Cheers,

Richard

