Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4E4D1170A
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14081.1764566269547724683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iLsbmkdk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tZNuY7vH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad8587ee5-c00d9275-9b07-4c22-8df9-0e9636c82d9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UxAMqaYulnUBK0BKJeC0UeLFhjqNFxYq+a3vaDUmxaY=;
	b=iLsbmkdkcWP/5FnyT7Ab6o1aviScOn3S0gOtSy5wAovsLPX91ILD7UtefFzL6DXW
	fEGMFbd4hwLh6bsGOHnqaZW+93jmtukXEl8Ua5Li8jLs5CrO5xwbzORehSAxsILvfrs
	Y9I2AldL+YE8jJS8oqh73eFVqfL3xQL8ghBcx+ds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UxAMqaYulnUBK0BKJeC0UeLFhjqNFxYq+a3vaDUmxaY=;
	b=tZNuY7vHxrm+i/oQko2QAzOkjxn29LPeWF6+xIi6ioq93SR7tPAYpZQ7/wfFvBmB
	j0/MHnzTRN42pyEqWxSBYgemHyVYe8SNcvBBi9FyoxeTMfmnYz8qW53Ilrmdov+GTKZ
	OmHU4dfiLvRStS/Xe/wT7iAg52MMkUfnJfirBEKQ=
Content-Type: multipart/mixed; boundary="===============2528504112607874425=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] base-passwd: upgrading to 3.6.8 FAILED
Message-ID: <0101019ad8587ee5-c00d9275-9b07-4c22-8df9-0e9636c82d9f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226972

--===============2528504112607874425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *base-passwd* to *3.6.8* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake base-passwd' failed
NOTE: Reconnecting to bitbake server...
ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has already got an assignment.
Please either disable the fragment or remove the value assignment.
To disable the fragment, use 'bitbake-config-build disable-fragment machine/qemux86-64'.
ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py", line 262, in fatal
    raise BBHandledException()
bb.BBHandledException




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2528504112607874425==--

