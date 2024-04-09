Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E22DC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 15:24:12 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.140090.1712676251322572023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 08:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=boeUbxCo;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso5655307276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712676250; x=1713281050; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZAHOoV5LCoHOo2JV0SVEOgcVXFICGTFH9FMToWGi+w=;
        b=boeUbxCo2dR1OEcn5uwQ365LYUd4RMJ88Kc+xlusd0Vy4qh3vn8lsg0potrhzyBlrg
         LQL8inpSROFeLwkKrtOALsF+xiZtm/s5WbBnKMu/tg0qb9Ca42TAtO+A5yqIhl5c/byF
         vsYouCU/eltSIWtSVqir7+G1QQkxf17axFbNcA/+BxwSJQEC5Oq1iJNyEJyr3zPoHm4/
         KJQfjAzfEHLSKyMaItb3bGsi+G5mo9wicavv2Wek/g172Fug3uXx2WUIaWzI5S3qYgVx
         PblkRA8DrpvwnX2QH1mZxniepSYE+VO1pHltJI+7ebFCW6+B3KRLOApmw81ax3aDRlXm
         nSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676250; x=1713281050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZAHOoV5LCoHOo2JV0SVEOgcVXFICGTFH9FMToWGi+w=;
        b=psMMIbGtKFDiXRxI45QzKEiDWE+2yb3eAsrBt0w/6++zTEL9q/MzK5og6wu+hY/H1C
         D0p5jy23ouD0jvTUrPK6qULQ1IC9XvpQVhtWdKACt8zu6U+KvqKgCjisqzm4aU5C2v/g
         I1fHuZ7xpSLZbMBaq+khDr8+wSVKCzEFmBCGGFomXZz6GBszjbmje6p4adu78r/nh8yh
         ee4YRoXcgEXZGi0e2+sahK66BACaxghEgRMlzjrpmHAeMgyLsW6fBPDS3Q9ALIiR25fJ
         WBSFYm//3cmT+HDSOJowsI22fFaHPX5vEyU+km4g6bBh9fsnUPYcrR65nJduOE19kfZF
         8efw==
X-Gm-Message-State: AOJu0Yze3qqAFIl23JG2CsEYdxcslPKF65kHunEEmaAv5b68j18WfiDG
	4VLGlDDb+guff1hN4NlrJiElXS9dY7zVx9Y02uBn0b9dR6RftqqvDuHQPId2Rc5xWumewZFNJde
	6XVbWzPdH+nYkgcERic1XiYTY9jFTT5M+
X-Google-Smtp-Source: AGHT+IHuXsQYh08jZs/xTblomlCn0MI2ytg4VerCDrrYQaxCF39RLdvtNd+iJ989VxpyU+V4N08bJE4tlTwUCpBCwG8=
X-Received: by 2002:a25:2e12:0:b0:dcc:44d7:5c7f with SMTP id
 u18-20020a252e12000000b00dcc44d75c7fmr54075ybu.62.1712676250183; Tue, 09 Apr
 2024 08:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240409151205.3333978-1-tim.orling@konsulko.com>
In-Reply-To: <20240409151205.3333978-1-tim.orling@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 9 Apr 2024 08:23:59 -0700
Message-ID: <CANx9H-CaJeyrR+DL699i+ky3DLYiz2aspnwv+7CN6wrEoOsUgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: update to final v2024.04 release
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081f0260615ab83b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 15:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198068

--00000000000081f0260615ab83b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To make it absolutely clear, this is for "master" (styhead 5.1) NOT for
"scarthgap".

On Tue, Apr 9, 2024 at 8:12=E2=80=AFAM Tim Orling <tim.orling@konsulko.com>=
 wrote:

> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2024-April/549827.html
>
> "The merge window is formally open again, and I'll be merging in next
> shortly. v2024.07 is scheduled for Monday, July 1st, 2024 and the merge
> window will close and -rc1 will be released on the 22nd of April, and
> then the next window will open with -rc2, two weeks later.
> "
>
> Changes since v2024.01:
> https://github.com/u-boot/u-boot/compare/v2024.01...v2024.04
>
> Complete changelog of merges from v2024.01...v2024.04:
>
> 425dc46a2c Merge tag 'u-boot-imx-master-20240330' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> 9468bf3a69 <https://gitlab.denx.de/u-boot/custodians/u-boot-imx9468bf3a69=
>
> Merge tag 'doc-2024-04-rc6' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> a5ec56aea1 <https://source.denx.de/u-boot/custodians/u-boot-efia5ec56aea1=
>
> Merge https://source.denx.de/u-boot/custodians/u-boot-riscv
> 34f0452e0e
> <https://source.denx.de/u-boot/custodians/u-boot-riscv34f0452e0e> Merge
> tag 'u-boot-amlogic-fixes-20240325' of
> https://source.denx.de/u-boot/custodians/u-boot-amlogic
> 5397daaed8
> <https://source.denx.de/u-boot/custodians/u-boot-amlogic5397daaed8> Merge
> tag 'efi-2024-04-rc5-2' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 6ec096a711 <https://source.denx.de/u-boot/custodians/u-boot-efi6ec096a711=
>
> Merge tag 'u-boot-imx-master-20240317' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> 86fd291a79 <https://gitlab.denx.de/u-boot/custodians/u-boot-imx86fd291a79=
>
> Merge tag 'efi-2024-04-rc5' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> a81242099c <https://source.denx.de/u-boot/custodians/u-boot-efia81242099c=
>
> Merge tag 'mips-fixes-for-v2024.04' of
> https://source.denx.de/u-boot/custodians/u-boot-mips
> 7422f661e2
> <https://source.denx.de/u-boot/custodians/u-boot-mips7422f661e2> Merge
> https://source.denx.de/u-boot/custodians/u-boot-riscv
> da07a629e1
> <https://source.denx.de/u-boot/custodians/u-boot-riscvda07a629e1> Merge
> tag 'u-boot-imx-master-20240311' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> 0981f8900f <https://gitlab.denx.de/u-boot/custodians/u-boot-imx0981f8900f=
>
> Merge https://source.denx.de/u-boot/custodians/u-boot-usb
> 485bfe1adb <https://source.denx.de/u-boot/custodians/u-boot-usb485bfe1adb=
>
> Merge branch 'master' of
> https://source.denx.de/u-boot/custodians/u-boot-marvell
> 46e3871aa6
> <https://source.denx.de/u-boot/custodians/u-boot-marvell46e3871aa6> Merge
> branch 'master' of https://source.denx.de/u-boot/custodians/u-boot-sunxi
> 773cb2bca7
> <https://source.denx.de/u-boot/custodians/u-boot-sunxi773cb2bca7> Merge
> tag 'u-boot-imx-master-20240304' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> eac52e4be4 <https://gitlab.denx.de/u-boot/custodians/u-boot-imxeac52e4be4=
>
> Merge patch series "ARM: renesas: Rename R-Mobile to Renesas"
> 574aac1c8c Merge branch 'master-riic' of
> https://source.denx.de/u-boot/custodians/u-boot-sh
> 44a15c3f4e <https://source.denx.de/u-boot/custodians/u-boot-sh44a15c3f4e>
> Merge patch series "toradex: fix reset and hardware detection regressions=
"
> abd4fb5ac1 Merge patch series "Dockerfile: Build coreboot from source"
> 1a66a7768a Merge tag 'u-boot-imx-master-20240224' of
> https://source.denx.de/u-boot/custodians/u-boot-imx
> bb9d6c7f4f <https://source.denx.de/u-boot/custodians/u-boot-imxbb9d6c7f4f=
>
> Merge tag 'u-boot-amlogic-fixes-20240223' of
> https://source.denx.de/u-boot/custodians/u-boot-amlogic
> 5e4a0c7f4a
> <https://source.denx.de/u-boot/custodians/u-boot-amlogic5e4a0c7f4a> Merge
> branch 'qcom-fixes-2024.04' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-snapdragon
> 7bb761c42d
> <https://gitlab.denx.de/u-boot/custodians/u-boot-snapdragon7bb761c42d>
> Merge patch series "board/ti: k3 boards: Stop using findfdt"
> 1817afe30f Merge https://gitlab.denx.de/u-boot/custodians/u-boot-usb
> bebf916f9e <https://gitlab.denx.de/u-boot/custodians/u-boot-usbbebf916f9e=
>
> Merge https://gitlab.denx.de/u-boot/custodians/u-boot-samsung
> 3e6f2a94bf
> <https://gitlab.denx.de/u-boot/custodians/u-boot-samsung3e6f2a94bf> Merge
> tag 'u-boot-imx-master-20240219' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> e4013bcb10 <https://gitlab.denx.de/u-boot/custodians/u-boot-imxe4013bcb10=
>
> Merge branch 'master-porter' of
> https://source.denx.de/u-boot/custodians/u-boot-sh
> 9e00b6993f <https://source.denx.de/u-boot/custodians/u-boot-sh9e00b6993f>
> Merge tag 'u-boot-dfu-20240215' of
> https://source.denx.de/u-boot/custodians/u-boot-dfu
> 77ff61a5bb <https://source.denx.de/u-boot/custodians/u-boot-dfu77ff61a5bb=
>
> Merge tag 'xilinx-for-v2024.04-rc3' of
> https://source.denx.de/u-boot/custodians/u-boot-microblaze
> 0b66c54a97
> <https://source.denx.de/u-boot/custodians/u-boot-microblaze0b66c54a97>
> Merge branch '2024-02-13-assorted-updates'
> 73b5b47dd5 Merge tag 'doc-2024-04-rc2' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 91c37c4a20 <https://source.denx.de/u-boot/custodians/u-boot-efi91c37c4a20=
>
> Merge tag 'u-boot-imx-master-20240212' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> e8f2404e09 <https://gitlab.denx.de/u-boot/custodians/u-boot-imxe8f2404e09=
>
> Merge branch 'master-779h0-r2' of
> https://source.denx.de/u-boot/custodians/u-boot-sh
> d7aaaf4223 <https://source.denx.de/u-boot/custodians/u-boot-shd7aaaf4223>
> Merge tag 'u-boot-dfu-20240209' of
> https://source.denx.de/u-boot/custodians/u-boot-dfu
> 2b51069b7c <https://source.denx.de/u-boot/custodians/u-boot-dfu2b51069b7c=
>
> Merge tag 'u-boot-imx-master-20240208' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> a7fb2f57ad <https://gitlab.denx.de/u-boot/custodians/u-boot-imxa7fb2f57ad=
>
> Merge tag 'fsl-qoriq-2024-2-8' of
> https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq
> 0101a2ffe1
> <https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq0101a2ffe1>
> Merge branch '2024-02-06-assorted-fixes'
> 7ebc77fede Merge tag 'u-boot-rockchip-20240207' of
> https://source.denx.de/u-boot/custodians/u-boot-rockchip
> daa3100250
> <https://source.denx.de/u-boot/custodians/u-boot-rockchipdaa3100250>
> Merge patch series "board: siemens: clean up subfolders"
> 090d8463b0 Merge tag 'rpi-next-2024.04' of
> https://source.denx.de/u-boot/custodians/u-boot-raspberrypi
> 819abd0a1e
> <https://source.denx.de/u-boot/custodians/u-boot-raspberrypi819abd0a1e>
> Merge tag 'smbios-2024-04-rc2' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 050a9b981d <https://source.denx.de/u-boot/custodians/u-boot-efi050a9b981d=
>
> Merge tag 'u-boot-amlogic-fixes-20240201' of
> https://source.denx.de/u-boot/custodians/u-boot-amlogic
> f0df21b40c
> <https://source.denx.de/u-boot/custodians/u-boot-amlogicf0df21b40c> Merge
> https://source.denx.de/u-boot/custodians/u-boot-watchdog
> b6d8969bcb
> <https://source.denx.de/u-boot/custodians/u-boot-watchdogb6d8969bcb>
> Merge tag 'u-boot-at91-2024.04-a' of
> https://source.denx.de/u-boot/custodians/u-boot-at91
> 625e68ef65
> <https://source.denx.de/u-boot/custodians/u-boot-at91625e68ef65> Merge
> https://source.denx.de/u-boot/custodians/u-boot-riscv
> 28760ce864
> <https://source.denx.de/u-boot/custodians/u-boot-riscv28760ce864> Merge
> tag 'clk-2024.04-rc2' of
> https://source.denx.de/u-boot/custodians/u-boot-clk
> d5c0c990c3 <https://source.denx.de/u-boot/custodians/u-boot-clkd5c0c990c3=
>
> Merge tag 'efi-2024-04-rc1-4' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 073f4f10b9 <https://source.denx.de/u-boot/custodians/u-boot-efi073f4f10b9=
>
> Merge patch series "Move framebuffer reservation for SPL to RAM end"
> 8986be59e7 Merge branch 'master' of
> https://source.denx.de/u-boot/custodians/u-boot-spi
> 41a737bb85 <https://source.denx.de/u-boot/custodians/u-boot-spi41a737bb85=
>
> Merge branch 'master' of
> https://source.denx.de/u-boot/custodians/u-boot-sunxi
> ce54325c42
> <https://source.denx.de/u-boot/custodians/u-boot-sunxice54325c42> Merge
> branch '2024-01-29-pytest-enhancements'
> 526a865fe4 Merge branch 'master-cleanup' of
> https://source.denx.de/u-boot/custodians/u-boot-sh
> fb5fe1bf84 <https://source.denx.de/u-boot/custodians/u-boot-shfb5fe1bf84>
> Merge tag 'smbios-2024-04-rc1-2' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> e7f9e5eb58 <https://source.denx.de/u-boot/custodians/u-boot-efie7f9e5eb58=
>
> Merge branch '2024-01-24-assorted-fixes-and-updates'
> 15e7927b5a Merge patch series "omap3: Make SPL_OMAP3_ID_NAND depend on
> NAND_OMAP_GPMC"
> c09ec8e1cb Merge https://gitlab.denx.de/u-boot/custodians/u-boot-marvell
> d64e05fc5b
> <https://gitlab.denx.de/u-boot/custodians/u-boot-marvelld64e05fc5b> Merge
> tag 'u-boot-imx-master-20240122' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> 79a9697894 <https://gitlab.denx.de/u-boot/custodians/u-boot-imx79a9697894=
>
> Merge commit '3c9bb8fbdc77f6bd56e97597d875d8965db3b96c' of
> https://github.com/tienfong/uboot_mainline
> 22aeab2d96 <https://github.com/tienfong/uboot_mainline22aeab2d96> Merge
> tag 'efi-2024-04-rc1-3' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 3c04fcf313 <https://source.denx.de/u-boot/custodians/u-boot-efi3c04fcf313=
>
> Merge patch series "k3-j721e: beagleboneai: Fix USB"
> 83a8424722 Merge tag 'u-boot-stm32-20240119' of
> https://source.denx.de/u-boot/custodians/u-boot-stm
> f4d5486506 <https://source.denx.de/u-boot/custodians/u-boot-stmf4d5486506=
>
> Merge branch '2024-01-18-assorted-fixes'
> cb49375239 Merge tag 'u-boot-rockchip-20240119' of
> https://source.denx.de/u-boot/custodians/u-boot-rockchip
> 002764d739
> <https://source.denx.de/u-boot/custodians/u-boot-rockchip002764d739>
> Merge tag 'xilinx-for-v2024.04-rc1-v2' of
> https://source.denx.de/u-boot/custodians/u-boot-microblaze
> bdaa0b27b3
> <https://source.denx.de/u-boot/custodians/u-boot-microblazebdaa0b27b3>
> Merge tag 'efi-2024-04-rc1-2' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 106332d6cc <https://source.denx.de/u-boot/custodians/u-boot-efi106332d6cc=
>
> Merge branch '2024-01-16-assorted-updates-and-improvements'
> 043ca8c8a9 Merge tag 'qcom-2024.04-rc1' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-snapdragon
> 6ca9349b67
> <https://gitlab.denx.de/u-boot/custodians/u-boot-snapdragon6ca9349b67>
> Merge tag 'u-boot-imx-20240115' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> b9631fe781 <https://gitlab.denx.de/u-boot/custodians/u-boot-imxb9631fe781=
>
> Merge tag 'u-boot-nand-20240115' of
> https://source.denx.de/u-boot/custodians/u-boot-nand-flash
> 697758e7c8
> <https://source.denx.de/u-boot/custodians/u-boot-nand-flash697758e7c8>
> Merge branch 'master-sync-dts-663' of
> https://source.denx.de/u-boot/custodians/u-boot-sh
> 817fdce324 <https://source.denx.de/u-boot/custodians/u-boot-sh817fdce324>
> Merge tag 'efi-2024-04-rc1' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 547d3dd28a <https://source.denx.de/u-boot/custodians/u-boot-efi547d3dd28a=
>
> Merge branch '2024-01-12-assorted-fixes'
> 2ee7a8ec6f Merge patch series "net fixes prior lwip"
> d3dba8a28b Merge tag 'u-boot-dfu-20240111' of
> https://source.denx.de/u-boot/custodians/u-boot-dfu
> 254a81c6b6 <https://source.denx.de/u-boot/custodians/u-boot-dfu254a81c6b6=
>
> Merge https://source.denx.de/u-boot/custodians/u-boot-marvell
> 344667db64
> <https://source.denx.de/u-boot/custodians/u-boot-marvell344667db64> Merge
> tag 'smbios-2024-04-rc1' of
> https://source.denx.de/u-boot/custodians/u-boot-efi
> 0727b10f6b <https://source.denx.de/u-boot/custodians/u-boot-efi0727b10f6b=
>
> Merge branch 'master' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-samsung
> c7937a4199
> <https://gitlab.denx.de/u-boot/custodians/u-boot-samsungc7937a4199> Merge
> tag 'rng-2024-04-rc1' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-efi
> c5e461fbf7 <https://gitlab.denx.de/u-boot/custodians/u-boot-efic5e461fbf7=
>
> Merge tag 'u-boot-imx-master-20240108' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx
> 93d91e9485 <https://gitlab.denx.de/u-boot/custodians/u-boot-imx93d91e9485=
>
> Merge branch 'next'
> f28a77589e Merge tag 'dm-next-7jan23' of
> https://source.denx.de/u-boot/custodians/u-boot-dm into next
> c2c598e87c Merge branch 'staging' of
> https://source.denx.de/u-boot/custodians/u-boot-tegra into next
> 18fa946ab9 Merge branch '2024-01-05-fw_env-fixes' into next
> 0d53be75c7 Merge patch series "ATF and OP-TEE Firewalling for K3 devices.=
"
> 93a0138acb Merge tag 'v2024.01-rc6' into next
> dffa6d0210 Merge tag 'dm-next-1124' of
> https://source.denx.de/u-boot/custodians/u-boot-dm into next
> 2b28c3b871 Merge patch series "Modernize U-Boot shell"
> 64e47952f5 Merge branch 'next' of
> https://source.denx.de/u-boot/custodians/u-boot-riscv into next
> 7c4647b8fb Merge patch series "Complete decoupling of bootm logic from
> commands"
> ced928b199 Merge branch '2023-12-21-assorted-updates-and-fixes' into next
> ae797e022e Merge branch '2023-12-21-header-inclusion-cleanup' into next
> 36d3db6c2c Merge branch '2023-12-20-assorted-general-updates' into next
> a0d0e132b3 Merge tag 'u-boot-imx-next-20231220' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
> f7655af980 Merge tag 'u-boot-amlogic-next-20231220' of
> https://source.denx.de/u-boot/custodians/u-boot-amlogic into next
> 1f115bdeb8 Merge branch 'staging' of
> https://source.denx.de/u-boot/custodians/u-boot-tegra into next
> 936d0f9dd7 Merge patch series "Fix J7200 kernel boot when using upstream
> u-boot"
> 9cfef5fcfb Merge patch series "Add support for MediaTek MT8365 EVK Board"
> 298419ba4d Merge branch '2023-12-19-assorted-platform-updates' into next
> a6f86132e3 Merge branch 'next' of
> https://source.denx.de/u-boot/custodians/u-boot-riscv into next
> cd908ba186 Merge branch 'master' of
> https://source.denx.de/u-boot/custodians/u-boot-spi into next
> 1373ffde52 Merge tag 'v2024.01-rc5' into next
> fdefb4e194 Merge tag 'efi-next-20231217' of
> https://source.denx.de/u-boot/custodians/u-boot-efi into next
> 8bb3cd7fe7 Merge tag 'clk-2024.01-next' of
> https://source.denx.de/u-boot/custodians/u-boot-clk into next
> 57e584d941 Merge branch '2023-12-15-assorted-TI-platform-updates' into ne=
xt
> c936ef7870 Merge tag 'u-boot-stm32-20231215' of
> https://source.denx.de/u-boot/custodians/u-boot-stm into next
> d7a2c7ff75 Merge patch series "bootm: Handle compressed arm64 images with
> bootm"
> fa3f19aa56 Merge tag 'xilinx-for-v2024.04-rc1' of
> https://source.denx.de/u-boot/custodians/u-boot-microblaze into next
> 11e1cc7aae Merge tag 'u-boot-imx-next-20231214' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
> 86f623dcf8 Merge tag 'dm-next-13dec23' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-dm into next
> 9565771076 Merge patch series "bootm: Refactoring to reduce reliance on
> CMDLINE (part A)"
> bfe3c7b93b Merge patch series "some LED patches"
> e54987d6af Merge patch series "cmd: bdinfo: Optionally use getopt and
> implement bdinfo -a"
> d379150621 Merge tag 'v2024.01-rc4' into next
> 4a363dd516 Merge branch 'staging' of
> https://source.denx.de/u-boot/custodians/u-boot-tegra into next
> 6357cf0cc4 Merge branch '2023-11-29-assorted-platform-updates' into next
> 339d96822e Merge patch series "cmd: add scmi command"
> e2a9edc0ce Merge patch series "fs: fat: calculate FAT type based on
> cluster count"
> 38cc6cdeb1 Merge patch series "Import "string" I/O functions from Linux"
> 66c21738fd Merge patch series "sysinfo: Expand sysinfo with some more
> banner information"
> d6e052c615 Merge patch series "ufs: Add a PCI UFS controller support"
> 129d6a0d87 Merge tag 'u-boot-dfu-next-20231124' of
> https://source.denx.de/u-boot/custodians/u-boot-dfu into next
> 1682d97db9 Merge branch '2023-11-25-assorted-platform-updates' into next
> 054222eb68 Merge branch '2023-11-22-TI-K3-cleanups' into next
> 0744fef6a3 Merge tag 'tpm-next-22112023' of
> https://source.denx.de/u-boot/custodians/u-boot-tpm into next
> dca7a8958f Merge tag 'v2024.01-rc3' into next
> 9e4b42267e Merge tag 'efi-next-18112023' of
> https://source.denx.de/u-boot/custodians/u-boot-tpm into next
> ae7ec8b0be Merge branch '2023-11-16-assorted-updates' into next
> 6c1608b1ff Merge patch series "spl: Use common function for
> loading/parsing images"
> 5e6a112e11 Merge patch series "nand: Add sandbox tests"
> be0724601a Merge tag 'u-boot-stm32-20231113' of
> https://source.denx.de/u-boot/custodians/u-boot-stm into next
> 3b6db6901f Merge branch '2023-11-10-improve-semihosting-armv6' into next
> 1e4d9dd871 Merge branch '2023-11-07-assorted-big-cleanups' into next
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
>  .../u-boot/{u-boot-tools_2024.01.bb =3D> u-boot-tools_2024.04.bb} | 0
>  .../recipes-bsp/u-boot/{u-boot_2024.01.bb =3D> u-boot_2024.04.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.01.bb =3D>
> u-boot-tools_2024.04.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2024.01.bb =3D> u-boot_2024.04.bb=
}
> (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index 1f17bd7d0af..ca5357392a5 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -12,7 +12,7 @@ PE =3D "1"
>
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV =3D "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
> +SRCREV =3D "25049ad560826f7dc1c4740883b0016014a59789"
>
>  SRC_URI =3D "git://
> source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branch=3Dmaster"
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
> b/meta/recipes-bsp/u-boot/u-boot_2024.04.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2024.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2024.04.bb
> --
> 2.43.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198067):
> https://lists.openembedded.org/g/openembedded-core/message/198067
> Mute This Topic: https://lists.openembedded.org/mt/105423519/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000081f0260615ab83b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To make it absolutely clear, this is for &quot;master&quot=
; (styhead 5.1) NOT for &quot;scarthgap&quot;.</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 9, 2024 at 8:12=
=E2=80=AFAM Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.o=
rling@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Release announcement:<br>
<a href=3D"https://lists.denx.de/pipermail/u-boot/2024-April/549827.html" r=
el=3D"noreferrer" target=3D"_blank">https://lists.denx.de/pipermail/u-boot/=
2024-April/549827.html</a><br>
<br>
&quot;The merge window is formally open again, and I&#39;ll be merging in n=
ext<br>
shortly. v2024.07 is scheduled for Monday, July 1st, 2024 and the merge<br>
window will close and -rc1 will be released on the 22nd of April, and<br>
then the next window will open with -rc2, two weeks later.<br>
&quot;<br>
<br>
Changes since v2024.01:<br>
<a href=3D"https://github.com/u-boot/u-boot/compare/v2024.01...v2024.04" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/u-boot/u-boot/compare=
/v2024.01...v2024.04</a><br>
<br>
Complete changelog of merges from v2024.01...v2024.04:<br>
<br>
425dc46a2c Merge tag &#39;u-boot-imx-master-20240330&#39; of <a href=3D"htt=
ps://gitlab.denx.de/u-boot/custodians/u-boot-imx9468bf3a69" rel=3D"noreferr=
er" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-imx<b=
r>
9468bf3a69</a> Merge tag &#39;doc-2024-04-rc6&#39; of <a href=3D"https://so=
urce.denx.de/u-boot/custodians/u-boot-efia5ec56aea1" rel=3D"noreferrer" tar=
get=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
a5ec56aea1</a> Merge <a href=3D"https://source.denx.de/u-boot/custodians/u-=
boot-riscv34f0452e0e" rel=3D"noreferrer" target=3D"_blank">https://source.d=
enx.de/u-boot/custodians/u-boot-riscv<br>
34f0452e0e</a> Merge tag &#39;u-boot-amlogic-fixes-20240325&#39; of <a href=
=3D"https://source.denx.de/u-boot/custodians/u-boot-amlogic5397daaed8" rel=
=3D"noreferrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/=
u-boot-amlogic<br>
5397daaed8</a> Merge tag &#39;efi-2024-04-rc5-2&#39; of <a href=3D"https://=
source.denx.de/u-boot/custodians/u-boot-efi6ec096a711" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
6ec096a711</a> Merge tag &#39;u-boot-imx-master-20240317&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imx86fd291a79" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
86fd291a79</a> Merge tag &#39;efi-2024-04-rc5&#39; of <a href=3D"https://so=
urce.denx.de/u-boot/custodians/u-boot-efia81242099c" rel=3D"noreferrer" tar=
get=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
a81242099c</a> Merge tag &#39;mips-fixes-for-v2024.04&#39; of <a href=3D"ht=
tps://source.denx.de/u-boot/custodians/u-boot-mips7422f661e2" rel=3D"norefe=
rrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-mip=
s<br>
7422f661e2</a> Merge <a href=3D"https://source.denx.de/u-boot/custodians/u-=
boot-riscvda07a629e1" rel=3D"noreferrer" target=3D"_blank">https://source.d=
enx.de/u-boot/custodians/u-boot-riscv<br>
da07a629e1</a> Merge tag &#39;u-boot-imx-master-20240311&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imx0981f8900f" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
0981f8900f</a> Merge <a href=3D"https://source.denx.de/u-boot/custodians/u-=
boot-usb485bfe1adb" rel=3D"noreferrer" target=3D"_blank">https://source.den=
x.de/u-boot/custodians/u-boot-usb<br>
485bfe1adb</a> Merge branch &#39;master&#39; of <a href=3D"https://source.d=
enx.de/u-boot/custodians/u-boot-marvell46e3871aa6" rel=3D"noreferrer" targe=
t=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-marvell<br>
46e3871aa6</a> Merge branch &#39;master&#39; of <a href=3D"https://source.d=
enx.de/u-boot/custodians/u-boot-sunxi773cb2bca7" rel=3D"noreferrer" target=
=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-sunxi<br>
773cb2bca7</a> Merge tag &#39;u-boot-imx-master-20240304&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imxeac52e4be4" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
eac52e4be4</a> Merge patch series &quot;ARM: renesas: Rename R-Mobile to Re=
nesas&quot;<br>
574aac1c8c Merge branch &#39;master-riic&#39; of <a href=3D"https://source.=
denx.de/u-boot/custodians/u-boot-sh44a15c3f4e" rel=3D"noreferrer" target=3D=
"_blank">https://source.denx.de/u-boot/custodians/u-boot-sh<br>
44a15c3f4e</a> Merge patch series &quot;toradex: fix reset and hardware det=
ection regressions&quot;<br>
abd4fb5ac1 Merge patch series &quot;Dockerfile: Build coreboot from source&=
quot;<br>
1a66a7768a Merge tag &#39;u-boot-imx-master-20240224&#39; of <a href=3D"htt=
ps://source.denx.de/u-boot/custodians/u-boot-imxbb9d6c7f4f" rel=3D"noreferr=
er" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-imx<b=
r>
bb9d6c7f4f</a> Merge tag &#39;u-boot-amlogic-fixes-20240223&#39; of <a href=
=3D"https://source.denx.de/u-boot/custodians/u-boot-amlogic5e4a0c7f4a" rel=
=3D"noreferrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/=
u-boot-amlogic<br>
5e4a0c7f4a</a> Merge branch &#39;qcom-fixes-2024.04&#39; of <a href=3D"http=
s://gitlab.denx.de/u-boot/custodians/u-boot-snapdragon7bb761c42d" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot=
-snapdragon<br>
7bb761c42d</a> Merge patch series &quot;board/ti: k3 boards: Stop using fin=
dfdt&quot;<br>
1817afe30f Merge <a href=3D"https://gitlab.denx.de/u-boot/custodians/u-boot=
-usbbebf916f9e" rel=3D"noreferrer" target=3D"_blank">https://gitlab.denx.de=
/u-boot/custodians/u-boot-usb<br>
bebf916f9e</a> Merge <a href=3D"https://gitlab.denx.de/u-boot/custodians/u-=
boot-samsung3e6f2a94bf" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.denx.de/u-boot/custodians/u-boot-samsung<br>
3e6f2a94bf</a> Merge tag &#39;u-boot-imx-master-20240219&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imxe4013bcb10" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
e4013bcb10</a> Merge branch &#39;master-porter&#39; of <a href=3D"https://s=
ource.denx.de/u-boot/custodians/u-boot-sh9e00b6993f" rel=3D"noreferrer" tar=
get=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-sh<br>
9e00b6993f</a> Merge tag &#39;u-boot-dfu-20240215&#39; of <a href=3D"https:=
//source.denx.de/u-boot/custodians/u-boot-dfu77ff61a5bb" rel=3D"noreferrer"=
 target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-dfu<br>
