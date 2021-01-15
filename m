Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.1400.1610741578236459893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 12:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESeIeMmB;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id w26so11728081ljo.4
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGwot5V7oV8XkTiQMjmzlaBRpDZIUDUR6lIRZt0UQn8=;
        b=ESeIeMmBpckCnerA1KIxynHee4g+Jo3OVlov90WJXEwPZL42xVaGtP/bm11bGmp4et
         rPwvlCueARRA4C/An2skKWZ4AX5DFsU4yiy+tA0wqGb0yVIydedPB4WnS7eHevMf0Rux
         PB/nXCQcGvKhXrLBSxgIrQJk+E2YxSgm+9MHFLNM6Zo7GCZCkyZVQRDBzyadmWvp0TOx
         /3vX3+iIpArZjbGB8G1BMzOOxPOziMgJENdgc95mg4dTs+ouowJDmIf5HgbMuLWBEZXM
         mH1ddHRTh22wJg7Ji0VVuILGTjdsj2kFgbZ133Wy9KLdyAQRo9aK0iV/uuvRVTgb/7US
         aSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGwot5V7oV8XkTiQMjmzlaBRpDZIUDUR6lIRZt0UQn8=;
        b=lmVT8F/63A/9LhnXmna0cXL7C+QDkdXwDX8NFz9Q0Ihy69NJIOUJwKpJs6/4W6QGZl
         WElJArjoCon4AT3r/FYQaBeTSXJ8fKmelHD+U1t96AX7Xtzj7TdgKvIWrJOjHc+9huhj
         UV36mhdxl9qayCw/k03QwtlrE/0a0Kg8dxWJYHlLsE9eNUfHZaVX9HCONthdKX+qoZc9
         uJqm+lpLgKFSDPNk+jaCd/roB3j/mEhlLfqClO27t0pkEXd+yPtOJGiTa9zkMwbiRC5u
         b/5hKxQ4FZMDm/vL6QYMZ2cPR3dk7lUgEpxjG0XwQWMdpigo7riDa3HLQFGz/34O/Swv
         C+XA==
X-Gm-Message-State: AOAM530mcSUlZ+c5Zk6HNsL+ZA8L9zOyty9uGOltPppJPIvIdeUslqdq
	x1IhF8GIPgP8DBOPXVAUsMHSjQqlLqneEcWFf1M=
X-Google-Smtp-Source: ABdhPJwJwpzO09gkSd3XacgqSTaUPJv5QHRKE2GXB1Dmh44mtOhl8aqkVYy/3CKz9ie4zpP69v9bOU/0vos5GoL6sjU=
X-Received: by 2002:a2e:50c:: with SMTP id 12mr6096025ljf.226.1610741576260;
 Fri, 15 Jan 2021 12:12:56 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
 <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com>
In-Reply-To: <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Fri, 15 Jan 2021 21:12:45 +0100
Message-ID: <CAHtQpK4OgZ5Qm6sFUiQavg6gd0taVUB2XiLHv8RG3q7O59B_TA@mail.gmail.com>
Subject: Re: [meta-freescale] MTD UBI undefined reference failed to build OE gatesgarth branch
To: JH <jupiter.hce@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	meta-freescale@lists.yoctoproject.org, 
	linux-mtd <linux-mtd@lists.infradead.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="UTF-8"

Hello Jupiter,

On Fri, Jan 15, 2021 at 8:32 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hello,
>
> The mtd build was fine, what could be missing not to link mtd?
>
> $ ls 2020.04-r0/build/mx6ull_14x14_evk_nand_config/drivers/mtd

From all the build logs you have, it look to me that you're trying to
build the U-Boot delivered by NXP as a part of their BSP release.

In this case, I suggest you'd rather contact NXP support in order to
address this failure, since it is a vendor BSP you're trying to
upgrade.

