Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.836.1608060225554998352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 25DAD38C0865
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:47 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2020-12-15
Message-ID: <MADEUP.1650FA423D58A17F.29031@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5890316709755736724=="

--===============5890316709755736724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed(do_compile): 26
        dhcpcd, 9.3.4, Armin Kuster <akuster808@gmail.com>
        glib-2.0, 2.66.3, Anuj Mittal <anuj.mittal@intel.com>
        readline, 8.1, Hongxu Jia <hongxu.jia@windriver.com>
        ccache, 4.1, Robert Yang <liezhi.yang@windriver.com>
        libmodulemd, 2.11.0, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-hypothesis, 5.43.3, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-packaging, 20.8, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-pygments, 2.7.3, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-setuptools-scm, 5.0.1, Tim Orling <timothy.t.orling@linux.intel.com>
        python3, 3.9.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        rpm, 4.16.1, Unassigned <unassigned@yoctoproject.org>
        vala, 0.50.2, Alexander Kanavin <alex.kanavin@gmail.com>
        gtk+3, 3.24.24, Ross Burton <ross.burton@arm.com>
        vulkan-loader, 1.2.162.0, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-tools, 1.2.162.0, Anuj Mittal <anuj.mittal@intel.com>
        xprop, 1.2.5, Armin Kuster <akuster808@gmail.com>
        gstreamer1.0-omx, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-base, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-python, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-vaapi, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        sbc, 1.5, Tanu Kaskinen <tanuk@iki.fi>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        webkitgtk, 2.30.3, Alexander Kanavin <alex.kanavin@gmail.com>
        curl, 7.74.0, Armin Kuster <akuster808@gmail.com>
        libcap-ng-python, 0.8.2, Yi Zhao <yi.zhao@windriver.com>
        libpcre2, 10.36, Armin Kuster <akuster808@gmail.com>
    * Succeeded: 21
        kea, 1.8.1, Armin Kuster <akuster808@gmail.com>
        init-system-helpers, 1.60, Anuj Mittal <anuj.mittal@intel.com>
        sysvinit, 2.98, Ross Burton <ross.burton@arm.com>
        go-runtime, 1.15.6, Khem Raj <raj.khem@gmail.com>
        go, 1.15.6, Khem Raj <raj.khem@gmail.com>
        ninja, 1.10.2, Khem Raj <raj.khem@gmail.com>
        libaio, 0.3.112, Alexander Kanavin <alex.kanavin@gmail.com>
        libtirpc, 1.3.1, Anuj Mittal <anuj.mittal@intel.com>
        stress-ng, 0.12.00, Anuj Mittal <anuj.mittal@intel.com>
        epiphany, 3.38.2, Alexander Kanavin <alex.kanavin@gmail.com>
        shaderc, 2020.4, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-headers, 1.2.162.0, Anuj Mittal <anuj.mittal@intel.com>
        libx11, 1.7.0, Armin Kuster <akuster808@gmail.com>
        xserver-xorg, 1.20.10, Armin Kuster <akuster808@gmail.com>
        systemtap, 4.4, Victor Kamensky <kamensky@cisco.com>
        gst-examples, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-good, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        diffoscope, 163, Joshua Watt <JPEWhacker@gmail.com>
        libcap-ng, 0.8.2, Yi Zhao <yi.zhao@windriver.com>
        p11-kit, 0.23.22, Alexander Kanavin <alex.kanavin@gmail.com>
        sqlite3, 3.34.0, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(other errors): 26
        openssl, 1.1.1i, Alexander Kanavin <alex.kanavin@gmail.com>
        ell, 0.35, Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
        util-linux, 2.36.1, Chen Qi <Qi.Chen@windriver.com>
        dnf, 4.5.2, Alexander Kanavin <alex.kanavin@gmail.com>
        libdnf, 0.55.2, Alexander Kanavin <alex.kanavin@gmail.com>
        llvm, 11.0.0, Khem Raj <raj.khem@gmail.com>
        opkg, 0.4.4, Alejandro del Castillo <alejandro.delcastillo@ni.com>
        python3-importlib-metadata, 3.3.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-py, 1.10.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-setuptools, 51.0.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        qemu, 5.2.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        strace, 5.10, Robert Yang <liezhi.yang@windriver.com>
        bash, 5.1, Hongxu Jia <hongxu.jia@windriver.com>
        sudo, 1.9.4, Chen Qi <Qi.Chen@windriver.com>
        gdk-pixbuf, 2.42.2, Ross Burton <ross.burton@arm.com>
        libva, 2.10.0, Anuj Mittal <anuj.mittal@intel.com>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        systemtap-uprobes, 4.4, Victor Kamensky <kamensky@cisco.com>
        gst-devtools, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-libav, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-bad, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-ugly, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-rtsp-server, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0, 1.18.2, Anuj Mittal <anuj.mittal@intel.com>
        boost, 1.75.0, Alexander Kanavin <alex.kanavin@gmail.com>
        enchant2, 2.2.14, Anuj Mittal <anuj.mittal@intel.com>
    * Failed (devtool error): 20
        ovmf, edk2-stable202011, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
        systemd-boot, 247.1, Chen Qi <Qi.Chen@windriver.com>
        systemd, 247.1, Chen Qi <Qi.Chen@windriver.com>
        autoconf, 2.70, Robert Yang <liezhi.yang@windriver.com>
        automake, 1.16.3, Robert Yang <liezhi.yang@windriver.com>
        binutils, 2.35.1, Khem Raj <raj.khem@gmail.com>
        cmake, 3.19.1, Pascal Bach <pascal.bach@siemens.com>
        gnu-config, 20201018-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        mtools, 4.0.26, Anuj Mittal <anuj.mittal@intel.com>
        python3-pytest, 6.2.0, Tim Orling <timothy.t.orling@linux.intel.com>
        libpam, 1.5.1, Anuj Mittal <anuj.mittal@intel.com>
        libva-initial, 2.10.0, Anuj Mittal <anuj.mittal@intel.com>
        mesa, 20.3.0, Otavio Salvador <otavio.salvador@ossystems.com.br>
        spirv-tools, 2020.6, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        gnupg, 2.2.25, Hongxu Jia <hongxu.jia@windriver.com>
        gnutls, 3.7.0, Armin Kuster <akuster808@gmail.com>
        libcap, 2.46, Yi Zhao <yi.zhao@windriver.com>
        libjitterentropy, 3.0.0, Ross Burton <ross.burton@arm.com>
        libksba, 1.5.0, Alexander Kanavin <alex.kanavin@gmail.com>

    TOTAL: attempted=93 succeeded=21(22.58%) failed=72(77.42%)

