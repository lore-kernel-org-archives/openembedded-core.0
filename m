Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.32526.1624189110533005392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id DDDFE38C137A
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-06-20
Message-ID: <MADEUP.168A47642123B050.8577@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5305925226659777811=="

--===============5305925226659777811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed(do_compile): 4
        bind, 9.16.18, Armin Kuster <akuster808@gmail.com>
        bluez5, 5.59, Anuj Mittal <anuj.mittal@intel.com>
        cmake, 3.20.4, Pascal Bach <pascal.bach@siemens.com>
        gdbm, 1.20, Alexander Kanavin <alex.kanavin@gmail.com>
    * Succeeded: 10
        dejagnu, 1.6.3, Nathan Rossi <nathan@nathanrossi.com>
        libdnf, 0.63.1, Alexander Kanavin <alex.kanavin@gmail.com>
        mtools, 4.0.31, Anuj Mittal <anuj.mittal@intel.com>
        python3-git, 3.1.18, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        mesa, 21.1.3, Otavio Salvador <otavio.salvador@ossystems.com.br>
        libxi, 1.7.99.2, Armin Kuster <akuster808@gmail.com>
        x264, r3039-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        libpcre, 8.45, Yi Zhao <yi.zhao@windriver.com>
        sqlite3, 3.36.0, Anuj Mittal <anuj.mittal@intel.com>
        vte, 0.64.2, Anuj Mittal <anuj.mittal@intel.com>
    * Failed (devtool error): 6
        dnf, 4.8.0, Alexander Kanavin <alex.kanavin@gmail.com>
        gnu-config, 20210522-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        python3-numpy, 1.21.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        bash, 5.1.8, Hongxu Jia <hongxu.jia@windriver.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=21 succeeded=10(47.62%) failed=11(52.38%)

Recipe upgrade statistics per Maintainer:

    Hongxu Jia <hongxu.jia: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Oleksandr Kravchuk <open.source: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Khem Raj <raj.khem: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Anuj Mittal <anuj.mittal: attempted=5 succeeded=4(80.00%) failed=1(20.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Ross Burton <ross.burton: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Armin Kuster <akuster808: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Nathan Rossi <nathan: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Yi Zhao <yi.zhao: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Alexander Kanavin <alex.kanavin: attempted=3 succeeded=1(33.33%) failed=2(66.67%)

--===============5305925226659777811==--
