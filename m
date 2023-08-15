Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131B0C27C56
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.129651.1692086043358115216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ooqo5kfS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B6BPENuJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010189f830005a-3ddeac25-bbbf-4a80-adc7-28b05846b3e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tfqw+5lNAYOoPdIPckW9xWGDMOPyjL42xKm3Rl9F2LQ=;
	b=Ooqo5kfSfmUt8G2PjD1XyLAo+IUM7qKxW5MEAp5Z/emYv3N5lnxDTyMHnIHZP+5f
	5tLiub85hiezYylvsRDMhyYE+c44q0hDUKMdWQ0wEuVr2UehQ+4q9hXfWkdPqckRnyw
	tnF7T7D6OZAeICURntFQcJ7Z57FZATmIMymLlOE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tfqw+5lNAYOoPdIPckW9xWGDMOPyjL42xKm3Rl9F2LQ=;
	b=B6BPENuJegGlzAJaY4ssMnebMGbKlaTPZ6A5K0xAeFTji2kYvvVyJ9Feegu1dZJQ
	g9igyytlOCwwZkmBPk2E8+4sFDcXGJ0Yj9+BCqjfhwvHZiJ/EQ60/yVpWD7c/Ec/Eoa
	lqZ1aDBD4+jaQ9jnuZ2U+suWNxxNTNnHUQPMd1sY=
Content-Type: multipart/mixed; boundary="===============3846689444102666355=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] groff: upgrading to 1.23.0 FAILED
Message-ID: <01010189f830005a-3ddeac25-bbbf-4a80-adc7-28b05846b3e2-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185998

--===============3846689444102666355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *groff* to *1.23.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake groff' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps-ps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-dev', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-start-stop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-start-stop', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'groff' has no buildable providers.
Missing or unbuildable dependency chain was: ['groff', 'perl', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3846689444102666355==--

