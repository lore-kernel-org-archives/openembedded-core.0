Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2215EED615
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102969.1767267472362400124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mw8CNATa;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rlbvZGSM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b79598e8a-bd07d318-9d9a-43f8-b24d-6f2bae38d546-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MAWAY5izr8PPL5JDwu1OafxsFScL3H0HVpuhdBzX5d4=;
	b=mw8CNATai/qLbzQrKhKXkHFWgPp7ZR8r3oNLy9AV2tvW0QrB8/shWWmt6xt7HuLc
	sX9bVzMVcMZIvNntFUfByC5VLvJ0D/w7p4wSzC6tS2Can4pS/A6P9RovdEiSikC1yN7
	XjceGGigxMgsRobAR14wYjxAnlZJ+rZsnhJE7yEI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MAWAY5izr8PPL5JDwu1OafxsFScL3H0HVpuhdBzX5d4=;
	b=rlbvZGSM9w1a5VLvHhUdST47xeWxfBLxsuQRJ2otDz2zxKiboVILeo+2Sm4sgClo
	n5wjYMtoxiW51PfO3ZuY9Z9Apxw0H93vqb0aBtSvHbVBfeooiLy1JplVyyV3TFJzRB7
	1JGr5K+OpWJm2Gr91Xt84LAd2lWjttadYoKZriG0=
Content-Type: multipart/mixed; boundary="===============4925573926949877431=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202511 FAILED
Message-ID: <0101019b79598e8a-bd07d318-9d9a-43f8-b24d-6f2bae38d546-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228768

--===============4925573926949877431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202511* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 64 skipped, 0 masked, 0 errors.
Removing 10 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 8 recipes from the qemuarm sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4925573926949877431==--

