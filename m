Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02C6CDE011
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50423.1781195505087963816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bScSbLwG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TL/nmncV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb786bec1-eba2b33f-9aac-41c3-9e66-cff73244727f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195521;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+yl72rYDAS2GEn80RUfnikP1IBlN8AlsgN2cx7561uQ=;
	b=bScSbLwGy2mq0k8rRftqDXHJxpvpNzzAbNVSO7iFip9jKfvmoPjL7Q50ErDafb69
	Q2Exgn0nzEVrFp3YT0IQU47c9rowm+dT9XbeUR/baA50F2ncOfSEF2f1Wbljm2B6GWB
	Ezll99I0Cht2/uSONGYRbC7Ce48BiQgQ03zf/+/o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195521;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+yl72rYDAS2GEn80RUfnikP1IBlN8AlsgN2cx7561uQ=;
	b=TL/nmncVsfylgk+mqz4iZp0xEzPmYtIqldC79DEDMOhBI0TpY316RrVO+dEpVc6i
	0hvivK5HdY8nVy2vG1TCbLHozGtkvdg38xGBX3bqavRgk6Ou1yH9ELKPjCCh/RZOjgF
	Sinqb4ilWCzaa+J/y3jqtG4YS8ZZPEjTsCq+GTow=
Content-Type: multipart/mixed; boundary="===============7634459218706080892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] webkitgtk: upgrading to 2.52.4 FAILED
Message-ID: <0101019eb786bec1-eba2b33f-9aac-41c3-9e66-cff73244727f-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238562

