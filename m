Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBDAC77B60
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10285.1676508396073967185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HMmJG/6y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018657affe9c-9cdba25d-61f5-43b1-9b3d-dc62975b7f03-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rDMYpK8gEgA3XOgCgMklkrSetNr+LOEaWj2g7y+UoyY=;
	b=HMmJG/6yqQxIWgyA5tYQhHz0vJiqL+RGci7sJs0oHbGdrrid1nBL7O5r9/kAenYl
	n6ficdMnpwPTWqqjW3WQmkFC++FNKCljZNp4BZt5XBIfL3iAvWry+KiqesqA0YFzGNX
	v4V0Z385L9MQuBi1Uexg99ITrOVlDtVvrC3j661M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rDMYpK8gEgA3XOgCgMklkrSetNr+LOEaWj2g7y+UoyY=;
	b=Rx5etQvSmXNG0NzUqZFJf9rFBUdPhosXMQAzxUHtn4S/VIbGqoA4Yyd7AXWjh2XP
	iNxsGt7EQQap2uQwCJpJkXDQ9j2TOHZ1LkL4f2Iw8VvbIYwbs7y2RPDxLv9QdWmk2mS
	4k7aL7dNBi1Ra/0yP/was4NyzbGuat2F9OIvYP54=
Content-Type: multipart/mixed; boundary="===============2070279804787473744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 3df7dba1b1f428f24cd9a242af78540a518f4b67 FAILED
Message-ID: <0101018657affe9c-9cdba25d-61f5-43b1-9b3d-dc62975b7f03-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177253

--===============2070279804787473744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *3df7dba1b1f428f24cd9a242af78540a518f4b67* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 38 skipped, 0 masked, 0 errors.
Removing 67 recipes from the core2-32 sysroot...done.
Removing 78 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2070279804787473744==--

