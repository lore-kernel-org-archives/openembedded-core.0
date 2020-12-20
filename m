Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.23992.1608473714053594195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id E258838C12E1
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2020-12-20
Message-ID: <MADEUP.16527253146401C3.28097@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============9091391883599996579=="

--===============9091391883599996579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Succeeded: 42
        bind, 9.16.10, Armin Kuster <akuster808@gmail.com>
        kea, 1.8.2, Armin Kuster <akuster808@gmail.com>
        init-system-helpers, 1.60, Anuj Mittal <anuj.mittal@intel.com>
        kbd, 2.4.0, Alexander Kanavin <alex.kanavin@gmail.com>
        sysvinit, 2.98, Ross Burton <ross.burton@arm.com>
        util-linux, 2.36.1, Chen Qi <Qi.Chen@windriver.com>
        dnf, 4.5.2, Alexander Kanavin <alex.kanavin@gmail.com>
        libmodulemd, 2.11.1, Alexander Kanavin <alex.kanavin@gmail.com>
        ninja, 1.10.2, Khem Raj <raj.khem@gmail.com>
        opkg, 0.4.4, Alejandro del Castillo <alejandro.delcastillo@ni.com>
        python3-hypothesis, 5.43.3, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-py, 1.10.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-setuptools-scm, 5.0.1, Tim Orling <timothy.t.orling@linux.intel.com>
        rpm, 4.16.1.2, Unassigned <unassigned@yoctoproject.org>
        vala, 0.50.2, Alexander Kanavin <alex.kanavin@gmail.com>
        acpica, 20201217, Ross Burton <ross.burton@arm.com>
        ethtool, 5.10, Changhyeok Bae <changhyeok.bae@gmail.com>
        libtirpc, 1.3.1, Anuj Mittal <anuj.mittal@intel.com>
        lighttpd, 1.4.57, Alexander Kanavin <alex.kanavin@gmail.com>
        stress-ng, 0.12.00, Anuj Mittal <anuj.mittal@intel.com>
        sudo, 1.9.4p1, Chen Qi <Qi.Chen@windriver.com>
        epiphany, 3.38.2, Alexander Kanavin <alex.kanavin@gmail.com>
        gtk+3, 3.24.24, Ross Burton <ross.burton@arm.com>
        libva, 2.10.0, Anuj Mittal <anuj.mittal@intel.com>
        shaderc, 2020.4, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-headers, 1.2.162.0, Anuj Mittal <anuj.mittal@intel.com>
        xprop, 1.2.5, Armin Kuster <akuster808@gmail.com>
        libx11, 1.7.0, Armin Kuster <akuster808@gmail.com>
        xserver-xorg, 1.20.10, Armin Kuster <akuster808@gmail.com>
        linux-firmware, 20201218, Otavio Salvador <otavio.salvador@ossystems.com.br>
        systemtap-uprobes, 4.4, Victor Kamensky <kamensky@cisco.com>
        systemtap, 4.4, Victor Kamensky <kamensky@cisco.com>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        webkitgtk, 2.30.4, Alexander Kanavin <alex.kanavin@gmail.com>
        curl, 7.74.0, Armin Kuster <akuster808@gmail.com>
        diffoscope, 163, Joshua Watt <JPEWhacker@gmail.com>
        enchant2, 2.2.14, Anuj Mittal <anuj.mittal@intel.com>
        libcap-ng, 0.8.2, Yi Zhao <yi.zhao@windriver.com>
        libpcre2, 10.36, Armin Kuster <akuster808@gmail.com>
        libusb1, 1.0.24, Anuj Mittal <anuj.mittal@intel.com>
        p11-kit, 0.23.22, Alexander Kanavin <alex.kanavin@gmail.com>
        sqlite3, 3.34.0, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(do_compile): 11
        ell, 0.35, Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
        glib-2.0, 2.66.4, Anuj Mittal <anuj.mittal@intel.com>
        ccache, 4.1, Robert Yang <liezhi.yang@windriver.com>
        python3-importlib-metadata, 3.3.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3, 3.9.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        systemd-bootchart, 234, Chen Qi <Qi.Chen@windriver.com>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        vulkan-loader, 1.2.162.0, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-tools, 1.2.162.0, Anuj Mittal <anuj.mittal@intel.com>
        sbc, 1.5, Unassigned <unassigned@yoctoproject.org>
        libcap-ng-python, 0.8.2, Yi Zhao <yi.zhao@windriver.com>
    * Failed (devtool error): 30
        ovmf, edk2-stable202011, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
        systemd-boot, 247.2, Chen Qi <Qi.Chen@windriver.com>
        systemd, 247.2, Chen Qi <Qi.Chen@windriver.com>
        autoconf, 2.70, Robert Yang <liezhi.yang@windriver.com>
        automake, 1.16.3, Robert Yang <liezhi.yang@windriver.com>
        binutils, 2.35.1, Khem Raj <raj.khem@gmail.com>
        cmake, 3.19.2, Pascal Bach <pascal.bach@siemens.com>
        gnu-config, 20201018-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        libdnf, 0.55.2, Alexander Kanavin <alex.kanavin@gmail.com>
        llvm, 11.0.0, Khem Raj <raj.khem@gmail.com>
        mtools, 4.0.26, Anuj Mittal <anuj.mittal@intel.com>
        python3-pytest, 6.2.1, Tim Orling <timothy.t.orling@linux.intel.com>
        qemu, 5.2.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        strace, 5.10, Robert Yang <liezhi.yang@windriver.com>
        bash, 5.1, Hongxu Jia <hongxu.jia@windriver.com>
        libpam, 1.5.1, Anuj Mittal <anuj.mittal@intel.com>
        gdk-pixbuf, 2.42.2, Ross Burton <ross.burton@arm.com>
        libva-initial, 2.10.0, Anuj Mittal <anuj.mittal@intel.com>
        libva-utils, 2.10.0, Anuj Mittal <anuj.mittal@intel.com>
        mesa, 20.3.1, Otavio Salvador <otavio.salvador@ossystems.com.br>
        spirv-tools, 2020.6, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        kexec-tools, 2.0.21, Armin Kuster <akuster808@gmail.com>
        boost, 1.75.0, Alexander Kanavin <alex.kanavin@gmail.com>
        gnupg, 2.2.25, Hongxu Jia <hongxu.jia@windriver.com>
        gnutls, 3.7.0, Armin Kuster <akuster808@gmail.com>
        icu, 68.2, Alexander Kanavin <alex.kanavin@gmail.com>
        libcap, 2.46, Yi Zhao <yi.zhao@windriver.com>
        libjitterentropy, 3.0.0, Ross Burton <ross.burton@arm.com>
        libksba, 1.5.0, Alexander Kanavin <alex.kanavin@gmail.com>

    TOTAL: attempted=83 succeeded=42(50.60%) failed=41(49.40%)

