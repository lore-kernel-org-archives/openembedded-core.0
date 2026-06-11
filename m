Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08976CDB460
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50603.1781195495576136043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KmlT92bU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VH6A3Kab;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb7866319-282db1e0-6bcd-4730-a201-d1bb529b2bf8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NXjoYA1EdTtcmxKIcDU0yK52u/UMC2Ge+eVl6u3l+PU=;
	b=KmlT92bUxojCfRQmcU1StG9UaB3OC5VOmhIHFiBiOXtwTKMMRE+WKzV53BtIDE9t
	LwAWscsNt+XGv2rVBR7i+36Odv7AN7IqAHZuAuoz+M69nkWKUgReb4mvMeQu+VKqOt0
	8b6mFSJ81lWagzhgYSobhD8ioj/lVMt6Zg1ndh1E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NXjoYA1EdTtcmxKIcDU0yK52u/UMC2Ge+eVl6u3l+PU=;
	b=VH6A3KabjXxeDqgqnc9YxV9N2e/1gxmBdzog8I40xHmwwPqghQbfkUTEYdiXBnJ2
	d5BsjHpPlrty8Ci0ThI2v16uAsPq7tell42JIcdquVjVQUBl7tbi5ceGJeXuRZgw0WZ
	Y6DZkvF6ksdmO852t5wINeM2LCkeuljA++PSri5U=
Content-Type: multipart/mixed; boundary="===============8559650608460386622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202605 FAILED
Message-ID: <0101019eb7866319-282db1e0-6bcd-4730-a201-d1bb529b2bf8-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238462

--===============8559650608460386622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202605* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 57 skipped, 0 masked, 0 errors.
Removing 11 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 10 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8559650608460386622==--

