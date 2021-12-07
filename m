Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A170C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:52:23 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.573.1638895941791506556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mp8IyT4V;
 spf=pass (domain: gmail.com, ip: 209.85.219.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id s9so13602153qvk.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sFlerUHfzP8PuvSjeDOfUbqHYiry7wqhg/gz17S+WVk=;
        b=Mp8IyT4VM6mvpGWIX/QAsFBcM6nR2pKeCy55WE753yMnYro3/iFH2cTBzvGZ+xs9aL
         0ZZKcWLTXm9o5QqtNJ8MzIoobAMV+sEu3e07xlDbObVEnPfEG1sag9n94bjfjdcn5NFV
         2v6ZfIPGpHIh+DEGuRBdLNm+cNOIKXyskP6PzoY80mLu6IK3+aXuAidBJ57+UKOQ679i
         4cGlvpDcGicYvFe2wj3HQyjMMHIN8ZrKO7NyfrpOh0bHxyjtT2ibJLvWQCTgmKosAL66
         ye15PRmySfb5de9ClygAv13VIeNQkzdfZBrN4VZ6V+/bx+gP8SsKI905gdMd6ExF3Zva
         B6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sFlerUHfzP8PuvSjeDOfUbqHYiry7wqhg/gz17S+WVk=;
        b=eE4VCnFeuKEPJLsgxZTAlzO6GNW9zAvRxLpzfNO3nwam2QRCivUSn7ZQ+YoRD1RWa1
         dqXjFIbcHORs7aET8XR5JMkiEug1QZLFeJbjS5Zj1jJWjHPzzrM+I0jAXOKQpgJ/eqsJ
         JPYNEz88zMvQH9UNrsD78dR8kexbDSYd3dME/z5X+/3zRnZxe6xo2gJmMcNaoYoVUxaN
         LPtqmwDNvcGQUd4XREtJ0vR1EI74o40w35n7+HubL06t4Het2vLBmkRv+D5pI3zQb5JP
         /j26MhbO8ecKMwBRcP5OlVfXhI70N/VGisaNsQaNnkBSTNbJWb5SA3fXKSoigvZj/p8A
         6NVg==
X-Gm-Message-State: AOAM530LmhG+9K8iuXJpQcFgUB7Ev/fI7i32cbWOLHrPr6xpCVGrXZWz
	DhDMJZIJD7RpmrAzVllSl6w=
X-Google-Smtp-Source: 
 ABdhPJxwBzVOrtr/QrILyvr6wus4Cq4c8rvBcKG2nZ+uVrF07PFbT2pIzWjcLkSIqKALkNEXYJNkFg==
X-Received: by 2002:a05:6214:20ee:: with SMTP id
 14mr158594qvk.95.1638895936612;
        Tue, 07 Dec 2021 08:52:16 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v9sm57536qkf.90.2021.12.07.08.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:52:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto-rt/5.10: update to -rt56
Date: Tue,  7 Dec 2021 11:52:07 -0500
Message-Id: 
 <c1e1c2c2ab0710992248e873a7f253b30774ad79.1638895732.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1638895732.git.bruce.ashfield@gmail.com>
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:52:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159323

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
2.19.1


