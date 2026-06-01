Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75513CD6E75
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1564.1780328135141851594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kMk+YkE2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OFe6tFux;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d37732-64d51028-9de1-43f2-89ed-4caf01cb13d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OZbgK1b4x/hCYsf4DIJb6pYJDQM/h0gf97pt98/hFPs=;
	b=kMk+YkE21xMbX51bpJvNbEnqEBOPMmmu6EGp2aBZoCkdcyaol5u7HwC/CD0P7iyD
	RxdliXoHKgaKW7RMX60ye82tpieubcd97/CcrkHN/DS+gMEYdKbAB51x275mdCUs/1o
	yZyGIs+b6yVXtNQe+QfNxVqnE0V/ZTCxyxF7KNr4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OZbgK1b4x/hCYsf4DIJb6pYJDQM/h0gf97pt98/hFPs=;
	b=OFe6tFuxGnw8DIDgIrwAW91g8lR+DWEg2BmIQww4Gd3ME3HQDicj/OthzisdiWFz
	SOwuiHkjuipNImCBNMtibZAB74TW064WcCTKMX5o29dCl5S5jfxwZIDUmztcglofOaF
	teQKeAldINBuazwzICtLuUQu7H1wnFQ8EYPxAyCM=
Content-Type: multipart/mixed; boundary="===============1536983986241080226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202605 FAILED
Message-ID: <0101019e83d37732-64d51028-9de1-43f2-89ed-4caf01cb13d5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237865

--===============1536983986241080226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202605* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 57 skipped, 0 masked, 0 errors.
Removing 11 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 10 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1536983986241080226==--

