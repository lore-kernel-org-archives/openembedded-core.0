Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04CCC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:36:23 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.17881.1690907781842166160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=p6ZobTon;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9f48b6796so21013751fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690907780; x=1691512580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QtZuZoMncl6tJL7rla3q7ljlX3V+XpUe434pbG/Soas=;
        b=p6ZobTon9E7ecM6zw2CGA3py/JvgwuNtReuya4iBO4WU+P5gaeQwSLgd1T0BQNiV6t
         MNJonROPAyo/TcYMyy7ODS8eSDUZOt60PDXvyW/3nhTQLXQ/rblpuRl2e9btDe9Uu7t4
         HLRS7xAW5DUpE9AWF0i1toOYCDUbZ6vmAP2nR2J+4A1OkgEmGPjwMU9MjZvU5lqDa0Uy
         0jetQxVp7HfQxgBGTrutRTYwCEJXxp1+2QR7NyTRUp++82/m8gtulbO1frvsHaAqDGcj
         9TcdDmdCxMk3O53wnBH/oRmMv1fWjQ6HFLPdz+ubZij+bSmtK6ra2DP+wNu632f/E25e
         SlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690907780; x=1691512580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtZuZoMncl6tJL7rla3q7ljlX3V+XpUe434pbG/Soas=;
        b=Nb6wc/jJQhT5riQV+HbGCbGS93tpneT9YWF3E8YbaDccFzAXwFJ0JEpcZ7gJv/cm9i
         KIJoydFTrauXVWuMIATcRCd4xt7BWVqvotSzlaUCb5j5ZmVSu5BrQuLUhjlxIYI6HDkQ
         WFQsr1VZH1Km561NCtoEU26YJGxaqQYYCOX4spFCmmBMCdMG52l054W+BjZt8Vn7lojZ
         4djLHDUX2xw6RrGFpCGf3EFugiNSdk9fESokwAf17yNGnhDLyjobjlcytma61ewwLLuk
         9DW71NfDVNVR9HYTMpQleOtZzfS/8EAIYE1b+fOovKP1TR6dHh0hpHUn3XVhGBLo5JNS
         wTfg==
X-Gm-Message-State: ABy/qLZBsjkRLQOJVwc4tkSANOMMyRHi8LFIuw6Mu6C+F6HUwvpvs3ht
	KqbMi6zS/QLbgRoC+gUcAJiHf4BNGX51gtMTkqk=
X-Google-Smtp-Source: APBJJlF/lcin5v8o+WwZPhB346WHHkeKuPONQ5KzJj8UoHqKlmkBLAf0gtG86Nfj5QrUUEOA5gZ5pEhZ+BLX2uBJj4E=
X-Received: by 2002:a2e:8455:0:b0:2b9:5b06:b724 with SMTP id
 u21-20020a2e8455000000b002b95b06b724mr2690365ljh.42.1690907779698; Tue, 01
 Aug 2023 09:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <01010189b1ee533c-9d06d28e-1ac4-48ec-9c61-acc24630bbad-000000@us-west-2.amazonses.com>
In-Reply-To: <01010189b1ee533c-9d06d28e-1ac4-48ec-9c61-acc24630bbad-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 18:36:08 +0200
Message-ID: <CANNYZj8AmqfvSzO=buyS9j6kAo2L4d_Q+FfsQHmwYvidnt++bQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2023-08-01
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185356

A lot of the failures seem to be about

File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py",
line 473, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory:
'/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/curl/COPYING'

As the projects didn't do anything to license files, something has
clearly regressed here, I'll take a look and probably start a re-run.

Alex


