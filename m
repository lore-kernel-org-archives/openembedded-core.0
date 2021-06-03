Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.2153.1622683488762099419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0722438C08EA
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:50 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-06-03
Message-ID: <MADEUP.1684EE0979663E70.11265@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5144141368612479534=="

--===============5144141368612479534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 10
        ovmf, edk2-stable202105, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
        util-linux-libuuid, 2.37, Chen Qi <Qi.Chen@windriver.com>
        util-linux, 2.37, Chen Qi <Qi.Chen@windriver.com>
        elfutils, 0.185, Zang Ruochen <zangrc.fnst@fujitsu.com>
        gnu-config, 20210522-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        m4, 1.4.19, Robert Yang <liezhi.yang@windriver.com>
        perl, 5.34.0, Alexander Kanavin <alex.kanavin@gmail.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        libcap, 2.50, Yi Zhao <yi.zhao@windriver.com>
    * Failed(do_compile): 4
        cmake, 3.20.3, Pascal Bach <pascal.bach@siemens.com>
        alsa-lib, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-plugins, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-utils, 1.2.5, Unassigned <unassigned@yoctoproject.org>
    * Succeeded: 19
        erofs-utils, 20191016, Richard Weinberger <richard@nod.at>
        mtools, 4.0.29, Anuj Mittal <anuj.mittal@intel.com>
        python3-hypothesis, 6.13.11, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-importlib-metadata, 4.4.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-libarchive-c, 3.1, Joshua Watt <JPEWhacker@gmail.com>
        python3-magic, 0.4.23, Joshua Watt <JPEWhacker@gmail.com>
        less, 589, Yi Zhao <yi.zhao@windriver.com>
        libinput, 1.18.0, Ross Burton <ross.burton@arm.com>
        xf86-input-libinput, 1.0.1, Armin Kuster <akuster808@gmail.com>
        libxi, 1.7.99.2, Armin Kuster <akuster808@gmail.com>
        xorgproto, 2021.4.99.2, Armin Kuster <akuster808@gmail.com>
        lttng-tools, 2.12.4, Richard Purdie <richard.purdie@linuxfoundation.org>
        alsa-tools, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-topology-conf, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        alsa-ucm-conf, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        diffoscope, 176, Joshua Watt <JPEWhacker@gmail.com>
        gnutls, 3.7.2, Armin Kuster <akuster808@gmail.com>
        libgcrypt, 1.9.3, Hongxu Jia <hongxu.jia@windriver.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=34 succeeded=19(55.88%) failed=15(44.12%)

Recipe upgrade statistics per Maintainer:

    Unassigned <unassigned: attempted=6 succeeded=3(50.00%) failed=3(50.00%)
    Alexander Kanavin <alex.kanavin: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Robert Yang <liezhi.yang: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Tim Orling <timothy.t.orling: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Joshua Watt <JPEWhacker: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Hongxu Jia <hongxu.jia: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Ricardo Neri <ricardo.neri-calderon: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Chen Qi <Qi.Chen: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Anuj Mittal <anuj.mittal: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Zang Ruochen <zangrc.fnst: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Richard Weinberger <richard: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Khem Raj <raj.khem: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Ross Burton <ross.burton: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Armin Kuster <akuster808: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Yi Zhao <yi.zhao: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Richard Purdie <richard.purdie: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============5144141368612479534==--
