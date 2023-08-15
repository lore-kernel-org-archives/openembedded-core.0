Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82E4C2FC2A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.129512.1692086041792233387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z9EBFrAi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EzXNfJ0a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189f82ffa86-c8a8c3c2-0794-40ef-84f6-3ff29f2c7909-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H6I/9lZdNhD8QvafIqbfBtPgpCLIL58lWdSm9ia/jGU=;
	b=Z9EBFrAi1NTCQZoymXF31NFtOtnVksuBQpQaoCjQumzI3CSd0Ly1qrKq0FKHSErp
	1X1c+ng+TJ92yXYhbpcNYeF2TRisFlbdN5VfhATLOvMJ8zWzk5jOzBEjZDEi8YzPn5V
	e8akyKlz5oPK0YwfbVJ68naJSeRAr6vTqsV0XcwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H6I/9lZdNhD8QvafIqbfBtPgpCLIL58lWdSm9ia/jGU=;
	b=EzXNfJ0abF0B0NKFcLIWa92s6DPiNveI32Br5M0quIuT6z8b7k6x5VljhHrC03EV
	4mYpuuwctWbTs4B6oc3hlPic4vmXtt/TGr4DR1ZEqstdgRunX+vBhNdATU7MsUdx9Q/
	sY36+Bp3XLUsPttH66n7OMlJ0eBrMPZeY9VveVXA=
Content-Type: multipart/mixed; boundary="===============1069523055926319281=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.1 FAILED
Message-ID: <01010189f82ffa86-c8a8c3c2-0794-40ef-84f6-3ff29f2c7909-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185953

--===============1069523055926319281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *254.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake systemd-boot' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'systemd-boot' has no buildable providers.
Missing or unbuildable dependency chain was: ['systemd-boot', 'util-linux', 'procps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1069523055926319281==--

