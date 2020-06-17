Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3033.1592382170620407649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 01:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EC51E01D15; Wed, 17 Jun 2020 01:22:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7782E01D18
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 01:22:35 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2020-06-17
Message-Id: <20200617082250.4EC51E01D15@yocto-www.yoctoproject.org>
Date: Wed, 17 Jun 2020 01:22:50 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5344334489044082430=="

--===============5344334489044082430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 11
        bind, 9.16.3, Armin Kuster <akuster808@gmail.com>
        dropbear, 2020.79, Yi Zhao <yi.zhao@windriver.com>
        elfutils, 0.180, Hongxu Jia <hongxu.jia@windriver.com>
        gnu-config, 20200515-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        libdnf, 0.48.0, Alexander Kanavin <alex.kanavin@gmail.com>
        llvm, 10.0.0, Khem Raj <raj.khem@gmail.com>
        patchelf, 0.11, Richard Purdie <richard.purdie@linuxfoundation.org>
        perl, 5.30.3, Alexander Kanavin <alex.kanavin@gmail.com>
        qemu, 5.0.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        mesa, 20.1.1, Otavio Salvador <otavio.salvador@ossystems.com.br>
        vulkan-demos, git-new-commits-available, Ross Burton <ross.burton@arm.com>
    * Succeeded: 20
        ell, 0.32, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        bison, 3.6.4, Chen Qi <Qi.Chen@windriver.com>
        dnf, 4.2.23, Alexander Kanavin <alex.kanavin@gmail.com>
        file, 5.39, Yi Zhao <yi.zhao@windriver.com>
        meson, 0.54.3, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-cython, 0.29.20, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-setuptools, 47.3.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        ethtool, 5.7, Changhyeok Bae <changhyeok.bae@gmail.com>
        man-pages, 5.07, Hongxu Jia <hongxu.jia@windriver.com>
        stress-ng, 0.11.13, Anuj Mittal <anuj.mittal@intel.com>
        libhandy, 0.80.0, Alexander Kanavin <alex.kanavin@gmail.com>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        powertop, 2.13, Alexander Kanavin <alex.kanavin@gmail.com>
        systemtap-uprobes, 4.3, Victor Kamensky <kamensky@cisco.com>
        systemtap, 4.3, Victor Kamensky <kamensky@cisco.com>
        alsa-lib, 1.2.3, Tanu Kaskinen <tanuk@iki.fi>
        alsa-topology-conf, 1.2.3, Tanu Kaskinen <tanuk@iki.fi>
        alsa-ucm-conf, 1.2.3, Tanu Kaskinen <tanuk@iki.fi>
        alsa-utils, 1.2.3, Tanu Kaskinen <tanuk@iki.fi>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(other errors): 2
        vulkan-headers, 1.2.141.0, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-loader, 1.2.141.0, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(do_compile): 3
        vulkan-tools, 1.2.141.0, Anuj Mittal <anuj.mittal@intel.com>
        ffmpeg, 4.3, Alexander Kanavin <alex.kanavin@gmail.com>
        libgpg-error, 1.38, Hongxu Jia <hongxu.jia@windriver.com>

    TOTAL: attempted=36 succeeded=20(55.56%) failed=16(44.44%)

Recipe upgrade statistics per Maintainer:

    Yi Zhao <yi.zhao: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Anuj Mittal <anuj.mittal: attempted=5 succeeded=2(40.00%) failed=3(60.00%)
    Ross Burton <ross.burton: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Alexander Kanavin <alex.kanavin: attempted=7 succeeded=4(57.14%) failed=3(42.86%)
    Victor Kamensky <kamensky: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Khem Raj <raj.khem: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Hongxu Jia <hongxu.jia: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Tanu Kaskinen <tanuk: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Oleksandr Kravchuk <open.source: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster808: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Changhyeok Bae <changhyeok.bae: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Chen Qi <Qi.Chen: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Richard Purdie <richard.purdie: attempted=2 succeeded=0(0.00%) failed=2(100.00%)

--===============5344334489044082430==--
