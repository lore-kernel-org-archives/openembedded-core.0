Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD98CC6B3D
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33252.1792043052686810286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aMwz28M5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cDH42zi0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a13e16eaf1-0f8e60d1-d27d-4365-a690-ca9b9abe1f69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792043051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W/eEFw/GYXjKQ939fqghfcLo6qFdzmHXR7o+kozagMA=;
	b=aMwz28M5+VEZBdKRPwILjFhs9dPFZ4q2NVSlUJ2sgUq7Po7Ue//p5pPorKWjitCi
	/cfSCSHmMHElsyvBlSj/hIW6iehy8odGqhBBEMXe9cvZpcIc7acH4fVGu8p8xdmgV4F
	4rAKeff9Yz0p3YXDPIRihijYGo1pq2McGHPYoFtw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792043051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W/eEFw/GYXjKQ939fqghfcLo6qFdzmHXR7o+kozagMA=;
	b=cDH42zi0WTnpikofqu1d3ieXTBuMi9QMNNX8FTutck0ABkIsg9zUZAwDyBxbJMOQ
	3yJdSU+a22dZq7mb49nXWfQAed4NzsBYB0/5bBCtFRi7ZTfV+BlPFCbqRnMXjoHpQKN
	oiOKuTcHHTVLG84r1c+hYa+NM0eaFsSPs6hWX1YU=
Content-Type: multipart/mixed; boundary="===============8385064377752099543=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 177edebf0cd7d4f669667e49f052cfb56b17e004 FAILED
Message-ID: <010101a13e16eaf1-0f8e60d1-d27d-4365-a690-ca9b9abe1f69-000000@us-west-2.amazonses.com>
Date: Thu, 15 Oct 2026 05:44:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247863

--===============8385064377752099543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *177edebf0cd7d4f669667e49f052cfb56b17e004* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 61 skipped, 0 masked, 0 errors.
Removing 12 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 12 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8385064377752099543==--

