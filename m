Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078E0CA0EDC
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.88636.1754057271655229901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Kh162D6C;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RcPqcrXY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019865f5e702-a94595ef-62d2-4b65-b774-a98e5591d5b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UU0Pvgq/CLVFJz9lYgV4CZNSgpFBycBu+3Mojkw0Uio=;
	b=Kh162D6CrZBW0/XMTjjY4NIXy0ookrTEqkLcFJG86s6CeAG3ibn7Sli/k4ZJOF46
	M7BOQmkEoSch62vAPxFtP5rVpsvXnzuKkizFhI7ItbUX8VpsOpiV/DJHsJCqSzRLULJ
	GTInf1cXZmiD6A3XbLTd19uUrlUzlNlg/AqVyuEM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UU0Pvgq/CLVFJz9lYgV4CZNSgpFBycBu+3Mojkw0Uio=;
	b=RcPqcrXYGqECXzss6G06eo8vxr86h64Ze6Ukb2bdB9Ghq/AAXDOgPAT3G7HBX363
	sJtVpp35iWPTCyfqiofb5o7lfcNwhiZcWJfmCpuGxO3XIumfh4ZTpht1jlO7eHu6r53
	HFoTiyHX3RuLcDtGjPMuTl24+SFGZLUGj9R6pT2o=
Content-Type: multipart/mixed; boundary="===============8724199763381345903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.22 FAILED
Message-ID: <0101019865f5e702-a94595ef-62d2-4b65-b774-a98e5591d5b4-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221276

--===============8724199763381345903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-docutils* to *0.22* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-docutils -V 0.22
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d742084727861653e7d45fbb6edeca26391189c9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d742084727861653e7d45fbb6edeca26391189c9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 943 .bb files complete (0 cached, 943 parsed). 1934 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d742084727861653e7d45fbb6edeca26391189c9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d742084727861653e7d45fbb6edeca26391189c9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  15% |#####                               | ETA:  0:00:00
Adding changed files:  31% |###########                         | ETA:  0:00:00
Adding changed files:  47% |#################                   | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.tar.gz;downloadfilename=docutils-0.22.tar.gz...
INFO: Rebasing devtool onto 71995beff919dd2333c01484701ad555a06b76e9
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 610, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 509, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-docutils/COPYING.txt'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8724199763381345903==--

