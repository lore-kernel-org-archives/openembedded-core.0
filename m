Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CCFC48BEA
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4049.1659679406908229833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GtXefCuT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101826c9a00b7-11f77c30-4a56-45ab-8a4c-f44b47525185-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7ZssD5YNytJjtCOcs3K6aR4RDqQTp79D52DYICxJ1Sw=;
	b=GtXefCuT7UMBxb7qeLn4TZhTHcfnbzHPM3BfYZYM8Le9QHrXpNQSBPPJWXzXB1Nb
	lh6FLjU9Snx3JdqqquH2RjOCsaj5NVYJUNdV737Pdkol4UGQw4T1c2Qn+KlUNZpHBFH
	POFTMFjjY4cXCWQYF5ggSBzavT+MFtkxYybnrbxQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7ZssD5YNytJjtCOcs3K6aR4RDqQTp79D52DYICxJ1Sw=;
	b=WHdYly3HzVe0CsKQUppDMCVHqv9SSA3bxKq9eUyhspkjtI/0gj3b/AlbMn23zVBs
	7ZvI8Ty0A8AL6VkLIHO3cd6T1Qe+6wOc0owMqKfBY71Tky5ZyxW2LO19pnZWTFVTwEY
	WIIzbFGfZ2q/mrwiMwTTDtqKMXYHBzKCmu9YsXaI=
Content-Type: multipart/mixed; boundary="===============5414135537900955598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 b1428e847f4b8aec1c86b8ea4b962b2fdf62f59d FAILED
Message-ID: 
 <010101826c9a00b7-11f77c30-4a56-45ab-8a4c-f44b47525185-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168906

--===============5414135537900955598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *b1428e847f4b8aec1c86b8ea4b962b2fdf62f59d* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 36 skipped, 0 masked, 0 errors.
Removing 65 recipes from the core2-32 sysroot...done.
Removing 71 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5414135537900955598==--

