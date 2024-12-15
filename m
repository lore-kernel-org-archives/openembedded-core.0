Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB436E77196
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.33385.1734254985283714179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RcvLmyae;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3TmcKZn7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193c9a6fff7-3fe1d0ae-60a5-42b4-b767-d141e23c0eb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SmghbssosZg75vE11NlW6RSvpQh2H2bCWRDrRCHlB80=;
	b=RcvLmyaeKn6usjaXYDB3/7jSrKdJ9nk48sRrcj1SIA2NEJP/kuzCeH4/kLCdSxUA
	jZcMkE0hEGO/+d5B+3PybnWc6ZP3joxA6pQow2l+CAgS8IX8kzMYBFJhScSyrHrMgAk
	QgDoJ+FC+OhD980a9PjuLERRzM8mcJfj/RNaJ16g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SmghbssosZg75vE11NlW6RSvpQh2H2bCWRDrRCHlB80=;
	b=3TmcKZn7UbinsIvTt8XYto1C4e0Sx58GlYBR4qSbvA1c2HU7IyQn38hTk8dS2Vtf
	sxwfbUWznum3GsiwDoDx545W2s20ba/QvPvcRnNFSITPDAW9a8VpSQvQ2ZJ1v2w3tAw
	4SizlxhWKuizl2+hgTt9riFgu6aGiEiF4+W3iqvk=
Content-Type: multipart/mixed; boundary="===============0805340425128067065=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.3.1 FAILED
Message-ID: <01010193c9a6fff7-3fe1d0ae-60a5-42b4-b767-d141e23c0eb8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208725

--===============0805340425128067065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *24.3.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:075a9a046d0cf6c96064a6e129c97de3eb0603df"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:075a9a046d0cf6c96064a6e129c97de3eb0603df"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-7exz747r: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-2i4i0n80/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-2i4i0n80/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:09
Adding changed files:   2% |                                    | ETA:  0:00:07
Adding changed files:   4% |#                                   | ETA:  0:00:06
Adding changed files:   5% |#                                   | ETA:  0:00:06
Adding changed files:   6% |##                                  | ETA:  0:00:06
Adding changed files:   8% |##                                  | ETA:  0:00:07
Adding changed files:   9% |###                                 | ETA:  0:00:09
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  12% |####                                | ETA:  0:00:07
Adding changed files:  13% |####                                | ETA:  0:00:07
Adding changed files:  14% |#####                               | ETA:  0:00:07
Adding changed files:  16% |#####                               | ETA:  0:00:06
Adding changed files:  17% |######                              | ETA:  0:00:06
Adding changed files:  19% |######                              | ETA:  0:00:05
Adding changed files:  20% |#######                             | ETA:  0:00:05
Adding changed files:  21% |#######                             | ETA:  0:00:05
Adding changed files:  23% |########                            | ETA:  0:00:05
Adding changed files:  24% |########                            | ETA:  0:00:05
Adding changed files:  25% |#########                           | ETA:  0:00:05
Adding changed files:  27% |#########                           | ETA:  0:00:04
Adding changed files:  28% |##########                          | ETA:  0:00:04
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  31% |###########                         | ETA:  0:00:04
Adding changed files:  32% |###########                         | ETA:  0:00:04
Adding changed files:  33% |############                        | ETA:  0:00:04
Adding changed files:  35% |############                        | ETA:  0:00:04
Adding changed files:  36% |#############                       | ETA:  0:00:04
Adding changed files:  38% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  42% |###############                     | ETA:  0:00:03
Adding changed files:  43% |###############                     | ETA:  0:00:03
Adding changed files:  44% |################                    | ETA:  0:00:03
Adding changed files:  46% |################                    | ETA:  0:00:03
Adding changed files:  47% |#################                   | ETA:  0:00:03
Adding changed files:  48% |#################                   | ETA:  0:00:03
Adding changed files:  50% |##################                  | ETA:  0:00:03
Adding changed files:  51% |##################                  | ETA:  0:00:03
Adding changed files:  52% |###################                 | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:03
Adding changed files:  55% |####################                | ETA:  0:00:02
Adding changed files:  57% |####################                | ETA:  0:00:02
Adding changed files:  58% |#####################               | ETA:  0:00:02
Adding changed files:  59% |#####################               | ETA:  0:00:02
Adding changed files:  61% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  63% |######################              | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  66% |#######################             | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  80% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-24.3.1.tar.xz...
INFO: Rebasing devtool onto 2eece57a00d37d3d27ee7eb7e5a25641280f0ed3
WARNING: Command 'git rebase 2eece57a00d37d3d27ee7eb7e5a25641280f0ed3' failed:
Auto-merging src/glx/drisw_glx.c
CONFLICT (content): Merge conflict in src/glx/drisw_glx.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mesa
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mesa/mesa.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0805340425128067065==--

