Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFCFCA9ECB
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.107887.1682976349953886504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GY2ut9Yb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d935296c-9cbffabf-8e8b-4287-81a1-461ee54bc231-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ajK4SnfRNbzGS+VrM5z4pS1T+EXD8Y2YXLR4WY2gqB8=;
	b=GY2ut9YbcKZf4bvlHxp0Gljnm5Fb4bxO4LGYqlXdymLaCyHnDSGd8qN2ljAIcN8r
	8/ZBVfoOyHxyHQekKj0tnHGktONez4DrstLwFReisajVcUXgIIlAXD+0BYr/XF2nAa8
	RKFUJ5t3yYUjoumzsZ86GZFxnbKWme6DdXfI5uGE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ajK4SnfRNbzGS+VrM5z4pS1T+EXD8Y2YXLR4WY2gqB8=;
	b=TwuK75CFoNbjoVLozF9HnGvXEcd9BOc3zPJ57NYHbc3PJ/xbjGAUZY7f9wdwMvP7
	aKtAtmpjFmPOK9LoErPMOV2oLPNZ2oy6eZsQN3vG7WQnA47r9My52b8D9+YwMp49xYy
	hXkcdHZto2k/KgyhNaWLCNunCLzYPfxoAwMUjbpI=
Content-Type: multipart/mixed; boundary="===============8547531259957344554=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 2307c3eb5608cb1205fa3514b3a31dbfb857d00c FAILED
Message-ID: <01010187d935296c-9cbffabf-8e8b-4287-81a1-461ee54bc231-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180659

--===============8547531259957344554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *2307c3eb5608cb1205fa3514b3a31dbfb857d00c* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8547531259957344554==--

