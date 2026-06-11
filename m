Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A892CD98E6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50612.1781195504249404383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OEd9PtZq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Vb3jtqJy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb78677a1-be9a324e-029e-40da-9ee0-b0fbb6727f71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sYM0QIMUU+3nhv3XCe4rtwdLz4jfvF7p6Rta54Sus0s=;
	b=OEd9PtZqyLeK9sDFmJPTC2TpFBq4xQ2mVFAuW467rZrbQJ4/J20zPSU4FmrojVo8
	Yq54yh1xRkjMidda4pG7rHMn44yt8gImml+TXLyWJfk6F1YNyRS41GMETkvZWkUkwxw
	O6IHtuulHGhV6MtbV8lo2T5UNmFUq6RXtA8qDmj8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sYM0QIMUU+3nhv3XCe4rtwdLz4jfvF7p6Rta54Sus0s=;
	b=Vb3jtqJyGCcInuNDX9w2H19/S2+6T3HlqSqazfidq9smRei0dpcfgaEdpIjFkyoZ
	hS/eHWiGN+thotSskTb76LSReu5CZIk1vQ7LgnmnkqMTz7lBLjznUXdfGZxwxULaWOp
	0PMWDEV5pTTVZA63F6bVPqzMq2gmTRCYjrY9zZPs=
Content-Type: multipart/mixed; boundary="===============8704062112702438239=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 428664896cf9e92d264976a960c76660938dffce FAILED
Message-ID: <0101019eb78677a1-be9a324e-029e-40da-9ee0-b0fbb6727f71-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238486

--===============8704062112702438239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnu-config* to *428664896cf9e92d264976a960c76660938dffce* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 428664896cf9e92d264976a960c76660938dffce
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-5cec121b974f50751bf06fd4343c3c18b471e2fa"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:5cec121b974f50751bf06fd4343c3c18b471e2fa"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 17 Local 9 Mirrors 0 Missed 8 Current 12 (52% match, 72% complete)
done.
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 59 tasks of which 38 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611090945.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611090945.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError("Fetch command ['git', '-c', 'gc.autoDetach=false', '-c', 'core.pager=cat', '-c', 'safe.bareRepository=all', '-c', 'clone.defaultRemoteName=origin', 'remote', 'set-url', 'origin', 'https://git.savannah.gnu.org/git/config.git'] failed with exit code 128, output:\nshell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory\nfatal: Unable to read current working directory: No such file or directory\n", None)
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gnu-config/20250709+git/devtooltmp-82mc20yw/temp/log.do_unpack.587867
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8704062112702438239==--

