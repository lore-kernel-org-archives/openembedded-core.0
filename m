Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EEBC5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:47 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7501.1786689404053698280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F7oH5IRT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dtht6qpO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ffefcb8f8-421f0860-e241-4255-8872-2433c303b22a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jvIfSg7U6nwYjY9+y7+7OqC6uReW3hfNCOqYqitG50Y=;
	b=F7oH5IRTUqMMicp6vuMc/GDQOcRWQvbjN+kB97te35obKxtMIQDtJx+1ymSDwKk2
	T1mt9i6+Lc3mdhUrKmtdlcDKwhXYR3H1LgyLzYshIZTTC79Y2KXerWc6EA2cqzulHNW
	sNdpUjjsjTdLBHyZCrXQDKSFsPA0VLhYeqijkEIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jvIfSg7U6nwYjY9+y7+7OqC6uReW3hfNCOqYqitG50Y=;
	b=dtht6qpO+dW6wJuXrRhLE0xgRgtC8arft0mmc3U/W0BxOgVlNYalViQbrV4dLN2t
	QZLGaoGzJwHNdMG5wUUSTsJ6qY/r/vOxUl4AHgiJe5m+nW0EEnwOxffUOveVME0ugUL
	Y3tTasYkuvPrv3y0sARekGoFyuJX2u7LvIsV5xfo=
Content-Type: multipart/mixed; boundary="===============5613612346855474166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 120a6072470a5e861cf664f5adfad4b7bf80a531 FAILED
Message-ID: <0101019ffefcb8f8-421f0860-e241-4255-8872-2433c303b22a-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243411

--===============5613612346855474166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *120a6072470a5e861cf664f5adfad4b7bf80a531* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 58 skipped, 0 masked, 0 errors.
Removing 151 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 83 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5613612346855474166==--

