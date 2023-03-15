Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F9BC77B78
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.12156.1678895727853294169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Jr9bmFaD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010186e5fbc163-5fbd2e1b-409b-4a45-ab29-6e0353cdf056-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4XT/WWBufOuwcO6pNKRxNB8GmDpTarI1BD5BbCKcmuc=;
	b=Jr9bmFaDfWNu01e+FIPADouiB++4HO3Ma8cZN5mQdJD2Inn2WdXTyN98IgexDo4w
	OUbafrM34pFSASdHpTJknPVRQcRqipD9MPaS7DMlcnaOFqeGlB2g2wkKMD04Qv5HXuh
	PrN4mXWPyVImCbr2749VSFNFdvSj+DNrinT+R4oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4XT/WWBufOuwcO6pNKRxNB8GmDpTarI1BD5BbCKcmuc=;
	b=j+m/jKR9KkgPy1QaQz7HyqOFucH708LYMtMkQ5o/4x79HgryIsc4FE+H0WHeWzRy
	amQdOuMUj4tYE+8hZg+ij0z6snX5HIb9t7/dIGmWV7FX7PU8YV1QQ/4fNqmt1A65SYV
	JVOaDWWzR3wC2mxq0S3nbRAOw9Xg8sLWgY2uqvb8=
Content-Type: multipart/mixed; boundary="===============5503188168570988598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 25d6da6aa1970e6c80805e53ba995f70782db151 FAILED
Message-ID: <01010186e5fbc163-5fbd2e1b-409b-4a45-ab29-6e0353cdf056-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178623

--===============5503188168570988598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *25d6da6aa1970e6c80805e53ba995f70782db151* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1790 targets, 39 skipped, 0 masked, 0 errors.
Removing 70 recipes from the core2-32 sysroot...done.
Removing 78 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5503188168570988598==--

