Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7608CCA481
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.4461.1655298221818193907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PICvYqnT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 0101018167766823-ff7143a8-d5ae-425b-ac94-62ea92e87a0b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=boZnhwpaqfSw9zX4Yt7pRJxqdPJIml6FVWmfqsclZy0=;
	b=PICvYqnTXqntsmOWpMxhUvvd/2ZCTWBR6ZTi3zGOaEY+oTgE40c/3UgSpuJ2pDwr
	dGsyICKAhtUdIxUtUUu0PAOXUTrX1rb90Z2r3XaizumgAYbjR1xwyP9fAI4xyyf+Rre
	D3uyodZLX6qey2JYvalxqNa9RDDW5JoqSdb9cCb4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=boZnhwpaqfSw9zX4Yt7pRJxqdPJIml6FVWmfqsclZy0=;
	b=OF4PkYio1DDOsogF+fBeJvmvsA5g16/9wmw69CS9eITL23SKK0Kepf5LhIsfQ534
	lsHyfKhy6ZqnwoO//PA9Hjm03voSuN1zqUxTTmhTFYLvOL8vgDVIbOft8Ejt9l+GZVx
	CmQZRPxrHJTAGbtZ8gGrZHZS6oS+uvZLXFxEuoFU=
Content-Type: multipart/mixed; boundary="===============2401109366312695698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2022-06-15
Message-ID: 
 <0101018167766823-ff7143a8-d5ae-425b-ac94-62ea92e87a0b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166976

--===============2401109366312695698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed(do_compile): 7
        ell, 0.51, Zang Ruochen <zangrc.fnst@fujitsu.com>
        go-runtime, 1.18.3, Khem Raj <raj.khem@gmail.com>
        go, 1.18.3, Khem Raj <raj.khem@gmail.com>
        python3-jsonschema, 4.6.0, Bruce Ashfield <bruce.ashfield@gmail.com>
        libdrm, 2.4.111, Otavio Salvador <otavio.salvador@ossystems.com.br>
        spirv-tools, 1.3.216.0, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-tools, 1.3.216.0, Anuj Mittal <anuj.mittal@intel.com>
    * Succeeded: 28
        btrfs-tools, 5.18.1, Wang Mingyu <wangmy@fujitsu.com>
        erofs-utils, 1.5, Richard Weinberger <richard@nod.at>
        file, 5.42, Yi Zhao <yi.zhao@windriver.com>
        python3-babel, 2.10.2, Tim Orling <tim.orling@konsulko.com>
        python3-hypothesis, 6.47.2, Tim Orling <tim.orling@konsulko.com>
        python3-magic, 0.4.27, Joshua Watt <JPEWhacker@gmail.com>
        python3-numpy, 1.22.4, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-requests, 2.28.0, Tim Orling <tim.orling@konsulko.com>
        python3-sphinx, 5.0.1, Tim Orling <tim.orling@konsulko.com>
        python3, 3.10.5, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        ethtool, 5.18, Changhyeok Bae <changhyeok.bae@gmail.com>
        lighttpd, 1.4.65, Alexander Kanavin <alex.kanavin@gmail.com>
        stress-ng, 0.14.02, Anuj Mittal <anuj.mittal@intel.com>
        sudo, 1.9.11p2, Chen Qi <Qi.Chen@windriver.com>
        adwaita-icon-theme, 42.0, Ross Burton <ross.burton@arm.com>
        librsvg, 2.54.4, Anuj Mittal <anuj.mittal@intel.com>
        glslang, 1.3.216.0, Jose Quaresma <quaresma.jose@gmail.com>
        mesa, 22.1.1, Otavio Salvador <otavio.salvador@ossystems.com.br>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        spirv-headers, 1.3.216.0, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-headers, 1.3.216.0, Anuj Mittal <anuj.mittal@intel.com>
        libx11, 1.8.1, Unassigned <unassigned@yoctoproject.org>
        linux-firmware, 20220610, Otavio Salvador <otavio.salvador@ossystems.com.br>
        wireless-regdb, 2022.06.06, Adrian Bunk <bunk@kernel.org>
        x264, r3039-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        diffoscope, 216, Joshua Watt <JPEWhacker@gmail.com>
        dos2unix, 7.4.3, Khem Raj <raj.khem@gmail.com>
    * Failed(other errors): 2
        cargo, 1.61.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
    * Failed (devtool error): 8
        gnu-config, 20220516-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        llvm, 14.0.5, Khem Raj <raj.khem@gmail.com>
        python3-setuptools, 62.4.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        libstd-rs, 1.61.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        rust-llvm, 1.61.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        procps, 4.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
        vulkan-loader, 1.3.216.0, Anuj Mittal <anuj.mittal@intel.com>
        lttng-modules, 2.13.4, Richard Purdie <richard.purdie@linuxfoundation.org>

    TOTAL: attempted=45 succeeded=28(62.22%) failed=17(37.78%)

Recipe upgrade statistics per Maintainer:

    Jose Quaresma <quaresma.jose: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Oleksandr Kravchuk <open.source: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Unassigned <unassigned: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Anuj Mittal <anuj.mittal: attempted=7 succeeded=5(71.43%) failed=2(28.57%)
    Adrian Bunk <bunk: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Wang Mingyu <wangmy: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Zang Ruochen <zangrc.fnst: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Joshua Watt <JPEWhacker: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Richard Weinberger <richard: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Changhyeok Bae <changhyeok.bae: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Tim Orling <tim.orling: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Khem Raj <raj.khem: attempted=4 succeeded=1(25.00%) failed=3(75.00%)
    Bruce Ashfield <bruce.ashfield: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Richard Purdie <richard.purdie: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Randy MacLeod <Randy.MacLeod: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
    Ross Burton <ross.burton: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Chen Qi <Qi.Chen: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Otavio Salvador <otavio.salvador: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Yi Zhao <yi.zhao: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============2401109366312695698==--

