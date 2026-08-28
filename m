Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FBEC61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:57:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.416.1787896667896253697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 22:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sz1lo/Oo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gsYgiMsI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a046f21bc3-a59c024c-0cef-40c3-87c0-a6c97f5f35f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787896667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=flmKhqQzfCvNJoGQoITyPN9i+vyVfwip38CsoPKRyDU=;
	b=sz1lo/OouLAIrYW9q8oT5p/Iy0UEgUa+d9yooQoNnKZzhta0W5Yajg2uRr2gRi22
	I+l7EbDAUOksuZOy0fz864q4ZwAmIESRrm/LCyNTGbY+VBwBD8a+Ja+VuW1vul01/zq
	xIZcjv4vj3U9PfDTGwHaJm2qjK0yj6IzITwu2gpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787896667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=flmKhqQzfCvNJoGQoITyPN9i+vyVfwip38CsoPKRyDU=;
	b=gsYgiMsIhCN75FM7/mSBpanO8N+lSpgNyuB34favbqbnmOLuJ5foQSf8wIQE7bGZ
	xm3SYSLgnADdICS0sp95CKOYN0vWpgY6VrmZSLvtvANVNhytVLX6mHj68qG5rbwk+yj
	esmxyqp9s0bpTL8xZknDqBVWIU+a6T5YoVAC6v+Q=
Content-Type: multipart/mixed; boundary="===============8843763596986865961=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu,qemu-native,qemu-system-native: upgrading to
 11.1.1,11.1.1,11.1.1 FAILED
Message-ID: <010101a046f21bc3-a59c024c-0cef-40c3-87c0-a6c97f5f35f9-000000@us-west-2.amazonses.com>
Date: Fri, 28 Aug 2026 05:57:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244507

--===============8843763596986865961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu,qemu-native,qemu-system-native* to *11.1.1,11.1.1,11.1.1* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (05:07:49.892238)
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (05:07:49.893059)
NOTE: Directory listing: ['conf', 'buildhistory', 'tmp', 'command-1-write-config.log', 'README', 'bitbake-cookerdaemon.log', 'oe-time-dd-test.dat', 'upgrade-helper', 'command-2-write-config.log', 'init-build-env', 'command-1-plain-cmds.log', 'command-2-cmds.log', 'cache', 'downloads']
NOTE: Retrying server connection (#2)... (05:07:50.003450)
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 58 skipped, 0 masked, 0 errors.
Removing 7 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8843763596986865961==--

