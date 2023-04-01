Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E51C7EE30
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.32129.1680384535233715827
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aP97S1Xk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb92c91-2f0bb094-87e0-4496-8b61-55dfc1ebf6b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d++LGRU34kAkBxffYX7c08tx7FBMi0NR34ad9cR37eQ=;
	b=aP97S1XkyXHQ6zemKjy8woL9v8ALFj/x+anVkZnhRCh7/6qnpKtgP9h58ndra1GZ
	rKrcszIpO+VXyP1mmyc+GZLmSuljc+93BHh6D9Mj9nleCfAMWMYo2Z8b6WNd9aXZTph
	G60gZP3nj0DiuZgm5i+A3t4tMeAb45w2TDKEW3S0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d++LGRU34kAkBxffYX7c08tx7FBMi0NR34ad9cR37eQ=;
	b=JbnvsO02o+LGWHc4jYvWvDaYrpn4AlBLp7SOt7AQvzTt1EadGdZjdG2tNHBpfasA
	eHHLur1+Ne1NaXB1LDDUpYPf2468HospKZ24bQIXktJ0JRnjJle7bVkbW2RZzggBpUM
	OninX87N7xKNV/r710kNKRC65P9oG/ofnXKS1mpY=
Content-Type: multipart/mixed; boundary="===============6061502925039224020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 de7304fbacf442a6c93c8f6e551b09f328b7407c FAILED
Message-ID: <010101873eb92c91-2f0bb094-87e0-4496-8b61-55dfc1ebf6b2-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179537

--===============6061502925039224020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *de7304fbacf442a6c93c8f6e551b09f328b7407c* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1796 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6061502925039224020==--

