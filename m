Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C430CC25B7D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1242.1715794337741021011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Oh4hAuV2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=srM4qG6V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f7d4fdcd5-c1471400-20b7-42cc-9a98-b9ff9a95831e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qYcszQ0m3by+E8r5lWPH6OzHOkfrBLGT1FZY1t4Ve10=;
	b=Oh4hAuV2Zp3RYUZt2LU/jqMzqYUzrVuM0ekOD/0qKlLoVy9DSRUxbBSkrVOvQjkb
	YQMZoXWCWGSWReHvYuG+N8UfsakOkgkgEz8sBQZawtJZsAAtfnqNrIJSmf57i8Mp9yx
	WiaGOezwodT/zOslFJkQUHDK8uKEwXaCho2176tc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qYcszQ0m3by+E8r5lWPH6OzHOkfrBLGT1FZY1t4Ve10=;
	b=srM4qG6VyIim+d7qJQKD6IW5Grcu5DEnXVwy9obEmbtbvnkM1SmB6QGbxz6eQJIp
	QyydLPsfQc2JpVyqGjqK4LnpkKWrdO6X3xcHFOxPUQgtCG04Dm43b/IpNbJ0heIsfks
	Cju3fakHvHe5ezUJFDiIWR1MGMWVn9k68e0NiW4w=
Content-Type: multipart/mixed; boundary="===============3045058547696484252=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-13.2.0: upgrading to 14.1.0 FAILED
Message-ID: <0101018f7d4fdcd5-c1471400-20b7-42cc-9a98-b9ff9a95831e-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199313

--===============3045058547696484252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcc-source-13.2.0* to *14.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-13.2.0 -V 14.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.

ERROR: The gcc-source-13.2.0 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3045058547696484252==--

