Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50795C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:31:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5598.1788327104284349618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MGPvKGR6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JnT37uZa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0609a0b98-56eb2d84-613f-49e3-a5b8-4d60be1f73d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788327103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F1d19LE/KQ2e2JbO702STDS6W3Qm9xWNn/SxmFZZH5k=;
	b=MGPvKGR6G5fnfcP0o8dqBs9FaWlp1iMD4g9JsPUqwfD37UIKRaoJebTeq0y9ZRdE
	zR5KK9mDCinIQLsnXMOb0SF5VbDEO5WraP7smDz+t2kzQOMGg7a9w/ptU4FBKvBWD6T
	6yDl1oXzACc3CJ/y9KuEkefV6sEsRpmoaCmxb8+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788327103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F1d19LE/KQ2e2JbO702STDS6W3Qm9xWNn/SxmFZZH5k=;
	b=JnT37uZaTL7RrYxL+nCwVNT5eMPiOfJYZ/TzFM5w3ziN5xS0VmmH4RgHtljjtxMC
	hfy3EIAJZS0uTZvxRSd65OUFHUDn3xbqyMMv9d3Ua8uN4WdfNsW5dDNwMZkTlP94tVM
	ZAeOS1ZcnMpF8SxuJ+FiGvO+78uC8YeWyVIp+5HE=
Content-Type: multipart/mixed; boundary="===============2418650404119539215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-runtime,go,go-crosssdk-x86_64-pokysdk-linux,go-cross-x86-64-v3,go-cross-canadian-x86-64:
 upgrading to 1.27.1,1.27.1,1.27.1,1.27.1,1.27.1 FAILED
Message-ID: <010101a0609a0b98-56eb2d84-613f-49e3-a5b8-4d60be1f73d2-000000@us-west-2.amazonses.com>
Date: Wed, 2 Sep 2026 05:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244880

--===============2418650404119539215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-runtime,go,go-crosssdk-x86_64-pokysdk-linux,go-cross-x86-64-v3,go-cross-canadian-x86-64* to *1.27.1,1.27.1,1.27.1,1.27.1,1.27.1* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1986 entries from dependency cache.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2418650404119539215==--

