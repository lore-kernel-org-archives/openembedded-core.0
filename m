Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DA5C3A5A1
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.2320.1651434541544190390
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=7x0efvHS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180812b5d54-b2ff7df6-30b2-49cc-805a-7614f060486b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=p3kerFPvOlWLPQ2Smo2+3PhHnlxjyKaNndeiySbpkik=;
	b=7x0efvHSeJr+KKuar9cIr5ByQh3IPQEqQ5wK3xwchEH1AmHGMc9vpsOAJHMD/FDh
	DpNJwP+DY7LnL3pKIv/Erj7T6ystSdeKo40AXnY/AM6yXEEPspxYu1ZuRCGpoG4I59I
	HMNHlQ8RvcnxLTn2G7VuNJKDLG4V4UsEXsJc5Fek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=p3kerFPvOlWLPQ2Smo2+3PhHnlxjyKaNndeiySbpkik=;
	b=CzZYB4Jlk4uh0WWyliNe7DOXH0SIFY0JrrjW4ViYplvlkJw6XY2KPXfmLC/KN3Mn
	TANR4rqXxEREspSly2hzrze5Kq2eM281+1H59ePG+vpNKmuUHVJRzoARWmVg0sdn/du
	LT7Vvg0gq8Tc8bWE0fNjuu8OOdSHVqX+ZxG2tb7A=
Content-Type: multipart/mixed; boundary="===============4929727933174357115=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2022-05-01
Message-ID: 
 <01010180812b5d54-b2ff7df6-30b2-49cc-805a-7614f060486b-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165143

