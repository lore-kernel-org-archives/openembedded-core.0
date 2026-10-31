Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1569.1793425338821758687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 22:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KqTXtXld;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=o7PbLpNo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1907aee05-b41b63a0-7f42-4cd4-8a41-028305fb9071-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793425338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cKRaKeCU+N1U1hk1uI8mQ1SE63XPexqQoz4Hyj83cao=;
	b=KqTXtXld/Buhmg1HW6KFXDsdxi/pIsDozhPuXvadpikkf/zZtzk4R0efSUsTUUkN
	TC1fbnHR4O0kWuFu58IVL0jp4HBeGm6qVv0miGjOorSZYLRtA2xdEC3p1ymzkwdG6HO
	wLNlMs86bCTaPg4xiGvJmbFGCZzfaomE6Sc2k7oo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793425338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cKRaKeCU+N1U1hk1uI8mQ1SE63XPexqQoz4Hyj83cao=;
	b=o7PbLpNoCc2dS6jMEFGpunEZw173xx3xcMxKUDPJBC/ROPYM4C/XB6muburxFItM
	D61KJoxfMNaf4HZ2NJoz5UrE10KEggFDQxZXQNGdj8uT4zr6wCU0FkLeAlqhwRp58D5
	PG23MEvG+yicw5dSuSmOsg6tlwjShf4kT93tRbhk=
Content-Type: multipart/mixed; boundary="===============1085579570628756784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedumpfile: upgrading to 1.8.0 FAILED
Message-ID: <010101a1907aee05-b41b63a0-7f42-4cd4-8a41-028305fb9071-000000@us-west-2.amazonses.com>
Date: Sat, 31 Oct 2026 05:42:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.31-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 05:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249138

--===============1085579570628756784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *makedumpfile* to *1.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe makedumpfile failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1997 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-14f40322f992796768d88aa6dcb3b06facdf2634"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:14f40322f992796768d88aa6dcb3b06facdf2634"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ae6c64cd2693cd7c4b683d1948d4bb1b206636d0
WARNING: Command 'git rebase ae6c64cd2693cd7c4b683d1948d4bb1b206636d0' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/makedumpfile
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/makedumpfile/makedumpfile_1.8.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/makedumpfile.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/makedumpfile.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1085579570628756784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="makedumpfile-changelog.txt"

[v1.8.0] Update version
[PATCH] Derive the mem_section mem_map mask from SIZE(page)
[PATCH] README: Remove email addresses that will be gone and update information
[PATCH v2 7/9] Add PG_INCLUDE_HEAD extension return status
[PATCH v2 6/9] Simplify arguments for page checks
[PATCH v2 5/9] Move page checks into makedumpfile.h
[PATCH v2 4/9] Introduce a stat for pages retained by extension
[PATCH v2 3/9] Share page information with extension callbacks
[PATCH v2 2/9] Honor CFLAGS in extensions/Makefile
[PATCH v2 1/9] Do not call extensions for tail pages
[PATCH 6/6] Ensure e_phentsize does not exceed buf size
[PATCH 5/6] Ensure get_smram_cpu_state() does not read beyond smram
[PATCH 4/6] Add an out-of-bounds check for info->valid_pages[]
[PATCH 3/6] Prevent a multiply overflow in cache_init()
[PATCH 2/6] Add an out-of-bounds check for si->block_table[]
[PATCH 1/6] Ensure page_desc does not exceed page_size
[PATCH] Avoid glibc lazy-unwind machinery in parallel teardown
[PATCH] arm64: Add 5-level page table support for 4K pages with 52-bit VA
[PATCH v6 09/10] Doc: Add --extension option to makedumpfile manual
[PATCH v6 08/10] Add erase_sample extension as an data erase reference
[PATCH v6 07/10] Add sample extension as an example reference
[PATCH v6 06/10] Add makedumpfile extensions support
[PATCH v6 05/10] Implement kernel module's btf resolving
[PATCH v6 04/10] Implement kernel module's kallsyms resolving
[PATCH v6 03/10] Implement kernel btf resolving
[PATCH v6 02/10] Implement kernel kallsyms resolving
[PATCH v6 01/10] Reserve sections for makedumpfile and extenions
[PATCH] Fix error and simplify eppic_scripts/proc_names_3_10_to_4_8.c
[PATCH] Fix wrong exclusion of compound tail pages on Linux 7.1 and later
[PATCH v2 2/2] riscv64: Fix huge page translation in vtop_riscv64()
[PATCH v2 1/2] riscv64: Fix vaddr_to_paddr for vmalloc and vmemmap regions
[PATCH] Mark start of 1.8.0 development phase with version 1.7.9++

--===============1085579570628756784==--
