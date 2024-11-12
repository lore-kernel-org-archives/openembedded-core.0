Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC7ED32D79
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:33:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.82864.1731404019469365216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NkAedOx2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43159c9f617so42669555e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 01:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731404018; x=1732008818; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz8EPpYIkW1To8EgAhS0wyTKZ6eJgoLteRATz33Nk7Y=;
        b=NkAedOx2QPnD+DB/z1sRH/dF8NYx28gX3u+lq58vSf0f99o17QkuLHfy1mVtNJpbtY
         Fjc4jZ/oXIl8tJnq+FAq8d86JrOEiaCptYr/GllwK+xskLJKmWLcMpkUUo52vL665abp
         GP1lhhWx1ZUrBRd1M3kTtI+cy8RSkA6bUQSuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404018; x=1732008818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qz8EPpYIkW1To8EgAhS0wyTKZ6eJgoLteRATz33Nk7Y=;
        b=iedQhHgUnvwmbJ+uN32dFF9TRYUVGfN6nrzHOaBfNIlCtpx4WvhORZKWN17kebBA3+
         av3edpLgAclw98AA69CwOm5Pb43RESO7RQwtHKiSnvxjZkmmg9g0BltIv2xLM8sSs7w9
         JohVkzCrugm3e4z64Hzo3/bTTW6UadrNGTSKzYPHmRGkqKk+E2yX0FoAGPmeplOKGFn2
         Oy/sF7VvlnmHvQsNzxnlIR3VGrFH0c2NC5hBkHtU8w7hEwS/KmF9rdZZHRRTEU79keqg
         Y+kKptbdw6+utmkHyiex9OGk+KVvDZWDGeMRMIeO42hpCksd7c1/vuTCeBIkAh2yvpGC
         HoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0TIcvdFYkDe4aLcI4wVdQ2J2JKc2EtO+u9wv3lFbL9TOeh1ecusqik90Zi5a7D2+HMsEKEqSVMnRALfXE1bWqKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxia5cndgjfMIQKH1EMWO9SAlmD3OejhXxa+HVXsnWv9ka9sOop
	siuMroZY7Ehp7xZ78z+hav4r9Idib42nONJOjw7n2dZlVqt866T+5AYcFpYHm0s=
X-Google-Smtp-Source: AGHT+IGQhuPmoKEDNqpWtT0hZVZxDHF97AvX0XRYIjAbvClP/JRJDFfi1WCCxr8b9z3Rn2za2gV5hw==
X-Received: by 2002:a05:6000:1449:b0:381:b716:2470 with SMTP id ffacd0b85a97d-381f1883dc8mr12823405f8f.40.1731404017904;
        Tue, 12 Nov 2024 01:33:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeea:2252:f7a4:6a05? ([2001:8b0:aba:5f3c:aeea:2252:f7a4:6a05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea5d9sm15034329f8f.75.2024.11.12.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:33:37 -0800 (PST)
Message-ID: <6b90962a56a9d50d5ebed2c1b3d67b32b980af6a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 8/8] core-image-weston: use
 virtual-x-terminal-emulator instead of matchbox-terminal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2024 09:33:36 +0000
In-Reply-To: <20241108170156.2057761-8-ross.burton@arm.com>
References: <20241108170156.2057761-1-ross.burton@arm.com>
	 <20241108170156.2057761-8-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207035

On Fri, 2024-11-08 at 17:01 +0000, Ross Burton via lists.openembedded.org w=
rote:
> Don't hardcode matchbox-terminal, but use the alternative.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-graphics/images/core-image-weston.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/rec=
ipes-graphics/images/core-image-weston.bb
> index 62305cc1cee..d5248cf480b 100644
> --- a/meta/recipes-graphics/images/core-image-weston.bb
> +++ b/meta/recipes-graphics/images/core-image-weston.bb
> @@ -7,6 +7,6 @@ LICENSE =3D "MIT"
> =C2=A0inherit core-image
> =C2=A0
> =C2=A0CORE_IMAGE_BASE_INSTALL +=3D "gtk+3-demo"
> -CORE_IMAGE_BASE_INSTALL +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'weston-xwayland matchbox-terminal', '', d)}"
> +CORE_IMAGE_BASE_INSTALL +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'weston-xwayland virtual-x-terminal-emulator', '', d)}"
> =C2=A0
> =C2=A0QB_MEM =3D "-m 512"
>=20

This breaks one of the selftests:

https://valkyrie.yoctoproject.org/#/builders/54/builds/382/steps/14/logs/st=
dio

ERROR: core-image-weston-1.0-r0 do_rootfs: Package rxvt-unicode cannot be i=
nstalled into the image because it has incompatible license(s): GPL-3.0-onl=
y

Cheers,

Richard

