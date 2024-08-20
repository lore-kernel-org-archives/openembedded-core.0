Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B4FC531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 19:42:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.3502.1724182951532908620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 12:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P3gny4iB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3718c176ed7so2814480f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724182950; x=1724787750; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSTbpJVbof5Ds/tpfJvgIPe8aiLvk/HzMfQ96M6JkWE=;
        b=P3gny4iBMUO+X/ZS9lt/WbzsHJoHDI7qZQoF2rO4oqeCuNy/+RXuyPm3yEeLt4xEUm
         23m2lCvFIrVeJJ9XrFr9MsUkh42A2VBFHacvzvT8sJ4a/mdkBfUVR7SSsXQE9HviuYX4
         xdAvb43aX1l2VtHaTPbkNBNYMUVtkBmhu8u3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724182950; x=1724787750;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSTbpJVbof5Ds/tpfJvgIPe8aiLvk/HzMfQ96M6JkWE=;
        b=OAn9FXQrt+V0M7mWcS9exk3tHyVfgy847oJP9yyxrygV7QROcKzeckQckZDUY0w8Ai
         Rm16eX1vNOJUVj27Js4p/psZLLRTpWGrKHu5gQTKyD2OGWKDdTFz5uwOWUZWc1k2u1EL
         IqOzl89Ok3WqxfjrmYc/7IE13OSFmdtobYkHrtiDMZ0JaRqhXwAAkBnLLCkk46lt2Jwg
         +q8ms5yDw2+1ptG62P3SMbcP2FXLsb0S5aWyDRNFyImfqix19c0Mssy1piuOGhZ+Bdvj
         7WHvf1e0PcqbMwIBnyC54DD/sh0LAEiqYeZYusKJhcuZITuZRa5T7BQJZB2yly4UFDFX
         3hzA==
X-Forwarded-Encrypted: i=1; AJvYcCXOu0kUah5a4H/K6TqmkFgELQPnY2BS7aIDrlNYqXoIDVQfhMbdxzGQCRtkDjnK/5Ow6u0xjPA9LwyTWue+GpegeA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZ0ZZTKMJkXpboW6bpwuQ9vapHWp0FZTrNRWnktjUFZaxg+Goa
	SzIwh3wbyB2IuUYjGoa4sve+LnsYuDbt0tMAvtrVL92Nubff+5/Pnya+CzZnNfg=
X-Google-Smtp-Source: AGHT+IEJY9qMiYhL4KJsjfdLZkcY10NGdg/GYMYzpD1ODX+oA5pg5vKijwYZNlWPuly/CNKLg/BvNA==
X-Received: by 2002:a05:6000:4593:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-372fd576901mr46904f8f.8.1724182949735;
        Tue, 20 Aug 2024 12:42:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:763d:b63d:b475:c32b? ([2001:8b0:aba:5f3c:763d:b63d:b475:c32b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded71ed8sm206292255e9.31.2024.08.20.12.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 12:42:28 -0700 (PDT)
Message-ID: <b91aadf80e98c918746a15bd791af78484103443.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 11/24] libedit: upgrade 20240517-3.1 ->
 20240808-3.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2024 20:42:26 +0100
In-Reply-To: <1724136703-20023-11-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
	 <1724136703-20023-11-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 19:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203567

On Tue, 2024-08-20 at 14:51 +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0.../{libedit_20240517-3.1.bb =3D> libedit_20240808-3.1.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-devtools/libedit/{libedit_20240517-3.1.bb =3D> =
libedit_20240808-3.1.bb} (88%)
>=20
> diff --git a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb b/meta=
/recipes-devtools/libedit/libedit_20240808-3.1.bb
> similarity index 88%
> rename from meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
> rename to meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
> index f8fa871ec9..56fee04ebb 100644
> --- a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
> +++ b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
> @@ -13,7 +13,7 @@ inherit autotools
> =C2=A0SRC_URI =3D "http://www.thrysoee.dk/editline/${BP}.tar.gz=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/stdc-predef.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> -SRC_URI[sha256sum] =3D "3a489097bb4115495f3bd85ae782852b7097c556d9500088=
d74b6fa38dbd12ff"
> +SRC_URI[sha256sum] =3D "5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe=
037cc02696d6099f"
> =C2=A0
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
> =C2=A0


Causes nativesdk build warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/9345/step=
s/18/logs/warnings

(and may more instances)

Cheers,

Richard

