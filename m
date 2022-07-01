Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029ADCCA485
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.39388.1656687065024057021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bjAeztWf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010181ba3e74cf-925e8cb2-d4d7-4ccd-824f-38a6a7ec4d07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687064;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OeSGpYYMjRK9U9LpjSUcTAq+dQw5KlYJPxFPOmLCffA=;
	b=bjAeztWfTb6Mj0uvHS6FxZHeGMNNSd5u4tUiOHM/yuy1A+02c3JXVvowpFiaJRq5
	+0AhYXbq8UZvMWCTx1kuCKHcvicSCwjyE+VqW/ldq0rciN0aW3/DiCyodtg7QZA7rMk
	4M5fQXxM8qfEiwm8C2cpr0HaSWgDsHRkr5szB3wU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687064;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OeSGpYYMjRK9U9LpjSUcTAq+dQw5KlYJPxFPOmLCffA=;
	b=WAENYur8zcTI7XN20KoG+LcT1lo7Bg+5uZS1STK3IgZO2+s3PncWv4Dd/IIAjgOE
	hRH44JysRZCFTNC2Cmnm2EXk47xDVFRihawWWSjIag3ulh0pVhCXN6ybFlLoDH94Xiz
	oH8o0FyTu1WvJHPbqthkTqzZY1rzai1LfwbvWyEg=
Content-Type: multipart/mixed; boundary="===============7814819984751956930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2022-07-01
Message-ID: 
 <01010181ba3e74cf-925e8cb2-d4d7-4ccd-824f-38a6a7ec4d07-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167525

--===============7814819984751956930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Failed (devtool error): 7
        openssl, 3.0.4, Alexander Kanavin <alex.kanavin@gmail.com>
        llvm, 14.0.6, Khem Raj <raj.khem@gmail.com>
        libstd-rs, 1.62.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        rust-llvm, 1.62.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        procps, 4.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
        wayland, 1.21.0, Denys Dmytriyenko <denis@denix.org>
        weston, 10.0.1, Denys Dmytriyenko <denis@denix.org>
    * Succeeded: 43
        glib-2.0, 2.72.3, Anuj Mittal <anuj.mittal@intel.com>
        glib-networking, 2.72.1, Anuj Mittal <anuj.mittal@intel.com>
        createrepo-c, 0.20.1, Alexander Kanavin <alex.kanavin@gmail.com>
        dmidecode, 3.4, Alexander Kanavin <alex.kanavin@gmail.com>
        git, 2.37.0, Robert Yang <liezhi.yang@windriver.com>
        python3-cffi, 1.15.1, Tim Orling <tim.orling@konsulko.com>
        python3-cryptography-vectors, 37.0.3, Tim Orling <tim.orling@konsulko.com>
        python3-cryptography, 37.0.3, Tim Orling <tim.orling@konsulko.com>
        python3-hatchling, 1.3.1, Ross Burton <ross.burton@arm.com>
        python3-hypothesis, 6.48.2, Tim Orling <tim.orling@konsulko.com>
        python3-jsonschema, 4.6.1, Bruce Ashfield <bruce.ashfield@gmail.com>
        python3-mako, 1.2.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pycryptodomex, 3.15.0, Joshua Watt <JPEWhacker@gmail.com>
        python3-requests, 2.28.1, Tim Orling <tim.orling@konsulko.com>
        python3-setuptools, 62.6.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-sphinx, 5.0.2, Tim Orling <tim.orling@konsulko.com>
        repo, 2.27, Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
        sudo, 1.9.11p3, Chen Qi <Qi.Chen@windriver.com>
        adwaita-icon-theme, 42.0, Ross Burton <ross.burton@arm.com>
        harfbuzz, 4.4.1, Anuj Mittal <anuj.mittal@intel.com>
        mesa, 22.1.3, Otavio Salvador <otavio.salvador@ossystems.com.br>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.com>
        xcb-proto, 1.15.2, Unassigned <unassigned@yoctoproject.org>
        kmod, 30, Chen Qi <Qi.Chen@windriver.com>
        gst-devtools, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-libav, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-omx, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-bad, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-base, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-good, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-plugins-ugly, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-python, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-rtsp-server, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0-vaapi, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        gstreamer1.0, 1.20.3, Anuj Mittal <anuj.mittal@intel.com>
        mpg123, 1.30.0, Alexander Kanavin <alex.kanavin@gmail.com>
        pulseaudio, 16.1, Unassigned <unassigned@yoctoproject.org>
        speex, 1.2.1, Michael Opdenacker <michael.opdenacker@bootlin.com>
        speexdsp, 1.2.1, Michael Opdenacker <michael.opdenacker@bootlin.com>
        diffoscope, 217, Joshua Watt <JPEWhacker@gmail.com>
        libsoup, 3.0.7, Anuj Mittal <anuj.mittal@intel.com>
        nghttp2, 1.48.0, Alexander Kanavin <alex.kanavin@gmail.com>
        sqlite3, 3.39.0, Anuj Mittal <anuj.mittal@intel.com>
    * Failed(other errors): 2
        cargo, 1.62.0, Randy MacLeod <Randy.MacLeod@windriver.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
    * Failed(do_compile): 2
        python3-setuptools-scm, 7.0.3, Tim Orling <tim.orling@konsulko.com>
        curl, 7.84.0, Robert Joslyn <robert.joslyn@redrectangle.org>

    TOTAL: attempted=54 succeeded=43(79.63%) failed=11(20.37%)

Recipe upgrade statistics per Maintainer:

    Tim Orling <tim.orling: attempted=7 succeeded=6(85.71%) failed=1(14.29%)
    Ross Burton <ross.burton: attempted=4 succeeded=3(75.00%) failed=1(25.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Denys Dmytriyenko <denis: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Jasper Orschulko <Jasper.Orschulko: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Oleksandr Kravchuk <open.source: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Anuj Mittal <anuj.mittal: attempted=16 succeeded=16(100.00%) failed=0(0.00%)
    Chen Qi <Qi.Chen: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Unassigned <unassigned: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Robert Joslyn <robert.joslyn: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Bruce Ashfield <bruce.ashfield: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Alexander Kanavin <alex.kanavin: attempted=6 succeeded=4(66.67%) failed=2(33.33%)
    Khem Raj <raj.khem: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Joshua Watt <JPEWhacker: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Michael Opdenacker <michael.opdenacker: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Otavio Salvador <otavio.salvador: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Randy MacLeod <Randy.MacLeod: attempted=3 succeeded=0(0.00%) failed=3(100.00%)

--===============7814819984751956930==--

