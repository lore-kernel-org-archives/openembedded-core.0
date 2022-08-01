Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F78C2BB9D
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.22117.1659341691313726990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eLMIEmKN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101825878d279-122da471-19d3-4eca-a28b-2597c4f81f26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yQiNpwasO4y6eZMAQZtVXatUn9uAwajpB2tY4v0BY8A=;
	b=eLMIEmKNSgSoGngS8KfbQ+X6skABqsUaw0BEUpP2hyWOLN3kUv1w8BKWUKsspxiL
	qKTWszp5IK2Dc/cwfZpY+z2dYLy9noRb41YbmEHPItES09CoM3HjdVOm5oIzP0sP8BB
	4vY8PqIRAfZ+aufhe3nUSLElvLZ3UhN4vcQt5VZU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yQiNpwasO4y6eZMAQZtVXatUn9uAwajpB2tY4v0BY8A=;
	b=TFRP+xTdKCT2RyH42qX2sDkQGYUGvAmdMkvDiSbZqk04E8sDHKdw3vRQQVl6T/DR
	x7/nf12bxnbMRocS9blIngoQpPcUhMH1BmT/9BwZhUgStfoNQNpMSA7Q/fcqBFqFsqY
	Q2+JXhawhcZP+a/TIRWyHLMNkKZIQ4a23/1XIOwI=
Content-Type: multipart/mixed; boundary="===============4627913942241767233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-tests: upgrading to 2.36 FAILED
Message-ID: 
 <010101825878d279-122da471-19d3-4eca-a28b-2597c4f81f26-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168716

--===============4627913942241767233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-tests* to *2.36* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade glibc-tests -V 2.36 -S 5fded9c44537283593a7f839347f831e15726572
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cc9a70388dbf3da26d760d8fc873757a9b86efa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cc9a70388dbf3da26d760d8fc873757a9b86efa"
workspace            = "master:b9223d27bdebd1356b3ece4c8735f561c947d47d"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5fded9c44537283593a7f839347f831e15726572
WARNING: Command 'git rebase 5fded9c44537283593a7f839347f831e15726572' failed:
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS

You will need to resolve conflicts in order to complete the upgrade.
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 338, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 325, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 570, in upgrade
    rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 340, in _create_new_recipe
    scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(entry)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/fetch2/__init__.py", line 357, in decodeurl
    raise MalformedUrl(url)
bb.fetch2.MalformedUrl: The URL: '${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4627913942241767233==--

