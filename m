Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63948C61DF0
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 05:08:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23162.1788152900044206950
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 22:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QzNnupba;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UXOv/V9y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a05637e638-0b976494-ac8c-4e45-9de5-1822d8747e65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788152899;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=FAtcidYApuEqFxol8IwMaKWM8yO7kM2huVKwLrdmv64=;
	b=QzNnupba26AysK/ZS9cd0OpSBw1ef1IZcS6rUV42Fba41jgmzErxd2iwaSCsG13U
	J/sDmSCd0tVmG1JKW0LyuqcRORuVZG/QsC5Zcz7AyNTIpN44MZ78e8MGDwW4KInnvdb
	EIww+2DAYRLMPtQ5/FQZpwqCBCEqu5OFbC3giuco=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788152899;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=FAtcidYApuEqFxol8IwMaKWM8yO7kM2huVKwLrdmv64=;
	b=UXOv/V9yWor8D6KdfjyQWu6v1VbFaIBmG+rBcBe7Kamw3ua8LkeS8YI+NgO27dJv
	WYhoecSmhsbaa6rgdsrzTDZtLhjQ6vksfz8HSDSPPzrvQFvlNdETqcltJsxpI7yVwjs
	XKso1LBT2OoflJHScKPPSwt9OFgdNl3gBBEDRhlc=
Content-Type: multipart/mixed; boundary="===============1853718212374127067=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2026-08-31
Message-ID: <010101a05637e638-0b976494-ac8c-4e45-9de5-1822d8747e65-000000@us-west-2.amazonses.com>
Date: Mon, 31 Aug 2026 05:08:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.31-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 05:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244728

--===============1853718212374127067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

AUH finished upgrade batch the result patches/logs can be found at:
https://valkyrie.yocto.io/pub/auh/20260831050054, next are the statistics:

Recipe upgrade statistics:

    * Succeeded: 1
        python3-hypothesis, 6.167.1, Trevor Gamblin <tgamblin@baylibre.com>
    * Skipped: 38
        llvm-project-source-22.1.8, 23.1.0, last attempt 2026-08-29 05:12:34 result=failure; will retry in 29 day(s), Khem Raj <raj.khem@gmail.com>
        sbom-cve-check-update-nvd-native, 2026.08.31-000008, rapid-fire; last attempt 2026-08-12 05:16:07 result=success; will retry in 12 day(s), Benjamin Robin <benjamin.robin@bootlin.com>
        sbom-cve-check-update-cvelist-native, 2026-08-31, rapid-fire; last attempt 2026-08-12 05:16:07 result=success; will retry in 12 day(s), Benjamin Robin <benjamin.robin@bootlin.com>
        gstreamer1.0-plugins-rs, 1.29.2, last attempt 2026-08-06 05:24:25 result=failure; will retry in 6 day(s), Jan Schmidt <jan@centricular.com>
        openssl, 4.0.2, last attempt 2026-08-26 05:37:04 result=failure; will retry in 26 day(s), Unassigned <unassigned@yoctoproject.org>
        ovmf, edk2-stable202608, last attempt 2026-08-22 05:07:17 result=failure; will retry in 22 day(s), Unassigned <unassigned@yoctoproject.org>
        gn, 0-new-commits-available, last attempt 2026-08-12 05:21:07 result=success; will retry in 12 day(s), Khem Raj <raj.khem@gmail.com>
        nasm, 3.02, last attempt 2026-08-30 05:08:25 result=failure; will retry in 30 day(s), Richard Purdie <richard.purdie@linuxfoundation.org>
        orc, 0.4.43, last attempt 2026-08-29 05:14:56 result=success; will retry in 29 day(s), Unassigned <unassigned@yoctoproject.org>
        perlcross, 1.6.5, last attempt 2026-08-18 05:14:21 result=failure; will retry in 18 day(s), Unassigned <unassigned@yoctoproject.org>
        python3-build, 1.6.0, last attempt 2026-08-28 05:36:35 result=success; will retry in 28 day(s), Ross Burton <ross.burton@arm.com>
        python3-cython, 3.3.0, last attempt 2026-08-23 05:15:55 result=success; will retry in 23 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        python3-flit-core, 4.0.2, last attempt 2026-08-05 05:12:58 result=failure; will retry in 5 day(s), Tim Orling <tim.orling@konsulko.com>
        python3-git, 3.1.61, last attempt 2026-08-29 05:21:08 result=success; will retry in 29 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        python3-hatchling, 1.32.0, last attempt 2026-08-11 05:53:57 result=failure; will retry in 11 day(s), Ross Burton <ross.burton@arm.com>
        python3-pbr, 7.1.2, last attempt 2026-08-26 05:51:54 result=success; will retry in 26 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        python3-pdm, 2.29.0, last attempt 2026-08-30 05:20:35 result=success; will retry in 30 day(s), Khem Raj <raj.khem@gmail.com>
        python3-pygobject, 3.58.0, last attempt 2026-08-28 05:45:17 result=success; will retry in 28 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        python3-shacl2code, 1.2.0, last attempt 2026-08-11 06:17:09 result=failure; will retry in 11 day(s), Benjamin Robin <benjamin.robin@bootlin.com>
        python3-uv-build, 0.12.7, last attempt 2026-08-28 05:52:27 result=success; will retry in 28 day(s), Trevor Gamblin <tgamblin@baylibre.com>
        python3-wcwidth, 0.8.3, last attempt 2026-08-29 05:24:17 result=success; will retry in 29 day(s), Tim Orling <tim.orling@konsulko.com>
        rpm, 6.1.0, last attempt 2026-08-21 05:45:50 result=failure; will retry in 21 day(s), Robert Yang <liezhi.yang@windriver.com>
        sysstat, 12.8.0, last attempt 2026-08-29 05:26:22 result=failure; will retry in 29 day(s), Chen Qi <Qi.Chen@windriver.com>
        blueprint-compiler, 0.22.2, last attempt 2026-08-11 06:26:13 result=failure; will retry in 11 day(s), Liu Yiding <liuyd.fnst@fujitsu.com>
        pango, 1.58.2, last attempt 2026-08-06 05:59:26 result=success; will retry in 6 day(s), Ross Burton <ross.burton@arm.com>
        piglit, 1.0-new-commits-available, last attempt 2026-08-12 05:48:00 result=failure; will retry in 12 day(s), Ross Burton <ross.burton@arm.com>
        spirv-llvm-translator, 23.1.0, last attempt 2026-08-07 05:14:23 result=failure; will retry in 7 day(s), Khem Raj <raj.khem@gmail.com>
        vulkan-samples, git-new-commits-available, rapid-fire; last attempt 2026-08-14 06:26:27 result=failure; will retry in 14 day(s), Ross Burton <ross.burton@arm.com>
        ffmpeg, 9.0.1, last attempt 2026-08-12 05:56:14 result=success; will retry in 12 day(s), Unassigned <unassigned@yoctoproject.org>
        lame, 4.0, last attempt 2026-08-12 05:58:03 result=failure; will retry in 12 day(s), Michael Opdenacker <michael.opdenacker@rootcommit.com>
        appstream, 1.2.0, last attempt 2026-08-29 05:30:22 result=success; will retry in 29 day(s), Markus Volk <f_l_k@t-online.de>
        debianutils, 5.24, last attempt 2026-08-28 05:55:03 result=success; will retry in 28 day(s), Yi Zhao <yi.zhao@windriver.com>
        gpgme, 2.2.0, last attempt 2026-08-23 05:17:51 result=failure; will retry in 23 day(s), Hongxu Jia <hongxu.jia@windriver.com>
        libgcrypt, 1.12.3, last attempt 2026-08-29 05:40:50 result=success; will retry in 29 day(s), Hongxu Jia <hongxu.jia@windriver.com>
        libical, 4.0.5, last attempt 2026-08-16 05:10:58 result=success; will retry in 16 day(s), Ross Burton <ross.burton@arm.com>
        libjitterentropy, 3.7.0, last attempt 2026-08-12 06:00:04 result=failure; will retry in 12 day(s), Ross Burton <ross.burton@arm.com>
        libksba, 1.8.1, last attempt 2026-08-29 05:44:07 result=success; will retry in 29 day(s), Unassigned <unassigned@yoctoproject.org>
        re2c, 4.6, last attempt 2026-08-30 05:32:49 result=success; will retry in 30 day(s), Khem Raj <raj.khem@gmail.com>

    TOTAL: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

