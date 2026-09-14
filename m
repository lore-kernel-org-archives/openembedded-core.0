Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07D8C88E6B
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13650.1789364445205141806
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aUYUwGmF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gx47QpSO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a09e6e9c6b-6b4cf00c-31a5-498b-8691-5f24a35367b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364444;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=emzNrLRUrKnc6F0Gq3c6qGa7niPoWLqyMt6YVSz9P2E=;
	b=aUYUwGmFMk1KmwLFpsSlSgLer5Vxvb6UEx5stWWPqE9e3kKyBkaIbAFwOb2VPg+n
	RW7gtnFuvr+Y7zf9Bno5ZJqjdm1QpYg7j1UGH2XWz7+okgA6oN10B7pDjHkxO0BXSHr
	U1sfKtEYVGn+HYDvcBexapPcH6E0mOMSSlU0P+B4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364444;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=emzNrLRUrKnc6F0Gq3c6qGa7niPoWLqyMt6YVSz9P2E=;
	b=Gx47QpSOmvZSePM/259fca0dPcJmadvs2z+42t62HXF9MV7DH7k5MzozRakBU6rq
	Qz/EDGP5jqwJob1uFEb7+bUek34Z/s90COJ4t+6qoiB/kUihzX6IDBleNfmhzaegKcW
	4eGi1AR5cMNkuO/cR9AxverXO0/HniUhUm2/NvuQ=
Content-Type: multipart/mixed; boundary="===============8196525722666143171=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 ad5dd381b11fe2e28fdb2d14d52b0aac9b0b9ef1 FAILED
Message-ID: <010101a09e6e9c6b-6b4cf00c-31a5-498b-8691-5f24a35367b4-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245753

--===============8196525722666143171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *ad5dd381b11fe2e28fdb2d14d52b0aac9b0b9ef1* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 61 skipped, 0 masked, 0 errors.
Removing 52 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 56 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8196525722666143171==--

