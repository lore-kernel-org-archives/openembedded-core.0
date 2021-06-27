Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5776.1624805202912141569
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id 19DB238C1329
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-06-27
Message-ID: <MADEUP.168C77B93BCFEADB.19577@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============7596423993435082766=="

--===============7596423993435082766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed(do_compile): 3
        cmake, 3.20.5, Pascal Bach <pascal.bach@siemens.com>
        man-pages, 5.12, Hongxu Jia <hongxu.jia@windriver.com>
        gdbm, 1.20, Alexander Kanavin <alex.kanavin@gmail.com>
    * Failed (devtool error): 6
        python3-iniparse, 0.5, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pip, 21.1.3, Zang Ruochen <zangrc.fnst@fujitsu.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        spirv-tools, 2021.2, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        rt-tests, 2.0, Alexander Kanavin <alex.kanavin@gmail.com>
    * Succeeded: 8
        python3-pbr, 5.6.0, Zang Ruochen <zangrc.fnst@fujitsu.com>
        stress-ng, 0.12.11, Anuj Mittal <anuj.mittal@intel.com>
        glslang, 11.5.0, Jose Quaresma <quaresma.jose@gmail.com>
        libglu, 9.0.2, Ross Burton <ross.burton@arm.com>
        shaderc, 2021.1, Jose Quaresma <quaresma.jose@gmail.com>
        xf86-input-libinput, 1.1.0, Armin Kuster <akuster808@gmail.com>
        hwlatdetect, 2.0, Alexander Kanavin <alex.kanavin@gmail.com>
        gpgme, 1.16.0, Hongxu Jia <hongxu.jia@windriver.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=18 succeeded=8(44.44%) failed=10(55.56%)

Recipe upgrade statistics per Maintainer:

    Jose Quaresma <quaresma.jose: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Khem Raj <raj.khem: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Armin Kuster <akuster808: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Oleksandr Kravchuk <open.source: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Zang Ruochen <zangrc.fnst: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Ross Burton <ross.burton: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Hongxu Jia <hongxu.jia: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Anuj Mittal <anuj.mittal: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============7596423993435082766==--
