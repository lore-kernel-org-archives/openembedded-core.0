Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D68D4A5F1
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1431.1768526746413650279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GXXMEvI0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=g01UPeV+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc468b1b4-2b73553c-df6a-4920-b680-5810f1993edc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LE4rIRs+lDxYVp1bn/7tEPrxpiN5iW2We6ewmpckOxQ=;
	b=GXXMEvI02oxyojuDWH3KkUAcGCYyjx+BiRTXXKAHhqxa6t/GMoH/770COq3PiWWY
	UY+BdRGbJSNJNCDys0mLCtt/KUAafChyUiR6RbABA5omBVt7rlcNsDmJm9mufaasHpx
	pb4aB87mS9H1n+wrUIiLei1zSF8SNLJD+pzpG+C0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LE4rIRs+lDxYVp1bn/7tEPrxpiN5iW2We6ewmpckOxQ=;
	b=g01UPeV+TGojLU4e3nM1ojOI2v6QgnKPqVNyS0MJR9LmQ48wXLpt+sW3SKWdmL9N
	tNMPAmVIuHNz8vFb4D2cBme0HbZVfjzn/+qCnm8eN5y7IMgxax+U4fCg1F7O3NL4HVb
	DWOF3KUdzrxgLmJnS3raVv2eNbisolQ8I+XMWOE4=
Content-Type: multipart/mixed; boundary="===============9116001908785367721=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 e6ada08f110de050636617a08821368efa7cd23b FAILED
Message-ID: <0101019bc468b1b4-2b73553c-df6a-4920-b680-5810f1993edc-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229490

--===============9116001908785367721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *e6ada08f110de050636617a08821368efa7cd23b* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 64 skipped, 0 masked, 0 errors.
Removing 56 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 97 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9116001908785367721==--

