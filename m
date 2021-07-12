Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5895.1626056248692290525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2AFB138C1181
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:28 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-07-12
Message-ID: <MADEUP.1690E98B1F89AF1B.19620@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5898955476826723334=="

--===============5898955476826723334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Succeeded: 13
        bluez5, 5.60, Anuj Mittal <anuj.mittal@intel.com>
        iproute2, 5.13.0, Changhyeok Bae <changhyeok.bae@gmail.com>
        createrepo-c, 0.17.4, Alexander Kanavin <alex.kanavin@gmail.com>
        mtools, 4.0.32, Anuj Mittal <anuj.mittal@intel.com>
        ruby, 3.0.2, Ross Burton <ross.burton@arm.com>
        ethtool, 5.13, Changhyeok Bae <changhyeok.bae@gmail.com>
        stress-ng, 0.12.12, Anuj Mittal <anuj.mittal@intel.com>
        harfbuzz, 2.8.2, Anuj Mittal <anuj.mittal@intel.com>
        xwayland, 21.1.2, Armin Kuster <akuster808@gmail.com>
        mpg123, 1.28.1, Alexander Kanavin <alex.kanavin@gmail.com>
        webkitgtk, 2.32.2, Alexander Kanavin <alex.kanavin@gmail.com>
        gdbm, 1.20, Alexander Kanavin <alex.kanavin@gmail.com>
        libgit2, 1.1.1, Unassigned <unassigned@yoctoproject.org>
    * Failed (devtool error): 10
        libuv, 1.41.1, Armin Kuster <akuster@mvista.com>
        systemd-boot, 249, Chen Qi <Qi.Chen@windriver.com>
        systemd, 249, Chen Qi <Qi.Chen@windriver.com>
        gnu-config, 20210620-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        libmodulemd, 2.13.0, Alexander Kanavin <alex.kanavin@gmail.com>
        llvm, 12.0.1, Khem Raj <raj.khem@gmail.com>
        python3-setuptools, 57.1.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        xserver-xorg, 1.20.12, Armin Kuster <akuster808@gmail.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>
    * Failed(do_compile): 1
        gtk+3, 3.24.30, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=25 succeeded=13(52.00%) failed=12(48.00%)

Recipe upgrade statistics per Maintainer:

    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=5 succeeded=4(80.00%) failed=1(20.00%)
    Chen Qi <Qi.Chen: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Unassigned <unassigned: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Oleksandr Kravchuk <open.source: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Anuj Mittal <anuj.mittal: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Ross Burton <ross.burton: attempted=4 succeeded=1(25.00%) failed=3(75.00%)
    Armin Kuster <akuster808: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Khem Raj <raj.khem: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Changhyeok Bae <changhyeok.bae: attempted=2 succeeded=2(100.00%) failed=0(0.00%)

--===============5898955476826723334==--
