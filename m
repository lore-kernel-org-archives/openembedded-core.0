Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.24447.1599582092414324770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 09:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=M5O/rr/b;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id u4so19930706ljd.10
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+wwqRMsTwLLb/Ps1YmdAW1s1fgvQ/ZVkwgB6Faq+Gic=;
        b=M5O/rr/bIgZq75i014J7jcCisgdXzPRr0kQ1JmU23BssP5+fSSPa3dK/UcDrz7owWf
         ifdtsQyo6QqdLsmHEZ0udS/obWs2yPNPTVyEBwff3R817N1wx1MmLKhYSRNdjSUQtW4g
         P1JeUDA9ppxOp1RLZvSNBnU3tWUkWasoRndogsdfIaUcfYDKJL2nYlVwxYDzSQnHwJMQ
         FXYQEiIEM4ZplWer25Xg/fOXmdV7kVtwMf0X05DB5CGyS1NHN6zoDBHpEoWDJQQMZFOk
         SFdXbJhm9BgVxniGOC/jELDDDCrA2UuXpJR5eLp1jDe1D068/KPhN4HFZaFJUVunDn1F
         SV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+wwqRMsTwLLb/Ps1YmdAW1s1fgvQ/ZVkwgB6Faq+Gic=;
        b=oNdQMy6f6WEDCyH5cUdQRkbfgbBE6TaHWWYGsr4R4rdKjJNLTld/TDQoOUO+EBTb2m
         qYSWksCKR3/3Z/c7yMpZIbFUUXxQ/HO1cvIozUdcosicZW0Ty86LyxZ5f4m7gfF93ZXe
         nSFWm1pLhSR6ZFSY6ZdG4a/27L9ifp49jA82lSibbCNyOzbJ3KDg5jG1RPIYvKOOzY4T
         U5cAIUd29uTOtRAJN6VK1fqdcM1zuf81lVBE8CLHut5KfruYcbdqaB1++fKrx3di208b
         y6rNnFmA4PQpkrYoQ309ky1fkxSZVPoJ/Rp3BIdRV9aVqIkUHeYacG/sWrSGeSMyE4VL
         YEOQ==
X-Gm-Message-State: AOAM530CZoi3cM+FY83y3ARf6yuhmlBTyzz/1o7+YEAUqsKJCNC7egtV
	HsrDQfx8SZTECYCzymRb/hgdZSi303rDdZaydrHU2Q==
X-Google-Smtp-Source: ABdhPJzQhnb36xt5VC7DWagK1AcfozCe4dJS/K8o9/BaiCmZbHPcBQmydebVEXN0oxUm3LalSPDujLLigH/XlAl0XEY=
X-Received: by 2002:a2e:83d7:: with SMTP id s23mr4138723ljh.340.1599582090339;
 Tue, 08 Sep 2020 09:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200908161555.10039-1-anibal.limon@linaro.org>
In-Reply-To: <20200908161555.10039-1-anibal.limon@linaro.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 8 Sep 2020 17:21:19 +0100
Message-ID: <CAAnfSTs6R+uH=9FA0BR25DbwmgVz3Y6LNQwC+_8fCVBkgsqz7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-graphics/xorg-xserver: Add patch to fix segfault when probe
To: Anibal Limon <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Missing Upstream-Status and Signed-off-by in the patch.

Ross

On Tue, 8 Sep 2020 at 17:16, Anibal Limon <anibal.limon@linaro.org> wrote:
>
> Fix segfault on probing a non-PCI platform device on a system with PCI.
>
> ...
>     at ../../xorg-server-1.20.9/os/log.c:1017
>     at ../../xorg-server-1.20.9/os/osinit.c:156
>     at ../../xorg-server-1.20.9/os/osinit.c:110
>     at ../../../../xorg-server-1.20.9/hw/xfree86/common/xf86platformBus.=
c:292
>     argv=3Dargv@entry=3D0xffffca43c7c8) at ../../../../xorg-server-1.20.=
9/hw/xfree86/common/xf86Init.c:388
>     at ../../xorg-server-1.20.9/dix/main.c:193
>     init=3D<optimized out>, fini=3D<optimized out>, rtld_fini=3D<optimiz=
ed out>, stack_end=3D<optimized out>)
>     at ../csu/libc-start.c:314
> ...
>
> From upstream rev e50c85f4e.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  ...probing-a-non-PCI-platform-device-on.patch | 31 +++++++++++++++++++
>  .../xorg-xserver/xserver-xorg_1.20.9.bb       |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001=
-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-se=
gfault-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphic=
s/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform=
-device-on.patch
> new file mode 100644
> index 0000000000..d66059d116
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-=
on-probing-a-non-PCI-platform-device-on.patch
> @@ -0,0 +1,31 @@
> +From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
> +From: Eric Anholt <eric@anholt.net>
> +Date: Fri, 26 Oct 2018 17:47:30 -0700
> +Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a=
 system
> + with PCI.
> +
> +Some Broadcom set-top-box boards have PCI busses, but the GPU is still
> +probed through DT.  We would dereference a null busid here in that
> +case.
> +
> +Signed-off-by: Eric Anholt <eric@anholt.net>
> +---
> + hw/xfree86/common/xf86platformBus.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf=
86platformBus.c
> +index cef47da03..dadbac6c8 100644
> +--- a/hw/xfree86/common/xf86platformBus.c
> ++++ b/hw/xfree86/common/xf86platformBus.c
> +@@ -289,7 +289,7 @@ xf86platformProbe(void)
> +     for (i =3D 0; i < xf86_num_platform_devices; i++) {
> +         char *busid =3D xf86_platform_odev_attributes(i)->busid;
> +
> +-        if (pci && (strncmp(busid, "pci:", 4) =3D=3D 0)) {
> ++        if (pci && busid && (strncmp(busid, "pci:", 4) =3D=3D 0)) {
> +             platform_find_pci_info(&xf86_platform_devices[i], busid);
> +         }
> +
> +--
> +2.28.0
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
> index 86d432a7c4..c83e43ed99 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
> @@ -6,6 +6,7 @@ SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-onl=
y-for-pre-gen4-hardwar.pat
>             file://sdksyms-no-build-path.patch \
>             file://0001-drmmode_display.c-add-missing-mi.h-include.patch=
 \
>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch =
\
> +           file://0001-Fix-segfault-on-probing-a-non-PCI-platform-devic=
e-on.patch \
>             "
>  SRC_URI[sha256sum] =3D "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094=
ae4f5c9ed9ccd3571"
>
> --
> 2.28.0
>
>=20