--===============4929727933174357115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 18
        pciutils, 3.8.0, Chen Qi <Qi.Chen@windriver.com>
        coreutils, 9.1, Chen Qi <Qi.Chen@windriver.com>
        sysvinit, 3.04, Ross Burton <ross.burton@arm.com>
        elfutils, 0.187, Zang Ruochen <zangrc.fnst@fujitsu.com>
        git, 2.36.0, Robert Yang <liezhi.yang@windriver.com>
        libdnf, 0.67.0, Alexander Kanavin <alex.kanavin@gmail.com>
        llvm, 14.0.3, Khem Raj <raj.khem@gmail.com>
        python3-setuptools, 62.1.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        qemu, 7.0.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        rsync, 3.2.4, Yi Zhao <yi.zhao@windriver.com>
        lsof, 4.95.0, Ross Burton <ross.burton@arm.com>
        procps, 4.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
        libhandy, 1.6.2, Alexander Kanavin <alex.kanavin@gmail.com>
        librsvg, 2.54.1, Anuj Mittal <anuj.mittal@intel.com>
        spirv-tools, 1.3.211.0, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-loader, 1.3.211.0, Anuj Mittal <anuj.mittal@intel.com>
        xauth, 1.1.2, Unassigned <unassigned@yoctoproject.org>
        gnupg, 2.3.6, Hongxu Jia <hongxu.jia@windriver.com>
    * Failed(do_compile): 8
        u-boot-tools, 2022.04, Marek Vasut <marek.vasut@gmail.com>
        u-boot, 2022.04, Marek Vasut <marek.vasut@gmail.com>
        systemd, 250.5, Chen Qi <Qi.Chen@windriver.com>
        util-linux-libuuid, 2.38, Chen Qi <Qi.Chen@windriver.com>
        util-linux, 2.38, Chen Qi <Qi.Chen@windriver.com>
        python3-cryptography, 37.0.1, Tim Orling <tim.orling@konsulko.com>
        vulkan-tools, 1.3.211.0, Anuj Mittal <anuj.mittal@intel.com>
        libnl, 3.6.0, Alexander Kanavin <alex.kanavin@gmail.com>
    * Succeeded: 45
        bind, 9.18.2, Armin Kuster <akuster808@gmail.com>
        neard, 0.18, Anuj Mittal <anuj.mittal@intel.com>
        ell, 0.50, Zang Ruochen <zangrc.fnst@fujitsu.com>
        systemd-boot, 250.5, Chen Qi <Qi.Chen@windriver.com>
        dnf, 4.12.0, Alexander Kanavin <alex.kanavin@gmail.com>
        mmc-utils, 0.1-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        python3-babel, 2.10.1, Tim Orling <tim.orling@konsulko.com>
        python3-cryptography-vectors, 37.0.1, Tim Orling <tim.orling@konsulko.com>
        python3-dtschema, 2022.4, Bruce Ashfield <bruce.ashfield@gmail.com>
        python3-hypothesis, 6.46.0, Tim Orling <tim.orling@konsulko.com>
        python3-jinja2, 3.1.2, Richard Purdie <richard.purdie@linuxfoundation.org>
        python3-mako, 1.2.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pygments, 2.12.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pygobject, 3.42.1, Zang Ruochen <zangrc.fnst@fujitsu.com>
        python3-pytest, 7.1.2, Tim Orling <tim.orling@konsulko.com>
        repo, 2.24.1, Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
        vala, 0.56.1, Alexander Kanavin <alex.kanavin@gmail.com>
        cronie, 1.6.1, Anuj Mittal <anuj.mittal@intel.com>
        libmnl, 1.0.5, Khem Raj <raj.khem@gmail.com>
        libpipeline, 1.5.6, Wang Mingyu <wangmy@fujitsu.com>
        parted, 3.5, Hongxu Jia <hongxu.jia@windriver.com>
        epiphany, 42.2, Alexander Kanavin <alex.kanavin@gmail.com>
        adwaita-icon-theme, 42.0, Ross Burton <ross.burton@arm.com>
        libnotify, 0.7.11, Anuj Mittal <anuj.mittal@intel.com>
        glslang, 1.3.211.0, Jose Quaresma <quaresma.jose@gmail.com>
        harfbuzz, 4.2.1, Anuj Mittal <anuj.mittal@intel.com>
        libsdl2, 2.0.22, Yi Zhao <yi.zhao@windriver.com>
        mesa, 22.0.2, Otavio Salvador <otavio.salvador@ossystems.com.br>
        pango, 1.50.7, Ross Burton <ross.burton@arm.com>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        spirv-headers, 1.3.211.0, Jose Quaresma <quaresma.jose@gmail.com>
        vulkan-headers, 1.3.211.0, Anuj Mittal <anuj.mittal@intel.com>
        libinput, 1.19.4, Ross Burton <ross.burton@arm.com>
        libx11, 1.8, Unassigned <unassigned@yoctoproject.org>
        xorgproto, 2022.1, Unassigned <unassigned@yoctoproject.org>
        xwayland, 22.1.1, Unassigned <unassigned@yoctoproject.org>
        lttng-tools, 2.13.7, Richard Purdie <richard.purdie@linuxfoundation.org>
        ffmpeg, 5.0.1, Alexander Kanavin <alex.kanavin@gmail.com>
        webkitgtk, 2.36.1, Alexander Kanavin <alex.kanavin@gmail.com>
        at-spi2-core, 2.44.1, Tim Orling <tim.orling@konsulko.com>
        diffoscope, 211, Joshua Watt <JPEWhacker@gmail.com>
        fribidi, 1.0.12, Ross Burton <ross.burton@arm.com>
        libseccomp, 2.5.4, Unassigned <unassigned@yoctoproject.org>
        sqlite3, 3.38.3, Anuj Mittal <anuj.mittal@intel.com>
        vte, 0.68.0, Anuj Mittal <anuj.mittal@intel.com>

    TOTAL: attempted=71 succeeded=45(63.38%) failed=26(36.62%)

Recipe upgrade statistics per Maintainer:

    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Khem Raj <raj.khem: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Jasper Orschulko <Jasper.Orschulko: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Marek Vasut <marek.vasut: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Anuj Mittal <anuj.mittal: attempted=11 succeeded=8(72.73%) failed=3(27.27%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Bruce Ashfield <bruce.ashfield: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Hongxu Jia <hongxu.jia: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Unassigned <unassigned: attempted=5 succeeded=4(80.00%) failed=1(20.00%)
    Yi Zhao <yi.zhao: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Richard Purdie <richard.purdie: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Wang Mingyu <wangmy: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Chen Qi <Qi.Chen: attempted=6 succeeded=1(16.67%) failed=5(83.33%)
    Ross Burton <ross.burton: attempted=7 succeeded=5(71.43%) failed=2(28.57%)
    Alexander Kanavin <alex.kanavin: attempted=9 succeeded=5(55.56%) failed=4(44.44%)
    Oleksandr Kravchuk <open.source: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Jose Quaresma <quaresma.jose: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Zang Ruochen <zangrc.fnst: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Tim Orling <tim.orling: attempted=6 succeeded=5(83.33%) failed=1(16.67%)
    Armin Kuster <akuster808: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============4929727933174357115==--

