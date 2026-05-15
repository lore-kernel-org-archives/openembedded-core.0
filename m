Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05EECD5BAA
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34814.1778851223055760794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PX3gJ9LT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cTvF/pDZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e2bcb92a2-73469bb6-a3ae-4683-acf8-a6e2accb8c12-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ttkeILTuiYgJMlw5E9aeKoSJoYcQJMQ1MIeVFODNiRA=;
	b=PX3gJ9LTtCvXx2FcFR49dPpBdXb3ChuLlQSfaTWLz8C4CqjggKgQ/SNlM4JuFu4m
	O7+fxmU8PRM/wk+38Xf5FO2SFJKoUKSf+SARevf7iu+VrcvGcNidtYgThYG76wfRqf7
	BU4epGwh/zMGYua7RpHKA2zpYMl4SE5Ll7BuiZgY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ttkeILTuiYgJMlw5E9aeKoSJoYcQJMQ1MIeVFODNiRA=;
	b=cTvF/pDZPjT0oXL+mpAy61f2sf0XTJ7MP1UitYsIa1wdtyCwOKW4AcT5vDY79rhY
	1U5zjRXCy6WgQ+zphww9hrOWzAG7CQqfWQ0xmmG/F0ZDaEQ4o/HZWSvRA1HT7tinI81
	IRBq3G+d5p04+pk7zHfxxNBOkvlQQpP0banA044Y=
Content-Type: multipart/mixed; boundary="===============2960588541457813715=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-15.2.0: upgrading to 16.1.0 FAILED
Message-ID: <0101019e2bcb92a2-73469bb6-a3ae-4683-acf8-a6e2accb8c12-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237087

--===============2960588541457813715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gcc-source-15.2.0* to *16.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-15.2.0 -V 16.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1975 entries from dependency cache.

ERROR: The gcc-source-15.2.0 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2960588541457813715==--

