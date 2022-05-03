Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D623C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 23:44:32 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.628.1651621467531135227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 16:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nb9aLfFB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso3735398pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 16:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=KfWMsoC6REHA70C1r0hSmZZ1W53IQmivj/EZH1+TEFE=;
        b=Nb9aLfFBwDC1neMaUnflAI8CwCRf7YUExkkIUq8wAhFzh1vO7MSg6QfmJrKJU+0EuI
         yYHUhX6mj4M8FREj0tfvl9PaT+pgOIQyEWi56xwNzpAH5Q8bb27z7YXCk5kCUYWwYPI5
         D7PfbyHuahvtNoPi7UrEIH88en9IIOXTlj7G3oYbLxcWPQZWVeqBXPXf602lbzjUqPqw
         Au8EJAnRhIHiWmEZ7J8G7M8YfIVSAuh7tQs+dlsaOmZQOTBSHbhaBPC15CM19o8n9AZ1
         twBShS9og7xiRW4cVk0UnHWrwGfoBvPADHvmnecvKTKcAhfxBzLj7WSuGJ9Fic7jBaIN
         oKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=KfWMsoC6REHA70C1r0hSmZZ1W53IQmivj/EZH1+TEFE=;
        b=ch3hqUa3Tii2tPEyBeH7BUdU4NSirNtQn8wu/o0OPPsPUvJBxCdbfLZg8rAa0bVgcq
         WRM7SMb9+BqV3CflZuhQcfyjoSTBQb+CCIXzF05He33h6P8LpwlgkvbrVNc5erCXgS8m
         Q7orooMi78OY1EblRQXMKML+0zpNGaugKCesiZ9WZ29RD+9zZQC3xeWC6NcqGQso3VNe
         1obpOhkcn9oC14A8LjEsMzN9RmQe8Z4SKGCP2jggiBvIGgpT0OYDU27Fi+e/4A2DLAlz
         ZOoY3s6fkHuAVgmFlhhA933GUHR3ROEZ5mGCfDFOc27yLDp7rndLJ+d0chYvPTS2UKrH
         3n+A==
X-Gm-Message-State: AOAM532KNrEFTgh/SlcqB086ES5XTy8Lq4WYqTL7p4Ky2PcQ7pMOzPGG
	I139V5nGEe2KTixF8AmttTzt/KBjREs55Q==
X-Google-Smtp-Source: 
 ABdhPJxAxnetWFYkD5EKNKNMnrUmG7XQ2kxUO5N9BGlNym4HkkmEEpe0/+vwKQ9ACoGCJjkEjMJekw==
X-Received: by 2002:a17:90b:124a:b0:1d9:de12:520f with SMTP id
 gx10-20020a17090b124a00b001d9de12520fmr7397112pjb.28.1651621466760;
        Tue, 03 May 2022 16:44:26 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::2ec0? ([2601:646:9200:a0f0::2ec0])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa7874b000000b0050dc76281a0sm6815182pfo.122.2022.05.03.16.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 16:44:26 -0700 (PDT)
Message-ID: <e3891bfd-95ec-15d5-0b11-36966cd3eaa7@gmail.com>
Date: Tue, 3 May 2022 16:44:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core][kirkstone 00/34] Pull request (cover letter only)
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1651617090.git.steve@sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <cover.1651617090.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 23:44:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165208

can you pick


https://git.openembedded.org/openembedded-core/commit/?id=20e9917b8d40f576b3661bc29e13602a24e86b7b

too plz

