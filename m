Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84375C16B13
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.129655.1692086043999019562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FYjV9Vd3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NezxI+iq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189f830065a-014048f9-ef46-443d-9ff7-7a9d929c17c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zKgLvGOA8K7WTIB2mGtZC5a9XTegczfEmkKIjRPFXKY=;
	b=FYjV9Vd3FthDIKzdGErYe27Qot0h2Uuzz2l0UA3cRj0eDmvxLBsmSSTAto9zCriY
	WSAZvVV4rY/kO3nUWcDJ/b0zT5CH33HuIt8Zw8ABXo4fI8yN4/Rlvh2lulimcM4JXMb
	q4JqSU+UdBIgqdX2ramvjJGL18DptSlsui2nlQ54=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zKgLvGOA8K7WTIB2mGtZC5a9XTegczfEmkKIjRPFXKY=;
	b=NezxI+iqf/GNxKs+GTg673SkuEBr9LHFSpsdi2MC2wDqJBlTHmtoLvokyKuIDae/
	uWX+vg0YTyGfz91boe0S5kMiFetloJffCJiU+IDPweo6UmNK72twK+dWFCXdzzGTvjt
	5yqceQZ1zKwHhYMDWKWsvwnPAB7YSpJb+4c3NeE0=
Content-Type: multipart/mixed; boundary="===============2715781585751077813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.22.5 FAILED
Message-ID: <01010189f830065a-014048f9-ef46-443d-9ff7-7a9d929c17c8-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186029

--===============2715781585751077813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.22.5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake gstreamer1.0-plugins-good' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb DEPENDS on or otherwise requires it)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
ERROR: Required build target 'gstreamer1.0-plugins-good' has no buildable providers.
Missing or unbuildable dependency chain was: ['gstreamer1.0-plugins-good', 'pulseaudio', 'udev']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2715781585751077813==--

