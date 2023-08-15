Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E0FC2FC23
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.129516.1692086042179356092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HyWIdfJR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=E7C+kzWz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f82ffa96-ea4921f1-2944-41ec-ad76-ce2604492da8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lPGVMpuIwKF94TvxHNvYbF9Oe5fBUKR8/tNlmKonwuk=;
	b=HyWIdfJR6NJ4CdrWD0N3vBmRCrQZCMth/jU3WLPcimyKm9Ib41/x0PNR9ogb5CBz
	9aIA6ghhaFQyJeE/LpnJ9+SfUAezogoaKV0n5gD0OLiIw5JmbJGRQKSDc8yLHRgdG7S
	swk5DGqn8UNbgqZL5LKj5wy3GPAC4rNC6MXg/KRA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lPGVMpuIwKF94TvxHNvYbF9Oe5fBUKR8/tNlmKonwuk=;
	b=E7C+kzWzMUwr3vOUIKjqd2xlTSUskRmb6f4mPIY5DR52ZFgdDBoA6IvC1hO3vx7C
	7hwdsxa2OdCxUVK8rYDVnTc9Rfh6ivNwEmIAHmUEX/dUSLSo1lXCcQiZ0+Uf/IOgUYS
	+Jr90Ageq5x9J6PfAj9vH5KsrOwNrkueAW5IP9Fo=
Content-Type: multipart/mixed; boundary="===============6573874863457118954=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.8.0 FAILED
Message-ID: <01010189f82ffa96-ea4921f1-2944-41ec-ad76-ce2604492da8-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185962

--===============6573874863457118954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *seatd* to *0.8.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake seatd' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'seatd' has no buildable providers.
Missing or unbuildable dependency chain was: ['seatd', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6573874863457118954==--

