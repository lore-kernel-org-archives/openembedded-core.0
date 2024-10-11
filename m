Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A76D0D785
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:33:40 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.10388.1728649984085282942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=daH5wQky;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so19381941fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728649982; x=1729254782; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1onFJftvc+Xq9cUrvf8jqj0avMpDmvbCq1X+f1oxcU=;
        b=daH5wQkyFIDURDqgz9D6ZVI0vneX2G7Tw8nLhD2ZP59aX/qJmql/J/M+yAEfqIO50d
         jTmFI6cuDjWklkmPgU9fOjvqg7WoBY1IcuxLLVRNJCnJQ4rMANwJZeR0jPBp3RGhgqLh
         acuXmie8WDmhcCykd5zx06zVuJhb0NuSthVPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649982; x=1729254782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1onFJftvc+Xq9cUrvf8jqj0avMpDmvbCq1X+f1oxcU=;
        b=EpbLBWSmNWMOOzMaAmiFe18yJYtMiLNQQFLWU2W6QwgKFs0tsXG1jwUkRb9h0E1Tza
         sUPk35xg6VfLxwvs6G4+R9ypru64DbnVHwteSsVHRJrkBHuyqMbdKJHx4EVHzXfNgT8v
         9wtYvQZ7q6iCNibGEY+9u2BYgrXcVGZVfuqaxMHMG4YLyN8uCGWBVq+ytRdJ4DontacP
         cAiGpr9gbvecmjpAVVoVRzn0Zxp+qOIb83XLguPCO5bq8jnTN1MZagSNI3UPdE5EOW+I
         tIsGwH1lqI4U+Puq/Gunu/7hS6ZTWktSMNa0B+JIl+RmQOJphsbZYaNvhXlGhSqYk+0D
         ke3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCSbTNZm7KiuIb76NsfCzUL7p4WeJWlty6JFaWdt7XPyq1Vsgp6IeisWmcLuknBt3dqjuO90aHQ/IOBAgu0qusmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxhJ4n7jtbWSJwLrKkf4m7vc3vv4zOEp31mRcBMFFP0uzbCWaz
	Ua4FFyfLL6F0INZ2jA8OneY5BeY+1qSHOLoEFoOpPXeOADfAziVMgAGU/2oIl7w=
X-Google-Smtp-Source: AGHT+IH3qHf66Re+o18EC4j0rbK/3WiNk6GCMd3GVbWyYZz3H5MCzBPYE/mQH1b3OHvWPWireLvkzg==
X-Received: by 2002:a05:6512:31c8:b0:539:9867:eec6 with SMTP id 2adb3069b0e04-539da58b2acmr1449218e87.54.1728649981782;
        Fri, 11 Oct 2024 05:33:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8145:ba6d:a6de:28af? ([2001:8b0:aba:5f3c:8145:ba6d:a6de:28af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d790fsm40830805e9.6.2024.10.11.05.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:33:01 -0700 (PDT)
Message-ID: <a9c4777b9bf0987e3a01138e664fdfbe45907035.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] busybox: 1.36.1 -> 1.37.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: andrej.v@skyrain.eu, openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2024 13:33:00 +0100
In-Reply-To: <20241011094830.1009557-1-andrej.v@skyrain.eu>
References: <20241011094830.1009557-1-andrej.v@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205694

On Fri, 2024-10-11 at 11:48 +0200, Andrej Valek via lists.openembedded.org =
wrote:
> - update to next stable version 1.37.0
> =C2=A0- refresh defconfig
> =C2=A0=C2=A0 - disable new applets (ip_link_can)
> =C2=A0=C2=A0 - enable new applets (time64, find_exec_ok, getfattr, udhcpd=
_bootp)
> =C2=A0- remove and refresh already merged patches
>=20
> Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
> ---
> =C2=A0...ab_1.36.1.bb =3D> busybox-inittab_1.37.0.bb} |=C2=A0=C2=A0 0
> =C2=A0...01-awk-fix-precedence-of-relative-to.patch | 197 ---------------=
---
> =C2=A0...-fix-segfault-when-compiled-by-clang.patch |=C2=A0 41 ----
> =C2=A0...1-awk.c-fix-CVE-2023-42366-bug-15874.patch |=C2=A0 37 ----
> =C2=A0...x-ternary-operator-and-precedence-of.patch |=C2=A0 96 ---------
> =C2=A0.../busybox/busybox/CVE-2021-42380.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 151 --------------
> =C2=A0.../busybox/busybox/CVE-2023-42363.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 67 ------
> =C2=A0meta/recipes-core/busybox/busybox/defconfig=C2=A0=C2=A0 |=C2=A0=C2=
=A0 8 +-
> =C2=A0.../{busybox_1.36.1.bb =3D> busybox_1.37.0.bb}=C2=A0 |=C2=A0=C2=A0 =
8 +-
> =C2=A09 files changed, 7 insertions(+), 598 deletions(-)
> =C2=A0rename meta/recipes-core/busybox/{busybox-inittab_1.36.1.bb =3D> bu=
sybox-inittab_1.37.0.bb} (100%)
> =C2=A0delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-p=
recedence-of-relative-to.patch
> =C2=A0delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-s=
egfault-when-compiled-by-clang.patch
> =C2=A0delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix=
-CVE-2023-42366-bug-15874.patch
> =C2=A0delete mode 100644 meta/recipes-core/busybox/busybox/0002-awk-fix-t=
ernary-operator-and-precedence-of.patch
> =C2=A0delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42380=
.patch
> =C2=A0delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363=
.patch
> =C2=A0rename meta/recipes-core/busybox/{busybox_1.36.1.bb =3D> busybox_1.=
37.0.bb} (84%)

This would seem to be causing:

https://valkyrie.yoctoproject.org/#/builders/65/builds/225/steps/11/logs/st=
dio

and many other failures in that build:

https://valkyrie.yoctoproject.org/#/builders/29/builds/251

Cheers,

Richard

