Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.19843.1597558988381512803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F81AE02028; Sat, 15 Aug 2020 23:23:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 573F0E02093
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:45 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2020-08-16
Message-Id: <20200816062308.3F81AE02028@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:23:08 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3903642452879301533=="

--===============3903642452879301533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Succeeded: 38
        libubootenv, 0.3, Stefano Babic <sbabic@denx.de>
        iproute2, 5.8.0, Changhyeok Bae <changhyeok.bae@gmail.com>
        systemd-boot, 246.1, Chen Qi <Qi.Chen@windriver.com>
        util-linux, 2.36, Chen Qi <Qi.Chen@windriver.com>
        bison, 3.7.1, Chen Qi <Qi.Chen@windriver.com>
        build-compare, 2020.05.29-new-commits-available, Paul Eggleton <paul.eggleton@linux.intel.com>
        python3-numpy, 1.19.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-setuptools, 49.6.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        rsync, 3.2.3, Yi Zhao <yi.zhao@windriver.com>
        vala, 0.48.9, Alexander Kanavin <alex.kanavin@gmail.com>
        acpica, 20200717, Ross Burton <ross.burton@arm.com>
        asciidoc, 9.0.2, Yi Zhao <yi.zhao@windriver.com>
        libpipeline, 1.5.3, Alexander Kanavin <alex.kanavin@gmail.com>
        man-pages, 5.08, Hongxu Jia <hongxu.jia@windriver.com>
        mc, 4.8.25, Ross Burton <ross.burton@arm.com>
        stress-ng, 0.11.18, Anuj Mittal <anuj.mittal@intel.com>
        sysstat, 12.4.0, Chen Qi <Qi.Chen@windriver.com>
        epiphany, 3.36.4, Alexander Kanavin <alex.kanavin@gmail.com>
        gtk+3, 3.24.22, Ross Burton <ross.burton@arm.com>
        libhandy, 0.90.0, Alexander Kanavin <alex.kanavin@gmail.com>
        harfbuzz, 2.7.1, Anuj Mittal <anuj.mittal@intel.com>
        mesa, 20.1.5, Otavio Salvador <otavio.salvador@ossystems.com.br>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        vulkan-headers, 1.2.148.0, Anuj Mittal <anuj.mittal@intel.com>
        libinput, 1.16.1, Ross Burton <ross.burton@arm.com>
        font-alias, 1.0.4, Armin Kuster <akuster808@gmail.com>
        libx11, 1.6.11, Armin Kuster <akuster808@gmail.com>
        cryptodev-linux, 1.11, Robert Yang <liezhi.yang@windriver.com>
        cryptodev-module, 1.11, Robert Yang <liezhi.yang@windriver.com>
        cryptodev-tests, 1.11, Robert Yang <liezhi.yang@windriver.com>
        linux-firmware, 20200721, Otavio Salvador <otavio.salvador@ossystems.com.br>
        lttng-tools, 2.12.2, Richard Purdie <richard.purdie@linuxfoundation.org>
        x264, r2991-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        webkitgtk, 2.28.4, Alexander Kanavin <alex.kanavin@gmail.com>
        diffoscope, 156, Joshua Watt <JPEWhacker@gmail.com>
        libcheck, 0.15.2, Yi Zhao <yi.zhao@windriver.com>
        re2c, 2.0.2, Khem Raj <raj.khem@gmail.com>
        sqlite3, 3.33.0, Anuj Mittal <anuj.mittal@intel.com>
    * Failed (devtool error): 11
        bind, 9.16.5, Armin Kuster <akuster808@gmail.com>
        gettext, 0.21, Robert Yang <liezhi.yang@windriver.com>
        bootchart2, 0.14.9, Alexander Kanavin <alex.kanavin@gmail.com>
        go-runtime, 1.15, Khem Raj <raj.khem@gmail.com>
        go, 1.15, Khem Raj <raj.khem@gmail.com>
        qemu, 5.1.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        vulkan-demos, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        xev, 1.2.4, Armin Kuster <akuster808@gmail.com>
        boost, 1.74.0, Alexander Kanavin <alex.kanavin@gmail.com>
        gpgme, 1.14.0, Hongxu Jia <hongxu.jia@windriver.com>
        libpsl, 0.21.1, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(do_compile): 7
        cmake, 3.18.1, Pascal Bach <pascal.bach@siemens.com>
        ethtool, 5.8, Changhyeok Bae <changhyeok.bae@gmail.com>
        pango, 1.46.0, Ross Burton <ross.burton@arm.com>
        vulkan-loader, 1.2.148.0, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-tools, 1.2.148.0, Anuj Mittal <anuj.mittal@intel.com>
        weston, 8.0.92, Denys Dmytriyenko <denys@ti.com>
        wpebackend-fdo, 1.7.1, Alexander Kanavin <alex.kanavin@gmail.com>
    * Failed(other errors): 1
        gcc-source-10.1.0, 10.2.0, Khem Raj <raj.khem@gmail.com>

    TOTAL: attempted=57 succeeded=38(66.67%) failed=19(33.33%)

Recipe upgrade statistics per Maintainer:

    Khem Raj <raj.khem: attempted=4 succeeded=1(25.00%) failed=3(75.00%)
    Chen Qi <Qi.Chen: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Oleksandr Kravchuk <open.source: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Anuj Mittal <anuj.mittal: attempted=8 succeeded=5(62.50%) failed=3(37.50%)
    Paul Eggleton <paul.eggleton: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Otavio Salvador <otavio.salvador: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Stefano Babic <sbabic: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Ross Burton <ross.burton: attempted=7 succeeded=5(71.43%) failed=2(28.57%)
    Richard Purdie <richard.purdie: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Denys Dmytriyenko <denys: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Changhyeok Bae <changhyeok.bae: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Armin Kuster <akuster808: attempted=4 succeeded=2(50.00%) failed=2(50.00%)
    Alexander Kanavin <alex.kanavin: attempted=8 succeeded=5(62.50%) failed=3(37.50%)
    Robert Yang <liezhi.yang: attempted=4 succeeded=3(75.00%) failed=1(25.00%)
    Yi Zhao <yi.zhao: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Hongxu Jia <hongxu.jia: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)

--===============3903642452879301533==--