Recipe upgrade statistics per Maintainer:

    Trevor Gamblin <tgamblin: attempted=1 succeeded=1(100.00%) failed=0(0.00%)

--===============1853718212374127067==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="20260831050054.tar.gz"

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
8Oc/Lf78w99+/n7hfHC+AWGI+8XPOopMZLvqEInAf/mXyvydLB+zpirp8cz9oz/+v2XWZerp9U3v
slYdA3t9s///25eH+vY/pwn80JcEgrr4dkDdOoS7v53xlTQrs3Z35hvmtKfvHIPph2j86+mfJvEd
+UKIwqsn/TUcD69ymsjPA9jjjz9/992ffvzxf//8l39afJ9LAtyi5KR/wt/6Q6/esDkXF1TOtz2s
P/THP4pHqZa3smVo5SfqqIzpwe4XH9rm8UNdPez1834wCJlPVfMgmw+i35lmkMP/h0e0djJX9vIH
48LwHDuw7cD/IPL8w5j18hvKeBhuU++/iFAt1SRpDMtKTVOeV08L9deLusqzeL9oZUc32envEQJL
b1qnLAhdCj7fYaHfU0pF1ehl/Xrvf7P4UZZmuZPzTjG+V0uXFxr69j+/WfxZlrqBiyJAk7PoRBOp
B6b7vNoMLhXR5faLfom/u13zr68WJJ1cMvlwXR7kB10FgfrpeEFon/w8Xr9zAtcPXFv9F/7Odnxf
fbwIrnsb+OqVadUsFr87rsaJv7v0+e26Xbfrdt2u23W7btftul2363bdrtt1u27X7bpdt+t23a7b
dbtu1+26Xbfrdt2u23W7btftul2363bdrtt1u27Xb3T9F6Nbsz4A4AEA

--===============1853718212374127067==--

