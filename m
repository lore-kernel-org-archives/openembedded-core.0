Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22593C71140
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.27766.1748786123737888376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hJ7DtUSl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ygj8iYLx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc69cec-6956396f-c5c8-4308-bc76-e2676afd1500-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CMnJoQlc4wvsfnCh4N1r27hcWanCCGpJFTWkMHM5vOM=;
	b=hJ7DtUSls9fnn3YeUtcPyimcVJAwdVNItSRHWn7tbCsWenVb1LAkJ+RfDNjQoqNl
	Jl3VGVuHbMM4gPt5iF3GCsTuOA7N0F7U7yuigYMgOermbnHUdQxC479ma1bF/jeACLp
	wmgegdtnfYXTia8WoWQ+GPz4vutSIjuy3PfYu1/Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CMnJoQlc4wvsfnCh4N1r27hcWanCCGpJFTWkMHM5vOM=;
	b=Ygj8iYLxrBf1YpxlXRbYsqrdffhHq4GZLNILnRjYhqUxLgon+VDiLcKinN/9L32X
	JtUCWKu66T7kALIvg5j/tH88tX0jenjZLExW3/aYJIoWMVIIrqJGq5El8ZW2R7cNVLJ
	3ktv1EEB0WAvtnkIDID0qVwaFj7GHFG8LUpSaPN4=
Content-Type: multipart/mixed; boundary="===============4534039959270300468=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>, 
	Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-native,systemtap: upgrading to 5.3,5.3 FAILED
Message-ID: <010101972bc69cec-6956396f-c5c8-4308-bc76-e2676afd1500-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217568

--===============4534039959270300468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemtap-native,systemtap* to *5.3,5.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemtap -V 5.3 -S c4fc655170b534478a6b131292b987630c7c0865
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (935 cached, 3 parsed). 1919 targets, 39 skipped, 0 masked, 0 errors.

ERROR: Current and upgrade versions are the same version


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4534039959270300468==--

