Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A56CA9ED8
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.3759.1684186747278405356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P/qkXlNl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010188215a4e1a-e48fd858-49cf-4495-860a-5b2bc2b0ae9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h8BAldkwv0wJ/p2xLMH+WarDmfJLVnMq7Pji1VdCuIo=;
	b=P/qkXlNlAS5zFYvQS/VznCBhv9cKDdAKvASdzzVSyhonj2+xG8ca8p03ljqU24pO
	vSIwHFO3XOM9PqXmp2DagPzYVCJbx7yQhsj/FdLjG2SPlyU3jpVBy4VVFrKrwrIVIiX
	zyBExv1Vsz03zIpV54NtgM2/JJy6GfXrlV5alRao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h8BAldkwv0wJ/p2xLMH+WarDmfJLVnMq7Pji1VdCuIo=;
	b=BYNre9A+xbeS07qQPL441BRoLwTjEp83+UzZHJx/bTlvzLlHP9YjFjYfcYZnqCrx
	wIvs8kkKjj10tc2S84nEyb/V0WtSK2435ESEOdEm/9LIYhGFoKde8mWaY9csuzA15CI
	4M7xPlNVxaUyBpVDAqVfuVusXyR6BEwbH1wnMJw4=
Content-Type: multipart/mixed; boundary="===============4180055755505240031=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-12.2.0: upgrading to 13.1.0 FAILED
Message-ID: <01010188215a4e1a-e48fd858-49cf-4495-860a-5b2bc2b0ae9d-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181290

--===============4180055755505240031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcc-source-12.2.0* to *13.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-12.2.0 -V 13.1.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:08:38.866147)
Loading cache...done.
Loaded 1804 entries from dependency cache.

ERROR: The gcc-source-12.2.0 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4180055755505240031==--

