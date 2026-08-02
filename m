Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2468BC55181
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21188.1785666559867945833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DX0JCkFH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso13325455e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666558; x=1786271358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G5FSlXmr0XbCZ5w/NaCEtPtYhfKQpc3M0FoexAaSwH4=;
        b=DX0JCkFHlaXRAONN5V2P6Lvlb2eS1ThMBdbqshuhOI/qTSq7OQuGZOw8SvYz4Fm8SA
         IzfJpbJTon/IsqwLcbqBtVsq6GX4l27qE0YcoHh9gUAlUrUZAxgcIR8mY+tL9vjBlnxI
         me4+NqFVZ9kcA+pFTu2GRixtWxk6DyZvz60No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666558; x=1786271358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G5FSlXmr0XbCZ5w/NaCEtPtYhfKQpc3M0FoexAaSwH4=;
        b=cihSuHbBiMHk111idpmGqiSQPGHb7jAIk/3OKasMg3iYjyc6Ne97+yXehNJOHU4W9m
         IDtgM1NwW2q/pZrgHObuUEzl6GA0CUZNM5zYxChXtB+WyA9Y84W6Zgn8/ZRButOG11QA
         8U3XzLoJL1+HuObgsLzMPwqvnciylOyuq9zOKA85q4yk9qCLVafMM9LTI2cU0gB0XhWO
         5iZVuxxPmeZVxqqOcoURzsSg0e6UyTUA19lO8TXhudGJgr66C/HlzKGjfEQiSAH7sQ7+
         BmLhfpMFAbOGcg+pkBk4Q756gXoxtiDSAi7QNNd/crwr/VagGRwIvZYpYuV31+/N8bXS
         dXpw==
X-Gm-Message-State: AOJu0YwZd5ZrO/2c1/M4VQ7zpuiuvQzc+1c3KpMBSzps7maRWZiiS1AJ
	BIJcrkyDlZO4jT/qhTZM/Wm7IxnXM+SiUc52ozWCn1N4xnTymBc238IyDTqbJ25VxV0N8OsHqk6
	jKPH+Ch4=
X-Gm-Gg: AR+sD138GsSfEmO3fiJPCrSxag0q8V8P0/C5fZMXyl94z0VoJi/bP9iget5KjR72pQN
	rsXk3Fw4KGZnHp2P2/TStB5PmKPGuJ+bQ6r+8NsboeQROtT9c662u+zmFnFm+YSkgMzfp6JX0Tc
	I4z4G5hkQQ04ZD+mKVH0xKJ7UWg8kn9VFAdboYQD9dPX2P4ZUNUdlJZGDsClDtyLkspQsi8fr/x
	n0EkHVP0M7vIny5nGiLLJOWRMeGWrOuPj4J/fN+e+Wu5NdICZRdjKygXC01KH0iKPfm54nGMJLA
	Zf9sTBDNiWoICvrkROAS5m4byOHlpQ+6lOkGoY4ny0ZDfmyFJ0fko6ePvt9bHyajwLtj+8mKmrC
	++13Rw7OznkxZLXRbQSsOzCmBPddpfSjWjbpckge9D3yIF7NrQBZpT7HwjJOTpxOwAvIgvz22ha
	GuI1xyAxhy68NTFHuuTvV+AcQum9aRV8SnymqUlQ2NyTlZ46xZBVQnf1ybEikKgHBxftZMbvc7g
	G9dn4u7R9fOTSWabw==
X-Received: by 2002:a05:600c:218d:b0:495:4c74:6a14 with SMTP id 5b1f17b1804b1-4980c674e8dmr93227345e9.14.1785666558056;
        Sun, 02 Aug 2026 03:29:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/25] kernel-arch: Move ARCH usage into target classes
Date: Sun,  2 Aug 2026 11:28:46 +0100
Message-ID: <20260802102854.3952760-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242542

Since ARCH is just a function now we can move it into the target class usages
and drop it from the default environment. We still have to export in some
cases where the usage is unknown but this does significatly reduce the
scope and number of places exported to.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/devicetree.bbclass                       | 4 +++-
 meta/classes-recipe/kernel-arch.bbclass                      | 5 -----
 meta/classes-recipe/kernel.bbclass                           | 3 +++
 meta/classes-recipe/module-base.bbclass                      | 1 +
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 ++-
 meta/recipes-kernel/perf/perf.bb                             | 2 ++
 6 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ce9d008aac1..4fe389bed83 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -29,7 +29,9 @@ LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "dtc-native"
 
-inherit deploy kernel-arch
+inherit deploy
+
+export ARCH = "${@oe.kernel.map_kernel_arch(d)}"
 
 COMPATIBLE_MACHINE ?= "^$"
 
diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index db708c35104..eb598d98b6e 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -4,11 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-# set the ARCH environment variable for kernel compilation (including
-# modules). return value must match one of the architecture directories
-# in the kernel source "arch" directory
-export ARCH = "${@oe.kernel.map_kernel_arch(d)}"
-
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
 TARGET_CC_KERNEL_ARCH ?= ""
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index aeaec8ccbd4..28460ce1cb9 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -6,6 +6,8 @@
 
 inherit linux-kernel-base kernel-module-split features_check
 
+ARCH = "${@oe.kernel.map_kernel_arch(d)}"
+
 COMPATIBLE_HOST = ".*-linux"
 
 # Linux has a minimum ISA requires on riscv, see arch/riscv/Makefile
@@ -245,6 +247,7 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
+EXTRA_OEMAKE += ' ARCH="${@oe.kernel.map_kernel_arch(d)}"'
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
 EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
diff --git a/meta/classes-recipe/module-base.bbclass b/meta/classes-recipe/module-base.bbclass
index 2a225881ba4..d52de45f4a5 100644
--- a/meta/classes-recipe/module-base.bbclass
+++ b/meta/classes-recipe/module-base.bbclass
@@ -10,6 +10,7 @@ inherit kernel-arch
 # in sstate, so we must force do_compile to run (once).
 do_configure[depends] += "make-mod-scripts:do_compile"
 
+export ARCH = "${@oe.kernel.map_kernel_arch(d)}"
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index ab984f4bcfe..6e64918f5b5 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -21,7 +21,8 @@ DEPENDS += "gmp-native"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "virtual/cross-cc virtual/cross-binutils"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = ' ARCH="${@oe.kernel.map_kernel_arch(d)}"'
+EXTRA_OEMAKE += " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@oe.kernel.get_localversion_file("${STAGING_KERNEL_BUILDDIR}")}"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e3e5d55e396..5fa98a0d94b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -58,6 +58,8 @@ PROVIDES = "virtual/perf"
 
 inherit linux-kernel-base kernel-arch manpages pkgconfig
 
+ARCH = "${@oe.kernel.map_kernel_arch(d)}"
+
 # needed for building the tools/perf Python bindings
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 inherit python3-dir

