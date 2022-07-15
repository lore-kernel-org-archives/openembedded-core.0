Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B31DCCA480
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.935.1657900667451541210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WV+U5CRp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101018202949940-3cf64b61-c847-40e3-bac5-e7b65f425b9b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900669;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=T8bGU6kEGUUnyx+LJ44Knmwtb5OuX3samg9EpP9UryA=;
	b=WV+U5CRpTeYHn1Wlf++v3AdA3kb/c7oCF24PoGpMo7M7WloIuiyq624zCHwpLBfN
	CK1xAlEP8XQB1suZOGiAEe+uuQs0BIdJu0xnY0ajKNBYzVYAXRKRXFq614ZflgjBLew
	ZCpDeICgSEnK5Ug+sSTck107oSBWNOR5P5JabGZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900669;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=T8bGU6kEGUUnyx+LJ44Knmwtb5OuX3samg9EpP9UryA=;
	b=XeeNDToudFqR4vCytiG+lEI4IPEDHruTRLxeG91yB7yUDPe1iAXo5h8WUwh6HlmX
	BpUeByB9UQhRD5opdv3qziVr1ob+ljEzbObWbIAXTylKGgmUUEUxKvxMi3Izlocvn1E
	RPC9eJnalo1sarmb7CwJFEMmtkr0cPrUiLSTFSC4=
Content-Type: multipart/mixed; boundary="===============3371228097924230397=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2022-07-15
Message-ID: 
 <0101018202949940-3cf64b61-c847-40e3-bac5-e7b65f425b9b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168118

--===============3371228097924230397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 16
        efibootmgr, 18, Ross Burton <ross.burton@arm.com>
        systemd, 251.3, Chen Qi <Qi.Chen@windriver.com>
        rpm, 4.17.1, Unassigned <unassigned@yoctoproject.org>
        gcr, 3.90.0, Alexander Kanavin <alex.kanavin@gmail.com>
        libva-initial, 2.15.0, Anuj Mittal <anuj.mittal@intel.com>
        libva-utils, 2.15.0, Anuj Mittal <anuj.mittal@intel.com>
        xev, 1.2.5, Unassigned <unassigned@yoctoproject.org>
        xmodmap, 1.0.11, Unassigned <unassigned@yoctoproject.org>
        xf86-input-keyboard, 2.0.0, Unassigned <unassigned@yoctoproject.org>
        xf86-input-synaptics, 1.9.2, Unassigned <unassigned@yoctoproject.org>
        xf86-video-cirrus, 1.6.0, Unassigned <unassigned@yoctoproject.org>
        encodings, 1.0.6, Unassigned <unassigned@yoctoproject.org>
        font-util, 1.3.3, Unassigned <unassigned@yoctoproject.org>
        linux-firmware, 20220708, Otavio Salvador <otavio.salvador@ossystems.com.br>
        rt-tests, 2.4, Alexander Kanavin <alex.kanavin@gmail.com>
        libgit2, 1.5.0, Unassigned <unassigned@yoctoproject.org>
    * Failed(do_compile): 5
        u-boot-tools, 2022.07, Marek Vasut <marek.vasut@gmail.com>
        u-boot, 2022.07, Marek Vasut <marek.vasut@gmail.com>
        go-runtime, 1.18.4, Khem Raj <raj.khem@gmail.com>
        go, 1.18.4, Khem Raj <raj.khem@gmail.com>
        llvm, 14.0.6, Khem Raj <raj.khem@gmail.com>
    * Succeeded: 35
        libuv, 1.44.2, Armin Kuster <akuster@mvista.com>
        systemd-boot, 251.3, Chen Qi <Qi.Chen@windriver.com>
        git, 2.37.1, Robert Yang <liezhi.yang@windriver.com>
        log4cplus, 2.0.8, Unassigned <unassigned@yoctoproject.org>
        meson, 0.63.0, Alexander Kanavin <alex.kanavin@gmail.com>
        mmc-utils, 0.1-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        python3-docutils, 0.19, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-dtschema, 2022.7, Bruce Ashfield <bruce.ashfield@gmail.com>
        python3-hypothesis, 6.50.1, Tim Orling <tim.orling@konsulko.com>
        python3-jsonschema, 4.7.2, Bruce Ashfield <bruce.ashfield@gmail.com>
        python3-setuptools-rust, 1.4.1, Tim Orling <tim.orling@konsulko.com>
        python3-setuptools-scm, 7.0.5, Tim Orling <tim.orling@konsulko.com>
        python3-setuptools, 63.2.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-zipp, 3.8.1, Tim Orling <tim.orling@konsulko.com>
        vala, 0.56.2, Alexander Kanavin <alex.kanavin@gmail.com>
        hdparm, 9.64, Denys Dmytriyenko <denis@denix.org>
        libidn2, 2.3.3, Ross Burton <ross.burton@arm.com>
        epiphany, 42.3, Alexander Kanavin <alex.kanavin@gmail.com>
        libhandy, 1.6.3, Alexander Kanavin <alex.kanavin@gmail.com>
        libnotify, 0.8.0, Anuj Mittal <anuj.mittal@intel.com>
        libdrm, 2.4.112, Otavio Salvador <otavio.salvador@ossystems.com.br>
        libva, 2.15.0, Anuj Mittal <anuj.mittal@intel.com>
        pango, 1.50.8, Ross Burton <ross.burton@arm.com>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        wayland-protocols, 1.26, Denys Dmytriyenko <denis@denix.org>
        xserver-xorg, 21.1.4, Unassigned <unassigned@yoctoproject.org>
        xwayland, 22.1.3, Unassigned <unassigned@yoctoproject.org>
        alsa-lib, 1.2.7.2, Michael Opdenacker <michael.opdenacker@bootlin.com>
        alsa-ucm-conf, 1.2.7.2, Michael Opdenacker <michael.opdenacker@bootlin.com>
        mpg123, 1.30.1, Alexander Kanavin <alex.kanavin@gmail.com>
        hwlatdetect, 2.4, Alexander Kanavin <alex.kanavin@gmail.com>
        webkitgtk, 2.36.4, Alexander Kanavin <alex.kanavin@gmail.com>
        diffoscope, 218, Joshua Watt <JPEWhacker@gmail.com>
        libnl, 3.7.0, Alexander Kanavin <alex.kanavin@gmail.com>
        sqlite3, 3.39.1, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(other errors): 1
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=57 succeeded=35(61.40%) failed=22(38.60%)

Recipe upgrade statistics per Maintainer:

    Marek Vasut <marek.vasut: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Anuj Mittal <anuj.mittal: attempted=6 succeeded=4(66.67%) failed=2(33.33%)
    Denys Dmytriyenko <denis: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Tim Orling <tim.orling: attempted=4 succeeded=4(100.00%) failed=0(0.00%)
    Armin Kuster <akuster: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Chen Qi <Qi.Chen: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Khem Raj <raj.khem: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
    Bruce Ashfield <bruce.ashfield: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Otavio Salvador <otavio.salvador: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Alexander Kanavin <alex.kanavin: attempted=10 succeeded=8(80.00%) failed=2(20.00%)
    Ross Burton <ross.burton: attempted=5 succeeded=3(60.00%) failed=2(40.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Unassigned <unassigned: attempted=12 succeeded=3(25.00%) failed=9(75.00%)
    Oleksandr Kravchuk <open.source: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Michael Opdenacker <michael.opdenacker: attempted=2 succeeded=2(100.00%) failed=0(0.00%)

--===============3371228097924230397==--