77ff61a5bb</a> Merge tag &#39;xilinx-for-v2024.04-rc3&#39; of <a href=3D"ht=
tps://source.denx.de/u-boot/custodians/u-boot-microblaze0b66c54a97" rel=3D"=
noreferrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-bo=
ot-microblaze<br>
0b66c54a97</a> Merge branch &#39;2024-02-13-assorted-updates&#39;<br>
73b5b47dd5 Merge tag &#39;doc-2024-04-rc2&#39; of <a href=3D"https://source=
.denx.de/u-boot/custodians/u-boot-efi91c37c4a20" rel=3D"noreferrer" target=
=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
91c37c4a20</a> Merge tag &#39;u-boot-imx-master-20240212&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imxe8f2404e09" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
e8f2404e09</a> Merge branch &#39;master-779h0-r2&#39; of <a href=3D"https:/=
/source.denx.de/u-boot/custodians/u-boot-shd7aaaf4223" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-sh<br>
d7aaaf4223</a> Merge tag &#39;u-boot-dfu-20240209&#39; of <a href=3D"https:=
//source.denx.de/u-boot/custodians/u-boot-dfu2b51069b7c" rel=3D"noreferrer"=
 target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-dfu<br>
2b51069b7c</a> Merge tag &#39;u-boot-imx-master-20240208&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imxa7fb2f57ad" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
a7fb2f57ad</a> Merge tag &#39;fsl-qoriq-2024-2-8&#39; of <a href=3D"https:/=
/source.denx.de/u-boot/custodians/u-boot-fsl-qoriq0101a2ffe1" rel=3D"norefe=
rrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-fsl=
-qoriq<br>
0101a2ffe1</a> Merge branch &#39;2024-02-06-assorted-fixes&#39;<br>
7ebc77fede Merge tag &#39;u-boot-rockchip-20240207&#39; of <a href=3D"https=
://source.denx.de/u-boot/custodians/u-boot-rockchipdaa3100250" rel=3D"noref=
errer" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-ro=
ckchip<br>
daa3100250</a> Merge patch series &quot;board: siemens: clean up subfolders=
&quot;<br>
090d8463b0 Merge tag &#39;rpi-next-2024.04&#39; of <a href=3D"https://sourc=
e.denx.de/u-boot/custodians/u-boot-raspberrypi819abd0a1e" rel=3D"noreferrer=
" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-raspber=
rypi<br>
819abd0a1e</a> Merge tag &#39;smbios-2024-04-rc2&#39; of <a href=3D"https:/=
/source.denx.de/u-boot/custodians/u-boot-efi050a9b981d" rel=3D"noreferrer" =
target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
050a9b981d</a> Merge tag &#39;u-boot-amlogic-fixes-20240201&#39; of <a href=
=3D"https://source.denx.de/u-boot/custodians/u-boot-amlogicf0df21b40c" rel=
=3D"noreferrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/=
u-boot-amlogic<br>
f0df21b40c</a> Merge <a href=3D"https://source.denx.de/u-boot/custodians/u-=
boot-watchdogb6d8969bcb" rel=3D"noreferrer" target=3D"_blank">https://sourc=
e.denx.de/u-boot/custodians/u-boot-watchdog<br>
b6d8969bcb</a> Merge tag &#39;u-boot-at91-2024.04-a&#39; of <a href=3D"http=
s://source.denx.de/u-boot/custodians/u-boot-at91625e68ef65" rel=3D"noreferr=
er" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-at91<=
br>
625e68ef65</a> Merge <a href=3D"https://source.denx.de/u-boot/custodians/u-=
boot-riscv28760ce864" rel=3D"noreferrer" target=3D"_blank">https://source.d=
enx.de/u-boot/custodians/u-boot-riscv<br>
28760ce864</a> Merge tag &#39;clk-2024.04-rc2&#39; of <a href=3D"https://so=
urce.denx.de/u-boot/custodians/u-boot-clkd5c0c990c3" rel=3D"noreferrer" tar=
get=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-clk<br>
d5c0c990c3</a> Merge tag &#39;efi-2024-04-rc1-4&#39; of <a href=3D"https://=
source.denx.de/u-boot/custodians/u-boot-efi073f4f10b9" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
073f4f10b9</a> Merge patch series &quot;Move framebuffer reservation for SP=
L to RAM end&quot;<br>
8986be59e7 Merge branch &#39;master&#39; of <a href=3D"https://source.denx.=
de/u-boot/custodians/u-boot-spi41a737bb85" rel=3D"noreferrer" target=3D"_bl=
ank">https://source.denx.de/u-boot/custodians/u-boot-spi<br>
41a737bb85</a> Merge branch &#39;master&#39; of <a href=3D"https://source.d=
enx.de/u-boot/custodians/u-boot-sunxice54325c42" rel=3D"noreferrer" target=
=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-sunxi<br>
ce54325c42</a> Merge branch &#39;2024-01-29-pytest-enhancements&#39;<br>
526a865fe4 Merge branch &#39;master-cleanup&#39; of <a href=3D"https://sour=
ce.denx.de/u-boot/custodians/u-boot-shfb5fe1bf84" rel=3D"noreferrer" target=
=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-sh<br>
fb5fe1bf84</a> Merge tag &#39;smbios-2024-04-rc1-2&#39; of <a href=3D"https=
://source.denx.de/u-boot/custodians/u-boot-efie7f9e5eb58" rel=3D"noreferrer=
" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
e7f9e5eb58</a> Merge branch &#39;2024-01-24-assorted-fixes-and-updates&#39;=
<br>
15e7927b5a Merge patch series &quot;omap3: Make SPL_OMAP3_ID_NAND depend on=
 NAND_OMAP_GPMC&quot;<br>
