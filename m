Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB55C25B07
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:15:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.22239.1659341691257556433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eF/vPcva;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101825878d719-2dc07d0c-a759-4bfc-85d7-f9cb795c4e9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oGIEVlMvfnCdjLk7xRPNwG6Ldv7Co9H7+jcUxMiTAwk=;
	b=eF/vPcvaN+1qWS49FaZRTwSZshmzT6P+HGj0Z72xD9Y1UmWidJJOXqDaK54ClRFT
	OQ6KpLpOChWLgRFENDeWnatdXkM5+jpIu1K1nQ7aMOmsufjB+RT/4ztnTodvtK9qYoN
	ZcMwpEkR5+wpGUHiOCz1h7mrluTxaHgj48wYEAuA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oGIEVlMvfnCdjLk7xRPNwG6Ldv7Co9H7+jcUxMiTAwk=;
	b=c5Q4LnmiVNt/ZoPHYIegODih0o/r2vb4Zo2o5ZTLVk+K3NhosouSl5q85NLezMeu
	YRmaNa2rngA211KsBc8KiC1Tnt0Y8ZcFwCHE2CkhHjIgaNAz89tRdYeQjVoqyy4nR6U
	Yw7NMdU77S98YdP+87hwET7RsQFTRWcP2pDuUfc8=
Content-Type: multipart/mixed; boundary="===============0255566846608925325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.4.0 FAILED
Message-ID: 
 <010101825878d719-2dc07d0c-a759-4bfc-85d7-f9cb795c4e9e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:50 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168713

--===============0255566846608925325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-scons* to *4.4.0* has Failed(get_env).

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
--===============0255566846608925325==--

