Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13216.1626600382142043398
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id BAC1B38C13A2
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-07-18
Message-ID: <MADEUP.1692D86E1A142C95.32522@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============1221476052269941555=="

--===============1221476052269941555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 8
        libuv, 1.41.1, Armin Kuster <akuster@mvista.com>
        systemd-boot, 249, Chen Qi <Qi.Chen@windriver.com>
        systemd, 249, Chen Qi <Qi.Chen@windriver.com>
        gnu-config, 20210620-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        mtools, 4.0.33, Anuj Mittal <anuj.mittal@intel.com>
        python3-testtools, 2.5.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
    * Failed(do_compile): 6
        btrfs-tools, 5.13, Wang Mingyu <wangmy@fujitsu.com>
        cmake, 3.21.0, Pascal Bach <pascal.bach@siemens.com>
        go-runtime, 1.16.6, Khem Raj <raj.khem@gmail.com>
        go, 1.16.6, Khem Raj <raj.khem@gmail.com>
        llvm, 12.0.1, Khem Raj <raj.khem@gmail.com>
        gdbm, 1.20, Alexander Kanavin <alex.kanavin@gmail.com>
    * Succeeded: 7
        libedit, 20210714-3.1, Khem Raj <raj.khem@gmail.com>
        python3-cython, 0.29.24, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-hypothesis, 6.14.3, Tim Orling <timothy.t.orling@intel.com>
        python3-setuptools, 57.2.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        mesa, 21.1.5, Otavio Salvador <otavio.salvador@ossystems.com.br>
        wireless-regdb, 2021.07.14, Adrian Bunk <bunk@kernel.org>
        diffoscope, 178, Joshua Watt <JPEWhacker@gmail.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=22 succeeded=7(31.82%) failed=15(68.18%)

Recipe upgrade statistics per Maintainer:

    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Khem Raj <raj.khem: attempted=5 succeeded=1(20.00%) failed=4(80.00%)
    Anuj Mittal <anuj.mittal: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Adrian Bunk <bunk: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Tim Orling <timothy.t.orling: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Oleksandr Kravchuk <open.source: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Chen Qi <Qi.Chen: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Wang Mingyu <wangmy: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Ross Burton <ross.burton: attempted=2 succeeded=0(0.00%) failed=2(100.00%)

--===============1221476052269941555==--
