Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.6804.1622200976148753698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id E2EF738C13D1
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-05-28
Message-ID: <MADEUP.16833731A817E903.665@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============1619057987452195340=="

--===============1619057987452195340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Succeeded: 19
        iproute2, 5.12.0, Changhyeok Bae <changhyeok.bae@gmail.com>
        libxcrypt-compat, 4.4.22, Khem Raj <raj.khem@gmail.com>
        libmodulemd, 2.12.1, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-hypothesis, 6.13.7, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-importlib-metadata, 4.3.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-jinja2, 3.0.1, Richard Purdie <richard.purdie@linuxfoundation.org>
        gi-docgen, 2021.6, Alexander Kanavin <alex.kanavin@gmail.com>
        libepoxy, 1.5.8, Anuj Mittal <anuj.mittal@intel.com>
        pango, 1.48.5, Ross Burton <ross.burton@arm.com>
        libinput, 1.17.3, Ross Burton <ross.burton@arm.com>
        xf86-input-libinput, 1.0.1, Armin Kuster <akuster808@gmail.com>
        libx11, 1.7.1, Armin Kuster <akuster808@gmail.com>
        xorgproto, 2021.4.99.1, Armin Kuster <akuster808@gmail.com>
        kmod, 29, Chen Qi <Qi.Chen@windriver.com>
        linux-firmware, 20210511, Otavio Salvador <otavio.salvador@ossystems.com.br>
        lttng-tools, 2.12.4, Richard Purdie <richard.purdie@linuxfoundation.org>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        libpcre2, 10.37, Armin Kuster <akuster808@gmail.com>
        vte, 0.64.1, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(do_compile): 5
        libxcrypt, 4.4.22, Khem Raj <raj.khem@gmail.com>
        cmake, 3.20.3, Pascal Bach <pascal.bach@siemens.com>
        python3-setuptools, 57.0.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        curl, 7.77.0, Armin Kuster <akuster808@gmail.com>
        libgcrypt, 1.9.3, Hongxu Jia <hongxu.jia@windriver.com>
    * Failed (devtool error): 6
        elfutils, 0.185, Zang Ruochen <zangrc.fnst@fujitsu.com>
        gnu-config, 20210522-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        perl, 5.34.0, Alexander Kanavin <alex.kanavin@gmail.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        libcap, 2.50, Yi Zhao <yi.zhao@windriver.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=31 succeeded=19(61.29%) failed=12(38.71%)

Recipe upgrade statistics per Maintainer:

    Khem Raj <raj.khem: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Anuj Mittal <anuj.mittal: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Oleksandr Kravchuk <open.source: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Changhyeok Bae <changhyeok.bae: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Ross Burton <ross.burton: attempted=4 succeeded=2(50.00%) failed=2(50.00%)
    Chen Qi <Qi.Chen: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Hongxu Jia <hongxu.jia: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster808: attempted=5 succeeded=4(80.00%) failed=1(20.00%)
    Tim Orling <timothy.t.orling: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Zang Ruochen <zangrc.fnst: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Yi Zhao <yi.zhao: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Richard Purdie <richard.purdie: attempted=2 succeeded=2(100.00%) failed=0(0.00%)

--===============1619057987452195340==--
