Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.4347.1597435952868167452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 13:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mAYN7b9v;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id x69so9514037qkb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ibTSUzJ3hfg/6tDZ2NeKvgHIDyz0qkXahUkqneedlB8=;
        b=mAYN7b9v4g/bGv7bCigw3W8p+EPVOvEFNl/WVcqPnM6pMalINpiLbp8TV0CQ/QQ1sT
         G0NJTUpcVbFkKhIun/L8KIIzatw/F9IBFmw6ffIGyutabIhgWw4HfzxUIV5hVVB4dyLu
         j3sUiDoeewlG8mWjDj5P1RHy0J6DoydMaUEIZiSB6Jg/y67hmbuQdB+gdReozUacEFle
         ZSYlV50Ef0Vo6gz9uPjqpL+wUh2p/Hr4ObDABLgM7szHHUkim1q1Xmvs4KQ+kHOP02T+
         of3JO4SQJfhmpgRF0i+wzvuahQTUyWXUYwYbQcwNuadmkyns8/1RdcaHDxeJUbPHMdyr
         ZKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ibTSUzJ3hfg/6tDZ2NeKvgHIDyz0qkXahUkqneedlB8=;
        b=fIXash0hIszttwpRnFLSE0fRQQanamuWjMFujCMIWjLID9YX8Qa8UNBpCKvymzGDgk
         FKidmwJslD6OqpwrERBvCHQJRd6IFXTyTBDu9WaLhPaW8/Wgu5PvaROPxFfpN32xY+u1
         d7ZXYqWyHZ+xdphHNXvr5py0/hLijQzjEVp06XzHi6OcHzdhq/853iKblOk/AqPdIPAd
         PWnQ8T/wNhHa6LWkTEySBqNMBFwQ9pi6Ijzqqbw0KRWKAcuXNAgAEeOF3pjHU/RlX7Gz
         LCPRSF2KUHU63DqgUeTsGk//oIMMK2DDOJV4Rr4ZZDxGy+DcGh3oaC7ZMOSsgkBTbnlC
         gmUg==
X-Gm-Message-State: AOAM533UDi8cpXaaxSQ6NQBOBvf69W6GNOmGwwcV6Xolw8AEPB/svoyY
	9HrZ+wayKRqjx+GcAeNYK92DYHLQAA6306jBaA4=
X-Google-Smtp-Source: ABdhPJyCIoSMrtD0hven48P/4HZGJSaHeBOfhjuJxeUi8541PqjgzcAqW5U5BFIaAHr+4TvDCg5S7UOIQMXGHPh777E=
X-Received: by 2002:a37:7081:: with SMTP id l123mr3432237qkc.225.1597435951680;
 Fri, 14 Aug 2020 13:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200814092914.4160-1-liu.ming50@gmail.com> <20200814092914.4160-3-liu.ming50@gmail.com>
In-Reply-To: <20200814092914.4160-3-liu.ming50@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 14 Aug 2020 13:12:05 -0700
Message-ID: <CAMKF1soXJ0Jm_WzUYCKhNyaE-eAHg9jG4OEemTSaLu7u5t-SSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 2/2] libubootenv: uprev to v0.3
To: Ming Liu <liu.ming50@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Content-Type: text/plain; charset="UTF-8"

for qemumips I am still seeing

00:01:59.669 WARNING: No bb files in default matched
BBFILE_PATTERN_odroid-extras
'^/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-odroid/meta-odroid-extras/'
00:02:03.245 ERROR: Nothing RPROVIDES 'u-boot-default-env' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
RDEPENDS on or otherwise requires it)
00:02:03.534 ERROR: Nothing RPROVIDES 'libubootenv-dev' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
RDEPENDS on or otherwise requires it)
00:02:03.534 No eligible RPROVIDERs exist for 'libubootenv-dev'

On Fri, Aug 14, 2020 at 2:29 AM <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Update libubootenv to the latest 0.3 release, which comprises the
> following commits:
>
> ```
> 1efed83 Increase max length for device name
> 6f4fc1c uboot_env: Use canonicalized pathname when reading device
> 23b3086 Fix bug introduced by commit 52a70114
> ed1a53e Dont store to device if no value changes
> 4a0a466 Merge pull request #7 from TomzBench/cmake-fix
> 6117831 Added Coverity badge
> 49372a1 Fix coverity #293496
> 69a6819 Fix coverity #293503 and #293507
> 258bf52 Fix coverity #293501
> aa52e61 Fix coverity #293505
> 52a7011 Fix coverity #293504 and #293506
> e822218 Fix coverity #293495 and #293497
> 23b305f Fix coverity #293499
> 25ef1f6 Add coverity setup for Travis
> 41b5188 fixed install for static target, fixed BUILD_DOC acknowledgement
> 86bd30a Restore ability to feed script file via stdin, using `-s -`.
> c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP
> f4b9cde Allow negative offsets
> 45bf92a Detect sector size if not found in config
> 9f59db6 uboot_env: remove unused variables
> 65d243e README: libubootenv is now in oe-core
> ba952d0 BUG: variable lists not released in close()
> 690f868 Variables are not removed when loading from file
> 9e3586a Make sure there's no file descriptor leakage in case of error
> 03647c4 Check config file defines a non-zero Sector size
> 3b2d4f1 Check environment size from fw_env.config
> 879c073 Do not hardcode path for install
> d9c639b libubootenv: add pkg-config support
> cc628ee libuboot: wrap libuboot in extern "C" for C++
> ```
>
> Also add u-boot-default-env to RRECOMMENDS since
> /etc/u-boot-initial-env is being referred in libubootenv source.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}        | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (85%)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> similarity index 85%
> rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> rename to meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> index 3820ba262e..55b2eb60f7 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> @@ -10,9 +10,8 @@ LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
>  SECTION = "libs"
>
> -PV = "0.2+git${SRCPV}"
>  SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> -SRCREV = "86bd30a14e153a18f670b25708795253d8736f0f"
> +SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
>
>  S = "${WORKDIR}/git"
>
> @@ -24,4 +23,6 @@ DEPENDS = "zlib"
>  PROVIDES += "u-boot-fw-utils"
>  RPROVIDES_${PN}-bin += "u-boot-fw-utils"
>
> +RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
> +
>  BBCLASSEXTEND = "native"
> --
> 2.28.0
>
