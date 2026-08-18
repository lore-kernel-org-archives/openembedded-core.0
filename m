Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE34C5DF80
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2593.1787030922556609517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ko2zUTX7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NWP4GRgz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a01357e15c-ac484e7b-e687-46f9-af6c-e42ea2f9e32f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787030921;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2qmQ9+BxD9jCXft4NbRtPOD9dBXDsElUWPQ/Yxoliws=;
	b=Ko2zUTX7hp2eLWvHDnUuplAFCMEOTj9NaqTTaEgBon8W14nsZ5M/xW7rwNu2b2Kt
	/Y3EsXKkXRZnzUcJuGxjWLqGHeal2z2yv7+rjuDR9AWQ5KZ+9GK9gPtxKn9R5n5q2pP
	fZ/T6bS0QRyqLi8VvBePL7BUwf2j4/b+or+ZLnFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787030921;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2qmQ9+BxD9jCXft4NbRtPOD9dBXDsElUWPQ/Yxoliws=;
	b=NWP4GRgzhlq0TWNejKSiiqmuIly2U9bxqycOH1W/V1hAM9qtcm73M1HUOLuLZ+CY
	gs6tKRH0gcbFJdD2tTQRyENl09uAXAqDODOJpfh56/Lsz1aqYQeEMS7JffhIOfkwIXC
	39mN+qSPYQCt26g7iSyfdzNvW7CjrICvLFcE4wMg=
Content-Type: multipart/mixed; boundary="===============3632214111345585764=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.15.3 FAILED
Message-ID: <010101a01357e15c-ac484e7b-e687-46f9-af6c-e42ea2f9e32f-000000@us-west-2.amazonses.com>
Date: Tue, 18 Aug 2026 05:28:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243642

--===============3632214111345585764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules* to *2.15.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade lttng-modules -V 2.15.3
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6f7a806ece411ab32e4b1c08a0299400bdf3b588"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6f7a806ece411ab32e4b1c08a0299400bdf3b588"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
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
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1985 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6f7a806ece411ab32e4b1c08a0299400bdf3b588"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6f7a806ece411ab32e4b1c08a0299400bdf3b588"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
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
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.lttng-modules'...
fatal: https://git.lttng.org/lttng-modules/info/refs not valid: could not determine hash algorithm; is this a git repository?
WARNING: Failed to fetch URL git://git.lttng.org/lttng-modules;branch=stable-2.13;protocol=https, attempting MIRRORS if available
Cloning into bare repository '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.git.lttng-modules'...
fatal: https://git.lttng.org/git/lttng-modules/info/refs not valid: could not determine hash algorithm; is this a git repository?

INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.15.3.tar.bz2...
INFO: Rebasing devtool onto e382aea30aa3833aa24ce3dcb8a759aaed4bc432
ERROR: Fetcher failure: Fetch command ['git', '-c', 'gc.autoDetach=false', '-c', 'core.pager=cat', '-c', 'safe.bareRepository=all', '-c', 'clone.defaultRemoteName=origin', 'clone', '--bare', '--mirror', 'https://git.lttng.org/lttng-modules', '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.lttng-modules', '--progress'] failed with exit code 128, see logfile for output
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 805, in upgrade
    rf, copied = _create_new_recipe(args.version, checksums, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
                 ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 368, in _create_new_recipe
    copied, _ = oe.recipeutils.copy_recipe_files(rd, path, all_variants=True)
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/lib/oe/recipeutils.py", line 425, in copy_recipe_files
    fetch_urls(localdata)
    ~~~~~~~~~~^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/lib/oe/recipeutils.py", line 409, in fetch_urls
    fetch.download()
    ~~~~~~~~~~~~~~^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/fetch2/__init__.py", line 1971, in download
    raise FetchError("Unable to fetch URL from any source.", u)
bb.fetch2.FetchError: Fetcher failure for URL: 'git://git.lttng.org/lttng-modules;branch=stable-2.13;protocol=https'. Unable to fetch URL from any source.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3632214111345585764==--

