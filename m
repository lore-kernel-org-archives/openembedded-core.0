Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3316C47090
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18723.1652634912674414110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CaIeof9n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180c8b78df6-8a3d1c4e-597a-474e-8d66-c7672c8a7dfc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634914;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Rb9ZUDoeQFzarv5L0iE/xfh8Svm2W6lEZhgk5H4O4AM=;
	b=CaIeof9nhrhAd16wIO57C5yc0bQJNyF5LthTPWk04tVZhFcSln1LDCqkvnGy4vDI
	rHgvuEF6N59Yd97bwyjk2Yrhc2toqAmH0Aq0laIB9DhdxJFyH+RsM4ZJtGHmx/6u64Z
	m/LO60g6rYd6QdqAsvSDVHrSv5473nOkKSjQ/VJ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634914;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Rb9ZUDoeQFzarv5L0iE/xfh8Svm2W6lEZhgk5H4O4AM=;
	b=BAA4cWB2q2YM4JEkA2ebpEGhLJYwzmZ/DKDU7LXZk+SrMF1ohJ/LM2qZgp4evjov
	REuimSD5IKsL58YLsFrnTzghxIXCL/NzxHLyzGsGKGjfSVtouQdYB4XmXngdi1Zx2IE
	Q0ywWGxwsC3oqtTQQ6kSy5+P7RogpK7+EZqOkle4=
Content-Type: multipart/mixed; boundary="===============4419728346098758719=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2022-05-15
Message-ID: 
 <01010180c8b78df6-8a3d1c4e-597a-474e-8d66-c7672c8a7dfc-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:14 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165652

--===============4419728346098758719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed(do_compile): 5
        u-boot-tools, 2022.04, Marek Vasut <marek.vasut@gmail.com>
        u-boot, 2022.04, Marek Vasut <marek.vasut@gmail.com>
        go-runtime, 1.18.2, Khem Raj <raj.khem@gmail.com>
        go, 1.18.2, Khem Raj <raj.khem@gmail.com>
        iptables, 1.8.8, Changhyeok Bae <changhyeok.bae@gmail.com>
    * Succeeded: 38
        mobile-broadband-provider-info, 20220511, Alexander Kanavin <alex.kanavin@gmail.com>
        openssl, 3.0.3, Alexander Kanavin <alex.kanavin@gmail.com>
        libcgroup, 2.0.2, Alexander Kanavin <alex.kanavin@gmail.com>
        git, 2.36.1, Robert Yang <liezhi.yang@windriver.com>
        librepo, 1.14.3, Wang Mingyu <wangmy@fujitsu.com>
        python3-bcrypt, 3.2.2, Tim Orling <tim.orling@konsulko.com>
        python3-cryptography-vectors, 37.0.2, Tim Orling <tim.orling@konsulko.com>
        python3-cryptography, 37.0.2, Tim Orling <tim.orling@konsulko.com>
        python3-hypothesis, 6.46.4, Tim Orling <tim.orling@konsulko.com>
        python3-jsonschema, 4.5.1, Bruce Ashfield <bruce.ashfield@gmail.com>
        python3-markdown, 3.3.7, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-more-itertools, 8.13.0, Tim Orling <tim.orling@konsulko.com>
        python3-pbr, 5.9.0, Zang Ruochen <zangrc.fnst@fujitsu.com>
        python3-pyparsing, 3.0.9, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        repo, 2.25, Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
        psmisc, 23.5, Alexander Kanavin <alex.kanavin@gmail.com>
        stress-ng, 0.14.01, Anuj Mittal <anuj.mittal@intel.com>
        adwaita-icon-theme, 42.0, Ross Burton <ross.burton@arm.com>
        libnotify, 0.7.12, Anuj Mittal <anuj.mittal@intel.com>
        librsvg, 2.54.3, Anuj Mittal <anuj.mittal@intel.com>
        mesa, 22.0.3, Otavio Salvador <otavio.salvador@ossystems.com.br>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        xcb-proto, 1.15, Unassigned <unassigned@yoctoproject.org>
        gst-devtools, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-libav, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-omx, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-bad, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-base, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-good, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-ugly, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-python, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-rtsp-server, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-vaapi, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0, 1.20.2, Anuj Mittal <anuj.mittal@intel.com>
        curl, 7.83.1, Robert Joslyn <robert.joslyn@redrectangle.org>
        diffoscope, 212, Joshua Watt <JPEWhacker@gmail.com>
        gnutls, 3.7.5, Unassigned <unassigned@yoctoproject.org>
        sqlite3, 3.38.5, Anuj Mittal <anuj.mittal@intel.com>
    * Failed (devtool error): 7
        gnu-config, 20220425-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        python3-pip, 22.1, Zang Ruochen <zangrc.fnst@fujitsu.com>
        python3-setuptools, 62.2.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        procps, 4.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
        libxcb, 1.15, Unassigned <unassigned@yoctoproject.org>
        systemtap-uprobes, 4.7, Victor Kamensky <victor.kamensky7@gmail.com>
        systemtap, 4.7, Victor Kamensky <victor.kamensky7@gmail.com>
    * Failed(other errors): 1
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=51 succeeded=38(74.51%) failed=13(25.49%)

Recipe upgrade statistics per Maintainer:

    Anuj Mittal <anuj.mittal: attempted=15 succeeded=15(100.00%) failed=0(0.00%)
    Zang Ruochen <zangrc.fnst: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Robert Joslyn <robert.joslyn: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Oleksandr Kravchuk <open.source: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Khem Raj <raj.khem: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Ross Burton <ross.burton: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Jasper Orschulko <Jasper.Orschulko: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Bruce Ashfield <bruce.ashfield: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Changhyeok Bae <changhyeok.bae: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Unassigned <unassigned: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Victor Kamensky <victor.kamensky7: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Alexander Kanavin <alex.kanavin: attempted=6 succeeded=5(83.33%) failed=1(16.67%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Marek Vasut <marek.vasut: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Tim Orling <tim.orling: attempted=5 succeeded=5(100.00%) failed=0(0.00%)
    Robert Yang <liezhi.yang: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Joshua Watt <JPEWhacker: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Wang Mingyu <wangmy: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============4419728346098758719==--

