Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA73ED172A6
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29052.1769951564401180849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E9XCHAVv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qOahf8C6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c1955b534-75d05006-1b5d-4bb5-bef6-d97561ed4574-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GrrNASiOHbA7hfn/FtwXoO1Q8KjPZUGLefb0xLH/xHM=;
	b=E9XCHAVvDMuhSnl0bf8uM9unemBuMpk/9+vVQpfSiDmn72jzEsjyoDxB4qD8z9bN
	H72FX/b91lpCgmrsEuV+kYdFywuiQkqR0ci2OZrsUQfngZWaIarlGYKvRCpCJGhZcrg
	qGtzkrZAeZ87g0E7CXSdCjmx67S+HBXNI5Eoa9AY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GrrNASiOHbA7hfn/FtwXoO1Q8KjPZUGLefb0xLH/xHM=;
	b=qOahf8C6clBYGzHFgw5l33/dnrJpa7lhsUfgiFSd4LENTZPLySK1oshYXNfyLFJQ
	JCUX5i+AKgU5NLHO5DQjH1GZN7Q+8lWmDF3BPf6f9LdrFpYx8XzK3R57X1DmTChtfso
	D8/q9Poba5dOiDQT0QphzSLlxdW/UZ/+C3ajQQU0=
Content-Type: multipart/mixed; boundary="===============6964586895195084678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mdadm: upgrading to 4.5 FAILED
Message-ID: <0101019c1955b534-75d05006-1b5d-4bb5-bef6-d97561ed4574-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230295

--===============6964586895195084678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mdadm* to *4.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mdadm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1957 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c15062d0163004cbee33b6cbb7b06b8017d7c9f0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c15062d0163004cbee33b6cbb7b06b8017d7c9f0"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8f0c7692d48414ff7b3fe927ce75799c65ef24b1
WARNING: Command 'git rebase 8f0c7692d48414ff7b3fe927ce75799c65ef24b1' failed:
Auto-merging raid6check.c
CONFLICT (content): Merge conflict in raid6check.c
Auto-merging restripe.c
CONFLICT (content): Merge conflict in restripe.c
Auto-merging swap_super.c
CONFLICT (content): Merge conflict in swap_super.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mdadm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mdadm/mdadm_4.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6964586895195084678==--

