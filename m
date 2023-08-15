Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B31C25B74
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.129656.1692086044266368194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YnMde5sv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=djHROree;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f8300368-0500bd26-107f-48e8-9a34-5a9f3e42b678-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CXCsxGQl05u+R54Mts3JuZsHS6jwjvDgACkjeN1Cetg=;
	b=YnMde5svqUbHpHM0iirz7UG0zyQ8mZx4HPUNolPUMJ9W92UksZ9mvldKBe/ULsP4
	tfruoRDovhkWs1/6bPPKh2XyH2ofq/mRl63AMsg/Df+n3FQX8XcpMPGifkj+qDjW3Zv
	kSyNUPHvaSSm2Wb+9pL8xOg760QhaKjVCnL+xZB4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CXCsxGQl05u+R54Mts3JuZsHS6jwjvDgACkjeN1Cetg=;
	b=djHROree9XwbsERJAr1dKM4ti7iySDv8VOcIZ8f7Zewh3CNs4NPqzKZcTQH5ZvH/
	lJlJ4lQttZ3XkRYuxVhRLcNdqHpOC+jx0Z2tf4yXjab+iF+7aHKh7xBrjOlHRo0nYRe
	ePf/OPxVvSG+0gG1e8zBtTmGbJXm9xHMOjjmdUWU=
Content-Type: multipart/mixed; boundary="===============2697304287247596572=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.51.0 FAILED
Message-ID: <01010189f8300368-0500bd26-107f-48e8-9a34-5a9f3e42b678-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186024

--===============2697304287247596572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.51.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake pango' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'gnome-desktop-testing' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-desktop-testing', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'pango' has no buildable providers.
Missing or unbuildable dependency chain was: ['pango', 'gnome-desktop-testing', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2697304287247596572==--

