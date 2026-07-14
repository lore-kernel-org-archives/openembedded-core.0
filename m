Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BAFC44507
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 05:40:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3781.1784007595488885482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 22:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RYRBLLa1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1Qw/x6L7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f5f23922f-d433d5d8-fc6d-4643-87fc-230565105ad7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784007594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JlgZx3BdnufbuKKghPVxRnnb8Mx92up3Kf3ICJH9v0I=;
	b=RYRBLLa18OLB1y09MdFV0AWcq58ZNoIVR2jgI0Vo7svr2qjM7jZ0hmM2lChjdM13
	7BfDax8UrUYLx+/akPPjFRkgmDqUzW2aDW4pbWgUArynUjBTVPOupFdFEbse/YCmTsv
	p4gZHCm8G9fDQtob+WG+i/R8ZgLpcRK5asz50+3I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784007594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JlgZx3BdnufbuKKghPVxRnnb8Mx92up3Kf3ICJH9v0I=;
	b=1Qw/x6L7NfZYEyz+cpcE+sNuz8OycqWr77gTXrKQ0pKEsI9lo4R1OcwEcPximYBq
	S2GpTiKf7M7SE0lkSSkHb4ohYT9wd9i/b2y9MBQLc1SmnTYImEi4GinMMeSa8IVesGN
	v1NbausjvV30urtANm2kqI4xvrApah2DRzXsbMDI=
Content-Type: multipart/mixed; boundary="===============4241971404817412611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 fc51e9c29ac1849a2efcbd1d5674a6dc65ee4365 FAILED
Message-ID: <0101019f5f23922f-d433d5d8-fc6d-4643-87fc-230565105ad7-000000@us-west-2.amazonses.com>
Date: Tue, 14 Jul 2026 05:39:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.14-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 05:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240869

--===============4241971404817412611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *fc51e9c29ac1849a2efcbd1d5674a6dc65ee4365* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 58 skipped, 0 masked, 0 errors.
Removing 14 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 13 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4241971404817412611==--