c09ec8e1cb Merge <a href=3D"https://gitlab.denx.de/u-boot/custodians/u-boot=
-marvelld64e05fc5b" rel=3D"noreferrer" target=3D"_blank">https://gitlab.den=
x.de/u-boot/custodians/u-boot-marvell<br>
d64e05fc5b</a> Merge tag &#39;u-boot-imx-master-20240122&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imx79a9697894" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
79a9697894</a> Merge commit &#39;3c9bb8fbdc77f6bd56e97597d875d8965db3b96c&#=
39; of <a href=3D"https://github.com/tienfong/uboot_mainline22aeab2d96" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/tienfong/uboot_mainlin=
e<br>
22aeab2d96</a> Merge tag &#39;efi-2024-04-rc1-3&#39; of <a href=3D"https://=
source.denx.de/u-boot/custodians/u-boot-efi3c04fcf313" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
3c04fcf313</a> Merge patch series &quot;k3-j721e: beagleboneai: Fix USB&quo=
t;<br>
83a8424722 Merge tag &#39;u-boot-stm32-20240119&#39; of <a href=3D"https://=
source.denx.de/u-boot/custodians/u-boot-stmf4d5486506" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-stm<br>
f4d5486506</a> Merge branch &#39;2024-01-18-assorted-fixes&#39;<br>
cb49375239 Merge tag &#39;u-boot-rockchip-20240119&#39; of <a href=3D"https=
://source.denx.de/u-boot/custodians/u-boot-rockchip002764d739" rel=3D"noref=
errer" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-ro=
ckchip<br>
002764d739</a> Merge tag &#39;xilinx-for-v2024.04-rc1-v2&#39; of <a href=3D=
"https://source.denx.de/u-boot/custodians/u-boot-microblazebdaa0b27b3" rel=
=3D"noreferrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/=
u-boot-microblaze<br>
bdaa0b27b3</a> Merge tag &#39;efi-2024-04-rc1-2&#39; of <a href=3D"https://=
source.denx.de/u-boot/custodians/u-boot-efi106332d6cc" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
106332d6cc</a> Merge branch &#39;2024-01-16-assorted-updates-and-improvemen=
ts&#39;<br>
043ca8c8a9 Merge tag &#39;qcom-2024.04-rc1&#39; of <a href=3D"https://gitla=
b.denx.de/u-boot/custodians/u-boot-snapdragon6ca9349b67" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-snapdrag=
on<br>
6ca9349b67</a> Merge tag &#39;u-boot-imx-20240115&#39; of <a href=3D"https:=
//gitlab.denx.de/u-boot/custodians/u-boot-imxb9631fe781" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-imx<br>
b9631fe781</a> Merge tag &#39;u-boot-nand-20240115&#39; of <a href=3D"https=
://source.denx.de/u-boot/custodians/u-boot-nand-flash697758e7c8" rel=3D"nor=
eferrer" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-=
nand-flash<br>
697758e7c8</a> Merge branch &#39;master-sync-dts-663&#39; of <a href=3D"htt=
ps://source.denx.de/u-boot/custodians/u-boot-sh817fdce324" rel=3D"noreferre=
r" target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-sh<br>
817fdce324</a> Merge tag &#39;efi-2024-04-rc1&#39; of <a href=3D"https://so=
urce.denx.de/u-boot/custodians/u-boot-efi547d3dd28a" rel=3D"noreferrer" tar=
get=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
547d3dd28a</a> Merge branch &#39;2024-01-12-assorted-fixes&#39;<br>
2ee7a8ec6f Merge patch series &quot;net fixes prior lwip&quot;<br>
d3dba8a28b Merge tag &#39;u-boot-dfu-20240111&#39; of <a href=3D"https://so=
urce.denx.de/u-boot/custodians/u-boot-dfu254a81c6b6" rel=3D"noreferrer" tar=
get=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-dfu<br>
254a81c6b6</a> Merge <a href=3D"https://source.denx.de/u-boot/custodians/u-=
boot-marvell344667db64" rel=3D"noreferrer" target=3D"_blank">https://source=
.denx.de/u-boot/custodians/u-boot-marvell<br>
344667db64</a> Merge tag &#39;smbios-2024-04-rc1&#39; of <a href=3D"https:/=
/source.denx.de/u-boot/custodians/u-boot-efi0727b10f6b" rel=3D"noreferrer" =
target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-efi<br>
0727b10f6b</a> Merge branch &#39;master&#39; of <a href=3D"https://gitlab.d=
enx.de/u-boot/custodians/u-boot-samsungc7937a4199" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-samsung<br>
c7937a4199</a> Merge tag &#39;rng-2024-04-rc1&#39; of <a href=3D"https://gi=
tlab.denx.de/u-boot/custodians/u-boot-efic5e461fbf7" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-efi<br>
c5e461fbf7</a> Merge tag &#39;u-boot-imx-master-20240108&#39; of <a href=3D=
"https://gitlab.denx.de/u-boot/custodians/u-boot-imx93d91e9485" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-i=
mx<br>
93d91e9485</a> Merge branch &#39;next&#39;<br>
f28a77589e Merge tag &#39;dm-next-7jan23&#39; of <a href=3D"https://source.=
denx.de/u-boot/custodians/u-boot-dm" rel=3D"noreferrer" target=3D"_blank">h=
ttps://source.denx.de/u-boot/custodians/u-boot-dm</a> into next<br>
c2c598e87c Merge branch &#39;staging&#39; of <a href=3D"https://source.denx=
.de/u-boot/custodians/u-boot-tegra" rel=3D"noreferrer" target=3D"_blank">ht=
tps://source.denx.de/u-boot/custodians/u-boot-tegra</a> into next<br>
18fa946ab9 Merge branch &#39;2024-01-05-fw_env-fixes&#39; into next<br>
0d53be75c7 Merge patch series &quot;ATF and OP-TEE Firewalling for K3 devic=
es.&quot;<br>
93a0138acb Merge tag &#39;v2024.01-rc6&#39; into next<br>
dffa6d0210 Merge tag &#39;dm-next-1124&#39; of <a href=3D"https://source.de=
nx.de/u-boot/custodians/u-boot-dm" rel=3D"noreferrer" target=3D"_blank">htt=
ps://source.denx.de/u-boot/custodians/u-boot-dm</a> into next<br>
2b28c3b871 Merge patch series &quot;Modernize U-Boot shell&quot;<br>
64e47952f5 Merge branch &#39;next&#39; of <a href=3D"https://source.denx.de=
/u-boot/custodians/u-boot-riscv" rel=3D"noreferrer" target=3D"_blank">https=
://source.denx.de/u-boot/custodians/u-boot-riscv</a> into next<br>
7c4647b8fb Merge patch series &quot;Complete decoupling of bootm logic from=
 commands&quot;<br>
