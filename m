Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.597.1615397575820377198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 09:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XZ9Z+iYl;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id x29so11849278pgk.6
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 09:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MGquy2DkDc16AJ3GtYU0D4ZlGxKV54mDhemkjEg2qMM=;
        b=XZ9Z+iYlWEjH78teAcjoJoOHVJFUxS9Nu6mq9hb+IgxW0NvC91im3iOXucO+9Lq8Fa
         HsV9Lq4ENvMwLfNnLYxWTVvTldx4qhWNDQRQJ1FyVZxlNauwnF/W7wVXsRfSP8sMervN
         61Vot6AT8UDaGjG1G9eDMKhMUzX/RgCWJQgnH7jOnDlRMDwBH87smTxYR2EkQSJ8/lz1
         uIKTI82WikKgXi6KU4n3WLePWlb4hrWsykRAWzsUIPyGAl9jgooN39LFQ6TYrWH3CNIb
         wIpF0TFqq5/r+MZVZABOpNlW+WuH6Dz9oFaV+9B5LTzB1TREbYtXp9bE3usdq7VI8215
         EpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=MGquy2DkDc16AJ3GtYU0D4ZlGxKV54mDhemkjEg2qMM=;
        b=PQbfTfLX+BkILuRUdPTSeAG/+5LZzydJrlisNVPL3xdTMJYxHd7cVibhhl1LFicOHu
         TH6Jb+xJhYTYy3EnKdNKiijQTyieu/WBHUhXhh8+fexa4vByp9FZ1MpDOuyevL31JHhl
         J+ZyS4tRt8AHbiym3zOkxtqAiFy0nGrjUrEzR1AcrdWkhacAclY7jar/InPQdUBGcwUg
         ZiASLpRwSXgs7Qs2z5nDSyrfb2GEnRO6L+m+9BKAW5k2YLnLY8tnCq0jBhKhzbQ2UkF9
         RJjHZoE5+t4G0+aF4R1AFhEhZONyZjnZ/cpcWNbVhx9wE8YtTwx/pVhb0Z4Ql5THVAND
         We1A==
X-Gm-Message-State: AOAM533M8DaXy6Yr10z5fZ2Ruv7iUk4OSi6/zt5beVnBLIgzIfqZ9idB
	jGI3D43EzBWKhog6Rh47kdZHPFjnTMA=
X-Google-Smtp-Source: ABdhPJz1vJCBu2Y8L8I4I8ZH8/AR7j9gzgy9T3xpr52oF2SKj10AqstKuKMO5Sqgy++FmEpQ3ZD3uA==
X-Received: by 2002:a62:17c4:0:b029:1f5:7cfe:ebc4 with SMTP id 187-20020a6217c40000b02901f57cfeebc4mr3905139pfx.5.1615397574780;
        Wed, 10 Mar 2021 09:32:54 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f56b:e4ef:635c:c0de? ([2601:202:4180:a5c0:f56b:e4ef:635c:c0de])
        by smtp.gmail.com with ESMTPSA id d16sm152357pgb.12.2021.03.10.09.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 09:32:54 -0800 (PST)
Subject: Re: [OE-core][dunfell 00/41] Pull request (cover letter only)
To: Khem Raj <raj.khem@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <cover.1614780812.git.steve@sakoman.com>
 <CAMKF1sr9mfJPigoX+ShJQn+F3ZVu2tHOQ=c4MgmJK6pBmiOk1w@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <48f96c0e-ba74-da7d-71d3-119562a6f02e@gmail.com>
