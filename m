Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C70CD4857
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15616.1777645533803624288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hsgYfDwT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AoCLZuLI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee8502-85506225-035b-4ea2-b0a2-f30a26a69ce2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yCYy/ye9icpCix69+aN9Ost8KnY2UzhC/HYXgEloGQw=;
	b=hsgYfDwTLryed+HyfOodt+lwcswINeVlxPYUs+NzlTt2YlYmGl+FSk/Qp2m5aKIy
	+RcJ8fCxo7o8Qv2I9dBprBi5yE5785blEmAm/5J9hzk5KpPce5uZTSBxJRmc7c7Amik
	UJdOlgkafEA62bC84gJZj1qo9KVD2Tw5PkqBpS/M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yCYy/ye9icpCix69+aN9Ost8KnY2UzhC/HYXgEloGQw=;
	b=AoCLZuLIN2Vkpqxzw8SSoDLlK4GmPJBv3zMOb1TGr7cKbJcn8QNj+m6DwihzJe7a
	v/ng+ffQ1BfnPOvAqGU1Fz3tnJcwS+QUbhxbQGrsvxUurn9oslXFeBhAuXRbRcL3RLt
	FsKreYMPWzjwm47p2z0zqwQBfxPWip6Uommvd1Bk=
Content-Type: multipart/mixed; boundary="===============3553332512098840992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ffmpeg: upgrading to 8.1 FAILED
Message-ID: <0101019de3ee8502-85506225-035b-4ea2-b0a2-f30a26a69ce2-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236283

--===============3553332512098840992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ffmpeg* to *8.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ffmpeg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a08cd15a1b20b5c93a2bb6dbf497cdc41b4366e2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a08cd15a1b20b5c93a2bb6dbf497cdc41b4366e2"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a08cd15a1b20b5c93a2bb6dbf497cdc41b4366e2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a08cd15a1b20b5c93a2bb6dbf497cdc41b4366e2"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   5% |#                                   | ETA:  0:00:02
Adding changed files:  10% |###                                 | ETA:  0:00:01
Adding changed files:  15% |#####                               | ETA:  0:00:01
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  30% |##########                          | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  50% |##################                  | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.ffmpeg.org/releases/ffmpeg-8.1.tar.xz...
INFO: Rebasing devtool onto 3d3764a0b4488d8261ec1454e092d46e8d824ace
WARNING: Command 'git rebase 3d3764a0b4488d8261ec1454e092d46e8d824ace' failed:
Auto-merging ffbuild/common.mak
CONFLICT (content): Merge conflict in ffbuild/common.mak
Auto-merging fftools/Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/ffmpeg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ffmpeg/ffmpeg_8.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3553332512098840992==--

