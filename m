Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2808CD342C
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15617.1777645535643143513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZCpP8BP3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SiaJSV1m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee3e8d-182ad5f6-9ff7-48af-8872-38a5e6d79608-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ptj7wgF1mRWH+fI+QWa8kGwkf4ThCVdRr6/dgj5yQOY=;
	b=ZCpP8BP3p7fVpoWlm//wy3QU4HBse8PYtNq4IWYP24FLQgV0s5wrc9jL8qrH7oxR
	/FZC7E168LF44LeGVXS6YQ4P6xmRxj1kcJvRODA2urm08S0vptJ170NSVjAonPC+SZN
	TveNCm8NJS1pQptnhi0ODyH0b94qCZnIm5elvjPs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ptj7wgF1mRWH+fI+QWa8kGwkf4ThCVdRr6/dgj5yQOY=;
	b=SiaJSV1mhkM+Q8cY5AChUpU8syfiG5aRn2v+9WsfFC3cT9Zk6UKZzHWkgHRxj1HC
	QqSl4HfCvgvxeumnqMikWZp/uXu/rUWk2pOaE+wUVU35vtq0BQxjQf8plUj3L6STQOS
	x4H57COH1z/BNEdlu3yz8JrCq3hEcFs2Xyrc20cA=
Content-Type: multipart/mixed; boundary="===============4980715576551726944=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202602 FAILED
Message-ID: <0101019de3ee3e8d-182ad5f6-9ff7-48af-8872-38a5e6d79608-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236220

--===============4980715576551726944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202602* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 57 skipped, 0 masked, 0 errors.
Removing 15 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 18 recipes from the qemuarm sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4980715576551726944==--