Date: Wed, 10 Mar 2021 09:32:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr9mfJPigoX+ShJQn+F3ZVu2tHOQ=c4MgmJK6pBmiOk1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/3/21 8:39 AM, Khem Raj wrote:
> On Wed, Mar 3, 2021 at 6:17 AM Steve Sakoman <steve@sakoman.com> wrote:
>> The following changes since commit a8debddd6cbdd70db74e096d72f97fbee008ee63:
>>
>>   build-appliance-image: Update to dunfell head revision (2021-02-18 23:43:04 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>>
>> Alexander Kanavin (1):
>>   connman: update to 1.38
>>
> connman changes will impact iwd and also depend on ell version. Many
> times they go in lock steps.

ok. The update should be dropped then.

-armin
>
>> Andrei Gherzan (2):
>>   oe/recipeutils: Fix copying patches when BBLAYERS entries are not
>>     normalised
>>   qemu: Backport patch to avoid assertion fails on icache line size
>>
>> Bruce Ashfield (2):
>>   linux-yocto/5.4: update to v5.4.96
>>   linux-yocto/5.4: update to v5.4.98
>>
>> Chris Laplante (2):
>>   cve-check: introduce CVE_CHECK_RECIPE_FILE variable to allow changing
>>     of per-recipe check file
>>   cve-check: add CVE_CHECK_REPORT_PATCHED variable to suppress reporting
>>     of patched CVEs
>>
>> Jan-Simon Möller (1):
>>   package_rpm: Enable use_source_date_epoch_as_buildtime in package_rpm
>>     class
>>
>> Joshua Watt (3):
>>   oeqa: reproducible: Fix SSTATE_MIRRORS variable
>>   oeqa: reproducible: Add more logging
>>   libomxil: Fix up commercial license flag
>>
>> Lee Chee Yang (2):
>>   sudo: 1.8.31 -> 1.8.32
>>   go: update to 1.14.15
>>
>> Marek Vasut (1):
>>   weston-init: Fix weston-keyboard path in weston.ini
>>
>> Martin Jansa (1):
>>   icu: backport fix for rare random genrb segmentation fault
>>
>> Richard Purdie (16):
>>   pseudo: Update to work with glibc 2.33
>>   pseudo: Update for rename and faccessat fixes
>>   pseudo: Update to include fixes for glibc 2.33
>>   quilt: Be determnistic about column presence
>>   buildtools-extended-tarball: Add glibc-gconvs needed for build
>>   cwautomacros: Ensure version is set deterministically
>>   vim: Improve determinism
>>   vim: Fix a race over creation of the desktop files
>>   watchdog: Fix determinism issue from sendmail host path
>>   watchdog: Avoid reproducibility failures after fixing build
>>   xorg-fonts-minimal: Fix reproducibility
>>   xorg-minimal-fonts: Really fix determinism
>>   xmlto: Fix reproducibility
>>   groff: Fix determinism issue
>>   oeqa/commands: Fix compatibility with python 3.9
>>   selftest/reproducible: Don't call sync between each file compare
>>
>> Scott Murray (1):
>>   u-boot: fix CVE-2020-8432 and CVE-2020-10648
>>
>> Teoh Jay Shen (1):
>>   oeqa/runlevel : add test for runlevels
>>
>> Thomas Viehweger (1):
>>   mtd-utils: Remove duplicate assignments to alternative link names
>>
>> Vivien Didelot (2):
>>   local.conf.sample.extended: fix double 'of' typo
>>   local.conf.sample.extended: prefer INIT_MANAGER
>>
>> Wes Lindauer (1):
>>   df.py: Add feature check for read-only-rootfs
>>
>> Yoann Congal (1):
>>   npm.bbclass: avoid building target nodejs for native npm recipes
>>
>> Zbigniew Bodek (1):
>>   wpebackend-fdo: Fix missing .so symlink when using dev package
>>
>> akuster (2):
>>   cve-check.bbclass: add layer to cve log
>>   connman: update to 1.39
>>
>>  meta/classes/cve-check.bbclass                |   46 +-
>>  meta/classes/npm.bbclass                      |    2 +-
>>  meta/classes/package_rpm.bbclass              |    1 +
>>  meta/conf/local.conf.sample.extended          |   23 +-
>>  meta/lib/oe/recipeutils.py                    |    2 +-
>>  meta/lib/oeqa/runtime/cases/df.py             |    2 +
>>  meta/lib/oeqa/runtime/cases/runlevel.py       |   22 +
>>  meta/lib/oeqa/selftest/cases/reproducible.py  |    7 +-
>>  meta/lib/oeqa/utils/commands.py               |    4 +-
>>  .../u-boot/files/CVE-2020-10648-1.patch       |   98 ++
>>  .../u-boot/files/CVE-2020-10648-2.patch       |   52 +
>>  .../u-boot/files/CVE-2020-8432.patch          |  114 ++
>>  meta/recipes-bsp/u-boot/u-boot-common.inc     |    3 +
>>  meta/recipes-connectivity/connman/connman.inc |    1 +
>>  ...-gweb-fix-segfault-with-musl-v1.1.21.patch |   34 -
>>  ...ve-musl-does-not-implement-res_ninit.patch |   20 +-
>>  .../connman/connman_1.37.bb                   |   17 -
>>  .../connman/connman_1.39.bb                   |   15 +
>>  .../meta/buildtools-extended-tarball.bb       |   10 +
>>  meta/recipes-devtools/go/go-1.14.inc          |    5 +-
>>  ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch |   98 --
>>  meta/recipes-devtools/mtd/mtd-utils_git.bb    |    2 -
>>  meta/recipes-devtools/pseudo/pseudo_git.bb    |    2 +-
>>  meta/recipes-devtools/qemu/qemu.inc           |    1 +
>>  ...fix-crash-when-compiling-with-uClibc.patch |   48 +
>>  meta/recipes-devtools/quilt/quilt.inc         |    2 +-
>>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |    2 +-
>>  .../cwautomacros/cwautomacros_20110201.bb     |    2 +-
>>  .../groff/files/0001-Include-config.h.patch   | 1026 +----------------
>>  meta/recipes-extended/groff/groff_1.22.4.bb   |   11 +
>>  meta/recipes-extended/sudo/sudo.inc           |    2 +-
>>  ...Fix-includes-when-building-with-musl.patch |   29 +
>>  .../sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb}   |    5 +-
>>  .../watchdog/watchdog_5.15.bb                 |    6 +
>>  .../wayland/weston-init/weston.ini            |    2 +-
>>  .../xorg-font/xorg-minimal-fonts.bb           |    8 +-
>>  .../linux/linux-yocto-rt_5.4.bb               |    6 +-
>>  .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
>>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
>>  .../libomxil/libomxil_0.9.3.bb                |    6 +-
>>  .../webkit/wpebackend-fdo_1.4.1.bb            |    3 +
>>  ...cnvalias-as-a-dependency-of-misc_res.patch |   24 +
>>  meta/recipes-support/icu/icu_66.1.bb          |    4 +-
>>  meta/recipes-support/vim/files/racefix.patch  |   33 +
>>  meta/recipes-support/vim/vim.inc              |    3 +
>>  45 files changed, 574 insertions(+), 1259 deletions(-)
>>  create mode 100644 meta/lib/oeqa/runtime/cases/runlevel.py
>>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.patch
>>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.patch
>>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-8432.patch
>>  delete mode 100644 meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
>>  delete mode 100644 meta/recipes-connectivity/connman/connman_1.37.bb
>>  create mode 100644 meta/recipes-connectivity/connman/connman_1.39.bb
>>  delete mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
>>  create mode 100644 meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
>>  rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (89%)
>>  create mode 100644 meta/recipes-support/icu/icu/0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch
>>  create mode 100644 meta/recipes-support/vim/files/racefix.patch
>>
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> 
>>

