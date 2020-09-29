Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.1462.1601416730239678719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 14:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q2bS45C0;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id a4so4985494qth.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 14:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsemm9BsPPCc9zWNEcB/qOkL5SlfgVOndx9/37bdsBI=;
        b=q2bS45C0+JgYYQhp7zFTlEkEPGmFufCTkbyYH82XZmrF9/HdNC1jaw70kQsF03xmkW
         uETAPLq15L2Pr12mXTbuaPgnQv79aNw/6iv/lRDamc6+tu84Srmh7Wr09dgLjTN3DWlW
         VqJmUoqBBlKOCsKx0bE/qhbae/R1dVLlJ+pKOX603ZIyNyut27+SXaQ8V83fwqULvmKz
         kDQEfHU8GidP6f5dy+9KBPFLxrdWlLkL4gSj3VTGX1Pn2KGHkNwTVz8zKDwivPuac+xb
         bo0YSp9b/iJeGu4TnJ/lTyq/D+gZwP28tw2/lpUp6QbT/H8SPLHIp7Un12KrSwm8qEIa
         lvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsemm9BsPPCc9zWNEcB/qOkL5SlfgVOndx9/37bdsBI=;
        b=a8xVk0q7CS4bLqhjRmldS5wiEcCgh3HxkiWvxECiQOobjo+6cEh5wp5cRVm0bjf9l/
         Cwct6Cs3ce67MnhQkuxWVtSslraqmaIWxqRJTvHeqQ/M+ZpS/ZzY8LpdqFf1TCyHGxaR
         x2d5iNDuMAJBQsHj8Z/4BYvGqiOC3NOIjHeDX+YMB/wRdeGTVZRWH7JGlTdfIJ03jRoS
         2kPVgTnbb0Zg0ezBt62UZCite7ZziLgJWNOTsGc3wtOBkzKE4fkznvV6L5qhUZmokBzm
         rtNTdSFalued20iRJCp6UzG0A6qECNGLX2/xOD9xVpmqXF6sKBwuqt92dCglcxtD2DrN
         oskw==
X-Gm-Message-State: AOAM531oaFaGJHwvJJ7ESfyJu2lOQyi+pcUy5QN/yRelnzjWoEZxAM8C
	brttvrtLM/G2p92YecqYha7Xb5d6iMr/c0aBLUA=
X-Google-Smtp-Source: ABdhPJwEr7Ui/3clPXJMU5fzMjCZ+7R0OD9cC0/g88+PQy69ax/f3te7awx8To+0DiHIJv7ZCdQNeDK4hacG74QmjJE=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr5735298qtq.378.1601416729132;
 Tue, 29 Sep 2020 14:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200928130551.21346-1-jon.mason@arm.com> <20200928130551.21346-7-jon.mason@arm.com>
In-Reply-To: <20200928130551.21346-7-jon.mason@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 29 Sep 2020 14:58:22 -0700
Message-ID: <CAMKF1spUKBY8ff3zphQ--H_9__jTKgs=hkHH7maMVJ4ZktjsHw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v4 6/6] tunes/armv8: move to a new location
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Lets not do it. For couple of reasons,

There are BSPs including these include files which are using same
branch across multiple yocto releases, this will break them
files under include/<ARCH> are common at arch level, this moved the
CPU implementation ( cortex* ) under it, seems odd and even more odd
when you consider arm32 tunes.

On Mon, Sep 28, 2020 at 6:06 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> Move the ARMv8a tunes into a separate location (per generation).  This
> should help reduce the number of tunes in the more generic location.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc | 0
>  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65.inc | 0
>  .../machine/include/{ => arm/armv8-2a}/tune-cortexa65ae.inc     | 0
>  .../include/{ => arm/armv8-2a}/tune-cortexa75-cortexa55.inc     | 0
>  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75.inc | 0
>  .../include/{ => arm/armv8-2a}/tune-cortexa76-cortexa55.inc     | 0
>  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76.inc | 0
>  .../machine/include/{ => arm/armv8-2a}/tune-cortexa76ae.inc     | 0
>  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa77.inc | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc   | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa34.inc   | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc   | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc   | 0
>  .../include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc       | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc   | 0
>  .../include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc       | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc   | 0
>  .../include/{ => arm/armv8a}/tune-cortexa73-cortexa35.inc       | 0
>  .../include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc       | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73.inc   | 0
>  meta/conf/machine/qemuarm64.conf                                | 2 +-
>  21 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65ae.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75-cortexa55.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76-cortexa55.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76ae.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa77.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa34.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa35.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73.inc (100%)
>
> diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa55.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
> diff --git a/meta/conf/machine/include/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa65.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> diff --git a/meta/conf/machine/include/tune-cortexa65ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa65ae.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
> diff --git a/meta/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa75-cortexa55.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> diff --git a/meta/conf/machine/include/tune-cortexa75.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa75.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
> diff --git a/meta/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa76-cortexa55.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> diff --git a/meta/conf/machine/include/tune-cortexa76.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa76.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
> diff --git a/meta/conf/machine/include/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa76ae.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
> diff --git a/meta/conf/machine/include/tune-cortexa77.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa77.inc
> rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
> diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa32.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> diff --git a/meta/conf/machine/include/tune-cortexa34.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa34.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
> diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa35.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
> diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa53.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa57.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa72.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa73-cortexa35.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> diff --git a/meta/conf/machine/include/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
> similarity index 100%
> rename from meta/conf/machine/include/tune-cortexa73.inc
> rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index 2f61eb0aed5f..c4096d0eeea4 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -2,7 +2,7 @@
>  #@NAME: QEMU ARMv8 machine
>  #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
>
> -require conf/machine/include/tune-cortexa57.inc
> +require conf/machine/include/arm/armv8a/tune-cortexa57.inc
>  require conf/machine/include/qemu.inc
>
>  KERNEL_IMAGETYPE = "Image"
> --
> 2.20.1
>
>
> 
>
