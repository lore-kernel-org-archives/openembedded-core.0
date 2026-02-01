Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B398D73E86
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29048.1769951560882154712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hScIUZJ1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qGiA+qoZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955819a-4aae78b2-63ab-40d4-9c7c-b56fffe5751f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TmFV6lEZn0JLzQLVhX8++OGYkeHBk/8O/p5YWsApkok=;
	b=hScIUZJ1wAbmoMOjes7dGj1LcaOat9NMIKwrzbAnq4IOk9dpf9wYuZszmqXFqU1t
	omGAmWLfveFdZNNyjiN0YiAzbbjcgVObAZggDsck2tpSoj8ZjXgHwhdRfE/BfS9oX77
	wRNeLnwiGwQqvk72hcx+/UD5QrHD4hhRfjgJUwHI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TmFV6lEZn0JLzQLVhX8++OGYkeHBk/8O/p5YWsApkok=;
	b=qGiA+qoZ/6ZD1GdXitJViS7yF8d5AcGjR9gLEqyyfncgwyx5GGFYd3EBapEoksm9
	TQI2TclYDeGCAMUJCVrKTxfMstIofd5ve1TPXL/cGa94y7x3r68i+0QI6qtX0qsyD3a
	ec3tv0zCaqzxGdHuCFwoNvAr8aAuNjbI0Z3UOD9o=
Content-Type: multipart/mixed; boundary="===============4880930535323548606=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] grub: upgrading to 2.14 FAILED
Message-ID: <0101019c1955819a-4aae78b2-63ab-40d4-9c7c-b56fffe5751f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230258

--===============4880930535323548606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *grub* to *2.14* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 64 skipped, 0 masked, 0 errors.
Removing 7 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4880930535323548606==--

