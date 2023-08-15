Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D094C2FC00
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.129650.1692086043226266195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f9cusbB/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FeNKTo2g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189f82fffd6-b1a38181-9a40-4c95-8609-4379c6bdb4fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4RH+V4Vm2sEPzRHbQVzuY32a9lYQJMBYeyF/8uLmagc=;
	b=f9cusbB/YVj/ipAH5y6Nf8f0wNIBWoA0MadysRjvZfuX8ZrW3rHuBBwx2Z4y8ecU
	CmFa7eKIM808qRfRkHpAu0fgYTLMra+SmsxNuJ9bdabNvxrLxPjHKQgxrtM/A+Oog16
	3I2DrkIgJjAETZmJe1AC2W/ZY5DXLhcZlJcPrahg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4RH+V4Vm2sEPzRHbQVzuY32a9lYQJMBYeyF/8uLmagc=;
	b=FeNKTo2gipFT1lOH8tni5yKnEuZ5L7wlof0mtUosRAsGDz4AEJ8cb2YkvZVRF9fD
	CAds4+haa34DFLakC2onbf7ZXSLKFbR7v8qq1BGkNtPdITM5Qpw4pZ1g/xdeZNbqGb1
	/ruAeXCyCUir7958w/PXbv0pZdm3ecirLjMeR0mg=
Content-Type: multipart/mixed; boundary="===============4400088076131973085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.11 FAILED
Message-ID: <01010189f82fffd6-b1a38181-9a40-4c95-8609-4379c6bdb4fe-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185993

--===============4400088076131973085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.11* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vala' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'gnome-desktop-testing' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-desktop-testing', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'vala' has no buildable providers.
Missing or unbuildable dependency chain was: ['vala', 'glib-2.0', 'gnome-desktop-testing', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4400088076131973085==--

