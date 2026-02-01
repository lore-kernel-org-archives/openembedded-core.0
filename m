Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111ABE65273
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29061.1769951573674408264
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ikdFp/Y4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Kk7/F4JP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c1955c902-ab07136d-bcae-4880-8597-d72a4ae52fa1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/09vg1R2mJoNckNjvpUscllNo5xO+/c4QMGSeIEsNvE=;
	b=ikdFp/Y4lAQ93FPnzJdsXTpcGSu5TsVZS4IFxvXh3FB3i4Tmfo1P7Ov66Mk8mXbf
	JaT4G/HfZCH5ClDswL8roRBR0AWSk4pZ66ge+okFue9jeFBfuVcJsVzXbJtE8WBvmoD
	HiogjzhjZ9zRV3qkAxSsoIhH08oV7vnUP9sTnBP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/09vg1R2mJoNckNjvpUscllNo5xO+/c4QMGSeIEsNvE=;
	b=Kk7/F4JPEFC84Ne1uBBxqq+RrMIfVgNmFkn6PBxz6BMp5cjKOxfdP4PxYHQY0Cxl
	EMyP2hovfo/70wxTAtosn/R8ZE/HAatA+6Z3AdRuuF5nGdxkgPdm4Gs+YUigC9RZGf4
	Njt3XYtR19IAIxxlkERKfZeR86KM0+Kq3nLWWe7I=
Content-Type: multipart/mixed; boundary="===============8530696538658666289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 69389f9b4c8f7ed697df809d534f0629a18c46bb FAILED
Message-ID: <0101019c1955c902-ab07136d-bcae-4880-8597-d72a4ae52fa1-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230314

--===============8530696538658666289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *69389f9b4c8f7ed697df809d534f0629a18c46bb* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 64 skipped, 0 masked, 0 errors.
Removing 14 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 14 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8530696538658666289==--