Recipe upgrade statistics per Maintainer:

    Anuj Mittal <anuj.mittal: attempted=26 succeeded=7(26.92%) failed=19(73.08%)
    Ross Burton <ross.burton: attempted=6 succeeded=1(16.67%) failed=5(83.33%)
    Robert Yang <liezhi.yang: attempted=5 succeeded=0(0.00%) failed=5(100.00%)
    Oleksandr Kravchuk <open.source: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
    Zang Ruochen <zangrc.fnst: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Victor Kamensky <kamensky: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Alexander Kanavin <alex.kanavin: attempted=11 succeeded=3(27.27%) failed=8(72.73%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Tanu Kaskinen <tanuk: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Richard Purdie <richard.purdie: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alejandro del Castillo <alejandro.delcastillo: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Unassigned <unassigned: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Tim Orling <timothy.t.orling: attempted=6 succeeded=0(0.00%) failed=6(100.00%)
    Chen Qi <Qi.Chen: attempted=4 succeeded=0(0.00%) failed=4(100.00%)
    Jose Quaresma <quaresma.jose: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Yi Zhao <yi.zhao: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Hongxu Jia <hongxu.jia: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
    Ricardo Neri <ricardo.neri-calderon: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Khem Raj <raj.khem: attempted=5 succeeded=3(60.00%) failed=2(40.00%)
    Armin Kuster <akuster808: attempted=8 succeeded=3(37.50%) failed=5(62.50%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============5890316709755736724==--