On 5/3/22 15:33, Steve Sakoman wrote:
> The following changes since commit ca1c990df62f1b3d53b2114a387f192efe7e38e8:
> 
>    ruby: upgrade 3.1.1 -> 3.1.2 (2022-04-28 17:07:01 +0100)
> 
> are available in the Git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next
> 
> Alexander Kanavin (2):
>    glib: upgrade 2.72.0 -> 2.72.1
>    libxml2: update patch status
> 
> Carlos Rafael Giani (2):
>    gstreamer1.0-plugins-good: Fix libsoup dependency
>    gstreamer1.0: Minor documentation addition
> 
> Chen Qi (2):
>    cases/buildepoxy.py: fix typo
>    go.bbclass: disable the use of the default configuration file
> 
> Davide Gardenal (1):
>    create-spdx: delete virtual/kernel dependency to fix FreeRTOS build
> 
> Dmitry Baryshkov (2):
>    linux-firmware: correct license for ar3k firmware
>    arch-armv8-2a.inc: fix a typo in TUNEVALID variable
> 
> Henning Schild (1):
>    wic: do not use PARTLABEL for msdos partition tables
> 
> Khem Raj (7):
>    seatd: Disable overflow warning as error on ppc64/musl
>    musl: Fix build when usrmerge distro feature is enabled
>    gcompat: Fix build when usrmerge distro feature is enabled
>    libc-glibc: Use libxcrypt to provide virtual/crypt
>    qemu.bbclass: Extend ppc/ppc64 extra options
>    busybox: Use base_bindir instead of hardcoding /bin path
>    util-linux: Create u-a symlink for findfs utility
> 
> Naveen Saini (1):
>    gstreamer1.0-plugins-bad: drop patch
> 
> Nicolas Dechesne (1):
>    sanity: skip make 4.2.1 warning for debian
> 
> Paul Gortmaker (1):
>    install/devshell: Introduce git intercept script due to fakeroot
>      issues
> 
> Peter Kjellerstedt (2):
>    terminal.py: Restore error output from Terminal
>    devshell.bbclass: Allow devshell & pydevshell to use the network
> 
> Pgowda (1):
>    glibc: ptest: Fix glibc-tests package issue
> 
> Rahul Kumar (1):
>    neard: Switch SRC_URI to git repo
> 
> Richard Purdie (2):
>    base: Drop git intercept
>    staging: Ensure we filter out ourselves
> 
> Ross Burton (5):
>    e2fsprogs: fix CVE-2022-1304
>    python3: ignore CVE-2015-20107
>    cve_check: skip remote patches that haven't been fetched when
>      searching for CVE tags
>    subversion: upgrade to 1.14.2
>    bitbake.conf: mark all directories as safe for git to read
> 
> Russ Dill (2):
>    package.bbclass: Prevent perform_packagecopy from removing
>      /sysroot-only
>    kernel-yocto.bbclass: Fixup do_kernel_configcheck usage of KMETA
> 
> wangmy (1):
>    apt: upgrade 2.4.4 -> 2.4.5
> 
>   meta/classes/create-spdx.bbclass              |  2 -
>   meta/classes/devshell.bbclass                 |  4 ++
>   meta/classes/go.bbclass                       |  1 +
>   meta/classes/kernel-yocto.bbclass             | 14 ++--
>   meta/classes/package.bbclass                  |  8 +--
>   meta/classes/qemu.bbclass                     |  6 +-
>   meta/classes/sanity.bbclass                   |  2 +-
>   meta/classes/staging.bbclass                  |  2 +-
>   meta/conf/bitbake.conf                        |  8 +++
>   meta/conf/distro/include/tclibc-glibc.inc     |  1 +
>   .../machine/include/arm/arch-armv8-2a.inc     |  2 +-
>   meta/lib/oe/cve_check.py                      |  5 +-
>   meta/lib/oe/terminal.py                       |  3 +-
>   meta/lib/oeqa/sdk/cases/buildepoxy.py         |  2 +-
>   meta/recipes-connectivity/neard/neard_0.16.bb | 13 ++--
>   meta/recipes-core/busybox/busybox.inc         |  2 +-
>   ...s-for-typechecking-with-atomic-compa.patch | 64 -----------------
>   ...variant-of-g_atomic_int_compare_and_.patch | 70 ------------------
>   ...ble-more-tests-while-cross-compiling.patch | 32 ++++-----
>   .../glib-2.0/glib-2.0/relocate-modules.patch  |  8 +--
>   ...{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} |  4 +-
>   meta/recipes-core/glibc/glibc-tests_2.35.bb   |  3 +-
>   .../recipes-core/libxml/libxml2/runtest.patch |  4 +-
>   meta/recipes-core/musl/gcompat_git.bb         |  8 +--
>   meta/recipes-core/musl/musl_git.bb            |  6 +-
>   meta/recipes-core/seatd/seatd_0.6.4.bb        |  3 +
>   .../util-linux/util-linux_2.37.4.bb           |  1 +
>   .../apt/{apt_2.4.4.bb => apt_2.4.5.bb}        |  2 +-
>   .../e2fsprogs/e2fsprogs/extents.patch         | 56 +++++++++++++++
>   .../e2fsprogs/e2fsprogs_1.46.5.bb             |  1 +
>   .../recipes-devtools/python/python3_3.10.4.bb |  3 +
>   .../subversion/subversion/disable_macos.patch | 71 -------------------
>   ...version_1.14.1.bb => subversion_1.14.2.bb} |  3 +-
>   .../linux-firmware/linux-firmware_20220411.bb |  4 +-
>   .../0005-msdk-fix-includedir-path.patch       | 40 -----------
>   .../gstreamer1.0-plugins-bad_1.20.1.bb        |  3 +-
>   .../gstreamer1.0-plugins-base_1.20.1.bb       |  2 +
>   .../gstreamer1.0-plugins-good_1.20.1.bb       |  7 +-
>   scripts/git-intercept/git                     | 19 +++++
>   scripts/lib/wic/plugins/imager/direct.py      |  2 +-
>   40 files changed, 174 insertions(+), 317 deletions(-)
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} (90%)
>   rename meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb} (97%)
>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
>   delete mode 100644 meta/recipes-devtools/subversion/subversion/disable_macos.patch
>   rename meta/recipes-devtools/subversion/{subversion_1.14.1.bb => subversion_1.14.2.bb} (96%)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
>   create mode 100755 scripts/git-intercept/git
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165207): https://lists.openembedded.org/g/openembedded-core/message/165207
> Mute This Topic: https://lists.openembedded.org/mt/90876532/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

