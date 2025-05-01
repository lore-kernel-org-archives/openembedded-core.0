Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4E5C3ABB9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1773.1746113609216164425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JvgQSBm1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Jn3ji/IQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b3af1-2d8b2865-323c-402c-8e52-471e5b6c9b51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113608;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=03iMzfIQ9QF3HyzkfR/WYMqRghEwiQdEAZrohUQkD5A=;
	b=JvgQSBm1Bo5JFJRhDZuZf5qRP/WIcfsXLuGZYamB3pjwzxenOvLfEDaNfQrbBKC0
	m2PUuB2zUar5KtXEJESsoSUpA1kpRLjYh0ELp/voy7f3HkwJld5s03wNT3jY7j0e5GZ
	ccG0Vd41AVU83B2LHtRURI8cZuAK1o3AOjK/scv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113608;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=03iMzfIQ9QF3HyzkfR/WYMqRghEwiQdEAZrohUQkD5A=;
	b=Jn3ji/IQBkAbYRDbX/vLQwt0uYWw5ZBGmQqZwk0SBvCUjLsipnTDvfYE/Wf5Aug9
	6w773QpnxJhxFauH01jKeGBhifAJHhIk62W0vx8lyFbeaGF+aDkUGJ1mcpCXJmPyvjI
	biTaRt1ezLwUi8SIEAzi6jhV6BQGEwyD7RmJuCcc=
Content-Type: multipart/mixed; boundary="===============6071723059615157580=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-14.2.0: upgrading to 15.1.0 FAILED
Message-ID: <010101968c7b3af1-2d8b2865-323c-402c-8e52-471e5b6c9b51-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215779

--===============6071723059615157580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gcc-source-14.2.0* to *15.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-14.2.0 -V 15.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.

ERROR: The gcc-source-14.2.0 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6071723059615157580==--

