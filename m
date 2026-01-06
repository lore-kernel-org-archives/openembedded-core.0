Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACDBCEFD18
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 22:30:28 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2091.1767738627314137693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 14:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIEqEKyF;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-455af5758fdso955124b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 14:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767738626; x=1768343426; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk0i2vbFSiC9zdoNDy8sWwbQ9cDG6OGMHIG8dTU3ef8=;
        b=eIEqEKyFpHxpAXKqvOG+dgEoAok3QOTP7230+FFSBbVvNQWTaXaIp4mhECiKnz5aPZ
         RNkGHoErUYLRklLkxDBKcOf9eEoOAtW/zvx1U5H2moYIvlk6bw/ngChInRXBAS9geu12
         7GWFxI8GKZA2GwDtUQ/Hu9WzaFZvRskp128ol5AB85I+4Ep4o9YH00Yj8tW2L/CdbE7r
         hrxw840FZ7fPs5hZpVU+nfBohUO9oDgsNdXe7JbnjnjIiiKTJZL2caYdJEmiNYOjEhpT
         cZA4OxuhJszycXxg8r4g7ev5aR3kFvYryfVfIjnE9mkCuO9E604TvVvhr1whwJt3gIPJ
         OTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767738626; x=1768343426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xk0i2vbFSiC9zdoNDy8sWwbQ9cDG6OGMHIG8dTU3ef8=;
        b=PWDmG8wH1r4Ee/RvepPrP2DaEGiVWzBKNTTnoV2xXSvxA/PlaLsVG/U6rKh1P2d+39
         arf7UAsoooI0994UPIHTE+VTLYFU6jDTo/lGCvPZJ3bC6rmn5XhS5GA+cF+PIWGi42xb
         dGH6FbKkGKttlAj8W4eJHs6Zv4bqO8H75Cb6HW2dWrMoUuUooYdaJah/elKgeBrZXx38
         jzpNPMysq7pBwgkZHpaZcgBTQHLMuCaTCT2KFRhVWh8QvV/ugfyyW2VlCBVrz6q1CK6e
         BJTkNGtoniIhN2UZ85NMD44Beqdravzdteml56kzWi2mZTYszlrLZku2n/R79LBfINbO
         TThg==
X-Gm-Message-State: AOJu0Yzg1/A805BV+YSkZwr6jjJvT7Gflvc2owz3+U7jF6swjogos5Ux
	SbRCYZDmhXv/Solg7AnQB6yXuow6GRlPgEXmdiEkc53lskbcB+Faelsyfs2T7Rvy8o5xl/64uP3
	QIQ9JCTNcu/uXAGn/tmGHE25nQHWNi5HsK14W
X-Gm-Gg: AY/fxX5Y0AuyoyppvGY64d5Jfl70rHL1yueZzsDm1PezqHxFfB++M7ulgoWdLqbCc0H
	cKtyVryJjO9omtp1rc7smdAfsh+EUGqC+nz3ULX5aDy6Alpepiy9p1WueF4gsW2h90iMTonkOkX
	V9hGaLnBOIKY5xylhYzuE4KOj7nv29SblVsNnP/GNWCpOLUHLV9F477fmHAFNFup7SNfhT/WNRD
	lv0JqsSZcsaL01cYBkBu0CVtVUCv3dyIfsUf/jV/P3gFURBEsjVfLMsD375MZ6FH11hndo5EEiQ
	JGsHM8I=
X-Google-Smtp-Source: AGHT+IEInN6BgTpCjg88vfD9CxvmA9S8fHj5bZ3oEITQUWSL9SpBZLRFHa2d2VXUPktX6d1j7WZzqI6WwqmSigcrFhQ=
X-Received: by 2002:a05:6808:3505:b0:44f:8c46:a2c2 with SMTP id
 5614622812f47-45a6bed76a1mr260574b6e.57.1767738625820; Tue, 06 Jan 2026
 14:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20260106221016.3504565-1-thomas.perrot@bootlin.com>
In-Reply-To: <20260106221016.3504565-1-thomas.perrot@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 7 Jan 2026 11:30:14 +1300
X-Gm-Features: AQt7F2qIhm8GoKG3A_LSOjVIkXTrUPxgWZ7q5EPcIZUsTnFYuRvFbogmGmKBsxA
Message-ID: <CADySD0GKQiq_jM=M57_A-6cwe-=xd8bukZH_3p1AzhuWLrmQfA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.8
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 22:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228936

On Wed, Jan 7, 2026 at 11:12=E2=80=AFAM Thomas Perrot via
lists.openembedded.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> This release has:
> - Safe and reverse list iteration
> - Stack protector support
> - Allocate heap housekeeping nodes dynamically
> - IPI device ratings
> - Andes QiLai SoC support
> - SpacemiT K1 SoC support
> - ESWIN Computing EIC7700 SoC support
> - Moved Ariane and Openpiton to generic platform
> - SiFive CLINT v2 support
> - Simple FDT based cache library
> - SiFive PL2 cache controller driver
> - SiFive Extensible Cache (EC) driver
> - SiFive TMC0 based HSM driver
> - SiFive SMC0 based system suspend driver
> - MPXY RPMI mailbox driver for voltage service group
> - MPXY RPMI mailbox driver for device power service group
> - MPXY RPMI mailbox driver for performance service group
> - HART protection abstraction
>
> Overall, this release has various domain related improvements and
> also adds multiple platform support.
>
> Also switch Qemu -cpu parameter to rv64 because rva23s64 and rva22s64
> profiles lack PMP entries, causing hart isolation configuration to fail [=
1].
>
> [1] https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.htm=
l
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc               | 2 +-
>  meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} (97=
%)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index b755d32c9d1a..45fcf36e62d9 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>  # qemuboot options
>  QB_SMP ?=3D "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> -QB_CPU:riscv64 ?=3D "-cpu rva23s64"
> +QB_CPU:riscv64 ?=3D "-cpu rv64"
>  QB_MACHINE =3D "-machine virt"
>  QB_DEFAULT_BIOS =3D "fw_jump.elf"
>  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb b/meta/recipes-bsp/o=
pensbi/opensbi_1.8.bb
> similarity index 97%
> rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
> rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
> index a460062e9398..f2d3e9f20082 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> @@ -8,7 +8,7 @@ require opensbi-payloads.inc
>
>  inherit deploy
>
> -SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
> +SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
>  SRC_URI =3D "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=
=3Dhttps"

Can you please also try including tag=3Dv${PV} in the SRC_URI ?

>  TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228935): https://lists.openembedded.org/g/openembedde=
d-core/message/228935
> Mute This Topic: https://lists.openembedded.org/mt/117115594/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

