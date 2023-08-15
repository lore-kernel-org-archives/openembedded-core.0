Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B254C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 08:04:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.129697.1692086678138390725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 01:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cZ4wt8q7;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso8487245e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 01:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692086676; x=1692691476;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIJDp9oD/vj9z7BgvpRF/bZoiQQ9fD1oaunBPyhBDAc=;
        b=cZ4wt8q7m2qsp32lM9yKljXAjGZR6bklKGPluExoZ71/Y7O9C824hnmMz5qhw8w0aW
         yE6X1h3dlmrlZexh3OH8/Dn86so+mSDoZ+AhaAUIdvv3NnuZBr0BsjOPVI7aION3nQgm
         gOlgbeKVBaxQLDqiC/bu02ambQtYJVqDJG4dEPxvL80SkYjgx62HiGkO8N/j7XgAoHHE
         WPhz/tfSe9/D05XsNVRcNumvkhSt07tiDhXvTeKU/NdgOdXDTrqRH+2poDxvhRERlAbL
         d/pjFIuLHgn+LpW2GjCvX8PS5Ir9G4OoWh60sh4XIW8OAKDu++MvOxD2caMjU2dD7tDA
         Im8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692086676; x=1692691476;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIJDp9oD/vj9z7BgvpRF/bZoiQQ9fD1oaunBPyhBDAc=;
        b=KSo9/JYQmCutz68PYhzbAB4o1ON1qoZhz7X7OrTjGDIifQsizs4F1hWo40dQpkCyMF
         AhZCr78nUMh/Fg4RL0oEAsJK9s3uARh8nfZ+l0HbrqgVFLpm+OqkU2IvYsqnXTHr04qR
         MgqHvOXu9S67VNYrUu03654ywr8jHHz0HpKyaB2d/Huawpd1tCtkJmmbXqsjcVvnbeBP
         wjYyojmnofFMrv5N0eWsRkZ3uITg7LuJHW+BwJC+xipbUnh5V1rtXMa6kdip8PeBXHB6
         p2riRRKZAv0xx/eQsNFNbT1n7LjO8osXa1QVJzxJtln3sNXQrc+0OEGAyxIV1m8dx+G8
         T7Cw==
X-Gm-Message-State: AOJu0Ywn5o+LTaQpzK0C+pB5IGjbNkD1h7oRtLrI4zavsJcNmaWJQLVD
	2QOnki5BQGmgYoNSjhidg4EhOVuNvWIojm86XzVWyVxd
X-Google-Smtp-Source: AGHT+IFa2WB+7uNjg6LzeMehgmfIJ80w7pV+A9TTgrAjwTQLUnDppMBg9ttCJZFGuhilDBbKnopVk9wkpCx0oU+Sh1M=
X-Received: by 2002:a19:740a:0:b0:4ff:87f3:4297 with SMTP id
 v10-20020a19740a000000b004ff87f34297mr460637lfe.23.1692086675989; Tue, 15 Aug
 2023 01:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <01010189f8300844-b53adeb7-9a97-4ae9-8af3-7fa62cb6d0cf-000000@us-west-2.amazonses.com>
In-Reply-To: <01010189f8300844-b53adeb7-9a97-4ae9-8af3-7fa62cb6d0cf-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Aug 2023 10:04:24 +0200
Message-ID: <CANNYZj9QJ90hzDecJUhqhsPVGb1ovV-zbKRC3pn0hTtiji8UzA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2023-08-15
To: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 08:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186053

This mass-fail is another fallout from systemd requiring usrmerge.
Patch incoming, there'll be a respin.

Alex

