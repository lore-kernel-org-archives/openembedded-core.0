Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CB9C982CD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33826.1789629007685807378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=u0JTgxE/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3hsMyi8T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0ae338383-1c516c59-2d1f-4221-b831-adadbf648e6f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629006;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=K2IC8eH73/gHG6lIfjqS37Xckvvj1jjMjY0AduXvzGg=;
	b=u0JTgxE/+p46t7k4C4LVxbFZdIwhC4p4/OhwUztmHH3CYPPu8VYRIFy3JXB/AZZv
	vyL570yVR+IzgwhvPQElN6o4b/tYTkwOLfDw/ISWCUziYb+n0ApV1QpP8q/OcQrbYll
	BAAGV2Fwu4gj6HR0J6JVgLECLQKDKpxCVc8yQv8Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629006;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=K2IC8eH73/gHG6lIfjqS37Xckvvj1jjMjY0AduXvzGg=;
	b=3hsMyi8TVuS8Ye+QJgPv0jDQrmcoe8GY8hUo3DdnBAEasdIVsRfXX6qLIUCI2+96
	ZvzW1PkL/w+W2RY6MGsZAiiVtxTFNGDyhY/A9o6OklNGjc67NF7m8Q474edQ2GGpzht
	As5FaOW71GVnX8LFVihMdoGUzwJogKMDUY4MHNQw=
Content-Type: multipart/mixed; boundary="===============0372498608654668280=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rt-tests,hwlatdetect: upgrading to 2.11,2.11 FAILED
Message-ID: <010101a0ae338383-1c516c59-2d1f-4221-b831-adadbf648e6f-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246027

--===============0372498608654668280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rt-tests,hwlatdetect* to *2.11,2.11* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rt-tests failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a4afede928cd512683bbc8319cedc040e63d0891"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a4afede928cd512683bbc8319cedc040e63d0891"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 62da2befac98f811af8e56f2b7992fb09faa33d6
WARNING: Command 'git rebase 62da2befac98f811af8e56f2b7992fb09faa33d6' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rt-tests
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rt-tests/rt-tests_git.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/rt-tests.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0372498608654668280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rt-tests-changelog.txt"

Changelog for rt-tests: 2.10 -> 2.11

62da2be rt-tests: Create v2.11
1434550 cyclictest: Fix BUILD failure for GCC_VER < 14
2b3dd85 rt-tests: rt-migrate-test: Report trace_marker write errno once and stop
fd45df8 cyclicdeadline: Fix potential path truncation in open_cpuset()
c5b894f cyclictest: Make trigger_lock a PI lock
a454352 cyclictest: Make break_thread_id_lock a PI lock
98fcd66 cyclictest: Acquire a lock before invoking pthread_cond_signal()
f5d9dd9 rt-tests: cyclicdeadline: Remove unused `alloverflows'
7aca811 pi_stress: Ensure null-termination of JSON filename
38aa42d pi_stress: Fix error and debug message formatting
494091b pi_stress: Improve error message for permission failures
4ffa7df pi_stress: Validate numeric command-line arguments
e18dc6b pi_stress: Fix inconsistent barrier wait logic to prevent deadlock
e6fb0b2 rt-tests: Add AGENTS.md guide for AI coding assistants
92d48c2 rt-tests: Add SPDX identifiers and fix documentation issues
f6f316d rt-tests: README: Remove obsolete -n option from cyclictest examples
ffc2cbb cyclictest.8: Reference rtla-timerlat(1)
698e733 cyclictest.8: Add example invocation
8c19fce cyclictest.8: Options: Reference clock_getres(2)
84cf95b cyclictest.8: Options: Expand --default-system description
1d7b621 cyclictest.8: System options: Deprecate --laptop
761b4b1 cyclictest.8: Group x86 options
b15c6b9 cyclictest.8: Group output options
30f4b0e cyclictest.8: Group test duration options
4302a38 cyclictest.8: Group tracing options
ee6a9b4 cyclictest.8: Group thread priority options
61aaaef cyclictest.8: Group memory options
8975886 cyclictest.8: Group SMP-related options
00ccd42 cyclictest.8: Group thread wakeup timing options
89157e0 cyclictest.8: Group sleep-mechanism (clock) options
bf48e5a cyclictest.8: Group system-altering options
b6462f9 cyclictest.8: Synopsis: Distinguish --help mode
e049df4 cyclictest.8: Rework the Synopsis blurb
757662f cyclictest.8: Synopsis: Fix parameters list rendering
7188762 cyclictest.8: Capitalize section headers
1a00768 cyclictest.8: Separate source sections
c6246b3 cyclictest.8: Align source file to 75 columns
88770e6 cyclictest.8: Remove left-over comments
d957297 cyclictest.8: Standardize --verbose paragraph formatting
18b6f0f cyclictest.8: Synopsis: Remove -h flag
4c8af09 cyclictest.8: Synopsis: Remove -y
4173739 cyclictest.8: Synopsis: Remove -w/-W
212dd7c cyclictest.8: Synopsis: Remove -U
776647b cyclictest.8: Comment-out SPDX license tag
b5242db rt-tests: hwlatdetect: Add --time-format argument
c77ee80 cyclictest: Simplify auxiliary clock parsing
870eb19 cyclictest: Add support for auxiliary clocks
55814ff cyclictest: Allow symbolic clock names
823dc45 cyclictest: Correctly print clock_nanosleep() errors
3c097fc cyclictest: Fix error error returns for uclibc clock_nanosleep() fallback
752f5c2 cyclictest: Test the return value of timer_create()
222b801 cyclictest: Centralize clock option parsing
1d20e72 Makefile: Use relative symlinks for Python scripts
f9c8218 cyclictest: fix growing shm stat file
5ced2b8 rt-tests: hwlatdetect: Add timestamp delta

--===============0372498608654668280==--

