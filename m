Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1462E9A05C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1419.1771440097995604526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=y/0vof+y;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Cb3OdeUV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ed976-2b383487-db50-44dd-a98e-82e6ff5c332c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3EbaQ8Bq0WFFxvIemzhBLLQGwJCegnsq5EAJKUcFLjY=;
	b=y/0vof+yp2bnN318QxBCHGiwaCdV2ceN1pSAYwTKW1mgH2RGHfYKh+XEOaX2uqyJ
	Lb3l5XN6A1IM0z1A3UfQhMZziTSf5GPpnwVEc3UHsXlSfyBPfOG4k236Cp8EC1h7Ln1
	VFtikFOilXvpPmuiFfBoZvqeeuXtU70akb6uE2Tc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3EbaQ8Bq0WFFxvIemzhBLLQGwJCegnsq5EAJKUcFLjY=;
	b=Cb3OdeUVinLYS7cpzeBkAZd+wG5cUBFNF0wlxQ8z37it+yI98FNfBn91xkvnGWJk
	t4mcBiJDKe7Efd62uIo/6iNxx1wlbrp+myL4rBHNUN1OVKPWWxpAaG1f+5p1e3TtohF
	axGlCdcP7xYObUq7EqTLLXXtyFFqNBhFcaHWnpE4=
Content-Type: multipart/mixed; boundary="===============6470683283381357066=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perlcross: upgrading to 1.6.4 FAILED
Message-ID: <0101019c720ed976-2b383487-db50-44dd-a98e-82e6ff5c332c-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231351

--===============6470683283381357066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perlcross* to *1.6.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade perlcross -V 1.6.4
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-6122d10c7c97288bab5f4ec9c2408c85f39f34cd"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:6122d10c7c97288bab5f4ec9c2408c85f39f34cd"
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

INFO: Extracting current version source...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 590, in upgrade
    old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 494, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/perlcross/1.6.2/sources/README.md'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6470683283381357066==--

