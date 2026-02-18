Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F883E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1383.1771440091132418618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FGjNYQTX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WSRgqos/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720eac29-49b6279e-f6e6-4db3-9a7b-dfcdb8198430-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440090;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zlRMi8uPoFTo+HeofSWNmWNMXzfuLEwjZSooCJUBjtQ=;
	b=FGjNYQTX6bKg/2V0eQCNjrvKDWtNu8q4Ti+NQ3mpCuWNPps2WWteXG3pa+haV1Eo
	xehz6IKzB68pjiPFVfes6tZafVoJo19CmCH1mozMJ9D+TD/+bZQtbvmErlqwR9LIGCd
	3spLfSk8tAt8k9vkceCzxhE/eJILDae03TJQj3fY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440090;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zlRMi8uPoFTo+HeofSWNmWNMXzfuLEwjZSooCJUBjtQ=;
	b=WSRgqos/10/9kuafN0WU62ujQZNSB316CCVad2ZdUqys9dZcGH6mHjFZhHVfnH9b
	6hzXPznrecOE0XeFrOgLFbAW2PQzZz9lqrpvgh+J0ufD8HM5mZF+C9yLeDVYZnY2wYJ
	7TXy9s+/h60I69/urH2VGby8UAcsx6v0eRCUmriw=
Content-Type: multipart/mixed; boundary="===============5520142064493639097=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] grub,grub-efi: upgrading to 2.14,2.14 FAILED
Message-ID: <0101019c720eac29-49b6279e-f6e6-4db3-9a7b-dfcdb8198430-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231316

--===============5520142064493639097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *grub,grub-efi* to *2.14,2.14* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:41:30.323706)
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (09:41:30.324538)
NOTE: Directory listing: ['downloads', 'init-build-env', 'oe-time-dd-test.dat', 'command-2-cmds.log', 'upgrade-helper', 'command-2-write-config.log', 'README', 'tmp', 'conf', 'command-1-plain-cmds.log', 'bitbake-cookerdaemon.log', 'buildhistory', 'command-1-write-config.log', 'cache']
NOTE: Retrying server connection (#2)... (09:41:30.434745)
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 59 skipped, 0 masked, 0 errors.
Removing 6 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5520142064493639097==--

