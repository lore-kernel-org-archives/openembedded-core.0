Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730AEC19F4F
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.129531.1692086044636554281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MJ1/dC5S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DHEiQvP9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f83005f6-ef97e6f4-5065-45b1-850e-543dcf52f538-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MqX/Nl52zMVxsTpB+TnhjnWssBxaf7kor5Z7dgdqUdo=;
	b=MJ1/dC5S0SGavsVEgTQHzlZt4vb6WT8n6Xx26RMmgVAZ+xNTz36B4FSVjPkQ/9zD
	rG58LF2waHaSyIE9SZRq35M0NrMxrh3qYBTjb+14zNhIB2insqrBk2WwT95mOWl9v5n
	EuMUy/QTFwHZ+FL30fWjK8VjGQhwW518GDFd7+fI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MqX/Nl52zMVxsTpB+TnhjnWssBxaf7kor5Z7dgdqUdo=;
	b=DHEiQvP9KQWKXZ/g/mhmOLEEgAD60neSPAAp1bHsUVZ16szu7lljQzvBHjU13yUe
	oBc/0Ric8Z3gwPbpJUf3V3eVVcwHSX0Q8v82y6fwOfTMFVJ/c0k8n0vaZi4uSssIxW2
	EC9qkmtLgdqglSnOo2Co0jEy1T8PEFpxpskNAwnY=
Content-Type: multipart/mixed; boundary="===============5245361997082875303=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.5 FAILED
Message-ID: <01010189f83005f6-ef97e6f4-5065-45b1-850e-543dcf52f538-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186034

--===============5245361997082875303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake gstreamer1.0-omx' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'gnome-desktop-testing' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-desktop-testing', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'gstreamer1.0-omx' has no buildable providers.
Missing or unbuildable dependency chain was: ['gstreamer1.0-omx', 'gstreamer1.0', 'gnome-desktop-testing', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5245361997082875303==--

