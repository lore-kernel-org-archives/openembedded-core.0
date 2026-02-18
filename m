Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2554E9A053
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1417.1771440097788459620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RI6J69o4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rFKQ8nYd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720ee001-b7ae658c-7e20-46e5-950f-c425578a55de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B62j+sxZZ4+hJcE98ob7uVuCVxHvn2Gvr7QYF1oxR5k=;
	b=RI6J69o40KbBF0ui3+MqBnagdyYofCPzDOTsHxbsOId2mxvFi9c7K23J2kCdhyLg
	danLTSN3hK5HCztVIQnWAs+cGg+dM16DfQMBUcXc/81yt5SREhabQiXkvrQVf+oSCCF
	JuvusALRgbHdLYqk1lWfj+IuZmuEPSOBoGktDvp4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B62j+sxZZ4+hJcE98ob7uVuCVxHvn2Gvr7QYF1oxR5k=;
	b=rFKQ8nYdeiP6pWXXllUh1bSfYd3ALlEHxqde7p0kn+04wtIDT6ANsVpjO0fCSJ15
	Ev7/kNdhCSWpNGcZaLtqrAy7nbweszU+9rnuPGZfMWq7HIvVcsJ4UgZxhMQWcfgLc35
	SwFXESgs2PkkU8X2fvaN9ysPZlc2za2BCIpBZaZI=
Content-Type: multipart/mixed; boundary="===============5353753696304036923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyzstd: upgrading to 0.19.1 FAILED
Message-ID: <0101019c720ee001-b7ae658c-7e20-46e5-950f-c425578a55de-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231358

--===============5353753696304036923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyzstd* to *0.19.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-pyzstd failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-05b92818fc1747f9bad95aac567fa0f20c62e955"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:05b92818fc1747f9bad95aac567fa0f20c62e955"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-05b92818fc1747f9bad95aac567fa0f20c62e955"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:05b92818fc1747f9bad95aac567fa0f20c62e955"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/pyzstd/pyzstd-0.19.1.tar.gz;downloadfilename=pyzstd-0.19.1.tar.gz...
INFO: Rebasing devtool onto c7d8e9c56887ae9113f5d3ea746250a75298c6ff
WARNING: Command 'git rebase c7d8e9c56887ae9113f5d3ea746250a75298c6ff' failed:
Auto-merging pyproject.toml
CONFLICT (content): Merge conflict in pyproject.toml

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-pyzstd
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-pyzstd/python3-pyzstd_0.19.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5353753696304036923==--

