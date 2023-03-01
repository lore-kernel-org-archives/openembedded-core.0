Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB8EC6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.24032.1677681913958111116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YMcB0FZu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101869da26d06-96dead25-acf5-4407-b081-c4e4734f1dbb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TE0B7oGb85egn8ZLvtag7m9XESNrWx+Z5u+fRIkIDiE=;
	b=YMcB0FZuV0yUql4dmTznyarxII9rulO9wtY7JAz888TqmU3ikDorQr1wdiEjsZVQ
	PaG33TV9YU0t9aQxPUPJZZzIy9qfj8qgSNNq9q2K4VODHTcum8PXC0coMDpW5MWJbeC
	nIuWpKBvLQog2iOkSegqoj+ZphuTW9JPpJGrkkEI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TE0B7oGb85egn8ZLvtag7m9XESNrWx+Z5u+fRIkIDiE=;
	b=MMhdDkL1A+eUAZ+HpXXRPKDS6a+JLMLEj+KFWxLDNHkDb1VpdznbySQdWzaMh+va
	w/Gq+5GoeYBqs5D4Epo8k2+SqsxoKiAiBdX9OY3o8HX9SZ4Lz0qRXRNvSnWKQ4s27vp
	PvQTOC8NzdYtL1V3iiZCpMcanZHUurIPyQn5fNug=
Content-Type: multipart/mixed; boundary="===============5955782001371192388=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd: upgrading to 253 FAILED
Message-ID: <010101869da26d06-96dead25-acf5-4407-b081-c4e4734f1dbb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177891

--===============5955782001371192388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd* to *253* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemd -V 253 -S 477fdc5afed0457c43d01f3d7ace7209f81d3995
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:40:58.100865)
Loading cache...done.
Loaded 1697 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0a96198be305e9ef9e7af2fbec88d3cc64d5a831"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0a96198be305e9ef9e7af2fbec88d3cc64d5a831"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 477fdc5afed0457c43d01f3d7ace7209f81d3995
WARNING: Command 'git rebase 477fdc5afed0457c43d01f3d7ace7209f81d3995' failed:
Auto-merging docs/ENVIRONMENT.md
CONFLICT (modify/delete): src/basic/util.c deleted in HEAD and modified in 83a772aae2 (Revert "initrd: extend SYSTEMD_IN_INITRD to accept non-ramfs rootfs").  Version 83a772aae2 (Revert "initrd: extend SYSTEMD_IN_INITRD to accept non-ramfs rootfs") of src/basic/util.c left in tree.

INFO: Rebasing devtool-override-libc-musl onto 477fdc5afed0457c43d01f3d7ace7209f81d3995
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 565, in upgrade
    rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 273, in _extract_new_source
    __run('git checkout %s' % b)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 175, in __run
    return _run(cmd, srctree)
           ^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 31, in _run
    return bb.process.run('%s' % cmd, cwd=cwd)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/process.py", line 189, in run
    raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
bb.process.ExecutionError: Execution of 'git checkout devtool-override-libc-musl' failed with exit code 1:
error: you need to resolve your current index first
src/basic/util.c: needs merge


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 349, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 573, in upgrade
    _upgrade_error(e, recipedir, srctree, args.keep_failure)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 139, in _upgrade_error
    _cleanup_on_error(rd, srctree)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 131, in _cleanup_on_error
    if not len(os.listdir(rdp)):
               ^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5955782001371192388==--

