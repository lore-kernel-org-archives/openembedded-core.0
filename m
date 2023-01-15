Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFADC71136
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.145843.1673805745304456075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kBnDXbXl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185b698c9bc-9fc7f7b7-9ce5-4f7c-99b9-0fbe85bd1fec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T5YDQNs1Dn9SyYWn6PmyD2dTTZ+WDZznzfwPXnjey1o=;
	b=kBnDXbXlOsgY/RqZiWQAj/vPw+K7rLjbSxjPLgZUfhYI8zJkVzCa6h62g1nMT51D
	2OQVAr9mNsMoA3rD1Evu5TNn1V8L6frwb9JTn6SEuu5jYTsUbl6XXyC58PVbD7SoUBu
	fub1/8sy/HNvfMdeNObTRyAPcEitlMvsKGshH28w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T5YDQNs1Dn9SyYWn6PmyD2dTTZ+WDZznzfwPXnjey1o=;
	b=CwXO2DrP9s+h7mxUEDTKTbt1zwo/C7zmYfs+YFXS3R3AK1OzluGwasr23DMA0Cy5
	3ZMOHI5Sz9BAbC/vaRNzKDuX7dW2fKAzo9+7kjKuzRCLs0IPuJUaPoLHX0oJ7T6Bgp8
	VKxn7XKfgzYBE5awfG7FOHgNsK4a//d3W/Fa3Vqo=
Content-Type: multipart/mixed; boundary="===============1347401146316490226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 a42d4eab1e5fe7814dfbe91e3bbaf8ab62cf03f6 FAILED
Message-ID: <01010185b698c9bc-9fc7f7b7-9ce5-4f7c-99b9-0fbe85bd1fec-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175928

--===============1347401146316490226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *a42d4eab1e5fe7814dfbe91e3bbaf8ab62cf03f6* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 41 skipped, 0 masked, 0 errors.
Removing 65 recipes from the core2-32 sysroot...done.
Removing 78 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1347401146316490226==--

