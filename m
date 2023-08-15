Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBA3C07E8A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.129659.1692086045002761654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cVoCqqqQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qMUX77DH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f83006dc-fc88a4e4-3044-4338-ac97-67c456b26d9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=41geHY/wRqNZFgQBdcq6Xj4J7Sj4ByFrtTITn1LQIXQ=;
	b=cVoCqqqQh/3RFf58eMDKmCSYQ/nskI5Dlax8QsUqHfKyKhzTg4uguxnqjHr0sUEw
	7rpjCUM5TdV7KtDkknMAb/gN2P6zfnJmuYPDT4XicO68EoD/pvC7eQwLHaOfCldaSFR
	Zysb17pKwHMvqaUeuwEqDqrYCvo+Vqkv97CgrajU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=41geHY/wRqNZFgQBdcq6Xj4J7Sj4ByFrtTITn1LQIXQ=;
	b=qMUX77DHfATLWD8UsJcxs1o+GBw+9tU5MTlt4QJvr2Dox8bEmjMWjicR/+rFZJNC
	YOPni8SB5VX0wiwIHElJqapVZLFJjL2/WAr16wimEIBn/EcYMLSoBe7UlYUI9Chh943
	lpAbwZ8+8SJK0Fnaadh7uHMZDkm35CQOB9zuwlJ8=
Content-Type: multipart/mixed; boundary="===============0019388246988657153=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.22.5 FAILED
Message-ID: <01010189f83006dc-fc88a4e4-3044-4338-ac97-67c456b26d9d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186044

--===============0019388246988657153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.22.5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake gstreamer1.0-rtsp-server' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'gnome-desktop-testing' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-desktop-testing', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'gstreamer1.0-rtsp-server' has no buildable providers.
Missing or unbuildable dependency chain was: ['gstreamer1.0-rtsp-server', 'gstreamer1.0', 'gnome-desktop-testing', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0019388246988657153==--

