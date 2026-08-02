Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E87C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 06:00:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18893.1785650409246163285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 23:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VcBDFjQ7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qA00bnY6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fc10eeb49-aa892c3f-e418-436d-ab24-48ea3401ee5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785650408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=fEX287IZs3NyNDjaPxbTu5ZBt8KJ2+VgGK2UuIfXFqY=;
	b=VcBDFjQ7aDx00AEM5HNoiAym6oANH65ievn4nN/c8oruYT2VF5f8Awo8n7OKnRSk
	W0wqV2d+rMVnIQD1WzkKGjhiDRYtBbCupa1r9vOIsogupxr+RsHcffh1ZMrsKxLlZc0
	WgpLzHv90BtDZPiCOl2d3740jiJBCBdyVurYuY/E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785650408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=fEX287IZs3NyNDjaPxbTu5ZBt8KJ2+VgGK2UuIfXFqY=;
	b=qA00bnY61chVFKVvXXaH766ghkfFwMZiSxcH8PkX1jUht9FH2lj7NjhmDOtQT/NG
	DO9fV+PvThd7jzSt95CsfYlfWPIEqz6K17xqSMN5Qh2okKY1T7zso+iQtibeRcbzWb8
	NYpJAL7MYNUDFOW/kc4xTfVSnISc8ubkkjA9FcMo=
Content-Type: multipart/mixed; boundary="===============5975191326326059130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.84.1 FAILED
Message-ID: <0101019fc10eeb49-aa892c3f-e418-436d-ab24-48ea3401ee5d-000000@us-west-2.amazonses.com>
Date: Sun, 2 Aug 2026 06:00:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 06:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242521

--===============5975191326326059130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vte* to *0.84.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vte -V 0.84.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1988 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-97ffd99bd37a859409b1c74d5771949fb2b848a0"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:97ffd99bd37a859409b1c74d5771949fb2b848a0"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260802055946.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260802055946.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vte/0.84.0/devtooltmp-ikutq8cn/temp/log.do_patch.118649
ERROR: Extracting source for vte failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5975191326326059130==--