Recipe upgrade statistics per Maintainer:

    Jose Quaresma <quaresma.jose: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Ross Burton <ross.burton: attempted=7 succeeded=3(42.86%) failed=4(57.14%)
    Alejandro del Castillo <alejandro.delcastillo: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Armin Kuster <akuster808: attempted=9 succeeded=7(77.78%) failed=2(22.22%)
    Victor Kamensky <kamensky: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Changhyeok Bae <changhyeok.bae: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Anuj Mittal <anuj.mittal: attempted=16 succeeded=9(56.25%) failed=7(43.75%)
    Richard Purdie <richard.purdie: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Otavio Salvador <otavio.salvador: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Oleksandr Kravchuk <open.source: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Tim Orling <timothy.t.orling: attempted=5 succeeded=3(60.00%) failed=2(40.00%)
    Alexander Kanavin <alex.kanavin: attempted=12 succeeded=8(66.67%) failed=4(33.33%)
    Yi Zhao <yi.zhao: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Unassigned <unassigned: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Ricardo Neri <ricardo.neri-calderon: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Hongxu Jia <hongxu.jia: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Zang Ruochen <zangrc.fnst: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=5 succeeded=0(0.00%) failed=5(100.00%)
    Chen Qi <Qi.Chen: attempted=5 succeeded=2(40.00%) failed=3(60.00%)
    Khem Raj <raj.khem: attempted=3 succeeded=1(33.33%) failed=2(66.67%)

--===============9091391883599996579==--
