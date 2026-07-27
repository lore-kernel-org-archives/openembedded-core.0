Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4DAC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 05:04:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24564.1785128657787511704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 22:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dkrdogEf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PTyocIG8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019fa1f59f17-3aae1890-666e-4f63-a2e3-da230ec5987c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785128656;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E05wXycx+lkB6yL7y/o64RvamBrV5LjVQHJRMi/cdYk=;
	b=dkrdogEfacXb1E2U23Q4+E4d+DpWlXHN22C3rLCZ96XzWv5la3Sn1iB3B/3W1mMl
	4of+k7io1uiW5eWV8bJh48Yxh9dPu7jHTcOArtLZBfus+qowvZQJdm2te9RSmwV0R1G
	xk9ua1wOoZYzQOPtGUMvFD5zBSuNx0wk1NvB755k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785128656;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E05wXycx+lkB6yL7y/o64RvamBrV5LjVQHJRMi/cdYk=;
	b=PTyocIG8wu1vqaiYZwdY+GQwDNgqHB2aY6xIRDwoKrW+gyt3hPzqLf+cz9CH+ly8
	G1GqjhXnm+5NhL7cnrdYj2FPB9WOL9AkJqSOBh6M1Lzlxc1DUqwdWDZc+ESgbKfXDv1
	DTAZPZFqrGjla0EVPoVaZdkLpDdNnHZYD0mUTIwY=
Content-Type: multipart/mixed; boundary="===============2474243893572121197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] binutils-cross-canadian-x86-64: upgrading to 2.47 FAILED
Message-ID: <0101019fa1f59f17-3aae1890-666e-4f63-a2e3-da230ec5987c-000000@us-west-2.amazonses.com>
Date: Mon, 27 Jul 2026 05:04:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.27-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 05:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242030

--===============2474243893572121197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *binutils-cross-canadian-x86-64* to *2.47* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (0 cached, 953 parsed). 1981 targets, 58 skipped, 0 masked, 0 errors.
Removing 6 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2474243893572121197==--

