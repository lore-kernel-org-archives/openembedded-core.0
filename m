Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A38C32762
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.3952.1659679409104886902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ek0mxXWf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101826c99fdf6-812bbdbf-7563-43b3-b1c1-a6b294c52cb7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ibr89fKHUeMVV3I9wCf3w+DLn5AQfC8oiToAPzhMRYA=;
	b=Ek0mxXWfjOBXOIHOrvj4jBhATEGxabUODzCdgvk8Spts1aH9ft7lxt8XR1Z43ZQR
	6lOZ9qhQvLWCwk1GZCYdbIhSvE0T2Y9AAypwZVwddpMahLmjSRT/pCvuF6WWfcZo27f
	upDPlMYi6b9bb5tA7y+uuAcyIpusarqhkfdxFPkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ibr89fKHUeMVV3I9wCf3w+DLn5AQfC8oiToAPzhMRYA=;
	b=hE9Obje7lNPoaKIK/Rk67BdHAFxt4H9GktXe0YQ7ht8JHsVt/LQoxaJoxNZy2mh/
	f2q9rNQf2D0gXfV5ITET1vYin3fhSGYK7S2l01G4BhNEMdZGYSBsvh/3RnfgTozD/Ef
	SXASHnGJBVJUPQBq7ER3FwRGPPOpE0DKzYNX2J5c=
Content-Type: multipart/mixed; boundary="===============5798433470520610450=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 22.2.2 FAILED
Message-ID: 
 <010101826c99fdf6-812bbdbf-7563-43b3-b1c1-a6b294c52cb7-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168910

--===============5798433470520610450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *22.2.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-pip failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-cee6e03be878ace77010d2d9ba5c03cf83085afa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cee6e03be878ace77010d2d9ba5c03cf83085afa"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (887 cached, 2 parsed). 1660 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-cee6e03be878ace77010d2d9ba5c03cf83085afa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cee6e03be878ace77010d2d9ba5c03cf83085afa"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  34% |############                        | ETA:  0:00:00
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/pip/pip-22.2.2.tar.gz...
INFO: Rebasing devtool onto ccf8116733c82aacb214e1179a7797401cd15867
WARNING: Command 'git rebase ccf8116733c82aacb214e1179a7797401cd15867' failed:
Auto-merging src/pip/_vendor/requests/certs.py
CONFLICT (content): Merge conflict in src/pip/_vendor/requests/certs.py
Auto-merging src/pip/_vendor/chardet/metadata/languages.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/metadata/languages.py
Auto-merging src/pip/_vendor/chardet/langturkishmodel.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/langturkishmodel.py
Auto-merging src/pip/_vendor/chardet/langthaimodel.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/langthaimodel.py
Auto-merging src/pip/_vendor/chardet/langrussianmodel.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/langrussianmodel.py
Auto-merging src/pip/_vendor/chardet/langhungarianmodel.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/langhungarianmodel.py
Auto-merging src/pip/_vendor/chardet/langhebrewmodel.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/langhebrewmodel.py
Auto-merging src/pip/_vendor/chardet/langgreekmodel.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/langgreekmodel.py
Auto-merging src/pip/_vendor/chardet/langbulgarianmodel.py
CONFLICT (content): Merge conflict in src/pip/_vendor/chardet/langbulgarianmodel.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/python3-pip
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/python3-pip/python3-pip_22.2.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5798433470520610450==--

