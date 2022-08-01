Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10413C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:15:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.22122.1659341692127050782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HlsPPDsH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101825878da73-259413bb-ee0f-4611-bbf8-62febc5f03f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341691;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=FPlKfP3soIF4F+NvWX61ZdigUbu8c03ZxP/nTLqYKpI=;
	b=HlsPPDsHVBB951rqOtKEG/X1UOTJ/5DPb6jHpQykxh5DTgCdYuJmG0sUs77xYtRx
	14RnM2Fl8ck9zwEezEQDz4GZhsk9SOd9xZckNN5tIqycNOTEGSyw31gyI4ywnmaKjKd
	l4cmtTLDKkHFk1+mu4XQmseWbn6hw2vWho6upwdw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341691;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=FPlKfP3soIF4F+NvWX61ZdigUbu8c03ZxP/nTLqYKpI=;
	b=LtbLi3Mf7NEhbJT3HhDI1wHCOylggNtTstvwRXo7qlN3JtTsPyCRMXpOLLrdHum7
	nCW59kMM1FOXXuVnI5qNiZXea5NBLU5OzjfcUQyEv3geixRemnrREtf3pV+eVgdkdxl
	A9EZ09C5vNKLo2j2HNKtm8CVk7Dc/rZARv+GX8/M=
Content-Type: multipart/mixed; boundary="===============3235146921688892228=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.7 FAILED
Message-ID: 
 <010101825878da73-259413bb-ee0f-4611-bbf8-62febc5f03f0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:51 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168736

--===============3235146921688892228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.7.7* has Failed(get_env).

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
--===============3235146921688892228==--

