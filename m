Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC9EC88C96
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.3714.1684186748009481278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MKyAaSHj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a5cfd-8e475401-6177-419f-bbb4-c2f30967619a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0ut3OOxv7TRu31DU09AXd4eSWpPdveMk7m373wsO/OU=;
	b=MKyAaSHjLz5c0mO8WH0ZF5RbKAGy5c/a2z6l15Me/d8qe02n7i+8sDr5RVS16pYu
	EXGAJ12D5IVUqo7fGfX52h4qyKfizZF0NioUad5YgXMARKVxt3dAhSvDXQNd4oWqWq+
	q1WDrmdO0J28zJhGdUC09ptQuJ3k/hb8uvo/zTbk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0ut3OOxv7TRu31DU09AXd4eSWpPdveMk7m373wsO/OU=;
	b=CJJs4QCBodcNM9Ib8/ISUiUFaeIH3UBnSCOVAxS4PfdqmLDfJPN/Dln7O/LgcIb+
	AdLgTiBd979a0P8lkgVPVAiYNgtRKe1pIxLBMI+9K2LYyLasYqrdINBCFiV2rPFw7E7
	vFccjHsD1i1PzWmUP2tWTyhx7AnAZ5tBixQjP2vU=
Content-Type: multipart/mixed; boundary="===============4586864494485984813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 4cf3865a258f4db7ff94bd383e7f282e7e16aa53 FAILED
Message-ID: <01010188215a5cfd-8e475401-6177-419f-bbb4-c2f30967619a-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181355

--===============4586864494485984813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *4cf3865a258f4db7ff94bd383e7f282e7e16aa53* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4586864494485984813==--

