Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74571F42106
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19731.1776261870716708588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ei482az3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JQ/5kC98;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d91753186-de77db10-1601-4067-b8aa-137511203f18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MgVY9FQwLVp6Aj7wmxYtEqIbtaVgSK8YN9Yo6dAfS0k=;
	b=Ei482az3lN8215HJz2ZLbgTmTAqijghZsN6F5GnqlTqgcBCoFXtpAOFnxvTyUO/H
	IA3+Ofifimf/5FS5a2XOCU3vqlTfcIjT9LjGHFLVcCmjqc+CTrBxl26mJ4IhcVct4m7
	Dfgp2i7qbScupD5UP/nNwnYw1OzSDRb0tdC2Wctk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MgVY9FQwLVp6Aj7wmxYtEqIbtaVgSK8YN9Yo6dAfS0k=;
	b=JQ/5kC98ODa1i4TGX8d/lIQlS5HWIF1I7ThXsXJU+Bs8MaFv+IlLuVfXPKQyILVr
	YKhpTvEzYO2lLnl78erB9GYEGXlo+h1ju7iyDqzYPQ+B4UutMPR22KkKpqxmLU+OSZh
	k+IrKdXpApYD4e62eXKZkW7el75PwQQqVcmN0nCk=
Content-Type: multipart/mixed; boundary="===============6884564787436012435=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native:
 upgrading to 2026.04.15,2026 FAILED
Message-ID: <0101019d91753186-de77db10-1601-4067-b8aa-137511203f18-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235206

--===============6884564787436012435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native* to *2026.04.15,2026* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade sbom-cve-check-update-nvd-native -V 2026.04.15 -S bcef629b5c77191ee09bae9c291a4a9d92847e9f
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1971 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-25e45cdfb653b1c348410390bf61aaf0c8b8ccdf"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:25e45cdfb653b1c348410390bf61aaf0c8b8ccdf"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415054004.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415054004.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/nvd-fkie"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sbom-cve-check-update-nvd-native/1.0/devtooltmp-rj_hzwcn/temp/log.do_unpack.2197
ERROR: Extracting source for sbom-cve-check-update-nvd-native failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6884564787436012435==--

