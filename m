Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111EBCD98F5
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 05:53:42 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13248.1781762012622532345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 22:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nZiOen0N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dk8cYprw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ed94ab232-e482cf83-49b1-434b-a8d1-853a2aca2ce1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781762011;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=NgMTwdM7QTjMlE+MRDItxqP4UXV01tkMFnPglSNW5Lc=;
	b=nZiOen0NQfaJIjTd6Dpb0rgxAL4EiflkiiVTqg36KxEF+xm7ltc4VnEVrrxZhIzQ
	PDoCTjPgJjYGphKJ/cRkDQbPgsI81lI9KvtB72aZgSdQ3Se/GOSfQwFUTprZ7Mel4fA
	QnLSuIop2i4QgAzGCsBsrVbk2EHEAQydYHA838l0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781762011;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=NgMTwdM7QTjMlE+MRDItxqP4UXV01tkMFnPglSNW5Lc=;
	b=dk8cYprwlL5H7PJWjohMowqiOLeoCnWrkRy7utUb0XmcJyuMA+6U9SJUSpDwQcvs
	T70FOCE+UOZlBeQVzA10ZHx1+rMcTlzYu3RmX0WF4Hq9JgyvUre8z2xIKNCWWmnMWVp
	3YydYiFkISBdAIjBijR/iQwWgPMEjbMkpdFdey0E=
Content-Type: multipart/mixed; boundary="===============1865406230720802332=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2026-06-18
Message-ID: <0101019ed94ab232-e482cf83-49b1-434b-a8d1-853a2aca2ce1-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 05:53:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 05:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239052

--===============1865406230720802332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

AUH finished upgrade batch the result patches/logs can be found at:
https://valkyrie.yocto.io/pub/auh/20260618050059, next are the statistics:

