Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2996ECA5FF6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 05:24:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18733.1791091482904564417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 22:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OArgkKG8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C3tnpRDk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1055f1da4-0aacc99e-9040-47a1-94c7-1d3908858ca5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791091482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HK7f3ADFom5l2hl84MwHVGUJs98g/8kFXFxZISTGMdU=;
	b=OArgkKG8iEl2y/yH6F75206ZVbtWNHeaoViLz8OIxCW3hw1hD97LegPcxy4Lmu20
	wS0LUMypailYdA4qr8ZycErhqv5sepdr6Leh9b8hwJSrD7Oxi59S5bs0df/nvQaQBPy
	CVDmQ5ZPLeygFfy/S1vcdwDrvRDOrlGKNc842LoQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791091482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HK7f3ADFom5l2hl84MwHVGUJs98g/8kFXFxZISTGMdU=;
	b=C3tnpRDkokfoO2vif4UY1XDzp5wrC/2UwWZxCunBy9MV+jTY3nTEPWvGEZGW++xp
	KqTrXsyLFvJn872NwlDXRTg7ggooAvAlrOt4zTt7CBk8gGdPH7wvn8YbWPIfWRzdbVO
	VtCmsY0dHAfuxNYF2AaJZMbjJ3pC8esrDHp7U7Ek=
Content-Type: multipart/mixed; boundary="===============2485463877211951135=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.6 FAILED
Message-ID: <010101a1055f1da4-0aacc99e-9040-47a1-94c7-1d3908858ca5-000000@us-west-2.amazonses.com>
Date: Sun, 4 Oct 2026 05:24:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247189

--===============2485463877211951135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libical failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1994 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-6286f747246dec2e77378331c12badfd6a7d4a43"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6286f747246dec2e77378331c12badfd6a7d4a43"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1995 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-6286f747246dec2e77378331c12badfd6a7d4a43"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6286f747246dec2e77378331c12badfd6a7d4a43"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
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
Adding changed files:  13% |####                                | ETA:  0:00:00
Adding changed files:  27% |#########                           | ETA:  0:00:00
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libical/libical/releases//download/v4.0.6/libical-4.0.6.tar.gz...
INFO: Rebasing devtool onto 111d7c0e4ad29848bcb7d857e717b523296de429
WARNING: Command 'git rebase 111d7c0e4ad29848bcb7d857e717b523296de429' failed:
Auto-merging src/libical-glib/CMakeLists.txt
CONFLICT (content): Merge conflict in src/libical-glib/CMakeLists.txt
Auto-merging src/libical/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libical
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libical/libical_4.0.6.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libical.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libical.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2485463877211951135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libical-changelog.txt"

# Libical v4.0.6
## Overview

This is a patch release and is fully source and binary compatible with version
4.0.0.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes

- CVE: Fix UBSAN issue "bsearch comparator through an incompatible function
  pointer"
- RFC5545 section 3.3.5 Date-Time fixes:
  - Resolve local times in a fall-back overlap to the first occurrence
  - Fix explicit local time in a DST gap resolves using the post-transition
    offset
- RFC5545 section 3.3.10 Recurrence Rule fixes:
  - FREQ=WEEKLY with BYMONTH and BYSETPOS loses occurrences in the week
    straddling month boundary
- libicalvcard: the typed vcardvalue getters now check that the value type of
  the property
  uses the same union member as the expected value type of the getter. If the
  type mismatches,
  then they return the zero value for the expected value type. The typed setters
  error with
  ICAL_BADARG_ERROR instead of overwriting a value held in another union member.
- libicalvcal: Fixed a memory leak in vobject.c
- Buildsystem changes:
  - Fix build paths in installed cmake files (esp. for cross-compiling)
  - Install the libicalversion.h header
  - Fix building libical as a submodule in a larger CMake project
  - Fix "now" linker support check in the hardening compiler options
  - Fix the DESTINATION path for libical.jar
  - Use private linkage for 3rdparty libraries (icu, glib, ..)
- Built-in timezones updated to tzdata2026e.
- Remove ancient hack (since 2012) to support malformed TZID parameters
- Build and test validated with clang 23.1.1
- Build and test validated with gcc (GCC) 17.0.0 20260920 (experimental)

Please see the
[CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

--===============2485463877211951135==--