ced928b199 Merge branch &#39;2023-12-21-assorted-updates-and-fixes&#39; int=
o next<br>
ae797e022e Merge branch &#39;2023-12-21-header-inclusion-cleanup&#39; into =
next<br>
36d3db6c2c Merge branch &#39;2023-12-20-assorted-general-updates&#39; into =
next<br>
a0d0e132b3 Merge tag &#39;u-boot-imx-next-20231220&#39; of <a href=3D"https=
://gitlab.denx.de/u-boot/custodians/u-boot-imx" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-imx</a> into ne=
xt<br>
f7655af980 Merge tag &#39;u-boot-amlogic-next-20231220&#39; of <a href=3D"h=
ttps://source.denx.de/u-boot/custodians/u-boot-amlogic" rel=3D"noreferrer" =
target=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-amlogic</=
a> into next<br>
1f115bdeb8 Merge branch &#39;staging&#39; of <a href=3D"https://source.denx=
.de/u-boot/custodians/u-boot-tegra" rel=3D"noreferrer" target=3D"_blank">ht=
tps://source.denx.de/u-boot/custodians/u-boot-tegra</a> into next<br>
936d0f9dd7 Merge patch series &quot;Fix J7200 kernel boot when using upstre=
am u-boot&quot;<br>
9cfef5fcfb Merge patch series &quot;Add support for MediaTek MT8365 EVK Boa=
rd&quot;<br>
298419ba4d Merge branch &#39;2023-12-19-assorted-platform-updates&#39; into=
 next<br>
