Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11511C54754
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11029.1747312308185867686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1uOtpHYm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KnOUDFOj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010196d3edecab-46b1c5c3-2e3a-4c9c-9609-541bed371299-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CwnQd1+GU1W8y3ewgxBOt1rj8eB+rNvdpyfTCInACAo=;
	b=1uOtpHYmEZOcKHcfsSQ+r/CrtbTMWF/k94DKXQoZHjytC5Xz/TlAvzd5awePh5aD
	oUU84AXrYRcwDax8J2DrrRTwhxoCv//rkuLOXIR5w0gHx9pYX86sjwmmxJCnkzEPquO
	uEMw9ntIBT29C2x9NjlsYYy0bWLI8GIHCIUZXgyw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CwnQd1+GU1W8y3ewgxBOt1rj8eB+rNvdpyfTCInACAo=;
	b=KnOUDFOj0pqYdKFJ0eo5YGLV6CI+BPCmASBx33hL0yUJysjCHHpjo0sGtM3t33rS
	H5TlyASUaL42SmVYrhO5kzK773roX9Hv1+2vzheggo+WEBbUP+qh+g2Dv5Be3OIMdHE
	9SG5yro3k7GT1j8jAHI8b5xGnO/XZkAcCk0cxbEc=
Content-Type: multipart/mixed; boundary="===============6242085302042849372=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>, 
	Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-native,systemtap: upgrading to 5.3,5.3 FAILED
Message-ID: <01010196d3edecab-46b1c5c3-2e3a-4c9c-9609-541bed371299-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216586

--===============6242085302042849372==
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
Loaded 1916 entries from dependency cache.
Parsing recipes...done.
Parsing of 939 .bb files complete (936 cached, 3 parsed). 1920 targets, 39 skipped, 0 masked, 0 errors.

ERROR: Current and upgrade versions are the same version


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6242085302042849372==--

