Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58246CCA47D
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.618.1654100323104782820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lnV0EXDt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181200feffe-872295b9-a18d-42fa-85b8-35c8459a957d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=r0qmPlROIeunNBG3latOFSqAcGxcYqlq7KprWLq72SI=;
	b=lnV0EXDtHHJpyVfhLJ7Y+NiyKn0xrsG/21riTZxJ+2fXHdS/qT6NfVKNPHdvDXqT
	wKunvX+1c8d4OZ4LfzICPAc1A0dY4vnRWOT/hX8ARqU6/cQ62QkfxHZWClOp3wFFCrC
	hEnB/W7JXnsIgvoUgcm5aduRPTi+3TuycXGwrAVc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=r0qmPlROIeunNBG3latOFSqAcGxcYqlq7KprWLq72SI=;
	b=a/z9CFcp2Ab+xzN/yUoVxzhNqmiL+we+un5IGIWKQDvSi8MM6/zjyRDUy2GGvk76
	p67pjon0Y+rxqos9sIU1jlh4rRofmvr814tlLQWi2qNg2jC+rWzigtLSi1RkWu/Kaa+
	HdcKoQVzTdO1WCmWvhso3zRexUb9Zq33PuUnsLco=
Content-Type: multipart/mixed; boundary="===============8225006079716085791=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2022-06-01
Message-ID: 
 <01010181200feffe-872295b9-a18d-42fa-85b8-35c8459a957d-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166423

--===============8225006079716085791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Succeeded: 20
        glib-2.0, 2.72.2, Anuj Mittal <anuj.mittal@intel.com>
        dnf, 4.13.0, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-dtschema, 2022.5, Bruce Ashfield <bruce.ashfield@gmail.com>
        python3-numpy, 1.22.4, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pip, 22.1.2, Zang Ruochen <zangrc.fnst@fujitsu.com>
        python3-sphinx, 5.0.0, Tim Orling <tim.orling@konsulko.com>
        sysklogd, 2.4.0, Chen Qi <Qi.Chen@windriver.com>
        sysstat, 12.6.0, Chen Qi <Qi.Chen@windriver.com>
        adwaita-icon-theme, 42.0, Ross Burton <ross.burton@arm.com>
        gtk+3, 3.24.34, Ross Burton <ross.burton@arm.com>
        harfbuzz, 4.3.0, Anuj Mittal <anuj.mittal@intel.com>
        mesa, 22.1.0, Otavio Salvador <otavio.salvador@ossystems.com.br>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        libxkbcommon, 1.4.1, Unassigned <unassigned@yoctoproject.org>
        xwayland, 22.1.2, Unassigned <unassigned@yoctoproject.org>
        alsa-lib, 1.2.7, Michael Opdenacker <michael.opdenacker@bootlin.com>
        alsa-ucm-conf, 1.2.7, Michael Opdenacker <michael.opdenacker@bootlin.com>
        webkitgtk, 2.36.3, Alexander Kanavin <alex.kanavin@gmail.com>
        diffoscope, 214, Joshua Watt <JPEWhacker@gmail.com>
        gnutls, 3.7.6, Unassigned <unassigned@yoctoproject.org>
    * Failed(do_compile): 5
        ovmf, edk2-stable202205, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
        cmake, 3.23.2, Pascal Bach <pascal.bach@siemens.com>
        perl, 5.36.0, Alexander Kanavin <alex.kanavin@gmail.com>
        ltp, 20220527, Yi Zhao <yi.zhao@windriver.com>
        alsa-utils, 1.2.7, Michael Opdenacker <michael.opdenacker@bootlin.com>
    * Failed (devtool error): 13
        seatd, 0.7.0, Alexander Kanavin <alex.kanavin@gmail.com>
        systemd-boot, 251.1, Chen Qi <Qi.Chen@windriver.com>
        systemd, 251.1, Chen Qi <Qi.Chen@windriver.com>
        btrfs-tools, 5.18, Wang Mingyu <wangmy@fujitsu.com>
        gnu-config, 20220516-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        llvm, 14.0.4, Khem Raj <raj.khem@gmail.com>
        python3-psutil, 5.9.1, Tim Orling <tim.orling@konsulko.com>
        libstd-rs, 1.61.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        rust-llvm, 1.61.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        procps, 4.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
        wayland, 1.20.91, Denys Dmytriyenko <denis@denix.org>
        tiff, 4.4.0, Alexander Kanavin <alex.kanavin@gmail.com>
        pulseaudio, 16.0, Unassigned <unassigned@yoctoproject.org>
    * Failed(other errors): 2
        cargo, 1.61.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=40 succeeded=20(50.00%) failed=20(50.00%)

Recipe upgrade statistics per Maintainer:

    Michael Opdenacker <michael.opdenacker: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Randy MacLeod <Randy.MacLeod: attempted=3 succeeded=0(0.00%) failed=3(100.00%)
    Tim Orling <tim.orling: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Yi Zhao <yi.zhao: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Unassigned <unassigned: attempted=4 succeeded=3(75.00%) failed=1(25.00%)
    Ross Burton <ross.burton: attempted=4 succeeded=3(75.00%) failed=1(25.00%)
    Bruce Ashfield <bruce.ashfield: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Zang Ruochen <zangrc.fnst: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Anuj Mittal <anuj.mittal: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Ricardo Neri <ricardo.neri-calderon: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=6 succeeded=2(33.33%) failed=4(66.67%)
    Wang Mingyu <wangmy: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Oleksandr Kravchuk <open.source: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Khem Raj <raj.khem: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Denys Dmytriyenko <denis: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Chen Qi <Qi.Chen: attempted=4 succeeded=2(50.00%) failed=2(50.00%)

--===============8225006079716085791==--

