Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F27210FCAC6
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14649.1775054158767052482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2Zd2uQCS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JtGqxn2D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d4978f8e9-7d7b43c9-7d52-42db-b7df-38e90630829f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GQ1t68mudqOWIp3dPEC8qtxbXHAhyU43qOU2mb9My0s=;
	b=2Zd2uQCSR2Ld41EASAgNqIz8f6F/qzgnxkTtoSWUx88KEgx14AmimDqrDrPcPzW8
	T+kc7jxvNBTyJxzHDrZwJxmOTykDmFNj6gP3WDOCsrzVFD56pulcsjPBSsXUnMqBP7F
	5J/7VyL13N+HQJdb6DNTOe4vX3Yge4FoDuL8P5iA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GQ1t68mudqOWIp3dPEC8qtxbXHAhyU43qOU2mb9My0s=;
	b=JtGqxn2DKKkqW5TqfTHxhYVtgHzMwms6n5P9Jr4JOEwOnykqU90sO43U4D8qgxO2
	YSzy0/+YohcgwylMcqg2zfJe4saF1emwL4bgctc55d9GLf1cCF7Go8Ksq6CeAwWA4xr
	T5l9hX08QC97TLVL7aaP4oOWofWyxQ+WQnR3wQrw=
Content-Type: multipart/mixed; boundary="===============0794810696116263245=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202602 FAILED
Message-ID: <0101019d4978f8e9-7d7b43c9-7d52-42db-b7df-38e90630829f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234363

--===============0794810696116263245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202602* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 59 skipped, 0 masked, 0 errors.
Removing 37 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 35 recipes from the qemuarm sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0794810696116263245==--

