Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B878C3276A
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.22236.1659341690677063049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QTzHriTV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101825878d392-7e42edb0-60ab-4c69-b508-f733e1d21190-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8avfGFoWVURX9GoIz+KT7gF0wpcBDLwtq6UEjX3+ZoE=;
	b=QTzHriTVcKKja+916GKgRTwlXPtpwqjSBc8LVhExfPVrM9Q4sH9ecbdDZRf60N/R
	OMcSCrJivMuFk68vy0QzS98gYn6/Wr27JzVZSJKH9rpB99RNyfE1vBzY50sbGaQKWD3
	u80ppZf1y7l4W7A9RLkIw8OHRqRvYO5VTwzuV4PU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8avfGFoWVURX9GoIz+KT7gF0wpcBDLwtq6UEjX3+ZoE=;
	b=UR7YeA/ovjYS3qWAD8PUSBgqe6TIkVhHOxFlZKVvEMhol9MtuDaKPxEBjQrfPMTl
	mW5nq0kdjOmjWlaDCNvY+YAiqIhp4gjG4mg8My8Qp+wFM5eOHKO3Etjp/f6YEUqSH4t
	ZcY+6fRr7XDUHo3b/MVCFLlgYFtl9NSQzUJJ/yYQ=
Content-Type: multipart/mixed; boundary="===============3034994493863688202=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.62.1 FAILED
Message-ID: 
 <010101825878d392-7e42edb0-60ab-4c69-b508-f733e1d21190-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168701

--===============3034994493863688202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.62.1* has Failed(get_env).

Detailed error information:

Empty environment returned
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 3 ERROR messages, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3034994493863688202==--

