Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE4DC27C6D
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.129527.1692086043309543990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hqS24W2Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hQWoZ29s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f830001a-d7854b03-0af3-4e1d-96e9-e7df62ca228c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wMgXMtir25RapYm8L6sSNlW0wI+1j3y/p6vYoHbf2TE=;
	b=hqS24W2Y+hxM/E8bH0BgvUv9m+Q3k8wq1kKmd2TcmGJ0YkDWGKiuHNx8A1zIIc+v
	S7r3SuVvCGxtjfdg5/dEgTHXEOhKdbog/gEtHA6dyi512MzCPdnx0D2bSAYEdoz+YDT
	EKQ0945IAodXuzska8wz7kIxC3XwaE4R+17/gHcs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wMgXMtir25RapYm8L6sSNlW0wI+1j3y/p6vYoHbf2TE=;
	b=hQWoZ29sGFy9u/ye+FvS+SsbNX5dEnt2YbJNcRcfELYUtIOyO+hzR/AX4ToPjXMp
	8KgEe688oD6Fa6mtH2kLc/uO0Kz5Kzjqp/GvDk6KBaUf+LqL1DGNvc6pqOrGI+6Ivhs
	snIzeYoBKxsUQ3AkpTFkQQAd35pZt3gBYBdTq1eU=
Content-Type: multipart/mixed; boundary="===============2026561916445587406=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.4 FAILED
Message-ID: <01010189f830001a-d7854b03-0af3-4e1d-96e9-e7df62ca228c-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185994

--===============2026561916445587406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.4* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake ethtool' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps', 'systemd']
NOTE: Runtime target 'util-linux-setpriv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['util-linux-setpriv', 'procps', 'systemd']
NOTE: Runtime target 'bash' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bash', 'util-linux-setpriv', 'procps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'ethtool' has no buildable providers.
Missing or unbuildable dependency chain was: ['ethtool', 'bash', 'util-linux-setpriv', 'procps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2026561916445587406==--