Recipe upgrade statistics:

    * Succeeded: 6
        cmake, 4.3.4, Unassigned <unassigned@yoctoproject.org>
        cmake-native, 4.3.4, Unassigned <unassigned@yoctoproject.org>
        bind, 9.20.24, Unassigned <unassigned@yoctoproject.org>
        python3-certifi, 2026.6.17, Tim Orling <tim.orling@konsulko.com>
        lighttpd, 1.4.84, Unassigned <unassigned@yoctoproject.org>
        libportal, 0.10.0, Unassigned <unassigned@yoctoproject.org>
    * Skipped: 88
        systemd-boot, 260.2, last attempt 2026-06-11 06:57:05 result=failure; will retry in 24 day(s), Chen Qi <Qi.Chen@windriver.com>
        systemd-boot-native, 260.2, last attempt 2026-06-11 06:57:05 result=failure; will retry in 24 day(s), Viswanath Kraleti <quic_vkraleti@quicinc.com>
        systemd-systemctl-native, 260.2, last attempt 2026-06-11 06:57:05 result=failure; will retry in 24 day(s), Chen Qi <Qi.Chen@windriver.com>
        systemd, 260.2, last attempt 2026-06-11 06:57:05 result=failure; will retry in 24 day(s), Chen Qi <Qi.Chen@windriver.com>
        util-linux, 2.42.2, last attempt 2026-06-17 05:06:23 result=failure; will retry in 30 day(s), Chen Qi <Qi.Chen@windriver.com>
        util-linux-libuuid, 2.42.2, last attempt 2026-06-17 05:06:23 result=failure; will retry in 30 day(s), Chen Qi <Qi.Chen@windriver.com>
        binutils-cross-x86_64, 2.46.1, last attempt 2026-06-11 07:07:16 result=failure; will retry in 24 day(s), Khem Raj <raj.khem@gmail.com>
        binutils-testsuite, 2.46.1, last attempt 2026-06-11 07:07:16 result=failure; will retry in 24 day(s), Khem Raj <raj.khem@gmail.com>
        binutils, 2.46.1, last attempt 2026-06-11 07:07:16 result=failure; will retry in 24 day(s), Khem Raj <raj.khem@gmail.com>
        binutils-cross-canadian-x86-64, 2.46.1, last attempt 2026-06-11 07:07:16 result=failure; will retry in 24 day(s), Khem Raj <raj.khem@gmail.com>
        binutils-crosssdk-x86_64-pokysdk-linux, 2.46.1, last attempt 2026-06-11 07:07:16 result=failure; will retry in 24 day(s), Khem Raj <raj.khem@gmail.com>
        llvm-project-source-22.1.7, 22.1.8, last attempt 2026-06-17 05:10:43 result=failure; will retry in 30 day(s), Khem Raj <raj.khem@gmail.com>
        python3-cryptography-vectors, 49.0.0, last attempt 2026-06-13 07:02:00 result=failure; will retry in 26 day(s), Tim Orling <tim.orling@konsulko.com>
        python3-cryptography, 49.0.0, last attempt 2026-06-13 07:02:00 result=failure; will retry in 26 day(s), Tim Orling <tim.orling@konsulko.com>
        sbom-cve-check-update-cvelist-native, 2026-06-18, rapid-fire; last attempt 2026-06-11 07:34:18 result=success; will retry in 24 day(s), Benjamin Robin <benjamin.robin@bootlin.com>
        sbom-cve-check-update-nvd-native, 2026.06.18-000006, rapid-fire; last attempt 2026-06-11 07:34:18 result=success; will retry in 24 day(s), Benjamin Robin <benjamin.robin@bootlin.com>
        mesa-tools-native, 26.1.2, last attempt 2026-06-11 07:44:31 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        mesa, 26.1.2, last attempt 2026-06-11 07:44:31 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        lttng-tools, 2.15.1, last attempt 2026-06-11 07:50:48 result=failure; will retry in 24 day(s), Richard Purdie <richard.purdie@linuxfoundation.org>
        lttng-modules, 2.15.1, last attempt 2026-06-11 07:50:48 result=failure; will retry in 24 day(s), Richard Purdie <richard.purdie@linuxfoundation.org>
        lttng-ust, 2.15.1, last attempt 2026-06-11 07:50:48 result=failure; will retry in 24 day(s), Richard Purdie <richard.purdie@linuxfoundation.org>
        systemtap-native, 5.5, last attempt 2026-06-11 07:52:33 result=failure; will retry in 24 day(s), Victor Kamensky <victor.kamensky7@gmail.com>
        systemtap, 5.5, last attempt 2026-06-11 07:52:33 result=failure; will retry in 24 day(s), Victor Kamensky <victor.kamensky7@gmail.com>
        gstreamer1.0-plugins-ugly, 1.28.4, last attempt 2026-06-13 07:09:04 result=failure; will retry in 26 day(s), Unassigned <unassigned@yoctoproject.org>
        gstreamer1.0-plugins-bad, 1.28.4, last attempt 2026-06-13 07:09:04 result=failure; will retry in 26 day(s), Unassigned <unassigned@yoctoproject.org>
        gstreamer1.0-plugins-base, 1.28.4, last attempt 2026-06-13 07:09:04 result=failure; will retry in 26 day(s), Unassigned <unassigned@yoctoproject.org>
        gstreamer1.0-plugins-good, 1.28.4, last attempt 2026-06-13 07:09:04 result=failure; will retry in 26 day(s), Unassigned <unassigned@yoctoproject.org>
        gstreamer1.0-rtsp-server, 1.28.4, last attempt 2026-06-13 07:09:04 result=failure; will retry in 26 day(s), Unassigned <unassigned@yoctoproject.org>
        libcap-ng-python, 0.9.3, last attempt 2026-06-11 08:08:43 result=failure; will retry in 24 day(s), Yi Zhao <yi.zhao@windriver.com>
        libcap-ng, 0.9.3, last attempt 2026-06-11 08:08:43 result=failure; will retry in 24 day(s), Yi Zhao <yi.zhao@windriver.com>
        inetutils, 2.8, last attempt 2026-06-11 08:14:56 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        iproute2, 7.1.0, last attempt 2026-06-16 05:15:13 result=success; will retry in 29 day(s), Unassigned <unassigned@yoctoproject.org>
        neard, 0.20, last attempt 2026-06-11 08:16:56 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        openssl, 4.0.1, last attempt 2026-06-11 08:18:59 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        ppp, 2.5.3, last attempt 2026-06-11 08:21:51 result=failure; will retry in 24 day(s), Hongxu Jia <hongxu.jia@windriver.com>
        libslirp, 4.9.3, last attempt 2026-06-11 08:25:48 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        ovmf, edk2-stable202605, last attempt 2026-06-11 08:33:58 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        debugedit, 5.3, last attempt 2026-06-11 08:51:05 result=failure; will retry in 24 day(s), Chen Qi <Qi.Chen@windriver.com>
        elfutils, 0.195, last attempt 2026-06-11 08:54:12 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        fmt, 12.2.0, last attempt 2026-06-17 05:14:35 result=success; will retry in 30 day(s), Robert Yang <liezhi.yang@windriver.com>
        gn, 0-new-commits-available, last attempt 2026-06-11 09:08:23 result=success; will retry in 24 day(s), Khem Raj <raj.khem@gmail.com>
        gnu-config, 20250709-new-commits-available, last attempt 2026-06-11 09:10:03 result=failure; will retry in 24 day(s), Robert Yang <liezhi.yang@windriver.com>
        perl, 5.42.2, last attempt 2026-06-11 09:12:48 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        python3-dtc, 1.8.1, last attempt 2026-06-11 09:26:42 result=failure; will retry in 24 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        python3-dtschema, 2026.6, last attempt 2026-06-17 05:19:37 result=success; will retry in 30 day(s), Bruce Ashfield <bruce.ashfield@gmail.com>
        python3-hypothesis, 6.155.3, last attempt 2026-06-16 05:18:49 result=success; will retry in 29 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        python3-shacl2code, 1.1.0, last attempt 2026-06-11 10:10:01 result=success; will retry in 24 day(s), Benjamin Robin <benjamin.robin@bootlin.com>
        python3-uritools, 6.1.2, last attempt 2026-06-11 10:19:23 result=failure; will retry in 24 day(s), Marta Rybczynska <marta.rybczynska@ygreky.com>
        python3, 3.14.6, last attempt 2026-06-11 10:31:51 result=failure; will retry in 24 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        rpm, 6.0.1, last attempt 2026-06-11 10:36:55 result=failure; will retry in 24 day(s), Robert Yang <liezhi.yang@windriver.com>
        strace, 7.1, last attempt 2026-06-16 05:27:11 result=success; will retry in 29 day(s), Robert Yang <liezhi.yang@windriver.com>
        tcf-agent, 1.11.0, last attempt 2026-06-11 10:58:03 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        ghostscript, 10.07.1, last attempt 2026-06-11 11:14:02 result=success; will retry in 24 day(s), Hongxu Jia <hongxu.jia@windriver.com>
        libsolv, 0.7.39, last attempt 2026-06-11 11:18:18 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        lsof, 4.99.7, last attempt 2026-06-17 05:22:47 result=success; will retry in 30 day(s), Ross Burton <ross.burton@arm.com>
        ltp, 20260529, last attempt 2026-06-11 11:21:32 result=failure; will retry in 24 day(s), Yi Zhao <yi.zhao@windriver.com>
        man-pages, 6.18, last attempt 2026-06-11 11:23:16 result=failure; will retry in 24 day(s), Hongxu Jia <hongxu.jia@windriver.com>
        minicom, 2.11.1, last attempt 2026-06-11 11:26:11 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        parted, 3.7, last attempt 2026-06-11 11:28:21 result=failure; will retry in 24 day(s), Hongxu Jia <hongxu.jia@windriver.com>
        which, 2.25, last attempt 2026-06-11 11:40:57 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        gtk-doc, 1.36.1, last attempt 2026-06-11 11:42:57 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        librsvg, 2.62.3, last attempt 2026-06-11 11:51:43 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        glslang, 1.4.350.0, last attempt 2026-06-11 12:06:27 result=success; will retry in 24 day(s), Jose Quaresma <quaresma.jose@gmail.com>
        igt-gpu-tools, 2.4, last attempt 2026-06-11 12:15:31 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        piglit, 1.0-new-commits-available, last attempt 2026-06-11 12:23:30 result=failure; will retry in 24 day(s), Ross Burton <ross.burton@arm.com>
        spirv-llvm-translator, 22.1.3, last attempt 2026-06-11 12:28:07 result=failure; will retry in 24 day(s), Khem Raj <raj.khem@gmail.com>
        spirv-tools, 1.4.350.0, last attempt 2026-06-11 12:30:03 result=failure; will retry in 24 day(s), Jose Quaresma <quaresma.jose@gmail.com>
        virglrenderer, 1.3.0, last attempt 2026-06-11 12:32:10 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        vulkan-loader, 1.4.350.0, last attempt 2026-06-11 12:37:09 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        vulkan-samples, git-new-commits-available, rapid-fire; last attempt 2026-06-11 12:48:55 result=success; will retry in 24 day(s), Ross Burton <ross.burton@arm.com>
        vulkan-tools, 1.4.350.0, last attempt 2026-06-11 12:51:50 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        vulkan-utility-libraries, 1.4.350.0, last attempt 2026-06-11 12:53:46 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        vulkan-validation-layers, 1.4.350.0, last attempt 2026-06-11 13:06:47 result=failure; will retry in 24 day(s), Vincent Davis Jr <vince@underview.tech>
        waffle, 1.8.2, last attempt 2026-06-15 05:11:58 result=failure; will retry in 28 day(s), Ross Burton <ross.burton@arm.com>
        libinput, 1.31.3, last attempt 2026-06-11 13:11:01 result=failure; will retry in 24 day(s), Ross Burton <ross.burton@arm.com>
        libxkbcommon, 1.13.2, last attempt 2026-06-11 13:16:39 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        dtc, 1.8.1, last attempt 2026-06-11 13:28:33 result=failure; will retry in 24 day(s), Wang Mingyu <wangmy@fujitsu.com>
        alsa-ucm-conf, 1.2.16.1, last attempt 2026-06-15 05:17:11 result=failure; will retry in 28 day(s), Michael Opdenacker <michael.opdenacker@rootcommit.com>
        ffmpeg, 8.1.2, last attempt 2026-06-17 05:31:40 result=success; will retry in 30 day(s), Unassigned <unassigned@yoctoproject.org>
        gst-examples, 1.28.4, last attempt 2026-06-13 07:35:11 result=failure; will retry in 26 day(s), Unassigned <unassigned@yoctoproject.org>
        webkitgtk, 2.52.4, last attempt 2026-06-11 14:48:13 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        boost, 1.91.0, last attempt 2026-06-11 14:53:24 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        libfyaml, 0.9.6, last attempt 2026-06-11 15:24:23 result=failure; will retry in 24 day(s), Changqing Li <changqing.li@windriver.com>
        libical, 4.0.3, last attempt 2026-06-15 05:18:39 result=failure; will retry in 28 day(s), Ross Burton <ross.burton@arm.com>
        libjitterentropy, 3.7.0, last attempt 2026-06-11 15:47:41 result=failure; will retry in 24 day(s), Ross Burton <ross.burton@arm.com>
        libmd, 1.2.0, last attempt 2026-06-11 15:55:02 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        nettle, 4.0, last attempt 2026-06-11 16:08:15 result=success; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>
        vte, 0.84.0, last attempt 2026-06-11 16:31:28 result=failure; will retry in 24 day(s), Unassigned <unassigned@yoctoproject.org>

    TOTAL: attempted=6 succeeded=6(100.00%) failed=0(0.00%)

Recipe upgrade statistics per Maintainer:

    Unassigned <unassigned: attempted=5 succeeded=5(100.00%) failed=0(0.00%)
    Tim Orling <tim.orling: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============1865406230720802332==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="20260618050059.tar.gz"

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
AwA=

--===============1865406230720802332==--

