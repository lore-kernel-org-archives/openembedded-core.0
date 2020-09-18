Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.9910.1600425072789339275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=aT4SwXDd;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id q8so5570626lfb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kKZC+ZK1tg1QdaytoRv9WENQH95h7xpekYcJROvt4Ss=;
        b=aT4SwXDdi3irwhR48+gsnhgD4nrUunCwvYctMXyG4WEQdG9u3tgyIhppqhPnFDj+et
         1QC5nhEE7C4PfYbUS1nSPvZ9F+dzkSm24+sGdX9IBFY/Nv4bO3HSa+Gux8fO5lSPkyMk
         IldCjYJrDInWTanIiCCwq9q95cK07eXFF/Yb7A1P0iRj7YMiNoe3tzFVpBkhJZEWG8xj
         GLgkQq04w2Zecxp1yqK9SN7IwGysxprUZrUAcoh0WwDlXIqY8w82xs/xydcZnkEkKARO
         OgmlENPAwMZmhuQYJDi3MfTNBSbjtZm9PEFADJriAn2u5oYGEIwE/q5vVxIRhRgktmui
         vv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kKZC+ZK1tg1QdaytoRv9WENQH95h7xpekYcJROvt4Ss=;
        b=iHDuV/pZ9ndl5tosRWBNejqZneJ7pVDuJVMdCEqIPIMp9RQOD2QLooE4nsuw6FC5Xz
         sL6nHltAjOzHya7yE14N2vOSCsG/6zC7nJG6Oo5iqRIsRTOcHeBAXsQ2k1tUqq/noyyn
         gBPBEd9xsvcpwe5dYj3AWR1BC3nWyGaSHr+kOxoeQX/v48vcICKyBw1JCHIDbyzt4r6G
         O78SAChphrxe7v1ZHiCtvrZNLlTK3/iE253I2Q7qKL6uEGY2HOWTlEvIfO85PZeLxgcl
         Y0AMpwONcl8KsLT1z7r4BPPci2EvOqO84aQwsszPQLg5nVGIMhGLOkE+LGn6yqigl7/W
         PneQ==
X-Gm-Message-State: AOAM530k78AcRQTVFs9y7vc85UHoEviMuq5gsyXDFz5km0ff396ZhIt/
	sJFPvo4WX89jxIaCG3HapJS52wNtsLf8vnfiDdRlcg==
X-Google-Smtp-Source: ABdhPJzSSouGrXgVG1HFS/0WJKWki2nlm6c2kF5a6r7ffIYmBvd72yJesPz0b9iqBYvOb9R7pJHMVSFCPjoKtXzZvt4=
X-Received: by 2002:a19:c8c6:: with SMTP id y189mr10704314lff.125.1600425070532;
 Fri, 18 Sep 2020 03:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200918071819.28679-1-chee.yang.lee@intel.com>
In-Reply-To: <20200918071819.28679-1-chee.yang.lee@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 18 Sep 2020 11:30:59 +0100
Message-ID: <CAAnfSTszCH_xxqLR+JJQ+MfgomNME9dg-opEVhD79Tpg1GH99w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bash : inlcude patch 17 & 18
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Typo in subject, and can you summarise what these patches are doing?
(especially if they are CVE related).

Ross

On Fri, 18 Sep 2020 at 08:18, Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  meta/recipes-extended/bash/bash_5.0.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
> index 8ff9e6edaf..12d472be57 100644
> --- a/meta/recipes-extended/bash/bash_5.0.bb
> +++ b/meta/recipes-extended/bash/bash_5.0.bb
> @@ -21,6 +21,8 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>             ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-014;apply=yes;striplevel=0;name=patch014 \
>             ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-015;apply=yes;striplevel=0;name=patch015 \
>             ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-016;apply=yes;striplevel=0;name=patch016 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-017;apply=yes;striplevel=0;name=patch017 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-018;apply=yes;striplevel=0;name=patch018 \
>             file://execute_cmd.patch \
>             file://mkbuiltins_have_stringize.patch \
>             file://build-tests.patch \
> @@ -65,6 +67,11 @@ SRC_URI[patch015.md5sum] = "c4c6ea23d09a74eaa9385438e48fdf02"
>  SRC_URI[patch015.sha256sum] = "a517df2dda93b26d5cbf00effefea93e3a4ccd6652f152f4109170544ebfa05e"
>  SRC_URI[patch016.md5sum] = "a682ed6fa2c2e7a7c3ba6bdeada07fb5"
>  SRC_URI[patch016.sha256sum] = "ffd1d7a54a99fa7f5b1825e4f7e95d8c8876bc2ca151f150e751d429c650b06d"
> +SRC_URI[patch017.md5sum] = "d9dcaa1d8e7a24850449a1aac43a12a9"
> +SRC_URI[patch017.sha256sum] = "4cf3b9fafb8a66d411dd5fc9120032533a4012df1dc6ee024c7833373e2ddc31"
> +SRC_URI[patch018.md5sum] = "a64d950d5de72ae590455b13e6afefcb"
> +SRC_URI[patch018.sha256sum] = "7c314e375a105a6642e8ed44f3808b9def89d15f7492fe2029a21ba9c0de81d3"
> +
>
>  DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>  DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
> --
> 2.17.1
>
>
> 
>