In addition, I do not think that all mailing lists you've cross-posted
your question to would be able to help you here:
- linux-mtd list is not really appropriate to solve U-Boot build issues;
- u-boot list is for upstream U-Boot patches and discussions, which is
way past over 2020.04 version (not even considering that you're
building U-Boot from NXP fork);
- oe-core is not a proper list to post questions specific to one SOC vendor;
- meta-freescale 'gatesgarth' branch does not have any U-Boot build
configuration for mx6ull_14x14_evk_nand_config, the only available
build config provided is for sd card;

Having all those points above, I'd suggest you contact NXP support at
first to see if they can solve those build errors for you.

If you would find a solution, you can send a PR to meta-freescale to
address it - this would be much appreciated.

>
> built-in.o  mtdcore.su  mtdpart.o   mtd_uboot.o   mtd-uclass.o   nand     spi
> mtdcore.o   mtd.o       mtdpart.su  mtd_uboot.su  mtd-uclass.su  onenand  ubi
>
>
>
> On 1/15/21, Jupiter <jupiter.hce@gmail.com> wrote:
> > Hello,
> >
> > I was able to build MTD, UBI and u-boot on OE version Zeus branch, but
> > failed in gatesgarth branch. Here are errors, what could I be missing?
> >
> > u-boot-imx/2020.04-r0/git/cmd/ubi.c:478: undefined reference to
> > `mtd_probe_devices'
> > u-boot-imx/2020.04-r0/git/cmd/ubi.c:484: undefined reference to
> > `put_mtd_device'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1161: undefined
> > reference to `put_mtd_device'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1229: undefined
> > reference to `get_mtd_device_nm'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:1407: undefined
> > reference to `mtd_read'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:279: undefined
> > reference to `mtd_write'
> >
> > u-boot-imx/2020.04-r0/git/drivers/video/cfb_console.c:2025: undefined
> > reference to `video_hw_init'
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51: undefined
> > reference to `dm_spi_claim_bus'
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55: undefined
> > reference to `dm_spi_xfer'
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58: undefined
> > reference to `dm_spi_release_bus'
> > u-boot-imx/2020.04-r0/git/Makefile:1701: recipe for target 'u-boot' failed
> > make[1]: *** [u-boot] Error 1
> > WARNING: exit code 1 from a shell command.
> >
> > There are a couple of warning messages I am not sure if they are
> > important or just nonsense, like CONFIG_DEFAULT_DEVICE_TREE has
> > already been defined but it complained:
> >
> > Device Tree Source is not correctly specified.
> > Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> > or build with 'DEVICE_TREE=<device_tree>' argument
> >
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51:8: warning:
> > implicit declaration of function 'dm_spi_claim_bus'; did you mean
> > 'spi_claim_bus'? [-Wimplicit-function-declaration]
> >    51 |  ret = dm_spi_claim_bus(dev);
> >       |        ^~~~~~~~~~~~~~~~
> >       |        spi_claim_bus
> > @
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55:8: warning:
> > implicit declaration of function 'dm_spi_xfer'; did you mean
> > 'spi_xfer'? [-Wimplicit-function-declaration]
> >    55 |  ret = dm_spi_xfer(dev, priv->nregs * 8, priv->buffer, NULL,
> >       |        ^~~~~~~~~~~
> >       |        spi_xfer
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58:2: warning:
> > implicit declaration of function 'dm_spi_release_bus'; did you mean
> > 'spi_release_bus'? [-Wimplicit-function-declaration]
> >    58 |  dm_spi_release_bus(dev);
> >       |  ^~~~~~~~~~~~~~~~~~
> >       |  spi_release_bus
> >
> > Appreciate your advice.
> >
> > Thank you very much.
> >
> > Kind regards,
> >
> > - jupiter
> >
>
>
> --
> "A man can fail many times, but he isn't a failure until he begins to
> blame somebody else."
> -- John Burroughs
>
> 
>


-- 
Regards,
Andrey.
