Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8BFC25B4F
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.129640.1692086041991284407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KgZl6Hx5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XuhFqw2c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010189f83005a1-6e7cf110-956c-42a8-93fd-b9753d7b121d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ab7teUYJcsMVIHhR+dpjaDNW4ZYERk2UgWC0XWPiZcs=;
	b=KgZl6Hx5PQN5eEMnYnhITk/jdIAn/842qlQtkouOvCnpK0LK3S3+osyWpESRG/W7
	Hrxb7TCQmFgT5RJjHctANCBFFigYS0f606XAJWTwc2qY2IqetYI7s9NNaR4cMK8QbUK
	Xo7E0U3yA6DT50SjdACffz477EzwHT+M6N46b+00=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ab7teUYJcsMVIHhR+dpjaDNW4ZYERk2UgWC0XWPiZcs=;
	b=XuhFqw2clfxkdEPhTZ/KTkoAVx0kt0vt7TPetecTFNfDGOVOubRcXGEKXP6hs1CE
	CDySibaXisRtSAFzzumooCpqnP3U2kKRJQoPt5pRuzuWkZEqHAVccwYumaLmsaA0v8K
	dhTmL395B0+hiHYwZzEu8K31Btzu2GRYJHOoGPMo=
Content-Type: multipart/mixed; boundary="===============3648926198008137214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.13.10 FAILED
Message-ID: <01010189f83005a1-6e7cf110-956c-42a8-93fd-b9753d7b121d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186031

--===============3648926198008137214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.13.10* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake lttng-tools' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1804 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'lttng-tools' has no buildable providers.
Missing or unbuildable dependency chain was: ['lttng-tools', 'procps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3648926198008137214==--

