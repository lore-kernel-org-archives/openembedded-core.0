Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E184AC71132
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.27767.1748786125129691612
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eu8wxKEZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TgCkoeMG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101972bc69448-0ed3deb3-dc33-45ba-94b4-86fb02458f32-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786124;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AgMBXB880mQyowsL4ZzkYFanI8skbq+Q7AduKlksbpY=;
	b=eu8wxKEZHWLVvt+d8kwXMytapAyA+nOV76ykat0VS/PCVMHrCO0r5iVI5+bVBGzV
	AITvRlkbaXB0gc0lihgiZApIgZ/5eFrSOhDmhRffKe8ZJFsdYp86mcsHPa+PxRc8bda
	KFl9VTlP8P+fJPfyBsYiMUb2+PJPKb0ihipAVHoE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786124;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AgMBXB880mQyowsL4ZzkYFanI8skbq+Q7AduKlksbpY=;
	b=TgCkoeMGE4scvMYOg/sI2HIx+S1jVjikKxcosyj8iBOSHbeJ1ClNkSGQ3m+hsBFH
	eKkgaYBePEUIEtlCJGc9TCAQJCHTx4/rQoQ1T2wh5gvVuEZBkLWqoTmdpRJlHAOnfX0
	Xsw8n2x91C3SFipBH1yOr2ieUuPVLPmXuBImp9rQ=
Content-Type: multipart/mixed; boundary="===============8427050830928714344=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quilt-native,quilt: upgrading to 0.69,0.69 FAILED
Message-ID: <010101972bc69448-0ed3deb3-dc33-45ba-94b4-86fb02458f32-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217566

--===============8427050830928714344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *quilt-native,quilt* to *0.69,0.69* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade quilt-native -V 0.69
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:deb9c3e041dfcf82d9ea54e062ed832493fb16af"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601065404.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601065404.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Execution of 'git rebase devtool-no-overrides' failed with exit code 1:
error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/quilt-native/0.68/devtooltmp-3kwemol2/temp/log.do_patch.2322999
ERROR: Extracting source for quilt-native failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8427050830928714344==--

