Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4569C48BCB
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2291.1651434545390972334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=9xSLbLl8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180812b5cdd-2e15e5fc-38a6-4043-8f39-bd93c7cb138c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=bP54iI6RrPjAc+P85/hbs2XIUYhmd4inN2sfN28zJcE=;
	b=9xSLbLl8H8towxztZPhbUwnlY6SpoaaM0fKJJyHhCjH0paQQ71m829TwQvx1EByJ
	2pInS/1zZJNL9Ro5NQdhwIAlHPTFlqR41FD0H3Cm19RMVelMqBqEZvwR6oRmilFgtAR
	yiAZBrk2I4qXIR/1hieYby7C1X8yg2M5tBL5a2RI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=bP54iI6RrPjAc+P85/hbs2XIUYhmd4inN2sfN28zJcE=;
	b=aSAQzuAmkHcrxsY+kAY9VcpWwvFN+7OtnEEnTiWzrArMwVgacOMxCbCLiZzA4O0M
	to6ncXhffuk6adMpjQVmzIXH3uIJwZG+/Rsk1pzcY748/l5c7sIWGAEwH3QJ4BYXTU7
	TZLRt+73xELLRf5eEog+SLwuFWuZsyl5eA+N8CBM=
Content-Type: multipart/mixed; boundary="===============8016343232062500381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libseccomp: upgrading to 2.5.4 SUCCEEDED
Message-ID: 
 <01010180812b5cdd-2e15e5fc-38a6-4043-8f39-bd93c7cb138c-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165159

--===============8016343232062500381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libseccomp* to *2.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libseccomp-upgrade-2.5.3-2.5.4.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8016343232062500381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libseccomp-upgrade-2.5.3-2.5.4.patch"

From 97529bf5fa86f3b3acbc29fbb94cf1bab18d0cd5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 19:11:00 +0000
Subject: [PATCH] libseccomp: upgrade 2.5.3 -> 2.5.4

