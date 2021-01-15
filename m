Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web09.731.1610739162561610357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 11:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aRTsraIK;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id f6so6027134ybq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yrntnvckKCepxIVGjBYYjKcJ5T21TGSOX6mTET4Mbb4=;
        b=aRTsraIKlUuQFEjVVGnhQoQYrJ3WnMp8QsGp3NcbrXCuRr0Zpcez8ag8Ma/2RyXUlD
         cFAGhhnRfQx1Wqvxf8pgicpjMtlR8Ad74SNf6J15jGZO9flGtKt7on2CSbaiOS2RhunB
         UKASJcjqjq8m9pZK7FSG4X/Hdtt5N44smkVlUmBLOzVTYClQ/XmE0Fq64Jc8nBgvo3yp
         dZWiX44uJIjsXaRTFM4+Ki+iCEylAtIcaigtnayhhxOAo3rzAJS4w3wZswaPIr57HWLb
         +on/Nlltx5U06DZ0rYUn+PUL3nchLujnwrr6feC3PBn5OBTVYmnc48SroAgTXkTOEAvC
         E+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yrntnvckKCepxIVGjBYYjKcJ5T21TGSOX6mTET4Mbb4=;
        b=ERLKxSp6CF+8QN8p6d/IunwygKQhUeqdkVl4swiXnZHPU/YYdBNULMfR0KkdMcKsdh
         LsBAN1ndZ+juWiO+oNA9n80wjMhVUmfCSwTKAYLlXE/L3uoZn4sJrV7VH5GNsMW1fmBH
         OwExwsUsf7//FCu5e5Mlk2RVYmfcdUCOT0RKcqNOOI1g+jwObOe7+J7jKMwn+oOoIivY
         NFen7SE3GajKUgwIg0MksRCltD+kB+UQU7OLlEgbDtmGazT/CsihJvqtTv6cA3tcKhcF
         KzxEaMDEPg4m3GXVCnrB2QT9eUd04gY6SF7505dJrBy1sS8JCGQcBdY1qfqhjKqOLMO+
         +dbA==
X-Gm-Message-State: AOAM5339yq7cN13Lf/abtJQWW8r66cdRYi2XKgbeqJTCsFaVL5MsjuXs
	6/3wAOsCZDil/MRXnjeTG9g4jWQ8ZNHiWgU4GDHcOeCV
X-Google-Smtp-Source: ABdhPJx4wQuZIQmQSAPrtJXDkWAQ2hNH1BTWIwO0Ddmqiq0dmIO+40XrOdT9mR9AuA3Fv0P1E2RU9g7DdpMHaYDeIHI=
X-Received: by 2002:a25:f02:: with SMTP id 2mr17580195ybp.190.1610739161317;
 Fri, 15 Jan 2021 11:32:41 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
In-Reply-To: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
From: "JH" <jupiter.hce@gmail.com>
Date: Sat, 16 Jan 2021 06:32:04 +1100
Message-ID: <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com>
Subject: Re: MTD UBI undefined reference failed to build OE gatesgarth branch
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: meta-freescale@lists.yoctoproject.org, 
	linux-mtd <linux-mtd@lists.infradead.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="UTF-8"

Hello,

The mtd build was fine, what could be missing not to link mtd?

$ ls 2020.04-r0/build/mx6ull_14x14_evk_nand_config/drivers/mtd

built-in.o  mtdcore.su  mtdpart.o   mtd_uboot.o   mtd-uclass.o   nand     spi
mtdcore.o   mtd.o       mtdpart.su  mtd_uboot.su  mtd-uclass.su  onenand  ubi



On 1/15/21, Jupiter <jupiter.hce@gmail.com> wrote:
> Hello,
>
> I was able to build MTD, UBI and u-boot on OE version Zeus branch, but
> failed in gatesgarth branch. Here are errors, what could I be missing?
>
> u-boot-imx/2020.04-r0/git/cmd/ubi.c:478: undefined reference to
> `mtd_probe_devices'
> u-boot-imx/2020.04-r0/git/cmd/ubi.c:484: undefined reference to
> `put_mtd_device'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1161: undefined
> reference to `put_mtd_device'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1229: undefined
> reference to `get_mtd_device_nm'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:1407: undefined
> reference to `mtd_read'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:279: undefined
> reference to `mtd_write'
>
> u-boot-imx/2020.04-r0/git/drivers/video/cfb_console.c:2025: undefined
> reference to `video_hw_init'
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51: undefined
> reference to `dm_spi_claim_bus'
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55: undefined
> reference to `dm_spi_xfer'
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58: undefined
> reference to `dm_spi_release_bus'
> u-boot-imx/2020.04-r0/git/Makefile:1701: recipe for target 'u-boot' failed
> make[1]: *** [u-boot] Error 1
> WARNING: exit code 1 from a shell command.
>
> There are a couple of warning messages I am not sure if they are
> important or just nonsense, like CONFIG_DEFAULT_DEVICE_TREE has
> already been defined but it complained:
>
> Device Tree Source is not correctly specified.
> Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> or build with 'DEVICE_TREE=<device_tree>' argument
>
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51:8: warning:
> implicit declaration of function 'dm_spi_claim_bus'; did you mean
> 'spi_claim_bus'? [-Wimplicit-function-declaration]
>    51 |  ret = dm_spi_claim_bus(dev);
>       |        ^~~~~~~~~~~~~~~~
>       |        spi_claim_bus
> @
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55:8: warning:
> implicit declaration of function 'dm_spi_xfer'; did you mean
> 'spi_xfer'? [-Wimplicit-function-declaration]
>    55 |  ret = dm_spi_xfer(dev, priv->nregs * 8, priv->buffer, NULL,
>       |        ^~~~~~~~~~~
>       |        spi_xfer
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58:2: warning:
> implicit declaration of function 'dm_spi_release_bus'; did you mean
> 'spi_release_bus'? [-Wimplicit-function-declaration]
>    58 |  dm_spi_release_bus(dev);
>       |  ^~~~~~~~~~~~~~~~~~
>       |  spi_release_bus
>
> Appreciate your advice.
>
> Thank you very much.
>
> Kind regards,
>
> - jupiter
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
