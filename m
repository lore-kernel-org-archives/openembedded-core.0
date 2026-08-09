Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15662C5AD55
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 06:00:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4793.1786255199230858191
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 22:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kOH55PY3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4iW7Qntu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019fe51b47ee-538a9cd2-24c7-431d-bf8b-ceb319cbda97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786255198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GnL/2YT5TzY5Ed9Gba2ygS2SRja5QnkAJRZf6VnBSYQ=;
	b=kOH55PY3MypN6C1dHxYw1STZ755eAEYVuzATbn1Zc1lxUFy2zsJwm8RfSvmGnarv
	/9tCaOGNTrlf+thv3XouNWDOGhsen/z8/4SBBuNMvRTnOTJl4XrSCLEyRPrINKPXjDp
	NZRF61HhuRC54p4oz4a8qrh1XAkPgCbwmjku3DzQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786255198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GnL/2YT5TzY5Ed9Gba2ygS2SRja5QnkAJRZf6VnBSYQ=;
	b=4iW7QntuIT+jKxyADnd+iuw07ZihOVHkY/GEVy7xvlQD9ISxFl0qrKy68NT7gguS
	SPV0ctVBYB5rkTZC54BUf0rtWy6fGWQ+G/WfEIIxtMjTH+g4vB0gTaBqFERV93pL0XC
	vkBhdOoHuLuIOzEWTxhRLf3EYJl9zI46I9Vb6w1U=
Content-Type: multipart/mixed; boundary="===============5206259403672787231=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-16.1.0: upgrading to 16.2.0 FAILED
Message-ID: <0101019fe51b47ee-538a9cd2-24c7-431d-bf8b-ceb319cbda97-000000@us-west-2.amazonses.com>
Date: Sun, 9 Aug 2026 05:59:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.09-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 06:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243057

--===============5206259403672787231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gcc-source-16.1.0* to *16.2.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-16.1.0 -V 16.2.0
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.

INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
ERROR: The gcc-source-16.1.0 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5206259403672787231==--

