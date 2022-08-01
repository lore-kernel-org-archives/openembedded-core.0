Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C180AC49EC0
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.22465.1659341691474281112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZbDpaJY3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101825878d726-ad9091e7-2b95-48da-b290-51188fe32a3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341690;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ttACRAGpzUEERId0FJuuCUQdtRkh4Z+c+kBNLzC6WU4=;
	b=ZbDpaJY39sYx94o1R1c7v/GSSu7R0IbDk6Kx+0kjl8hm3VcQ7EMBE0KUwY9ygIgE
	OHyaoN4DMDKfSjRh9BB9tNbcPWUBoRotid7xj/nfJgCA0GvBaGmpfySwRVDFrEbSZkL
	eIh6f1HyboJ2roo7jQ6DOqOseqHTEAF1eWMzU9Hg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341690;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ttACRAGpzUEERId0FJuuCUQdtRkh4Z+c+kBNLzC6WU4=;
	b=EbMRYyZsCbVWAprTtG8f8nAM/oHFA/pel9Ez04gqcwgqzBmuUq7IZltTSzTD9SET
	bzWQZy1bxkdhHXCIbI1aHthP+uhpbHWd+1mg3r4lyuEKxHnjUNnWfKnsUYoY2VPs+zk
	Gkt4mHJdHiAemm8jtxDLZuxmV68Ptf4SSo9EMQwc=
Content-Type: multipart/mixed; boundary="===============9165001142254533882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.17.1 FAILED
Message-ID: 
 <010101825878d726-ad9091e7-2b95-48da-b290-51188fe32a3d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:50 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168722

--===============9165001142254533882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.17.1* has Failed(get_env).

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
--===============9165001142254533882==--