a6f86132e3 Merge branch &#39;next&#39; of <a href=3D"https://source.denx.de=
/u-boot/custodians/u-boot-riscv" rel=3D"noreferrer" target=3D"_blank">https=
://source.denx.de/u-boot/custodians/u-boot-riscv</a> into next<br>
cd908ba186 Merge branch &#39;master&#39; of <a href=3D"https://source.denx.=
de/u-boot/custodians/u-boot-spi" rel=3D"noreferrer" target=3D"_blank">https=
://source.denx.de/u-boot/custodians/u-boot-spi</a> into next<br>
1373ffde52 Merge tag &#39;v2024.01-rc5&#39; into next<br>
fdefb4e194 Merge tag &#39;efi-next-20231217&#39; of <a href=3D"https://sour=
ce.denx.de/u-boot/custodians/u-boot-efi" rel=3D"noreferrer" target=3D"_blan=
k">https://source.denx.de/u-boot/custodians/u-boot-efi</a> into next<br>
8bb3cd7fe7 Merge tag &#39;clk-2024.01-next&#39; of <a href=3D"https://sourc=
e.denx.de/u-boot/custodians/u-boot-clk" rel=3D"noreferrer" target=3D"_blank=
">https://source.denx.de/u-boot/custodians/u-boot-clk</a> into next<br>
57e584d941 Merge branch &#39;2023-12-15-assorted-TI-platform-updates&#39; i=
nto next<br>
c936ef7870 Merge tag &#39;u-boot-stm32-20231215&#39; of <a href=3D"https://=
source.denx.de/u-boot/custodians/u-boot-stm" rel=3D"noreferrer" target=3D"_=
blank">https://source.denx.de/u-boot/custodians/u-boot-stm</a> into next<br=
>
d7a2c7ff75 Merge patch series &quot;bootm: Handle compressed arm64 images w=
ith bootm&quot;<br>
fa3f19aa56 Merge tag &#39;xilinx-for-v2024.04-rc1&#39; of <a href=3D"https:=
//source.denx.de/u-boot/custodians/u-boot-microblaze" rel=3D"noreferrer" ta=
rget=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-microblaze<=
/a> into next<br>
11e1cc7aae Merge tag &#39;u-boot-imx-next-20231214&#39; of <a href=3D"https=
://gitlab.denx.de/u-boot/custodians/u-boot-imx" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.denx.de/u-boot/custodians/u-boot-imx</a> into ne=
xt<br>
86f623dcf8 Merge tag &#39;dm-next-13dec23&#39; of <a href=3D"https://gitlab=
.denx.de/u-boot/custodians/u-boot-dm" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.denx.de/u-boot/custodians/u-boot-dm</a> into next<br>
9565771076 Merge patch series &quot;bootm: Refactoring to reduce reliance o=
n CMDLINE (part A)&quot;<br>
bfe3c7b93b Merge patch series &quot;some LED patches&quot;<br>
e54987d6af Merge patch series &quot;cmd: bdinfo: Optionally use getopt and =
implement bdinfo -a&quot;<br>
d379150621 Merge tag &#39;v2024.01-rc4&#39; into next<br>
4a363dd516 Merge branch &#39;staging&#39; of <a href=3D"https://source.denx=
.de/u-boot/custodians/u-boot-tegra" rel=3D"noreferrer" target=3D"_blank">ht=
tps://source.denx.de/u-boot/custodians/u-boot-tegra</a> into next<br>
6357cf0cc4 Merge branch &#39;2023-11-29-assorted-platform-updates&#39; into=
 next<br>