---
 .../libseccomp/{libseccomp_2.5.3.bb => libseccomp_2.5.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libseccomp/{libseccomp_2.5.3.bb => libseccomp_2.5.4.bb} (96%)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
similarity index 96%
rename from meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
index e6260a7754..c76f3c3573 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
 
 DEPENDS += "gperf-native"
 
-SRCREV = "57357d2741a3b3d3e8425889a6b79a130e0fa2f3"
+SRCREV = "f33f95014b36f97b42f0c2290e96d5c31647ed10"
 
 SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5;protocol=https \
            file://run-ptest \
@@ -51,4 +51,4 @@ FILES:${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
 
 RDEPENDS:${PN}-ptest = "coreutils bash"
 
-PV = "2.5.3"
+PV = "2.5.4"
-- 
2.27.0


--===============8016343232062500381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libseccomp/libseccomp-ptest: FILELIST: added "/usr/lib/libseccomp/ptest/tests/59-basic-empty_binary_tree.py /usr/lib/libseccomp/ptest/tests/59-basic-empty_binary_tree /usr/lib/libseccomp/ptest/tests/59-basic-empty_binary_tree.tests"
packages/core2-32-poky-linux/libseccomp/libseccomp: FILELIST: removed "/usr/lib/libseccomp.so.2.5.3", added "/usr/lib/libseccomp.so.2.5.4"
Changes to packages/core2-32-poky-linux/libseccomp (sysroot):
  /usr/lib/libseccomp.so.2 changed symlink target from libseccomp.so.2.5.3 to libseccomp.so.2.5.4
  /usr/lib/libseccomp.so changed symlink target from libseccomp.so.2.5.3 to libseccomp.so.2.5.4
  /usr/lib/libseccomp.so.2.5.3 moved to /usr/lib/libseccomp.so.2.5.4

--===============8016343232062500381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libseccomp: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp-dbg: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp-dbg: FILELIST: removed "/usr/lib/.debug/libseccomp.so.2.5.3", added "/usr/lib/.debug/libseccomp.so.2.5.4 /usr/lib/libseccomp/ptest/tests/.debug/59-basic-empty_binary_tree"
packages/core2-32-poky-linux/libseccomp/libseccomp-dbg: PKGSIZE changed from 21679156 to 22080556 (+2%)
packages/core2-32-poky-linux/libseccomp/libseccomp-dbg: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp-dev: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp-dev: PKGSIZE changed from 76752 to 76865 (+0%)
packages/core2-32-poky-linux/libseccomp/libseccomp-dev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp-doc: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp-doc: PKGSIZE changed from 70991 to 70963 (-0%)
packages/core2-32-poky-linux/libseccomp/libseccomp-doc: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp-locale: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp-locale: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp-ptest: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp-ptest: FILELIST: added "/usr/lib/libseccomp/ptest/tests/59-basic-empty_binary_tree /usr/lib/libseccomp/ptest/tests/59-basic-empty_binary_tree.py /usr/lib/libseccomp/ptest/tests/59-basic-empty_binary_tree.tests"
packages/core2-32-poky-linux/libseccomp/libseccomp-ptest: PKGSIZE changed from 8160793 to 8294936 (+2%)
packages/core2-32-poky-linux/libseccomp/libseccomp-ptest: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp-src: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp-src: FILELIST: directory renamed /usr/src/debug/libseccomp/2.5.3-r0/git/src -> /usr/src/debug/libseccomp/2.5.4-r0/git/src, directory renamed /usr/src/debug/libseccomp/2.5.3-r0/git/tools -> /usr/src/debug/libseccomp/2.5.4-r0/git/tools, directory renamed /usr/src/debug/libseccomp/2.5.3-r0/git/include -> /usr/src/debug/libseccomp/2.5.4-r0/git/include, removed "/usr/src/debug/libseccomp/2.5.3-r0/git/tests/10-sim-syscall_priority_post.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/30-sim-socket_syscalls.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/04-sim-multilevel_chains.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/19-sim-missing_syscalls.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/47-live-kill_process.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/56-basic-iterate_syscalls.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/15-basic-resolver.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/08-sim-subtree_checks.c /usr/src/debug/libsecco
 mp/2.5.3-r0/git/tests/05-sim-long_jumps.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/27-sim-bpf_blk_state.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/42-sim-adv_chains.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/31-basic-version_check.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/39-basic-api_level.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/49-sim-64b_comparisons.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/46-sim-kill_process.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/01-sim-allow.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/20-live-basic_die.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/22-sim-basic_chains_array.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/12-sim-basic_masked_ops.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/32-live-tsync_allow.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/35-sim-negative_one.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/58-live-tsync_notify.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/miniseq.c /usr/src/debug/libsecco
 mp/2.5.3-r0/git/tests/11-basic-basic_errors.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/41-sim-syscall_priority_arch.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/37-sim-ipc_syscalls_be.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/48-sim-32b_args.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/51-live-user_notification.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/util.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/44-live-a2_order.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/09-sim-syscall_priority_pre.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/17-sim-arch_merge.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/16-sim-arch_basic.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/24-live-arg_allow.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/40-sim-log.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/13-basic-attrs.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/26-sim-arch_all_be_basic.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/53-sim-binary_tree.c /usr/src/debug/libseccomp
 /2.5.3-r0/git/tests/34-sim-basic_denylist.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/02-sim-basic.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/06-sim-actions.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/38-basic-pfc_coverage.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/50-sim-hash_collision.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/43-sim-a2_order.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/07-sim-db_bug_looping.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/52-basic-load.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/28-sim-arch_x86.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/23-sim-arch_all_le_basic.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/03-sim-basic_chains.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/29-sim-pseudo_syscall.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/18-sim-basic_allowlist.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/25-sim-multilevel_chains_adv.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/54-live-binary_tree.c /usr/src/debug/l
 ibseccomp/2.5.3-r0/git/tests/21-live-basic_allow.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/57-basic-rawsysrc.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/util.h /usr/src/debug/libseccomp/2.5.3-r0/git/tests/36-sim-ipc_syscalls.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/55-basic-pfc_binary_tree.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/33-sim-socket_syscalls_be.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/45-sim-chain_code_coverage.c /usr/src/debug/libseccomp/2.5.3-r0/git/tests/14-sim-reset.c", added "/usr/src/debug/libseccomp/2.5.4-r0/git/tests/37-sim-ipc_syscalls_be.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/14-sim-reset.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/08-sim-subtree_checks.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/32-live-tsync_allow.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/53-sim-binary_tree.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/49-sim-64b_comparisons.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/46-sim-kill_process.c /usr/
 src/debug/libseccomp/2.5.4-r0/git/tests/12-sim-basic_masked_ops.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/44-live-a2_order.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/34-sim-basic_denylist.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/39-basic-api_level.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/56-basic-iterate_syscalls.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/54-live-binary_tree.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/util.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/22-sim-basic_chains_array.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/31-basic-version_check.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/miniseq.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/30-sim-socket_syscalls.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/23-sim-arch_all_le_basic.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/09-sim-syscall_priority_pre.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/55-basic-pfc_binary_tree.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/util.h /
 usr/src/debug/libseccomp/2.5.4-r0/git/tests/41-sim-syscall_priority_arch.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/43-sim-a2_order.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/50-sim-hash_collision.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/07-sim-db_bug_looping.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/15-basic-resolver.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/03-sim-basic_chains.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/48-sim-32b_args.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/05-sim-long_jumps.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/29-sim-pseudo_syscall.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/42-sim-adv_chains.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/02-sim-basic.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/17-sim-arch_merge.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/21-live-basic_allow.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/10-sim-syscall_priority_post.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/24-live-arg_al
 low.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/35-sim-negative_one.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/36-sim-ipc_syscalls.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/28-sim-arch_x86.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/47-live-kill_process.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/38-basic-pfc_coverage.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/52-basic-load.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/57-basic-rawsysrc.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/11-basic-basic_errors.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/25-sim-multilevel_chains_adv.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/26-sim-arch_all_be_basic.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/58-live-tsync_notify.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/18-sim-basic_allowlist.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/59-basic-empty_binary_tree.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/16-sim-arch_basic.c /usr/src/debug/libseccomp/2.5.4-r0/gi
 t/tests/01-sim-allow.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/45-sim-chain_code_coverage.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/06-sim-actions.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/13-basic-attrs.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/33-sim-socket_syscalls_be.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/40-sim-log.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/04-sim-multilevel_chains.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/19-sim-missing_syscalls.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/27-sim-bpf_blk_state.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/20-live-basic_die.c /usr/src/debug/libseccomp/2.5.4-r0/git/tests/51-live-user_notification.c"
packages/core2-32-poky-linux/libseccomp/libseccomp-src: PKGSIZE changed from 539108 to 540637 (+0%)
packages/core2-32-poky-linux/libseccomp/libseccomp-src: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp-staticdev: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp-staticdev: PKGSIZE changed from 474798 to 475502 (+0%)
packages/core2-32-poky-linux/libseccomp/libseccomp-staticdev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-32-poky-linux/libseccomp/libseccomp: PV changed from "2.5.3" to "2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp: FILELIST: removed "/usr/lib/libseccomp.so.2.5.3", added "/usr/lib/libseccomp.so.2.5.4"
packages/core2-32-poky-linux/libseccomp/libseccomp: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
Changes to packages/core2-32-poky-linux/libseccomp (sysroot):
  /usr/lib/libseccomp.so.2 changed symlink target from libseccomp.so.2.5.3 to libseccomp.so.2.5.4
  /usr/lib/libseccomp.so changed symlink target from libseccomp.so.2.5.3 to libseccomp.so.2.5.4
  /usr/lib/libseccomp.so.2.5.3 moved to /usr/lib/libseccomp.so.2.5.4

--===============8016343232062500381==--

