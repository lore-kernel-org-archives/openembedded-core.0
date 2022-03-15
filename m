Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE75BC352B6
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.10657.1647349736026580057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=uJt41E+y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 0101017f8db21e54-362525b2-34b3-44aa-9b3d-ffdaac46dbce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ejj18/uz7KBIw3Zz1EF6zFPNh/tJTZWKeYa8VOiTqKU=;
	b=uJt41E+y/AHu3EBUk3mS56oXWgQt2+gjrkaI5k4mcCO6gePq1W/bctCesHxZ35JK
	fYmKfAs1FJiTy/BqhODesIKtIEgK61bE9lLs96KtWJvgq+ZAfh1WAARTdwFApnk25kv
	MeJdorpwBs/Gc53C8ftoc/FFiA7Yhm6SvIU0BDvM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ejj18/uz7KBIw3Zz1EF6zFPNh/tJTZWKeYa8VOiTqKU=;
	b=KzlWBPeM6mSV4nXxpYJXmJ5XpPJLTITmhVudWTwm90s6xIpekRcUSoGXqqDVBMdg
	KmnS1sUsU7xiqf4007AJ+Q20Rtw6tNbg+OHAsAhaGtmAHB1NZmN7GtLN16pkILlmC10
	LCYTkpAhWgfwfTtnYPTP43/VoKDAOzwX0vor7jUI=
Content-Type: multipart/mixed; boundary="===============3484396429921325755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 9e56ef313debe39e6d45c98c5fe3128de612bb8c FAILED
Message-ID: 
 <0101017f8db21e54-362525b2-34b3-44aa-9b3d-ffdaac46dbce-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:55 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163273

--===============3484396429921325755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *9e56ef313debe39e6d45c98c5fe3128de612bb8c* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 35 skipped, 0 masked, 0 errors.
Removing 77 recipes from the core2-32 sysroot...done.
Removing 76 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3484396429921325755==--

