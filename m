Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87553C7EE39
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.107425.1682976349838626228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hY8HFzko;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010187d9351bf1-38a39984-eb16-4045-941f-390bac6770ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=71x5+fx1OdcCvFhQaH+l5VDOno9rkbgRO7VHyyZVYf4=;
	b=hY8HFzkou2lLW1UsckalPofISfyVJPQVa2gZjoUGB7/XTdJSGrjGF/Bk2C6BRI2T
	uZifMR/PR1MCElXT6r1wyTDmGAjROKwcZ1Q/TPFWDaDhg+XSlyjX/eaD9VGSzceOJLD
	o1kgr/a1x0atCXzVTzfTdUS8BI8LoRRTwgSkfsF4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=71x5+fx1OdcCvFhQaH+l5VDOno9rkbgRO7VHyyZVYf4=;
	b=B6i5j6TLo46XjAm0Fxh4+AAEZjEhCyjLSx4ifaH0meOn71D0A9zmAmddk8kn7N+4
	QpLxf4ll37ziglUVzTR2kmDDDBoR5EH+/z2GnTbYCnDMG/gDZVNWYWY40jS/pZ+0nAT
	TnwE5Ao4NfDVZAzHkZxvS+418wN1SWZNqYzYufqU=
Content-Type: multipart/mixed; boundary="===============7063097819589248848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-12.2.0: upgrading to 13.1.0 FAILED
Message-ID: <01010187d9351bf1-38a39984-eb16-4045-941f-390bac6770ec-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180604

--===============7063097819589248848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcc-source-12.2.0* to *13.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-12.2.0 -V 13.1.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:53:21.832437)
Loading cache...done.
Loaded 1799 entries from dependency cache.

ERROR: The gcc-source-12.2.0 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7063097819589248848==--

