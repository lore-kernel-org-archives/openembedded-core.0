Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB11EC4450B
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8003.1783669770626879010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iDOqbbEH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VrosAoML;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f4b00c5f0-25b328a8-555f-4d58-9596-6070ff429589-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FxOWECvXxxx14LLnTKwQmNLEI8/B7RUYWLq2PaIJL84=;
	b=iDOqbbEHvEueL5QypuCKrNByDvOu4FxtlnPybJVSCVeaTeKKBnhgItu0QqdFfhjF
	ywn0yAmj6K1gwwMth2auTT6w0k+ZaBwHC9ONWbfxjZQhd2ERAuMiFthzNJkV2V6YOHn
	ubyNQo/Vt0BQcKWn45Ykmvhp1F75GxjQqGmIMUCI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FxOWECvXxxx14LLnTKwQmNLEI8/B7RUYWLq2PaIJL84=;
	b=VrosAoML6xmYsge0pg1UptPezb0VfBTyAoXwU2bXweetxwcPDRvsvzdhibP6+qmM
	SmOzxZBEH/JdA7v9m8kuyVbNZNZPuq4KPqeaP/KTTHDsOjFYqixzKBVpTCNAt65hSB1
	gDUt3j/xnTJrnyBNmlVLMrTGaPs50JrO5MqYjQMw=
Content-Type: multipart/mixed; boundary="===============4886477634661571346=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lame: upgrading to 3.101 FAILED
Message-ID: <0101019f4b00c5f0-25b328a8-555f-4d58-9596-6070ff429589-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240611

--===============4886477634661571346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lame* to *3.101* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade lame -V 3.101
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ee3e278ff045fa0fe54a5018aa05d1a3ecfed5e2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ee3e278ff045fa0fe54a5018aa05d1a3ecfed5e2"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ee3e278ff045fa0fe54a5018aa05d1a3ecfed5e2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ee3e278ff045fa0fe54a5018aa05d1a3ecfed5e2"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/lame/lame-3.101.tar.gz...
INFO: Rebasing devtool onto 8f7c9bd37d846ae7702857ec02d045a2e741ab73
WARNING: Command 'git rebase 8f7c9bd37d846ae7702857ec02d045a2e741ab73' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/lame
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lame/lame_3.101.bb
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 767, in upgrade
    changelog_file = _extract_changelog(srctree, pn, old_ver, newpv,
                                        'devtool-base', new_tag,
                                        config.workspace_path, is_git)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 621, in _extract_changelog
    diff_out, _ = _run('git diff %s %s -- %s' % (old_tag, new_tag, shlex.quote(fname)), srctree)
                  ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 58, in _run
    return bb.process.run('%s' % cmd, cwd=cwd)
           ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/process.py", line 181, in run
    stdout = stdout.decode("utf-8")
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xe9 in position 859285: invalid continuation byte


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4886477634661571346==--

