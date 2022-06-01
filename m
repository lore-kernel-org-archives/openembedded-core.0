Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16F4CCA495
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.618.1654100323104782820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P3imEvGJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181200feaa8-e0b4b206-c383-49fe-ad34-06df87fd3f65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hj+5J4Ye6TT5+Qsxib0ufx+8dAkCg84KjAFNBPiDidk=;
	b=P3imEvGJKpHT9QA9vrWeSVu/+VBBt/E0qrBYvCOWNOIj6F9TvbqmK0qzl7D56tWL
	1fQRVDF2oXvLnJkBLyedLQ+G5BpyDhLyubox8EpWZ+UQ/26ccwJrlOznihGUhDCbxqs
	ySIs2RvEW33c3kTKmFp+xT7wSFkordDqyaNWFRYE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hj+5J4Ye6TT5+Qsxib0ufx+8dAkCg84KjAFNBPiDidk=;
	b=AiL4svodLUTAByPYR3mGJi7z6C1OhS8Pds1XeGzXpfAq6z9mzkY715wSoJTU4YYH
	iYJAU8XkZAtJuOdYSYYOZvjVdLPpngwro2OPE5sx4Zsh9Qm3gxoXpyKYinG08dtAQM0
	/AAvRGKP9G/FL5KwPeKMh+0wY2W38OB6eMSwzy2s=
Content-Type: multipart/mixed; boundary="===============6245163723204523692=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 14.0.4 FAILED
Message-ID: 
 <01010181200feaa8-e0b4b206-c383-49fe-ad34-06df87fd3f65-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166398

--===============6245163723204523692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *14.0.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f llvm /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/llvm
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (882 cached, 2 parsed). 1645 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2108, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1814, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1608, in _update_recipe_patch
    initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev, force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1213, in _get_patchset_revs
    initial_rev, cwd=srctree)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/process.py", line 187, in run
    raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
bb.process.ExecutionError: Execution of 'git rev-list --reverse 29f1039a7285a5c3a9c353d054140bf2556d4c4d..HEAD' failed with exit code 128:
fatal: Invalid revision range 29f1039a7285a5c3a9c353d054140bf2556d4c4d..HEAD



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6245163723204523692==--

