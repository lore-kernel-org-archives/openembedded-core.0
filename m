Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BDEC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2330.1783489329948852338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H2iVYEsp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UmCo5XUy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f403f7669-09063155-5109-4518-912a-03091a268ee6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WaCs8w/mZ9SFSd++8PNRQVxb76fWCT5AOo33/dZ9hDo=;
	b=H2iVYEspiu9L7bHagu9frDvWRkk1WDoQukTLXRNfqnsbGDpArlaTpo1FeIJIPWuB
	cKEAaKENaLYpqYxTiNm0jH7ALqCcQ8kNaF89z8xvruzVEiGnQt3GvpsY4ecFhXYIBTC
	iojG4I7f8RRubh5ni5KpxuBmjo7yb3Kg2MhUF5pk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WaCs8w/mZ9SFSd++8PNRQVxb76fWCT5AOo33/dZ9hDo=;
	b=UmCo5XUy/YscaCoxSWEPh0ezU82Ar5py4099AiTKKgocJDk+rqp8ii3B+DF7jlom
	KIBbd6XO1Y0WJtKq4XcKRCu82XNjwy4ywWdnPumReYIwaNyfB0PqcJ6HijG/0GaQc8Q
	Oxmvm1mXkyFZm1ECKYjZN5VjaQf1P5C2ArKgXj4A=
Content-Type: multipart/mixed; boundary="===============6766055218294589853=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-cross-canadian-x86-64,go-runtime,go-cross-x86-64-v3,go-crosssdk-x86_64-pokysdk-linux,go:
 upgrading to 1.26.5,1.26.5,1.26.5,1.26.5,1.26.5 FAILED
Message-ID: <0101019f403f7669-09063155-5109-4518-912a-03091a268ee6-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240426

--===============6766055218294589853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-cross-canadian-x86-64,go-runtime,go-cross-x86-64-v3,go-crosssdk-x86_64-pokysdk-linux,go* to *1.26.5,1.26.5,1.26.5,1.26.5,1.26.5* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (05:05:07.810674)
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (05:05:07.811512)
NOTE: Directory listing: ['bitbake-cookerdaemon.log', 'downloads', 'README', 'cache', 'command-1-plain-cmds.log', 'command-1-write-config.log', 'command-2-write-config.log', 'buildhistory', 'command-2-cmds.log', 'oe-time-dd-test.dat', 'tmp', 'upgrade-helper', 'conf', 'init-build-env']
NOTE: Retrying server connection (#2)... (05:05:07.921731)
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 58 skipped, 0 masked, 0 errors.
Removing 6 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6766055218294589853==--

