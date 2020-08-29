Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.16483.1598724176725874674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 907DCE020D2; Sat, 29 Aug 2020 11:02:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5ADC7E02115
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:02:01 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2020-08-29
Message-Id: <20200829180256.907DCE020D2@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7819885782169217902=="

--===============7819885782169217902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 9
        bind, 9.16.6, Armin Kuster <akuster808@gmail.com>
        gnu-config, 20200721-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        go-runtime, 1.15, Khem Raj <raj.khem@gmail.com>
        go, 1.15, Khem Raj <raj.khem@gmail.com>
        nasm, 2.15.05, Richard Purdie <richard.purdie@linuxfoundation.org>
        iputils, s20200821, Changhyeok Bae <changhyeok.bae@gmail.com>
        libva-utils, 2.9.0, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-demos, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        gnupg, 2.2.22, Hongxu Jia <hongxu.jia@windriver.com>
    * Succeeded: 19
        iw, 5.8, Changhyeok Bae <changhyeok.bae@gmail.com>
        libuv, 1.39.0, Armin Kuster <akuster@mvista.com>
        resolvconf, 1.83, Chen Qi <Qi.Chen@windriver.com>
        libxcrypt-compat, 4.4.17, Khem Raj <raj.khem@gmail.com>
        systemd-boot, 246.3, Chen Qi <Qi.Chen@windriver.com>
        librepo, 1.12.1, Alexander Kanavin <alex.kanavin@gmail.com>
        ninja, 1.10.1, Khem Raj <raj.khem@gmail.com>
        patchelf, 0.12, Richard Purdie <richard.purdie@linuxfoundation.org>
        msmtp, 1.8.12, Alexander Kanavin <alex.kanavin@gmail.com>
        stress-ng, 0.11.19, Anuj Mittal <anuj.mittal@intel.com>
        libhandy, 0.90.0, Alexander Kanavin <alex.kanavin@gmail.com>
        harfbuzz, 2.7.2, Anuj Mittal <anuj.mittal@intel.com>
        pango, 1.46.1, Ross Burton <ross.burton@arm.com>
        debianutils, 4.11.1, Yi Zhao <yi.zhao@windriver.com>
        diffoscope, 158, Joshua Watt <JPEWhacker@gmail.com>
        enchant2, 2.2.9, Anuj Mittal <anuj.mittal@intel.com>
        libmpc, 1.2.0, Khem Raj <raj.khem@gmail.com>
        p11-kit, 0.23.21, Alexander Kanavin <alex.kanavin@gmail.com>
        re2c, 2.0.3, Khem Raj <raj.khem@gmail.com>
    * Failed(do_compile): 6
        glib-2.0, 2.64.5, Anuj Mittal <anuj.mittal@intel.com>
        libxcrypt, 4.4.17, Khem Raj <raj.khem@gmail.com>
        cmake, 3.18.2, Pascal Bach <pascal.bach@siemens.com>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        vulkan-tools, 1.2.148.0, Anuj Mittal <anuj.mittal@intel.com>
        weston, 8.0.93, Denys Dmytriyenko <denys@ti.com>
    * Failed(other errors): 5
        mesa, 20.1.6, Otavio Salvador <otavio.salvador@ossystems.com.br>
        vulkan-headers, 1.2.148.0, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-loader, 1.2.148.1, Anuj Mittal <anuj.mittal@intel.com>
        libx11, 1.6.12, Armin Kuster <akuster808@gmail.com>
        xserver-xorg, 1.20.9, Armin Kuster <akuster808@gmail.com>

    TOTAL: attempted=39 succeeded=19(48.72%) failed=20(51.28%)

Recipe upgrade statistics per Maintainer:

    Chen Qi <Qi.Chen: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Alexander Kanavin <alex.kanavin: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Denys Dmytriyenko <denys: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster808: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Hongxu Jia <hongxu.jia: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Ross Burton <ross.burton: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Anuj Mittal <anuj.mittal: attempted=8 succeeded=3(37.50%) failed=5(62.50%)
    Yi Zhao <yi.zhao: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Changhyeok Bae <changhyeok.bae: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Richard Purdie <richard.purdie: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Khem Raj <raj.khem: attempted=7 succeeded=4(57.14%) failed=3(42.86%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============7819885782169217902==--
