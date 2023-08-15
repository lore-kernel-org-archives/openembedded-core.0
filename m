Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D584FC2FC2C
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.129638.1692086041509693475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DK1+EgPO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SXzmukRf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010189f82ffacf-4ce884a0-1938-449c-a5ed-a4c6e9ef9e10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s/tC6GrwBrj7JmY3tEJTmIlNK9kPKG07qsbL0dhAdH0=;
	b=DK1+EgPOko1KzoCTWesWDXdzgYVBPQExIjcMzavs6D9+i/DkHeiLB7FSBGaubpb+
	K3S//Yh7lFsymsqRjF99d0fHN8Bc3MGEr741cL88XCcRdau1D30EzHZBoYCuL94D4Dt
	vYoOFq7jO2i/2OF5oZN05TJcQ7R4W6e1shnTF5PQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s/tC6GrwBrj7JmY3tEJTmIlNK9kPKG07qsbL0dhAdH0=;
	b=SXzmukRfPlTSGfWsRt8pIURLKpMmOZ5cv4/a4DbS20hDWafo387r7u0+Dh/yYWUR
	hsqtdoR3fQJ0u1KxuzgQgeTNtEx7vt9NdFD+kVWvCNefqA3dLm/re1Ha5Fs+EPXtDqd
	7sB8C+jdsBY7rMpIB10iCN2FM/GZ5DNYdgvuWHd8=
Content-Type: multipart/mixed; boundary="===============0209008311791265395=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.0 FAILED
Message-ID: <01010189f82ffacf-4ce884a0-1938-449c-a5ed-a4c6e9ef9e10-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185951

--===============0209008311791265395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *1.0.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake createrepo-c' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'createrepo-c' has no buildable providers.
Missing or unbuildable dependency chain was: ['createrepo-c', 'rpm', 'dbus', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0209008311791265395==--

