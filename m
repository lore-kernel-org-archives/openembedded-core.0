Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.25799.1623000257921543294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6E59438C1323
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-06-06
Message-ID: <MADEUP.16860E22EBE6B111.27789@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============7473727395687257144=="

--===============7473727395687257144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 12
        ovmf, edk2-stable202105, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
        util-linux-libuuid, 2.37, Chen Qi <Qi.Chen@windriver.com>
        util-linux, 2.37, Chen Qi <Qi.Chen@windriver.com>
        elfutils, 0.185, Zang Ruochen <zangrc.fnst@fujitsu.com>
        gnu-config, 20210522-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        m4, 1.4.19, Robert Yang <liezhi.yang@windriver.com>
        perl, 5.34.0, Alexander Kanavin <alex.kanavin@gmail.com>
        acpica, 20210604, Ross Burton <ross.burton@arm.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        libcap, 2.50, Yi Zhao <yi.zhao@windriver.com>
        p11-kit, 0.24.0, Alexander Kanavin <alex.kanavin@gmail.com>
    * Failed(do_compile): 6
        cmake, 3.20.3, Pascal Bach <pascal.bach@siemens.com>
        go-runtime, 1.16.5, Khem Raj <raj.khem@gmail.com>
        go, 1.16.5, Khem Raj <raj.khem@gmail.com>
        alsa-lib, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-plugins, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-utils, 1.2.5, Unassigned <unassigned@yoctoproject.org>
    * Succeeded: 27
        erofs-utils, 1.3, Richard Weinberger <richard@nod.at>
        mtools, 4.0.29, Anuj Mittal <anuj.mittal@intel.com>
        python3-hypothesis, 6.13.14, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-importlib-metadata, 4.5.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-libarchive-c, 3.1, Joshua Watt <JPEWhacker@gmail.com>
        python3-magic, 0.4.24, Joshua Watt <JPEWhacker@gmail.com>
        python3-pycairo, 1.20.1, Zang Ruochen <zangrc.fnst@fujitsu.com>
        vala, 0.52.4, Alexander Kanavin <alex.kanavin@gmail.com>
        less, 590, Yi Zhao <yi.zhao@windriver.com>
        epiphany, 40.2, Alexander Kanavin <alex.kanavin@gmail.com>
        mesa, 21.1.2, Otavio Salvador <otavio.salvador@ossystems.com.br>
        libinput, 1.18.0, Ross Burton <ross.burton@arm.com>
        xf86-input-libinput, 1.0.1, Armin Kuster <akuster808@gmail.com>
        libxi, 1.7.99.2, Armin Kuster <akuster808@gmail.com>
        xorgproto, 2021.4.99.2, Armin Kuster <akuster808@gmail.com>
        lttng-tools, 2.12.4, Richard Purdie <richard.purdie@linuxfoundation.org>
        alsa-tools, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-topology-conf, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-ucm-conf, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        libogg, 1.3.5, Anuj Mittal <anuj.mittal@intel.com>
        mpg123, 1.28.0, Alexander Kanavin <alex.kanavin@gmail.com>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        at-spi2-core, 2.40.2, Tim Orling <timothy.t.orling@linux.intel.com>
        diffoscope, 177, Joshua Watt <JPEWhacker@gmail.com>
        gnutls, 3.7.2, Armin Kuster <akuster808@gmail.com>
        libgcrypt, 1.9.3, Hongxu Jia <hongxu.jia@windriver.com>
        liburcu, 0.13.0, Wang Mingyu <wangmy@fujitsu.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=46 succeeded=27(58.70%) failed=19(41.30%)

Recipe upgrade statistics per Maintainer:

    Tim Orling <timothy.t.orling: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Chen Qi <Qi.Chen: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Ricardo Neri <ricardo.neri-calderon: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster808: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=5 succeeded=3(60.00%) failed=2(40.00%)
    Yi Zhao <yi.zhao: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Unassigned <unassigned: attempted=6 succeeded=3(50.00%) failed=3(50.00%)
    Hongxu Jia <hongxu.jia: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Zang Ruochen <zangrc.fnst: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Khem Raj <raj.khem: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Anuj Mittal <anuj.mittal: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Joshua Watt <JPEWhacker: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Ross Burton <ross.burton: attempted=4 succeeded=1(25.00%) failed=3(75.00%)
    Richard Purdie <richard.purdie: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Wang Mingyu <wangmy: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Richard Weinberger <richard: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============7473727395687257144==--
