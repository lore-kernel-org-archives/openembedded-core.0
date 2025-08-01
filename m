Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C47CA0ECD
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.88641.1754057277505146862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HoctfLzp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sopOGiOy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019865f5fdfd-84432b47-0b82-438a-8499-497346c04594-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z1kayCPrpIsKdolXxV/pYS52TyFsYUu5QaH1pTKd6eM=;
	b=HoctfLzpLaoixUkQi3jU2QEdL1DL3l5f6Z1wPHcKmr1dtQjxLJqd2zfcXAraSCK2
	/hWKR8+44FJfIuaa85FrYQTlVkFeXDm0H1S9hpJOJ1cdYBNvKNkyh6wPOoL/V17jYsK
	uv7Ak7Mg0GDNu+3lvqr4xiXi7HX8mRoAxyUWiqlU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057277;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z1kayCPrpIsKdolXxV/pYS52TyFsYUu5QaH1pTKd6eM=;
	b=sopOGiOyDed92eIvSWgbCTxv9St5fBID96m1D4k9uVuZ4bD/5+ud39sbSgX2bksb
	tTqFlyYYez5+3zCVJXiIgVyxbz7pSO0PQItkIKBqUw/ohJ+vrRpbsnpXIdQi8aNpvr0
	bYJm4rCliarI7RWuPZsXlIKCsIdmaW9sPGXnjXRI=
Content-Type: multipart/mixed; boundary="===============2256132295180533285=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 8b405629c4a5215871be932097e099c05ec5cb2e FAILED
Message-ID: <0101019865f5fdfd-84432b47-0b82-438a-8499-497346c04594-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221294

--===============2256132295180533285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *8b405629c4a5215871be932097e099c05ec5cb2e* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 8b405629c4a5215871be932097e099c05ec5cb2e
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-f68a56f4625d15f161df0be87acbe589a58430a4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f68a56f4625d15f161df0be87acbe589a58430a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 8b405629c4a5215871be932097e099c05ec5cb2e' failed with exit code 128:
fatal: unable to read tree (8b405629c4a5215871be932097e099c05ec5cb2e)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2256132295180533285==--

