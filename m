Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B8DC35275
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.2251.1651434542023789292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Zo36WUnZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180812b52d8-c00d5e12-d7ab-44ce-8da5-4e5f184ec016-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VsRomDRtNsCAjNRhmYZrX/Svi2s4ObOfePW+0U5+zMI=;
	b=Zo36WUnZ0N0DQUM5Mxpio2AlKIAwOkWMUtrXyoZ/zhBA168BvyadMk3cHydR05UO
	d06aBOsOaWbN0a3MTi5jX3zk61bbkCdMgf20kOWPJe13G2vrRNKpjO7c5lxOJZvGRW2
	044F0FabSangaypCfB5QMEJTl5oReHj/zLYj69EI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VsRomDRtNsCAjNRhmYZrX/Svi2s4ObOfePW+0U5+zMI=;
	b=VMeTC9BDnGZReoyXhJ3UyGpbuamUJM7LY4qdKE3GPRiMCZFtQI/EMWkzVEIwNGdD
	Nw9XhbnYCltLlrDJR3m4Lm7qRWnmhFVAincIS6DNMiFkiHLMk4cOgj2ciDQv7/Sl/iI
	kSgvKomOA1lYJKauL1zS6UrDJq5IM+AvXEGbvGIY=
Content-Type: multipart/mixed; boundary="===============3174132932007933575=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 14.0.3 FAILED
Message-ID: 
 <01010180812b52d8-c00d5e12-d7ab-44ce-8da5-4e5f184ec016-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165098

--===============3174132932007933575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *14.0.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f llvm /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/llvm
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1645 targets, 35 skipped, 0 masked, 0 errors.

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
bb.process.ExecutionError: Execution of 'git rev-list --reverse 1f9140064dfbfb0bbda8e51306ea51080b2f7aac..HEAD' failed with exit code 128:
fatal: Invalid revision range 1f9140064dfbfb0bbda8e51306ea51080b2f7aac..HEAD



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3174132932007933575==--

