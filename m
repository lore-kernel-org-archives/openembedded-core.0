Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39E6C27C42
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.129521.1692086042667248938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OlFAWgcF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g9V3Hdmz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189f8300314-a4cce4e0-2a1e-419a-8fd8-e976480d2392-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pHNJHb0HBaY1CiRUxXRMlecX2SwpUrm0FvXzjLky3TI=;
	b=OlFAWgcFVsMJ3gAsnTtRF302lH8DBfU3vEZRnaf8QRRweTSSYXBkxKxsDW81t+Ex
	HG7vBXWSHNPyBrt6G5IxWxYHNrLrvYYr034SAPxdai+WiNDwgaY6pYriuWRGm2+tTjP
	mPfPuTtKKFSenkwXAv2WgbjGOeEcTrjKDdISG16I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pHNJHb0HBaY1CiRUxXRMlecX2SwpUrm0FvXzjLky3TI=;
	b=g9V3HdmzTDj7rc31jeovE+HBwpEwtX1bKdbqPRpPx/W+bfon8puq23uT8qUiIyIS
	d8WN2fu62DegjlnCWcaaDl/d5WoysYIGYML6nWeF0kZ0oaxqitk6HOaXQzoGt4OfW+b
	RJFAAVpV302fcQBAmD4x1MBLZ5e41OD4pN24xKvc=
Content-Type: multipart/mixed; boundary="===============2436635907878763760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.28.2 FAILED
Message-ID: <01010189f8300314-a4cce4e0-2a1e-419a-8fd8-e976480d2392-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186009

--===============2436635907878763760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.28.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake libsdl2' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb DEPENDS on or otherwise requires it)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'libsdl2' has no buildable providers.
Missing or unbuildable dependency chain was: ['libsdl2', 'pulseaudio', 'udev']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2436635907878763760==--