On Tue, 15 Aug 2023 at 09:56, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
>
> AUH finished upgrade batch the result patches/logs can be found at:
> https://autobuilder.yocto.io/pub/auh/20230815045617, next are the statistics:
>
> Recipe upgrade statistics:
>
>     * Failed(other errors): 90
>         connman, 1.42, Changhyeok Bae <changhyeok.bae@gmail.com>
>         openssh, 9.4p1, Unassigned <unassigned@yoctoproject.org>
>         openssl, 3.1.2, Alexander Kanavin <alex.kanavin@gmail.com>
>         gettext, 0.22, Robert Yang <liezhi.yang@windriver.com>
>         glibc-tests, 2.38, Lukasz Majewski <lukma@denx.de>
>         glibc-testsuite, 2.38, Khem Raj <raj.khem@gmail.com>
>         libcgroup, 3.1.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         libxml2, 2.11.5, Hongxu Jia <hongxu.jia@windriver.com>
>         seatd, 0.8.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         systemd-boot, 254.1, Chen Qi <Qi.Chen@windriver.com>
>         cmake, 3.27.2, Unassigned <unassigned@yoctoproject.org>
>         createrepo-c, 1.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         dnf, 4.16.2, Alexander Kanavin <alex.kanavin@gmail.com>
>         json-c, 0.17, Yi Zhao <yi.zhao@windriver.com>
>         libdnf, 0.70.2, Alexander Kanavin <alex.kanavin@gmail.com>
>         librepo, 1.15.2, Wang Mingyu <wangmy@fujitsu.com>
>         meson, 1.2.1, Alexander Kanavin <alex.kanavin@gmail.com>
>         perl, 5.38.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         python3-cython, 3.0.0, Unassigned <unassigned@yoctoproject.org>
>         python3-dbusmock, 0.29.1, Unassigned <unassigned@yoctoproject.org>
>         python3-dtc, 1.7.0, Trevor Gamblin <tgamblin@baylibre.com>
>         python3-dtschema, 2023.7, Bruce Ashfield <bruce.ashfield@gmail.com>
>         python3-hypothesis, 6.82.4, Tim Orling <tim.orling@konsulko.com>
>         python3-jsonschema, 4.19.0, Bruce Ashfield <bruce.ashfield@gmail.com>
>         python3-libarchive-c, 5.0, Joshua Watt <JPEWhacker@gmail.com>
>         python3-more-itertools, 10.1.0, Tim Orling <tim.orling@konsulko.com>
>         python3-numpy, 1.25.2, Unassigned <unassigned@yoctoproject.org>
>         python3-pygments, 2.16.1, Tim Orling <tim.orling@konsulko.com>
>         python3-sphinxcontrib-applehelp, 1.0.7, Tim Orling <tim.orling@konsulko.com>
>         python3-sphinxcontrib-devhelp, 1.0.5, Tim Orling <tim.orling@konsulko.com>
>         python3-sphinxcontrib-htmlhelp, 2.0.4, Tim Orling <tim.orling@konsulko.com>
>         python3-sphinxcontrib-qthelp, 1.0.6, Tim Orling <tim.orling@konsulko.com>
>         python3-sphinxcontrib-serializinghtml, 1.1.8, Tim Orling <tim.orling@konsulko.com>
>         python3-trove-classifiers, 2023.8.7, Trevor Gamblin <tgamblin@baylibre.com>
>         python3-wheel, 0.41.1, Tim Orling <tim.orling@konsulko.com>
>         qemu, 8.0.4, Richard Purdie <richard.purdie@linuxfoundation.org>
>         cargo, 1.71.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         rust, 1.71.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         vala, 0.56.11, Alexander Kanavin <alex.kanavin@gmail.com>
>         ethtool, 6.4, Changhyeok Bae <changhyeok.bae@gmail.com>
>         groff, 1.23.0, Hongxu Jia <hongxu.jia@windriver.com>
>         less, 643, Yi Zhao <yi.zhao@windriver.com>
>         libarchive, 3.7.1, Otavio Salvador <otavio.salvador@ossystems.com.br>
>         man-pages, 6.05.01, Hongxu Jia <hongxu.jia@windriver.com>
>         mc, 4.8.30, Ross Burton <ross.burton@arm.com>
>         libconvert-asn1-perl, 0.34, Tim Orling <tim.orling@konsulko.com>
>         shadow, 4.14.0, Chen Qi <Qi.Chen@windriver.com>
>         stress-ng, 0.16.04, Anuj Mittal <anuj.mittal@intel.com>
>         sysklogd, 2.5.1, Chen Qi <Qi.Chen@windriver.com>
>         tar, 1.35, Chen Qi <Qi.Chen@windriver.com>
>         xz, 5.4.4, Denys Dmytriyenko <denis@denix.org>
>         adwaita-icon-theme, 44.0, Ross Burton <ross.burton@arm.com>
>         gtk4, 4.12.0, Markus Volk <f_l_k@t-online.de>
>         libgudev, 238, Ross Burton <ross.burton@arm.com>
>         libsecret, 0.21.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         harfbuzz, 8.1.1, Anuj Mittal <anuj.mittal@intel.com>
>         kmscube, git-new-commits-available, Carlos Rafael Giani <crg7475@mailbox.org>
>         libsdl2, 2.28.2, Yi Zhao <yi.zhao@windriver.com>
>         libglu, 9.0.3, Ross Burton <ross.burton@arm.com>
>         mesa, 23.1.5, Otavio Salvador <otavio.salvador@ossystems.com.br>
>         pango, 1.51.0, Ross Burton <ross.burton@arm.com>
>         piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
>         shaderc, 2023.6, Jose Quaresma <quaresma.jose@gmail.com>
>         spirv-tools, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
>         vulkan-headers, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-loader, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-tools, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
>         vulkan-validation-layers, 1.3.250.1, Vincent Davis Jr <vince@underview.tech>
>         wayland-utils, 1.2.0, Denys Dmytriyenko <denis@denix.org>
>         weston, 12.0.2, Denys Dmytriyenko <denis@denix.org>
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
>         puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
>         bmap-tools, 3.7, Anuj Mittal <anuj.mittal@intel.com>
>         boost, 1.83.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         diffoscope, 247, Joshua Watt <JPEWhacker@gmail.com>
>         gnupg, 2.4.3, Hongxu Jia <hongxu.jia@windriver.com>
>         gnutls, 3.8.1, Unassigned <unassigned@yoctoproject.org>
>         gpgme, 1.21.0, Hongxu Jia <hongxu.jia@windriver.com>
>         libgit2, 1.7.1, Unassigned <unassigned@yoctoproject.org>
>     * Failed(get_env): 1
>         dhcpcd, 10.0.2, Unassigned <unassigned@yoctoproject.org>
>     * Failed (devtool error): 9
>         glibc, 2.38, Khem Raj <raj.khem@gmail.com>
>         gnu-config, 20230216-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
>         go-runtime, 1.21.0, Khem Raj <raj.khem@gmail.com>
>         go, 1.21.0, Khem Raj <raj.khem@gmail.com>
>         libstd-rs, 1.71.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         rust-llvm, 1.71.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
>         vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
>         libpthread-stubs, 0.5, Alexander Kanavin <alex.kanavin@gmail.com>
>     * Succeeded: 6
>         mmc-utils, 0.1-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
>         pkgconf, 2.0.1, Ross Burton <ross.burton@arm.com>
>         glslang, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
>         spirv-headers, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
>         linux-firmware, 20230804, Otavio Salvador <otavio.salvador@ossystems.com.br>
>         libsndfile1, 1.2.2, Unassigned <unassigned@yoctoproject.org>
>     * Failed(do_compile): 1
>         lttng-modules, 2.13.10, Richard Purdie <richard.purdie@linuxfoundation.org>
>
>     TOTAL: attempted=107 succeeded=6(5.61%) failed=101(94.39%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Lukasz Majewski <lukma: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Joshua Watt <JPEWhacker: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Denys Dmytriyenko <denis: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
>     Yi Zhao <yi.zhao: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
>     Alexander Kanavin <alex.kanavin: attempted=12 succeeded=0(0.00%) failed=12(100.00%)
>     Khem Raj <raj.khem: attempted=5 succeeded=0(0.00%) failed=5(100.00%)
>     Robert Yang <liezhi.yang: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Jose Quaresma <quaresma.jose: attempted=4 succeeded=2(50.00%) failed=2(50.00%)
>     Markus Volk <f_l_k: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Richard Purdie <richard.purdie: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
>     Changhyeok Bae <changhyeok.bae: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Carlos Rafael Giani <crg7475: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Vincent Davis Jr <vince: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Chen Qi <Qi.Chen: attempted=4 succeeded=0(0.00%) failed=4(100.00%)
>     Ross Burton <ross.burton: attempted=8 succeeded=1(12.50%) failed=7(87.50%)
>     Wang Mingyu <wangmy: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>     Trevor Gamblin <tgamblin: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Randy MacLeod <Randy.MacLeod: attempted=4 succeeded=0(0.00%) failed=4(100.00%)
>     Hongxu Jia <hongxu.jia: attempted=5 succeeded=0(0.00%) failed=5(100.00%)
>     Anuj Mittal <anuj.mittal: attempted=19 succeeded=1(5.26%) failed=18(94.74%)
>     Bruce Ashfield <bruce.ashfield: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
>     Otavio Salvador <otavio.salvador: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
>     Tim Orling <tim.orling: attempted=10 succeeded=0(0.00%) failed=10(100.00%)
>     Unassigned <unassigned: attempted=9 succeeded=1(11.11%) failed=8(88.89%)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186052): https://lists.openembedded.org/g/openembedded-core/message/186052
> Mute This Topic: https://lists.openembedded.org/mt/100754235/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