339d96822e Merge patch series &quot;cmd: add scmi command&quot;<br>
e2a9edc0ce Merge patch series &quot;fs: fat: calculate FAT type based on cl=
uster count&quot;<br>
38cc6cdeb1 Merge patch series &quot;Import &quot;string&quot; I/O functions=
 from Linux&quot;<br>
66c21738fd Merge patch series &quot;sysinfo: Expand sysinfo with some more =
banner information&quot;<br>
d6e052c615 Merge patch series &quot;ufs: Add a PCI UFS controller support&q=
uot;<br>
129d6a0d87 Merge tag &#39;u-boot-dfu-next-20231124&#39; of <a href=3D"https=
://source.denx.de/u-boot/custodians/u-boot-dfu" rel=3D"noreferrer" target=
=3D"_blank">https://source.denx.de/u-boot/custodians/u-boot-dfu</a> into ne=
xt<br>
1682d97db9 Merge branch &#39;2023-11-25-assorted-platform-updates&#39; into=
 next<br>
054222eb68 Merge branch &#39;2023-11-22-TI-K3-cleanups&#39; into next<br>
0744fef6a3 Merge tag &#39;tpm-next-22112023&#39; of <a href=3D"https://sour=
ce.denx.de/u-boot/custodians/u-boot-tpm" rel=3D"noreferrer" target=3D"_blan=
k">https://source.denx.de/u-boot/custodians/u-boot-tpm</a> into next<br>
dca7a8958f Merge tag &#39;v2024.01-rc3&#39; into next<br>
9e4b42267e Merge tag &#39;efi-next-18112023&#39; of <a href=3D"https://sour=
ce.denx.de/u-boot/custodians/u-boot-tpm" rel=3D"noreferrer" target=3D"_blan=
k">https://source.denx.de/u-boot/custodians/u-boot-tpm</a> into next<br>
ae7ec8b0be Merge branch &#39;2023-11-16-assorted-updates&#39; into next<br>
6c1608b1ff Merge patch series &quot;spl: Use common function for loading/pa=
rsing images&quot;<br>
5e6a112e11 Merge patch series &quot;nand: Add sandbox tests&quot;<br>
be0724601a Merge tag &#39;u-boot-stm32-20231113&#39; of <a href=3D"https://=
source.denx.de/u-boot/custodians/u-boot-stm" rel=3D"noreferrer" target=3D"_=
blank">https://source.denx.de/u-boot/custodians/u-boot-stm</a> into next<br=
>
3b6db6901f Merge branch &#39;2023-11-10-improve-semihosting-armv6&#39; into=
 next<br>
