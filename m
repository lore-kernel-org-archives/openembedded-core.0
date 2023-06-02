Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7A0CA9EA0
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7542.1685693435100085531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bc+1JZiY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b288a40-fa60c0d9-039a-47ed-b017-2c5a2ee3e2b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8xDN19Ncgq+wwHC+eBg2Sndpp/fFGeueZg6pgDtpDTU=;
	b=bc+1JZiYMM80pMYk5JelEja8p0AV062bvDW+0Lp58afXZK/CMeUI4K1dUACw0m5Z
	U62O0vnQtV4hPLsw1JGUVxk244b9cFY7Vf5SEVCWTHWhh8hIhmjRfXf+R0eLAHuKTiG
	LqTGVKYCezp2TZq0klRqHAZUCZTDSe4Dy3OstFVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8xDN19Ncgq+wwHC+eBg2Sndpp/fFGeueZg6pgDtpDTU=;
	b=NakYCAaw/487sKtqN39b3xoVGKkALqH1CM2jOuceJUHE/jZoMI18xmWc3wp7/w6j
	6ASLNtkKaFiwsOgDwgor0NEHVqRRN47xC8hajOrHn8WCNDu9cOUPSEWKMjb6DYnN0X6
	DjRGDGPIYVqfrOFxZFI66oVeQffCZAzrwHJklU8w=
Content-Type: multipart/mixed; boundary="===============3113817134827178707=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.56.1 FAILED
Message-ID: <010101887b288a40-fa60c0d9-039a-47ed-b017-2c5a2ee3e2b9-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182235

--===============3113817134827178707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librsvg* to *2.56.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade librsvg -V 2.56.1
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8bc4234049d397a9bd2e94bf4811f87406255a72"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 349, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 559, in upgrade
    rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 696, in _extract_source
    shutil.rmtree(tempdir)
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/shutil.py", line 732, in rmtree
    _rmtree_safe_fd(fd, path, onerror)
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/shutil.py", line 660, in _rmtree_safe_fd
    _rmtree_safe_fd(dirfd, fullname, onerror)
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/shutil.py", line 660, in _rmtree_safe_fd
    _rmtree_safe_fd(dirfd, fullname, onerror)
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/shutil.py", line 660, in _rmtree_safe_fd
    _rmtree_safe_fd(dirfd, fullname, onerror)
  [Previous line repeated 1 more time]
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/shutil.py", line 683, in _rmtree_safe_fd
    onerror(os.unlink, fullname, sys.exc_info())
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/shutil.py", line 681, in _rmtree_safe_fd
    os.unlink(entry.name, dir_fd=topfd)
FileNotFoundError: [Errno 2] No such file or directory: 'gc.log.lock'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3113817134827178707==--

