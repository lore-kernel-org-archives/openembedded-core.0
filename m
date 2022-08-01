Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164BDC3276B
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.22116.1659341690479197621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F8eW+C70;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101825878d266-914bd060-c69c-4542-a5a2-511030f46265-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CEMRyq4UrboO99XjaqdFY36szbWHkkbyfI3IQ2u8S9Q=;
	b=F8eW+C709lU3XTPSn6i0ScOAPXzJ2ev7iRo4+LO92K3QFF/DHP/CHSp6FDOyx6QL
	W73/vmb+G3MaK4lIeAUnL9k+U4v4D9NaTWifDD/emy6CHuP9L/6AZ0ofL3GZo+eLJih
	SPSVafawZ0ptun6kyqK4RKqrXJ8fQbxJVCG7KycQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CEMRyq4UrboO99XjaqdFY36szbWHkkbyfI3IQ2u8S9Q=;
	b=G8EZ3TcI8TGjjNcqSKO1FzCIWNiHo86rPhPlw8I8m8KXDnC2le6qKpu6nBmuaWJI
	IJ1ighDaB5PjE5xaXH7AvyeuR/nik6bZ7Ly1xi7Y3N2wzI5Lv1h6/JAIhUEklyHZ7Zn
	SxaWRhefIymbhtVZQlWZydXcr4AN5q3RYkUSJZUE=
Content-Type: multipart/mixed; boundary="===============1596624663200910489=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-testsuite: upgrading to 2.36 FAILED
Message-ID: 
 <010101825878d266-914bd060-c69c-4542-a5a2-511030f46265-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168698

--===============1596624663200910489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-testsuite* to *2.36* has Failed(get_env).

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
--===============1596624663200910489==--