--===============7634459218706080892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *webkitgtk* to *2.52.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe webkitgtk failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f442244a3425b308592d828cf797aebfbf429aac"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f442244a3425b308592d828cf797aebfbf429aac"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f442244a3425b308592d828cf797aebfbf429aac"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f442244a3425b308592d828cf797aebfbf429aac"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
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
Adding changed files:   0% |                                    | ETA:  0:00:42
Adding changed files:   1% |                                    | ETA:  0:00:30
Adding changed files:   1% |                                    | ETA:  0:00:26
Adding changed files:   2% |                                    | ETA:  0:00:25
Adding changed files:   2% |                                    | ETA:  0:00:23
Adding changed files:   3% |#                                   | ETA:  0:00:23
Adding changed files:   3% |#                                   | ETA:  0:00:22
Adding changed files:   4% |#                                   | ETA:  0:00:22
Adding changed files:   4% |#                                   | ETA:  0:00:21
Adding changed files:   5% |#                                   | ETA:  0:00:21
Adding changed files:   5% |##                                  | ETA:  0:00:22
Adding changed files:   6% |##                                  | ETA:  0:00:22
Adding changed files:   6% |##                                  | ETA:  0:00:23
Adding changed files:   7% |##                                  | ETA:  0:00:24
Adding changed files:   7% |##                                  | ETA:  0:00:35
Adding changed files:   8% |###                                 | ETA:  0:00:34
Adding changed files:   9% |###                                 | ETA:  0:00:35
Adding changed files:   9% |###                                 | ETA:  0:00:35
Adding changed files:  10% |###                                 | ETA:  0:00:35
Adding changed files:  10% |###                                 | ETA:  0:00:35
Adding changed files:  11% |####                                | ETA:  0:00:36
Adding changed files:  11% |####                                | ETA:  0:00:36
Adding changed files:  12% |####                                | ETA:  0:00:36
Adding changed files:  12% |####                                | ETA:  0:00:36
Adding changed files:  13% |####                                | ETA:  0:00:37
Adding changed files:  13% |####                                | ETA:  0:00:37
Adding changed files:  14% |#####                               | ETA:  0:00:36
Adding changed files:  14% |#####                               | ETA:  0:00:36
Adding changed files:  15% |#####                               | ETA:  0:00:35
Adding changed files:  15% |#####                               | ETA:  0:00:34
Adding changed files:  16% |#####                               | ETA:  0:00:33
Adding changed files:  17% |######                              | ETA:  0:00:33
Adding changed files:  17% |######                              | ETA:  0:00:32
Adding changed files:  18% |######                              | ETA:  0:00:32
Adding changed files:  18% |######                              | ETA:  0:00:31
Adding changed files:  19% |######                              | ETA:  0:00:31
Adding changed files:  19% |#######                             | ETA:  0:00:30
Adding changed files:  20% |#######                             | ETA:  0:00:30
Adding changed files:  20% |#######                             | ETA:  0:00:29
Adding changed files:  21% |#######                             | ETA:  0:00:29
Adding changed files:  21% |#######                             | ETA:  0:00:28
Adding changed files:  22% |########                            | ETA:  0:00:28
Adding changed files:  22% |########                            | ETA:  0:00:27
Adding changed files:  23% |########                            | ETA:  0:00:27
Adding changed files:  23% |########                            | ETA:  0:00:27
Adding changed files:  24% |########                            | ETA:  0:00:26
Adding changed files:  25% |#########                           | ETA:  0:00:26
Adding changed files:  25% |#########                           | ETA:  0:00:26
Adding changed files:  26% |#########                           | ETA:  0:00:26
Adding changed files:  26% |#########                           | ETA:  0:00:25
Adding changed files:  27% |#########                           | ETA:  0:00:25
Adding changed files:  27% |#########                           | ETA:  0:00:25
Adding changed files:  28% |##########                          | ETA:  0:00:25
Adding changed files:  28% |##########                          | ETA:  0:00:24
Adding changed files:  29% |##########                          | ETA:  0:00:24
Adding changed files:  29% |##########                          | ETA:  0:00:24
Adding changed files:  30% |##########                          | ETA:  0:00:24
Adding changed files:  30% |###########                         | ETA:  0:00:24
Adding changed files:  31% |###########                         | ETA:  0:00:23
Adding changed files:  31% |###########                         | ETA:  0:00:23
Adding changed files:  32% |###########                         | ETA:  0:00:23
Adding changed files:  33% |###########                         | ETA:  0:00:22
Adding changed files:  33% |############                        | ETA:  0:00:22
Adding changed files:  34% |############                        | ETA:  0:00:22
Adding changed files:  34% |############                        | ETA:  0:00:22
Adding changed files:  35% |############                        | ETA:  0:00:21
Adding changed files:  35% |############                        | ETA:  0:00:21
Adding changed files:  36% |#############                       | ETA:  0:00:21
Adding changed files:  36% |#############                       | ETA:  0:00:21
Adding changed files:  37% |#############                       | ETA:  0:00:20
Adding changed files:  37% |#############                       | ETA:  0:00:20
Adding changed files:  38% |#############                       | ETA:  0:00:20
Adding changed files:  38% |#############                       | ETA:  0:00:20
Adding changed files:  39% |##############                      | ETA:  0:00:19
Adding changed files:  39% |##############                      | ETA:  0:00:19
Adding changed files:  40% |##############                      | ETA:  0:00:19
Adding changed files:  40% |##############                      | ETA:  0:00:19
Adding changed files:  41% |##############                      | ETA:  0:00:19
Adding changed files:  42% |###############                     | ETA:  0:00:18
Adding changed files:  42% |###############                     | ETA:  0:00:18
Adding changed files:  43% |###############                     | ETA:  0:00:18
Adding changed files:  43% |###############                     | ETA:  0:00:17
Adding changed files:  44% |###############                     | ETA:  0:00:17
Adding changed files:  44% |################                    | ETA:  0:00:17
Adding changed files:  45% |################                    | ETA:  0:00:17
Adding changed files:  45% |################                    | ETA:  0:00:16
Adding changed files:  46% |################                    | ETA:  0:00:16
Adding changed files:  46% |################                    | ETA:  0:00:16
Adding changed files:  47% |#################                   | ETA:  0:00:16
Adding changed files:  47% |#################                   | ETA:  0:00:16
Adding changed files:  48% |#################                   | ETA:  0:00:15
Adding changed files:  48% |#################                   | ETA:  0:00:15
Adding changed files:  49% |#################                   | ETA:  0:00:15
Adding changed files:  50% |##################                  | ETA:  0:00:15
Adding changed files:  50% |##################                  | ETA:  0:00:14
Adding changed files:  51% |##################                  | ETA:  0:00:14
Adding changed files:  51% |##################                  | ETA:  0:00:14
Adding changed files:  52% |##################                  | ETA:  0:00:14
Adding changed files:  52% |##################                  | ETA:  0:00:14
Adding changed files:  53% |###################                 | ETA:  0:00:13
Adding changed files:  53% |###################                 | ETA:  0:00:13
Adding changed files:  54% |###################                 | ETA:  0:00:13
Adding changed files:  54% |###################                 | ETA:  0:00:13
Adding changed files:  55% |###################                 | ETA:  0:00:13
Adding changed files:  55% |####################                | ETA:  0:00:12
Adding changed files:  56% |####################                | ETA:  0:00:12
Adding changed files:  56% |####################                | ETA:  0:00:12
Adding changed files:  57% |####################                | ETA:  0:00:12
Adding changed files:  58% |####################                | ETA:  0:00:12
Adding changed files:  58% |#####################               | ETA:  0:00:12
Adding changed files:  59% |#####################               | ETA:  0:00:11
Adding changed files:  59% |#####################               | ETA:  0:00:11
Adding changed files:  60% |#####################               | ETA:  0:00:11
Adding changed files:  60% |#####################               | ETA:  0:00:11
Adding changed files:  61% |######################              | ETA:  0:00:11
Adding changed files:  61% |######################              | ETA:  0:00:11
Adding changed files:  62% |######################              | ETA:  0:00:10
Adding changed files:  62% |######################              | ETA:  0:00:10
Adding changed files:  63% |######################              | ETA:  0:00:10
Adding changed files:  63% |######################              | ETA:  0:00:10
Adding changed files:  64% |#######################             | ETA:  0:00:10
Adding changed files:  64% |#######################             | ETA:  0:00:10
Adding changed files:  65% |#######################             | ETA:  0:00:09
Adding changed files:  66% |#######################             | ETA:  0:00:09
Adding changed files:  66% |#######################             | ETA:  0:00:09
Adding changed files:  67% |########################            | ETA:  0:00:09
Adding changed files:  67% |########################            | ETA:  0:00:09
Adding changed files:  68% |########################            | ETA:  0:00:09
Adding changed files:  68% |########################            | ETA:  0:00:08
Adding changed files:  69% |########################            | ETA:  0:00:08
Adding changed files:  69% |#########################           | ETA:  0:00:08
Adding changed files:  70% |#########################           | ETA:  0:00:08
Adding changed files:  70% |#########################           | ETA:  0:00:08
Adding changed files:  71% |#########################           | ETA:  0:00:08
Adding changed files:  71% |#########################           | ETA:  0:00:08
Adding changed files:  72% |##########################          | ETA:  0:00:07
Adding changed files:  72% |##########################          | ETA:  0:00:07
Adding changed files:  73% |##########################          | ETA:  0:00:07
Adding changed files:  74% |##########################          | ETA:  0:00:07
Adding changed files:  74% |##########################          | ETA:  0:00:07
Adding changed files:  75% |###########################         | ETA:  0:00:07
Adding changed files:  75% |###########################         | ETA:  0:00:06
Adding changed files:  76% |###########################         | ETA:  0:00:06
Adding changed files:  76% |###########################         | ETA:  0:00:06
Adding changed files:  77% |###########################         | ETA:  0:00:06
Adding changed files:  77% |###########################         | ETA:  0:00:06
Adding changed files:  78% |############################        | ETA:  0:00:06
Adding changed files:  78% |############################        | ETA:  0:00:06
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  80% |############################        | ETA:  0:00:05
Adding changed files:  80% |#############################       | ETA:  0:00:05
Adding changed files:  81% |#############################       | ETA:  0:00:05
Adding changed files:  81% |#############################       | ETA:  0:00:05
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  83% |#############################       | ETA:  0:00:04
Adding changed files:  83% |##############################      | ETA:  0:00:04
Adding changed files:  84% |##############################      | ETA:  0:00:04
Adding changed files:  84% |##############################      | ETA:  0:00:04
Adding changed files:  85% |##############################      | ETA:  0:00:04
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  88% |###############################     | ETA:  0:00:03
Adding changed files:  88% |################################    | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:27
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.52.4.tar.xz...
INFO: Rebasing devtool onto 2044ed54df67cb3705cfb0d4efc8fb5f1b9b8875
WARNING: Command 'git rebase 2044ed54df67cb3705cfb0d4efc8fb5f1b9b8875' failed:
Auto-merging Source/WebCore/contentextensions/ContentExtensionActions.h
CONFLICT (content): Merge conflict in Source/WebCore/contentextensions/ContentExtensionActions.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/webkitgtk
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/webkitgtk/webkitgtk_2.52.4.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/webkitgtk.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7634459218706080892==--

