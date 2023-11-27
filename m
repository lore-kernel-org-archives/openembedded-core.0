Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D01FC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 01:18:44 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.83276.1701047923062079423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 17:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g4gATYlc;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1f9e6a8b00aso1753785fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 17:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701047922; x=1701652722; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IoaANW0PT4sympnVCo3MIqJO65DCGdYTWayrWVva1A=;
        b=g4gATYlcCjU11dtrD5s+lU+xEfbThlwsz8FgglJ0ab35Tqmi+Hs4wfRDPXblAhwE3U
         Teqx25JPcxaIy6AWXlR0y5zN37zSO1Z/0toY9L36QsEl8/XSIxxOlB2JPzIWwPPm/OkW
         1R89DHTYvco46WLKtCJ7HArfXw6KaSAJHljVRYqriXCOsK8l5fnOJbtj1vlGRuOdtaPs
         YkMHAVHguCfH/TWzEMgaKHZBJc49lrTK68qJWMbSdBaT3vaiqPtVTHslR2BQE8ceHTGt
         uf0+PxuDoY28GmHchGLQXblWArmYXP6jCl8HybqocVHzi5tZWbth66++HgiLWwmcLHQd
         3kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701047922; x=1701652722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IoaANW0PT4sympnVCo3MIqJO65DCGdYTWayrWVva1A=;
        b=Y8/WEa8U5xG3dTcUQ3OUsxKzN1eJmH+gqKWjXaTYmuh7qEXBSFri/di2rgE8fEafwy
         Q4w0fCcT24vDEpERkcCEFNMzh3DkyX5GUP9+QqNKLIbdSqTLSXgsiNaaZ1L+CdMEJvBI
         7RL49l7ccNci9xOekkL+qLwohSzqRovPdUMk6gkKEiWNckl5Ga45Y1ztg40DiNaNFcRS
         dAFkq+VTem/1Wjlc0AeT4MpaRUtaktZRPqMjhmhu+4zf+441RqoBaIUjAfq8tqDI7GRx
         TkYFaTBorikQRysRqoAsPWTcyfQi5kUrr/N4HRINo0IOtDCUf8kzgnrAQmBuG0ll0svz
         s3IQ==
X-Gm-Message-State: AOJu0Yz5oWuQwEkGQan+7b8+u89gJ8LnEPnv9hKKdcmJcwqyNRu7qdWZ
	fTqJ1+g5vxJh8AZvY4E2J+boNbLQKdyxJmhFc7k=
X-Google-Smtp-Source: AGHT+IH63mhOsDU/BjGKrYkc+GXYGVcs1d2cZE+wvprQdCVHZd6KPfe9hxhYFqJnidVbnsoRjFkBfzLG4OAzVycCu10=
X-Received: by 2002:a05:6871:528c:b0:1fa:261f:c474 with SMTP id
 hu12-20020a056871528c00b001fa261fc474mr7459018oac.37.1701047922124; Sun, 26
 Nov 2023 17:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20231123113452.1697802-1-f_l_k@t-online.de>
In-Reply-To: <20231123113452.1697802-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2023 17:18:16 -0800
Message-ID: <CAMKF1spWFVCbyL9NT1CWQKgWTthBV7REiL40NnZXb-b9tN=FEA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] pciutils: add packageconfigs for options
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 01:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191243

I am seeing configure failures

   8923  | /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-=
linux/pciutils/3.10.0/temp/run.do_configure.1786381:
line 149: DNS=3Dyes: command not found

On Thu, Nov 23, 2023 at 3:34=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> My motivation for this is to get zlib support selectable, because
> libosinfo requires the pci.ids file uncompressed. Add packageconfigs for
> the other options as well to avoid autoselect.
>
> Configuration stays the same besides zlib is deselected by default.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-bsp/pciutils/pciutils_3.10.0.bb | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb b/meta/recipes-=
bsp/pciutils/pciutils_3.10.0.bb
> index e27cfd4ced..4bde090169 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
>  # Can drop make-native when all systems have make 4.3
>  # https://git.savannah.gnu.org/cgit/make.git/commit/?id=3Db90fabc8d6f34f=
b37d428dc0fb1b8b1951a9fbed
>  # causes space issues in lib/libpci.pc
> -DEPENDS =3D "zlib kmod make-native"
> +DEPENDS =3D "make-native"
>
>  SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.=
tar.xz \
>             file://configure.patch"
> @@ -18,10 +18,11 @@ SRC_URI[sha256sum] =3D "238a2e27166730e53a17fe07bfad2=
29e07fa39b618117e5944b6d7eda9
>
>  inherit multilib_header pkgconfig update-alternatives
>
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'hwdb', '', d)}"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'hwdb', '', d)} dns kmod"
>  PACKAGECONFIG[hwdb] =3D "HWDB=3Dyes,HWDB=3Dno,udev"
> -
> -PCI_CONF_FLAG =3D "ZLIB=3Dyes DNS=3Dyes SHARED=3Dyes STRIP=3D LIBDIR=3D$=
{libdir}"
> +PACKAGECONFIG[zlib] =3D "ZLIB=3Dyes,ZLIB=3Dno,zlib"
> +PACKAGECONFIG[kmod] =3D "LIBKMOD=3Dyes,LIBKMOD=3Dno,kmod"
> +PACKAGECONFIG[dns] =3D "DNS=3Dyes,DNS=3Dno"
>
>  # see configure.patch
>  do_configure () {
> @@ -38,7 +39,7 @@ export SBINDIR =3D "${sbindir}"
>  export SHAREDIR =3D "${datadir}"
>  export MANDIR =3D "${mandir}"
>
> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D ${PCI_CONF_FLAG}"
> +EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D SHARED=3Dyes STRIP=3D LIBDIR=3D${libdi=
r}"
>
>  ASNEEDED =3D ""
>
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191142): https://lists.openembedded.org/g/openembedde=
d-core/message/191142
> Mute This Topic: https://lists.openembedded.org/mt/102765276/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