On Tue, 1 Aug 2023 at 18:30, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
>
> AUH finished upgrade batch the result patches/logs can be found at:
> https://autobuilder.yocto.io/pub/auh/20230801050116, next are the statistics:
>
> Recipe upgrade statistics:
>
>     * Failed (devtool error): 76
>         bind, 9.18.17, Unassigned <unassigned@yoctoproject.org>
>         kea, 2.4.0, Unassigned <unassigned@yoctoproject.org>
>         openssh, 9.3p2, Unassigned <unassigned@yoctoproject.org>
>         gettext, 0.22, Robert Yang <liezhi.yang@windriver.com>
>         glibc-tests, 2.38, Lukasz Majewski <lukma@denx.de>
>         glibc, 2.38, Khem Raj <raj.khem@gmail.com>
>         libcgroup, 3.1.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         systemd-boot, 254, Chen Qi <Qi.Chen@windriver.com>
>         systemd, 254, Chen Qi <Qi.Chen@windriver.com>
>         util-linux-libuuid, 2.39.1, Chen Qi <Qi.Chen@windriver.com>
>         util-linux, 2.39.1, Chen Qi <Qi.Chen@windriver.com>
>         binutils, 2.41, Khem Raj <raj.khem@gmail.com>
>         cmake, 3.27.1, Unassigned <unassigned@yoctoproject.org>
>         gnu-config, 20230216-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
>         meson, 1.2.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         perl, 5.38.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         python3-certifi, 2023.7.22, Tim Orling <tim.orling@konsulko.com>
>         python3-cython, 3.0.0, Unassigned <unassigned@yoctoproject.org>
>         python3-dbusmock, 0.29.1, Unassigned <unassigned@yoctoproject.org>
>         python3-dtschema, 2023.7, Bruce Ashfield <bruce.ashfield@gmail.com>
>         python3-editables, 0.5, Ross Burton <ross.burton@arm.com>
>         python3-jsonschema, 4.18.4, Bruce Ashfield <bruce.ashfield@gmail.com>
>         python3-libarchive-c, 5.0, Joshua Watt <JPEWhacker@gmail.com>
>         python3-markdown, 3.4.4, Alexander Kanavin <alex.kanavin@gmail.com>
>         python3-more-itertools, 10.0.0, Tim Orling <tim.orling@konsulko.com>
>         python3-numpy, 1.25.2, Unassigned <unassigned@yoctoproject.org>
>         python3-pathspec, 0.11.2, Ross Burton <ross.burton@arm.com>
>         python3-pip, 23.2.1, Zang Ruochen <zangruochen@loongson.cn>
>         python3-pyparsing, 3.1.1, Unassigned <unassigned@yoctoproject.org>
>         python3-sphinx, 7.1.1, Tim Orling <tim.orling@konsulko.com>
>         python3-wheel, 0.41.0, Tim Orling <tim.orling@konsulko.com>
>         cargo, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
>         libstd-rs, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
>         rust-llvm, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
>         rust, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
>         vala, 0.56.9, Alexander Kanavin <alex.kanavin@gmail.com>
>         ethtool, 6.4, Changhyeok Bae <changhyeok.bae@gmail.com>
>         go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
>         groff, 1.23.0, Hongxu Jia <hongxu.jia@windriver.com>
>         libarchive, 3.7.1, Otavio Salvador <otavio.salvador@ossystems.com.br>
>         sudo, 1.9.14p3, Chen Qi <Qi.Chen@windriver.com>
>         tar, 1.35, Chen Qi <Qi.Chen@windriver.com>
>         epiphany, 44.6, Alexander Kanavin <alex.kanavin@gmail.com>
>         adwaita-icon-theme, 44.0, Ross Burton <ross.burton@arm.com>
>         libgudev, 238, Ross Burton <ross.burton@arm.com>
>         librsvg, 2.56.3, Anuj Mittal <anuj.mittal@intel.com>
>         harfbuzz, 8.1.0, Anuj Mittal <anuj.mittal@intel.com>
>         libsdl2, 2.28.1, Yi Zhao <yi.zhao@windriver.com>
>         libglu, 9.0.3, Ross Burton <ross.burton@arm.com>
>         mesa, 23.1.4, Otavio Salvador <otavio.salvador@ossystems.com.br>
>         piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
>         vulkan-loader, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
>         wayland-utils, 1.2.0, Denys Dmytriyenko <denis@denix.org>
>         libpthread-stubs, 0.5, Alexander Kanavin <alex.kanavin@gmail.com>
>         lttng-modules, 2.13.10, Richard Purdie <richard.purdie@linuxfoundation.org>
>         lttng-tools, 2.13.10, Richard Purdie <richard.purdie@linuxfoundation.org>
>         gst-devtools, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-libav, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-omx, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-plugins-bad, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-plugins-base, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-plugins-good, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-plugins-ugly, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-python, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-rtsp-server, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-vaapi, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
>         webkitgtk, 2.40.4, Alexander Kanavin <alex.kanavin@gmail.com>
>         curl, 8.2.1, Robert Joslyn <robert.joslyn@redrectangle.org>
>         diffoscope, 246, Joshua Watt <JPEWhacker@gmail.com>
>         gmp, 6.3.0, Khem Raj <raj.khem@gmail.com>
>         gnupg, 2.4.3, Hongxu Jia <hongxu.jia@windriver.com>
>         gpgme, 1.21.0, Hongxu Jia <hongxu.jia@windriver.com>
>         libgit2, 1.7.0, Unassigned <unassigned@yoctoproject.org>
>         re2c, 3.1, Khem Raj <raj.khem@gmail.com>
>     * Succeeded: 19
>         dhcpcd, 10.0.2, Unassigned <unassigned@yoctoproject.org>
>         seatd, 0.8.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         btrfs-tools, 6.3.3, Wang Mingyu <wangmy@fujitsu.com>
>         createrepo-c, 1.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         dnf, 4.16.2, Alexander Kanavin <alex.kanavin@gmail.com>
>         file, 5.45, Yi Zhao <yi.zhao@windriver.com>
>         libdnf, 0.70.2, Alexander Kanavin <alex.kanavin@gmail.com>
>         mmc-utils, 0.1-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
>         python3-dtc, 1.7.0, Trevor Gamblin <tgamblin@baylibre.com>
>         sysklogd, 2.5.1, Chen Qi <Qi.Chen@windriver.com>
>         glslang, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
>         shaderc, 2023.5, Jose Quaresma <quaresma.jose@gmail.com>
>         spirv-headers, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
>         spirv-tools, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
>         vulkan-headers, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-tools, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-validation-layers, 1.3.250.1, Vincent Davis Jr <vince@underview.tech>
>         puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
>         xxhash, 0.8.2, Alexander Kanavin <alex.kanavin@gmail.com>
>     * Failed(other errors): 1
>         glibc-testsuite, 2.38, Khem Raj <raj.khem@gmail.com>
>     * Failed(do_compile): 1
>         stress-ng, 0.16.02, Anuj Mittal <anuj.mittal@intel.com>
>
>     TOTAL: attempted=97 succeeded=19(19.59%) failed=78(80.41%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Chen Qi <Qi.Chen: attempted=7 succeeded=1(14.29%) failed=6(85.71%)
>     Richard Purdie <richard.purdie: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Unassigned <unassigned: attempted=10 succeeded=1(10.00%) failed=9(90.00%)
>     Randy MacLeod <Randy.MacLeod: attempted=4 succeeded=0(0.00%) failed=4(100.00%)
>     Robert Joslyn <robert.joslyn: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Bruce Ashfield <bruce.ashfield: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Changhyeok Bae <changhyeok.bae: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Wang Mingyu <wangmy: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
>     Joshua Watt <JPEWhacker: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Robert Yang <liezhi.yang: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Lukasz Majewski <lukma: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Yi Zhao <yi.zhao: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
>     Vincent Davis Jr <vince: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
>     Zang Ruochen <zangruochen: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Denys Dmytriyenko <denis: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Khem Raj <raj.khem: attempted=6 succeeded=0(0.00%) failed=6(100.00%)
>     Tim Orling <tim.orling: attempted=4 succeeded=0(0.00%) failed=4(100.00%)
>     Anuj Mittal <anuj.mittal: attempted=19 succeeded=4(21.05%) failed=15(78.95%)
>     Trevor Gamblin <tgamblin: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
>     Alexander Kanavin <alex.kanavin: attempted=13 succeeded=5(38.46%) failed=8(61.54%)
>     Jose Quaresma <quaresma.jose: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
>     Hongxu Jia <hongxu.jia: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
>     Ross Burton <ross.burton: attempted=7 succeeded=0(0.00%) failed=7(100.00%)
>     Otavio Salvador <otavio.salvador: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185355): https://lists.openembedded.org/g/openembedded-core/message/185355
> Mute This Topic: https://lists.openembedded.org/mt/100487678/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