1e4d9dd871 Merge branch &#39;2023-11-07-assorted-big-cleanups&#39; into nex=
t<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../u-boot/{<a href=3D"http://u-boot-tools_2024.01.bb" rel=3D"norefer=
rer" target=3D"_blank">u-boot-tools_2024.01.bb</a> =3D&gt; <a href=3D"http:=
//u-boot-tools_2024.04.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-tool=
s_2024.04.bb</a>} | 0<br>
=C2=A0.../recipes-bsp/u-boot/{<a href=3D"http://u-boot_2024.01.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-boot_2024.01.bb</a> =3D&gt; <a href=3D"http:=
//u-boot_2024.04.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2024.04.bb=
</a>} | 0<br>
=C2=A03 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-tools_2024.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-tools_2024.01.bb</a> =3D&=
gt; <a href=3D"http://u-boot-tools_2024.04.bb" rel=3D"noreferrer" target=3D=
"_blank">u-boot-tools_2024.04.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2024.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-boot_2024.01.bb</a> =3D&gt; <a href=
=3D"http://u-boot_2024.04.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2=
024.04.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc<br>
index 1f17bd7d0af..ca5357392a5 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc<br>
@@ -12,7 +12,7 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0# We use the revision in order to avoid having to fetch it from the<b=
r>
=C2=A0# repo during parse<br>
-SRCREV =3D &quot;866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e&quot;<br>
+SRCREV =3D &quot;25049ad560826f7dc1c4740883b0016014a59789&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://source.denx.de/u-boot/u-boo=
t.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank=
">source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branch=3Dmaster</a>&quo=
t;<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-tools_2024.01=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-tools_2024.01.bb</a> b/met=
a/recipes-bsp/u-boot/<a href=3D"http://u-boot-tools_2024.04.bb" rel=3D"nore=
ferrer" target=3D"_blank">u-boot-tools_2024.04.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-tools_2024.01.=
bb" rel=3D"noreferrer" target=3D"_blank">u-boot-tools_2024.01.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-tools_2024.04.bb=
" rel=3D"noreferrer" target=3D"_blank">u-boot-tools_2024.04.bb</a><br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2024.01.bb" r=
el=3D"noreferrer" target=3D"_blank">u-boot_2024.01.bb</a> b/meta/recipes-bs=
p/u-boot/<a href=3D"http://u-boot_2024.04.bb" rel=3D"noreferrer" target=3D"=
_blank">u-boot_2024.04.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2024.01.bb" re=
l=3D"noreferrer" target=3D"_blank">u-boot_2024.01.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2024.04.bb" rel=
=3D"noreferrer" target=3D"_blank">u-boot_2024.04.bb</a><br>
-- <br>
2.43.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198067): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198067" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198067</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105423519/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105423519/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000081f0260615ab83b7--

