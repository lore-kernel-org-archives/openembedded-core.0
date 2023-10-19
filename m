Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62610CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 15:39:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.31135.1697729965884602724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 08:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bm3e+zV6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so1637765e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 08:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697729964; x=1698334764; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Mz8xGEhN7wWrM9vaQBPyGZkmng7Ggy0NwJLoDhzamk=;
        b=Bm3e+zV6B83HiHNN5hYUvFR9mC2vFBmq8uPQkEUdlTzJlgzewpodUc30M2mjsi2Ge5
         9lXw/qZDzDE5F8CFPgk08Qe38ayZH97JLtobf2aj8s+hpabwNDoMaq09DomzF4QWI8r3
         oAFjHvkKjHoZG6lL3x/r/6tkS/FjYnwZK3Q3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697729964; x=1698334764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Mz8xGEhN7wWrM9vaQBPyGZkmng7Ggy0NwJLoDhzamk=;
        b=LYhwSLEVzrjcPlfEnpBN/un5cumbZWfXwkzeQNFj4Z/GnnC/rzdLFbS0dbO6Wh85TX
         UDrRtadiZOOuUp4kLd/LW6BDw6CjVZU/3Xz9/5gDHfpqLLXca4h36RCUjPzC9tc93y72
         6nQe62gVoA2rO80kYvSLKeKPufFhvuGGLBDVRJzooflrNJdmUNg0nO35wfZnrtDD1m84
         uubkzXDwcv7zagyiJclJtTyMqph21HBq7LcGsnJtVIGHHXxlBWw/Rzh0mn5WlxkV6JWK
         st993/sIysicZZDs8InEHdBYfAdqfgyZsyF9wZ+5ZHoqBPHpT9K2E64nO5arH80XkReA
         hFwg==
X-Gm-Message-State: AOJu0Yy3F4WdY0AQLWoLuk2xV4hErnw9k1jhOEzO3ffEe+gHGm7xvJ/u
	6QfRRMBqrh/bIum7yNCp5XPSRg==
X-Google-Smtp-Source: AGHT+IFt7uVek2ssK6g4oe0mxvjYL99znRYi3mt2p+bzop0w98n5kMbRe8N5pI1ukBwy37fhoselug==
X-Received: by 2002:a05:600c:1c1e:b0:407:5b7c:2f6a with SMTP id j30-20020a05600c1c1e00b004075b7c2f6amr2200416wms.0.1697729964187;
        Thu, 19 Oct 2023 08:39:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d50b:9488:c681:57b6? ([2001:8b0:aba:5f3c:d50b:9488:c681:57b6])
        by smtp.gmail.com with ESMTPSA id b24-20020a05600c06d800b004064e3b94afsm4678837wmn.4.2023.10.19.08.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:39:23 -0700 (PDT)
Message-ID: <89dea6106456334db25a039fa5434f17420bd2a8.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yocto/6.5: serial: core: integrate upstream fixes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 19 Oct 2023 16:39:23 +0100
In-Reply-To: <20231019150849.2323667-1-bruce.ashfield@gmail.com>
References: <20231019150849.2323667-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 15:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189471

On Thu, 2023-10-19 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Integrating the following commit(s) to linux-yocto/6.5:
>=20
>     14f83e409308 serial: core: test for -EINPROGRESS during tx power mana=
gement validation
>     1b5b735f311f serial: core: Fix checks for tx runtime PM state
>     dee98a75d75c Revert "serial-core: disable power managment for serial =
tx"

Thanks, these changes look good.

>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_6.5.bb               |  2 +-
>  .../linux/linux-yocto-tiny_6.5.bb             |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 22 +++++++++----------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_6.5.bb
> index 985490e5e5..598280c5b6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
> @@ -14,7 +14,7 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
> =20
> -SRCREV_machine ?=3D "541ff832e9f2a168145f96ff41857a6cf1c74289"
> +SRCREV_machine ?=3D "2aa14dbb8520e59358778a80b32d7ccf6dd6c2ac"
>  SRCREV_meta ?=3D "9af846da534077c91e3c42242fceba7aef8dd784"
> =20

The patch doesn't want to apply unfortunately, locally (and on master)
I have:

SRCREV_machine ?=3D "541ff832e9f2a168145f96ff41857a6cf1c74289"
SRCREV_meta ?=3D "7686d2c442df26daa77f91098f7fac8fdf5b35d7"

for the rt recipe for example so the meta revisions are different. Did
I miss a patch?

Cheers,

Richard

