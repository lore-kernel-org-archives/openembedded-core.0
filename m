Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.39234.1605551304091618103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id A132B38C13F6
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2020-11-16
Message-ID: <MADEUP.16481067BC731F85.12355@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============7272680655914555495=="

--===============7272680655914555495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed(do_compile): 7
        bind, 9.16.8, Armin Kuster <akuster808@gmail.com>
        ccache, 4.0, Robert Yang <liezhi.yang@windriver.com>
        elfutils, 0.182, Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
        go-runtime, 1.15.5, Khem Raj <raj.khem@gmail.com>
        go, 1.15.5, Khem Raj <raj.khem@gmail.com>
        quota, 4.06, Anuj Mittal <anuj.mittal@intel.com>
        pango, 1.48.0, Ross Burton <ross.burton@arm.com>
    * Succeeded: 25
        kea, 1.8.1, Armin Kuster <akuster808@gmail.com>
        ifupdown, 0.8.36, Anuj Mittal <anuj.mittal@intel.com>
        bison, 3.7.4, Chen Qi <Qi.Chen@windriver.com>
        createrepo-c, 0.16.2, Alexander Kanavin <alex.kanavin@gmail.com>
        dnf, 4.4.2, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-numpy, 1.19.4, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pycryptodome, 3.9.9, Joshua Watt <JPEWhacker@gmail.com>
        python3-pycryptodomex, 3.9.9, Joshua Watt <JPEWhacker@gmail.com>
        acpica, 20201113, Ross Burton <ross.burton@arm.com>
        grep, 3.6, Denys Dmytriyenko <denys@ti.com>
        man-pages, 5.09, Hongxu Jia <hongxu.jia@windriver.com>
        msmtp, 1.8.13, Wang Mingyu <wangmy@cn.fujitsu.com>
        stress-ng, 0.11.24, Anuj Mittal <anuj.mittal@intel.com>
        libhandy, 1.0.2, Alexander Kanavin <alex.kanavin@gmail.com>
        libdrm, 2.4.103, Otavio Salvador <otavio.salvador@ossystems.com.br>
        mesa, 20.2.2, Otavio Salvador <otavio.salvador@ossystems.com.br>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        libinput, 1.16.3, Ross Burton <ross.burton@arm.com>
        xkbcomp, 1.4.4, Armin Kuster <akuster808@gmail.com>
        systemtap-uprobes, 4.4, Victor Kamensky <kamensky@cisco.com>
        systemtap, 4.4, Victor Kamensky <kamensky@cisco.com>
        enchant2, 2.2.13, Anuj Mittal <anuj.mittal@intel.com>
        gmp, 6.2.1, Khem Raj <raj.khem@gmail.com>
        gpgme, 1.15.0, Hongxu Jia <hongxu.jia@windriver.com>
        lz4, 1.9.3, Denys Dmytriyenko <denys@ti.com>
    * Failed (devtool error): 10
        netbase, 6.2, Armin Kuster <akuster808@gmail.com>
        binutils, 2.35.1, Khem Raj <raj.khem@gmail.com>
        gnu-config, 20201018-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        libdnf, 0.55.0, Alexander Kanavin <alex.kanavin@gmail.com>
        llvm, 11.0.0, Khem Raj <raj.khem@gmail.com>
        meson, 0.56.0, Alexander Kanavin <alex.kanavin@gmail.com>
        gdk-pixbuf, 2.42.0, Ross Burton <ross.burton@arm.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        libcap, 2.45, Yi Zhao <yi.zhao@windriver.com>
        libunwind, 1.5.0, Bruce Ashfield <bruce.ashfield@gmail.com>

    TOTAL: attempted=42 succeeded=25(59.52%) failed=17(40.48%)

Recipe upgrade statistics per Maintainer:

    Joshua Watt <JPEWhacker: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Ross Burton <ross.burton: attempted=6 succeeded=3(50.00%) failed=3(50.00%)
    Hongxu Jia <hongxu.jia: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Khem Raj <raj.khem: attempted=5 succeeded=1(20.00%) failed=4(80.00%)
    Otavio Salvador <otavio.salvador: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Bruce Ashfield <bruce.ashfield: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Denys Dmytriyenko <denys: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Chen Qi <Qi.Chen: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Anuj Mittal <anuj.mittal: attempted=4 succeeded=3(75.00%) failed=1(25.00%)
    Zang Ruochen <zangrc.fnst: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Wang Mingyu <wangmy: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Armin Kuster <akuster808: attempted=4 succeeded=2(50.00%) failed=2(50.00%)
    Victor Kamensky <kamensky: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Yi Zhao <yi.zhao: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=5 succeeded=3(60.00%) failed=2(40.00%)
    Oleksandr Kravchuk <open.source: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=2 succeeded=0(0.00%) failed=2(100.00%)

--===============7272680655914555495==--
