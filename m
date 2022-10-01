Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DD0C38A2D
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.481.1664643228871383203
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZfovUXIj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101839477e2d3-1fb9c70e-4083-4a1e-87fa-c3b3400c202b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GbmQwyC8Yh8j4ZZNlkumva9ZdpsoOa0LUDCL4Y7c4MA=;
	b=ZfovUXIj51u1Nkx8v6I1a06xnpCtIGKoizG9HsrOF8BjaCtrw+oyDFtv4YkUockd
	BgcwwVY/BiA87HUxRDSXhIYf3WoS1M+dHE2Nf0GT9XudGLeSnVp/QBOocbCe09wULxu
	EQRPWAUvKkn0XiaMXZav9RRp92QW8NIl2htm24Lc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GbmQwyC8Yh8j4ZZNlkumva9ZdpsoOa0LUDCL4Y7c4MA=;
	b=X/dxNpFEvQvB7I4xcIaqu97m/m9sbUDtzt6xpj5loTGFly6MHn7aiw1d9Mra22ii
	1vHjnIzzNHE1jKAg6obdntxIpUWJtbuo1XF0e9Fh9UMOo0ed1hhEqALmzwuJQntL0rM
	SBcug/F4dsUMBgvIk0NBiE0J7iX8fZN/FnTXxsDM=
Content-Type: multipart/mixed; boundary="===============3593885877053624396=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 9d39d151dfd7a71a3b1c7bc8c99dd39cca04d3de FAILED
Message-ID: 
 <010101839477e2d3-1fb9c70e-4083-4a1e-87fa-c3b3400c202b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171323

--===============3593885877053624396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *9d39d151dfd7a71a3b1c7bc8c99dd39cca04d3de* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

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
--===============3593885877053624396==--

