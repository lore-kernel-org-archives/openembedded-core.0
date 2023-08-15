Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCBBC2FC13
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.129647.1692086042686174746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E/DHdkKq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=alUG4qql;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010189f82ffd10-6be813d1-fec5-490c-9b97-8e1d0443d4da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Cm9Mj5WMM4UcGt+wAytWO2B1pcA3xMVPokBRCaaEv/Y=;
	b=E/DHdkKqn8QJ7ZYKRHBNou6a8MXYIETo+IJPFOBrZ1HSmWO2rv0E+90OgSLPDw7D
	evYsC3sgf0voWOvSQr1reNnG37yVV+IQAlctWPsJ/SDCv7TJBEy+7A22ftPyfliAG9T
	g4sSBFL2FALwE9428y7NbdaXGgbgp84hffx6O2Yk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Cm9Mj5WMM4UcGt+wAytWO2B1pcA3xMVPokBRCaaEv/Y=;
	b=alUG4qqlcEekJyxMF8EmwTzXQ5kCc2GK/hVDoPqV/jxMym8xs+y8OQ8oWc07NaS9
	ZxGtfwgnCsBOmLHffBY7e34Hx2hqsIheyLogb6TNpIHIwfdGvi7sWqUyZuxgKP02Up/
	2JSvEvVNPsY/dGfWnQ2XrNkIKC2kM1REmaYRn8O0=
Content-Type: multipart/mixed; boundary="===============4867101476404816359=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.29.1 FAILED
Message-ID: <01010189f82ffd10-6be813d1-fec5-490c-9b97-8e1d0443d4da-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185977

--===============4867101476404816359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.29.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake python3-dbusmock' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'python3-dbus' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-dbus', 'dbus', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'python3-dbusmock' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-dbusmock', 'python3-dbus', 'dbus', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4867101476404816359==--

