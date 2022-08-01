Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF69C48BE4
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.22243.1659341692226853238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f4tm5nFh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101825878d9a9-e8f90468-e834-47f3-a331-d9e1f3727d91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y6GcdUHAmfnfIao1j/0OM8K2r+NHKLbimZjBmFSgsBs=;
	b=f4tm5nFhlInPVd0NPLidX2NWuLTjApX5p94vvdqyWnh3vrto5ABSRQaum5BFldRX
	XAgBy+Hi717/A2G/J8vGtDi2eMNMcZKRp0DZNqqKznkjBE05Eaz5IUbLlzgPeyYpSRj
	5fYsdXlXoa2UppxWxo8XE0qinNVc2feomqYVJF5U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y6GcdUHAmfnfIao1j/0OM8K2r+NHKLbimZjBmFSgsBs=;
	b=a7KmsRddvTPINvQ3WOKark0ai8q1nrA5CxLohe5LSmq48TYay8TSK+MfATLk9yYx
	Yd6AvwUCpXWbz/za3T57rp8jX8qPRGK3uPPp8bKBBwRYfKxv2esxe0p82FEoNjGHOvd
	T3TldwdATAIxysfHpvdsYI3KFYYMTTxag3KuqM7I=
Content-Type: multipart/mixed; boundary="===============1672627610634357776=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwebp: upgrading to 1.2.3 FAILED
Message-ID: 
 <010101825878d9a9-e8f90468-e834-47f3-a331-d9e1f3727d91-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:51 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168739

--===============1672627610634357776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwebp* to *1.2.3* has Failed(get_env).

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
--===============1672627610634357776==--

