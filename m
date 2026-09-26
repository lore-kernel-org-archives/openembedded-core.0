Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FA2C9831E
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 05:25:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14309.1790400310817356050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 22:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uYsapKAa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NMlb3dLz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0dc2ca9e2-c0fe0483-9e38-4667-84a4-388790b3db98-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790400309;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3KFww1gJ/D1OfsA4wQBsRqGzW7F48zYXVGxg0i6j+rE=;
	b=uYsapKAaqvTZLskKX2A2uS+sqXNcPjvlvA9AM+HBEmtYVLdtK7GslX7mH7seDei/
	Vg9Vn2hESD8EIyBnfEoZcFx7i8hhzr0ae9qjVWK3nDYXgjxg+eyTVAGMGgGy8H5baoo
	hUgLra+wZ82XeqMbgYHjElXpvRHPOxxoX5SY1rb4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790400309;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3KFww1gJ/D1OfsA4wQBsRqGzW7F48zYXVGxg0i6j+rE=;
	b=NMlb3dLzE7yhqpEWHI9DXkD4vsT0Zt+n0bpI4vVHa8Beeb5XTN1Bp6+ADiI2y19r
	EGLv0wrfCNmB0exSviz+EIJ4LMfESPIJ/jug3x2fFTvDLMNkNhjFk8WUs4iHWwOaPe5
	3gNiaMedYsR9vo1fjnedmtw5tAWiNUUUJtF2P7fM=
Content-Type: multipart/mixed; boundary="===============3438994902583411194=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdb-cross-canadian-x86-64,gdb,gdb-cross-x86_64: upgrading to
 18.1 FAILED
Message-ID: <010101a0dc2ca9e2-c0fe0483-9e38-4667-84a4-388790b3db98-000000@us-west-2.amazonses.com>
Date: Sat, 26 Sep 2026 05:25:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.26-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 05:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246628

--===============3438994902583411194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdb-cross-canadian-x86-64,gdb,gdb-cross-x86_64* to *18.1* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1994 targets, 61 skipped, 0 masked, 0 errors.
Removing 7 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3438994902583411194==--

