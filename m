Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D08C04A6A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:08 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.129655.1692086043999019562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LuZ8bdRq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZiMtI9LW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189f830072f-65d52864-851f-4e63-bc5b-2f225c72f6f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BvATY969yxS7Ukvo4onF9GZN7BlXIr5Yw34bIHEz+Z0=;
	b=LuZ8bdRq43sEU3on5AChRyzuQ8FCFIIecKm5nhdMnT4amJdV3SeFkiC8PXWvnNyQ
	15s2uIAPVrsswv5kVe9LPpiG6qE4sJ/IJC/TE8RR9y1peADQKFF7Qs27StatkXqcgY2
	AY+nPRsWJrOD3Fup6GxaVcn1UR9NG6oPYXJMWw1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BvATY969yxS7Ukvo4onF9GZN7BlXIr5Yw34bIHEz+Z0=;
	b=ZiMtI9LWqkoMvz47qGHSDdSpXWDG9BHbSAoM/l5PhdnqLnYp2bUg5yT9sWUpnahG
	BX5IDfEgBvOSvVQIc2udAbsC/CHEYjsMTAfRDEkteeFO+lLBncP3Y0GYQvn57hOxDzp
	eOIR8r4JspuKQr88mq0MoS0yd90FhUq/24a5IatQ=
Content-Type: multipart/mixed; boundary="===============3167712028593582651=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to eeec6b867af104a93a615a285a29fab91d8709d4
 FAILED
Message-ID: <01010189f830072f-65d52864-851f-4e63-bc5b-2f225c72f6f0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186051

--===============3167712028593582651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *eeec6b867af104a93a615a285a29fab91d8709d4* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake puzzles' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1804 targets, 42 skipped, 0 masked, 0 errors.
Removing 12 recipes from the core2-32 sysroot...done.
Removing 11 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'gnome-desktop-testing' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-desktop-testing', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'puzzles' has no buildable providers.
Missing or unbuildable dependency chain was: ['puzzles', 'gtk+3', 'gdk-pixbuf', 'gnome-desktop-testing', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3167712028593582651==--

