Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D76C25B76
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.129522.1692086042689806630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D2/FwRhk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QZoLrJmv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189f83004a8-65d5cffb-299a-4282-b6b0-e1ca83ea34fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OZ/+b992GWntwbHjcR4HsnZQyfDWCBqqaO72pPcNaWA=;
	b=D2/FwRhkRfJDxj0vUIDwYzSvkZNxXjbMvw/EvrR7y/6w0PTZ6ZBW9qZaElt/LoiS
	0pQHLH0Q7hfg/e9lajToGidLy1ad6r9n0Vaoak616QFQtgprzdF6tQWLLIKMA2+0KiS
	Lfafv+ngRHXawRX1+gzRqsBWvuYTriLdhOcj3q5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OZ/+b992GWntwbHjcR4HsnZQyfDWCBqqaO72pPcNaWA=;
	b=QZoLrJmvdAAnhnKLns7hyUj2daUaayedPxYaelVH92iGEiMeGyO0a/yEzXDZgG9k
	6OepcfmpdWhsNSrFT01qg1Ogb9l95ZOFzEnJbfLFD+NRlAKB/ot9N/i35Mprmoml6Wz
	CMFwHSbUI8rNV+opAX9AIJckMeOSaOARqKQNaK/0=
Content-Type: multipart/mixed; boundary="===============8783081368829947946=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.250.1 FAILED
Message-ID: <01010189f83004a8-65d5cffb-299a-4282-b6b0-e1ca83ea34fd-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186025

--===============8783081368829947946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.250.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-tools' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps-ps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-start-stop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-start-stop', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-dev', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'liberror-perl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'vulkan-tools' has no buildable providers.
Missing or unbuildable dependency chain was: ['vulkan-tools', 'wayland', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8783081368829947946==--

