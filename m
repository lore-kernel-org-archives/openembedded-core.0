Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.2099.1626982513927305189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cYQLTIrr;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d2so127154qto.6
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=01VMcqfeMQelgZJLQa0/EPpuhNTONPoaRCT/z7RJvwY=;
        b=cYQLTIrrx2+FiqaW5FWsJPg8sxaaQYN2atjbAcAM0h/YkUpiOn9QKUPeT66qZ2V/VZ
         bXbtJvfbx6BvXDbJ4tfqze73jH+4w2Cfz+nWp+oyz+Z6CyoV9BNc9PfvvJhKQBiUNBbJ
         UPrxfw+jkrcjL0tvIlNXtpWYZYs5ho8GqAIXR1XzQfilZZjJA3VCWx2oqLWUZlSwqMef
         lTX6pyK3r3HGTwNd36YkNSpTy7gclaxDf6kjEFCmxSxWOMNJlKxoyX4tKQjayz2FdRAk
         4A7xcdWltSVsJ58RXb3Pwz32eRrwQISggW+wgiSqmGXgcF3+ZEj0HKPg71KQVW5QNjTp
         kMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=01VMcqfeMQelgZJLQa0/EPpuhNTONPoaRCT/z7RJvwY=;
        b=CiH11zQIqa61DznvqAZ8g8YJ5tmGab1aq5dZVqJgqEcqsMI14+E0rpm3i3Bkpth5GS
         MEpUTs8AnNvj5PIA/iKzGxVFroKdF9fOtPym6tGOotIXP85dcZit3DE1MA9h+SnUEpox
         y4CRJ/HFb4VXMDuFU0JUbeQV4WaB7LN8xC8hdRA5a9kwMhFmmXZahawAS+mPjh4GU3Bc
         kpKMMpqiTgdtiaOWFtkA5xWgv8b9NXz1BniF3Ci1dTXpCeX1p+WXRwU8HO+nZRfLVAEh
         sgsfsZ0sY5u0b06LGm/0XVwTBL+Li5J7BiAHqrYUmz7lQYqlOFh5mlTf8suXdqGth7qG
         Za2Q==
X-Gm-Message-State: AOAM5328K7OmCdm/5IJcGsOVTh+MxfhW3/PcVwUkekREqnNtPlHd/ox5
	jiHFmKMc5c2fU4PQDe1vtPmSy0WKbX+7WA7HD9BoIED8uL4a4Q==
X-Google-Smtp-Source: ABdhPJw1dynYslXBaZ2l4VZZWOgwQmKwboFPpdSDplyLIyZWzYT4Ciu0WO5h3YssruSZ8gRjP7GECwUEgO7XDTibZOg=
X-Received: by 2002:ac8:41cd:: with SMTP id o13mr1088663qtm.289.1626982512848;
 Thu, 22 Jul 2021 12:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210704210740.581650-1-raj.khem@gmail.com> <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 12:34:47 -0700
Message-ID: <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com>
Subject: Re: [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

ping^2

Is there any issue with this patch ? If so please let me know

I am seeing following on qemuppc64

ERROR: Nothing RPROVIDES 'u-boot-default-env' (but
/mnt/b/yoe/master/sources/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
RDEPENDS on or otherwise requires it)
u-boot-starfive RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-hardkernel RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-poplar RPROVIDES u-boot-default-env but was skipped: Either
UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc64 machine
configuration.
u-boot-imx-mfgtool RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-toradex RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-ti-mainline RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-juno RPROVIDES u-boot-default-env but was skipped: Either
UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc64 machine
configuration.
u-boot-qoriq RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-ti-staging RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-timesys RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-congatec RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-qoriq RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-imx RPROVIDES u-boot-default-env but was skipped: incompatible
with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot RPROVIDES u-boot-default-env but was skipped: Either
UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc64 machine
configuration.
u-boot-fslc RPROVIDES u-boot-default-env but was skipped: incompatible
with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-gateworks-imx RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-boundary RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-orangepi-i96 RPROVIDES u-boot-default-env but was skipped:
Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc64
machine configuration.
u-boot-fslc-mfgtool RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-kontron RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-remarkable2 RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-variscite RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
u-boot-ti-staging RPROVIDES u-boot-default-env but was skipped:
incompatible with machine qemuppc64 (not in COMPATIBLE_MACHINE)
NOTE: Runtime target 'u-boot-default-env' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['u-boot-default-env']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'libubootenv', 'u-boot-default-env']


On Wed, Jul 7, 2021 at 10:15 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> ping
>
> On Sun, Jul 4, 2021 at 2:07 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This recipe depends on u-boot and u-boot is not available for
> > qemuppc/qemuppc64 and there is no defconfig available either
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> > index 306296922c..88a8397c3c 100644
> > --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> > +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> > @@ -25,6 +25,9 @@ RPROVIDES_${PN}-bin += "u-boot-fw-utils"
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> > +COMPATIBLE_HOST_qemuppc64 = "null"
> > +COMPATIBLE_HOST_qemuppc = "null"
> > +
> >  RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
> >
> >  BBCLASSEXTEND = "native"
> > --
> > 2.32.0
> >
