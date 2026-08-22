Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5964C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 05:25:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1718.1787376340289464190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 22:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XKRaQYDx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k+XgLo24;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a027ee8955-50162c72-d34f-4e21-bd48-59e3ca8c8559-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787376339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=HJWAXnEn00kW+jZ1LEioedqjbxEnwtcBi6mSfVhIRxI=;
	b=XKRaQYDxtJVFw/rkuGgrEWkDHBbEVcq8Hx2C+gpgm8QFyo1e1MsU6+CK0KpympsQ
	sXTZxCg35A1rKt3t9TLif98jOAA1fYAUYcMU7Bc1II0Y5oOXU0cRNfO9c0oE3uy3lny
	aupSNDHhzGXge3sN9PeV0EOP4zQn+SdeehMeRyx4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787376339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=HJWAXnEn00kW+jZ1LEioedqjbxEnwtcBi6mSfVhIRxI=;
	b=k+XgLo24FegiwkRc3vdIeGuCKvptlaoQhS6JYiQJ7fZE6KenJppgA74n1KmylGAk
	QhdXClGIOK/n36xEgaxb6pjyy0nelBPo2mQBEuWUCWq2h4cloG7Q5BMw1cMjk3k9k97
	L59fWO8k2VDjaLya35M3/is5gBoujVowIwbaq+NE=
Content-Type: multipart/mixed; boundary="===============3757519768342220471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202608 FAILED
Message-ID: <010101a027ee8955-50162c72-d34f-4e21-bd48-59e3ca8c8559-000000@us-west-2.amazonses.com>
Date: Sat, 22 Aug 2026 05:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.22-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 05:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243966

--===============3757519768342220471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202608* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1985 targets, 58 skipped, 0 masked, 0 errors.
Removing 7 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3757519768342220471==--

