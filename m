Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8B1C5DF70
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 05:30:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3718.1786771835376986084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 22:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=alxCzg1S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SL9AAkTv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a003e685c2-406a6317-70b3-4029-a797-4482a0844b47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786771834;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=iYDKQRnSMCIxqzpArPOHEja5KC23z32L+Y5AkMaAbLc=;
	b=alxCzg1S/Ha+WD/AX8uUS8rSl6MGICjY2dXNio8mUth1DXfKmv4WqUXdFUvsHfwS
	ZZ7cKa9ra+n1Ul7Rdk5r9kQ2sqL88/BpjUjxS7R8w0fXuttMqIS1NjZOia3ahAxROVs
	HS47BH0DhuS00UuHlbaklQSz/rzTPgXQ36FPC80E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786771834;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=iYDKQRnSMCIxqzpArPOHEja5KC23z32L+Y5AkMaAbLc=;
	b=SL9AAkTvMI2wtpZ7/x7iMscqZxeW9bkoEwXesMHuYAAooV79rUsRNA8VPiEpT0eX
	Fn6K97O0kHLYkN+OZlyWOijv0dDRkSzw+fmCXVW434//N6CR4XTsIgPhNJmj55icXoa
	WLiicuPo7HLya4fB5ygR+b5qbD4gjqZcDNc+1X84=
Content-Type: multipart/mixed; boundary="===============5951879776452920221=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.196 FAILED
Message-ID: <010101a003e685c2-406a6317-70b3-4029-a797-4482a0844b47-000000@us-west-2.amazonses.com>
Date: Sat, 15 Aug 2026 05:30:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243470

--===============5951879776452920221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *elfutils* to *0.196* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe elfutils failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-dd003e147db548d9c86821a08450d6461d061cea"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:dd003e147db548d9c86821a08450d6461d061cea"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-4oqqcw6q.bb: tmp-recipetool-4oqqcw6q: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-4oqqcw6q-CLOSED"
done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1985 targets, 40 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-dd003e147db548d9c86821a08450d6461d061cea"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:dd003e147db548d9c86821a08450d6461d061cea"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-4oqqcw6q: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-4oqqcw6q-CLOSED"
WARNING: tmp-recipetool-4oqqcw6q: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-4oqqcw6q-CLOSED"
WARNING: tmp-recipetool-4oqqcw6q: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-4oqqcw6q-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: tmp-recipetool-4oqqcw6q: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-4oqqcw6q-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/elfutils/ftp/0.196/elfutils-0.196.tar.bz2...
INFO: Rebasing devtool onto 14042dfa7a557296cfd678ae71dce8586a9f51f6
INFO: Rebasing devtool-override-libc-musl onto 14042dfa7a557296cfd678ae71dce8586a9f51f6
WARNING: Command 'git rebase 14042dfa7a557296cfd678ae71dce8586a9f51f6' failed:
Auto-merging src/elfcompress.c
CONFLICT (content): Merge conflict in src/elfcompress.c
Auto-merging src/strip.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/elfutils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/elfutils/elfutils_0.196.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/elfutils.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5951879776452920221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="elfutils-changelog.txt"

Changelog for elfutils: 0.195 -> 0.196
Source: NEWS

Version 0.196 "Split Personality"

debuginfod: The $DEBUGINFOD_TIMEOUT environment variable is now enforced
            when establishing a connection to a server.

libdw: New functions dwarf_begin_type, dwarf_begin_elf_type and
       dwarf_get_type plus new enum Dwarf_Type.  Used to select between
       plain DWARF, split DWARF (.dwo/.dwp) and GNU LTO when opening a
       file.

       Added support for DWARF5 supplementary files (.debug_sup) and
       associated DW_FORM_ref_sup4/8 and DW_FORM_strp_sup forms.

       Added support for split DWARF debug data when contained in the
       same file as the skeleton.

libdwelf: New functions dwelf_dwarf_debug_sup and dwelf_dwarf_debug_dwp
          for querying .debug_sup and .debug_dwp section data.

libdwfl: Now correctly handles Linux kernel module sections that are
         not present in sysfs.

libdwfl_stacktrace: New functions dwflst_arch_from_uname,
                    dwflst_arch_expected_frame_nregs,
                    dwflst_arch_sp_dwarf_reg and dwflst_arch_sp_perf_reg
                    providing per-architecture constants.  The
                    libdwfl_stacktrace interface is experimental and may
                    be subject to API/ABI changes.

stackprof: New profiling tool for collecting systemwide stacktrace
           profiles.  Replaces the eu-stacktrace tool.  Requires
           a C++20 capable compiler.

stacktrace: This experimental tool has been removed and replaced with
            eu-stackprof.

srcfiles: Now handles CU names and files from split DWARF.

strip: Fixed bug where a section's sh_link or sh_info reference could
       be missing from the debug file.

version.h: New macro _ELFUTILS_THREAD_SAFE added to <elfutils/version.h>.
           Defined to 1 when the elfutils libraries are built with thread
           safety support enabled.  Otherwise it is left undefined.
           Thread safety support is experimental and is not yet officially
           supported.

--===============5951879776452920221==--

