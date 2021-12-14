Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3C5C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=Anjn/zKd;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444872; x=1670980872;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eJhnuiuGV7yMUxQYcAAOyahT5NT6AoVDnO6v5ZFzJeA=;
  b=Anjn/zKdsPoU5TMImRcb+3NvekSHonmaT+2l1qXngzFnl82VFvSY5HKy
   MBtAlEPF9pdWFGEASqkAyPVvVoxE1Mwm6lo9Tf7PdaPn3VTBLoDx6PIzJ
   ONMwWhRPmi6KGlu50FDRxmX2A2IkQ019GTR8bz8KcY6WSVrtBsEFrdIje
   AeAwc6xPrpw03Jz2HFhPA+iocU7pCUur9sL0QHbIO3wm5gzXf4uk2tmB2
   +GFbeTHFXqfZ/0vm7M5iQ6WYiAiWUKLElqptmG6SwVX7LB30gu/S3EXGN
   Hpzovgxi6w4v66Peh2wjecOG3JS3+0J/CLro4NM9TvFq7924GbAcFTjLT
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682508"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682508"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869200"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/17] linux-yocto-rt/5.10: update to -rt56
Date: Tue, 14 Dec 2021 09:20:42 +0800
Message-Id: 
 <31125411003d5790398ad776885bf87df6def3ee.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159669

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.10:

23f3ad608bc7 rcutorture: fixup merge from standard/base -stable
8612be3f3e2b Revert "rcutorture: Avoid problematic critical section nesting on RT"
9a6fb5667ac8 Linux 5.10.78-rt56
78c80dca8b1f irq_work: Also rcuwait for !IRQ_WORK_HARD_IRQ on PREEMPT_RT
e91d3b98e3b3 irq_work: Handle some irq_work in a per-CPU thread on PREEMPT_RT
bded6a156d4e irq_work: Allow irq_work_sync() to sleep if irq_work() no IRQ support.
747c881d3348 drm/i915/gt: Queue and wait for the irq_work item.
fa4ef0011e58 locking: Drop might_resched() from might_sleep_no_state_check()
f44d86bc5923 fscache: Use only one fscache_object_cong_wait.
2da5bc42a911 fscache: Use only one fscache_object_cong_wait.
53ecacfc9c68 mm: Disable NUMA_BALANCING_DEFAULT_ENABLED and TRANSPARENT_HUGEPAGE on PREEMPT_RT
03bdef3c5563 preempt: Move preempt_enable_no_resched() to the RT block
0def39751031 sched: Switch wait_task_inactive to HRTIMER_MODE_REL_HARD
60df07c6bd86 sched: Fix get_push_task() vs migrate_disable()
27f8594efeac mm, zsmalloc: Convert zsmalloc_handle.lock to spinlock_t
3fcbcd86a8eb Linux 5.10.78-rt55

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 29f8c47f1d61eb702bd9af72e81708ca66ca9c09)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 977856376c..47f8ff27ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d007a2fd6964323f58564a7362cb0293bc69c5bf"
-SRCREV_meta ?= "e2f792a996eb4ace257b7dd12d3890ce504741c3"
+SRCREV_machine ?= "23f3ad608bc75fc89f49a533ac4e5ed8deaa33b0"
+SRCREV_meta ?= "64fb693a6c11f21bab3ff9bb8dcb65a70abe05e3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d1309861d9..d9bec45691 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "01f85f09232df2aa45edd757150cb03e35f41f3b"
 SRCREV_machine ?= "f0a0ddc2f355d02a706454137d3dab7889fcf4d1"
-SRCREV_meta ?= "e2f792a996eb4ace257b7dd12d3890ce504741c3"
+SRCREV_meta ?= "64fb693a6c11f21bab3ff9bb8dcb65a70abe05e3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c007768dc0..63d7670f80 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
 SRCREV_machine:qemux86-64 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
 SRCREV_machine:qemumips64 ?= "690b09d3a24bafeff32bb06a72643be0c8fae9a7"
 SRCREV_machine ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
-SRCREV_meta ?= "e2f792a996eb4ace257b7dd12d3890ce504741c3"
+SRCREV_meta ?= "64fb693a6c11f21bab3ff9bb8dcb65a70abe05e3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.33.1


