Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4422C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7499.1786689400692429175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GND9H+35;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i0XdAWqk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ffefcabd9-11105cdc-ef74-4691-b630-a0a8cb35c00e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c3AWaKeZ07hXNhAxP0xkHVNVwv9qsS9jaDsOWeL249c=;
	b=GND9H+35oJzm/j05Wmzo4e4A2hZUlhdWDThWMbA2/Y/FS6RLmQie3AaqGItMH+2p
	MdZU/70Q5zYXvxTA2PXiiWNQUcwxDrNIsEGdMwoVLZQ67aU6Dg4gXd6WQPRiWpt4Jvs
	YvDscHJfzvqM661kCpkLcnuExcXkHTxsi3ADnD1U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c3AWaKeZ07hXNhAxP0xkHVNVwv9qsS9jaDsOWeL249c=;
	b=i0XdAWqk+oi0FHY0zbhXsLNytuZXROtVTy2Qshfia1waYrwvs/4zbs92c4mdmMvD
	i1k7JT2VRdWW4KNZczTU+pJ6wFQrBjP/LSK1ndi7fSOWclftYtx3pHFeAZ7qT4qs68Z
	sf1lu/bii74Bg9y6G1s9ZlEOKiOLt1ZwB0wHrJ+Q=
Content-Type: multipart/mixed; boundary="===============8206047903488552728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go,go-crosssdk-x86_64-pokysdk-linux,go-runtime,go-cross-canadian-x86-64,go-cross-x86-64-v3:
 upgrading to 1.26.6,1.26.6,1.26.6,1.26.6,1.26.6 FAILED
Message-ID: <0101019ffefcabd9-11105cdc-ef74-4691-b630-a0a8cb35c00e-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243407

--===============8206047903488552728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go,go-crosssdk-x86_64-pokysdk-linux,go-runtime,go-cross-canadian-x86-64,go-cross-x86-64-v3* to *1.26.6,1.26.6,1.26.6,1.26.6,1.26.6* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1984 entries from dependency cache.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8206047903488552728==--

