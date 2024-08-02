Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0419C52D6D
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 13:17:43 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.92381.1722604661326521196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 06:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iPv6EJWH;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso6653979b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722604660; x=1723209460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGYfVjorbh0vqlmCEqlVwnQCuCvWjFA5JuTfodtQJRs=;
        b=iPv6EJWHUYaCsnyia4JuLBz2E/xVEqyPUJB0idc8tAila1ABb/UUvr2Izse1WvqRHe
         XAFxCfLsSiS1DhEzv/2EqAlpl1i0MytYaacl6FXu/GEGPQPmbrl1fI88pB9quX1k7wdV
         W1/dGt1Ls2/NZWlTa518KzBsE6fEUt+SKHeW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722604660; x=1723209460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGYfVjorbh0vqlmCEqlVwnQCuCvWjFA5JuTfodtQJRs=;
        b=KNUijFye/fg+MTE60T6L6B6kX3gFH1t46nNiAOzHHQ0AX1WuU8pARhvbj6o8TpRcB8
         MPkerbzFR+PolYl8e92e3rGazck4Uf2/52rLPHRJE8gqiX7Ph23rjXRp4hQJ2+/lUYv6
         kE14C8AXkOJ7ld0+wzBCgQ77A6vO7LgYIZzxHWxksgYPX+9rW7eugxso0/kyLuqBaNOS
         2s/mvDSRo819lxB4jPVodaPjZrU0fPoNdU0ifqxLxvclyF9GTjr8tSh7q+y2HO6Yzx3H
         4j6MhpR//S09AgGoE0WDQIK3mPtR1vR1aqwcl8OwBA4xdd7zUUnKhGJ8ir5bhD8Xo6s1
         nOYA==
X-Gm-Message-State: AOJu0Yyd6HG1XgqAKy/JFiftBsVQ5h1yKS15bQ6L4iLziHbOt4AIlo5I
	4ebMv8zkbQf3cac2aXU7obI8DqWap9Ja8jmpXljMhF27bUM2m2ANf6Fc2tXdILu8H6GsJE42oLt
	J
X-Google-Smtp-Source: AGHT+IHt6CKEPON0wACTczRFP9UPIUQtViA9N+Xef3JH6nyvUcrCRaKt6ubt3kJtswhBcDvorIA2MA==
X-Received: by 2002:a05:6a20:4391:b0:1c6:91e1:f0f9 with SMTP id adf61e73a8af0-1c699624f3dmr5302966637.34.1722604660319;
        Fri, 02 Aug 2024 06:17:40 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.86.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4064d9sm5239230a91.8.2024.08.02.06.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 06:17:39 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [OE-core][kirkstone][PATCHv3] lttng-modules: Upgrade 2.13.9 -> 2.13.14
Date: Fri,  2 Aug 2024 18:47:30 +0530
Message-Id: <20240802131730.178144-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 13:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202909

From: Siddharth Doshi <sdoshi@mvista.com>

License-Update: Upstream cleaned stale file paths in License file and updated LICENSES/LGPL-2.1 and LICENSES/GPL-2.0 -> LICENSES/LGPL-2.1-only.txt and LICENSES/GPL-2.0-only.txt causing md5 to change.
(ref commit ->
https://github.com/lttng/lttng-modules/commit/b972ef5708a00718a081f0eb40205e25677e5e93
and
https://github.com/lttng/lttng-modules/commit/61baff6e8de2462f45006662bc34bcbf5f645ba0#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7)

Note: Upgrade lttng-modules to 2.13.14 to fix fcheck error which occurs
with commit 782202de6478f68caaed4567017095ad906c4eef in kernel "file: Rename fcheck
lookup_fd_rcu" which does replaces fcheck with lookup_fd_rcu.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../0009-Rename-genhd-wrapper-to-blkdev.patch | 19 +++++++++++--------
 ...les_2.13.9.bb => lttng-modules_2.13.14.bb} |  4 ++--
 2 files changed, 13 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.9.bb => lttng-modules_2.13.14.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
index 90fec9dc58..874e076675 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
@@ -8,9 +8,12 @@ to follow upstream.
 
 Upstream-Status: Backport
 
+Note: Updated patch to cleanly apply to 2.13.14
+
 Change-Id: I4ec94fb94d11712dd20f0680aea1de77fbfa9d17
 Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
 Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
  include/wrapper/{genhd.h => blkdev.h} | 10 +++++-----
  src/lttng-statedump-impl.c            |  2 +-
@@ -21,7 +24,7 @@ diff --git a/include/wrapper/genhd.h b/include/wrapper/blkdev.h
 similarity index 93%
 rename from include/wrapper/genhd.h
 rename to include/wrapper/blkdev.h
-index 4a59b68e..0d5ad90f 100644
+index e32c7b6..76397f6 100644
 --- a/include/wrapper/genhd.h
 +++ b/include/wrapper/blkdev.h
 @@ -1,6 +1,6 @@
@@ -41,9 +44,9 @@ index 4a59b68e..0d5ad90f 100644
 +#ifndef _LTTNG_WRAPPER_BLKDEV_H
 +#define _LTTNG_WRAPPER_BLKDEV_H
  
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
- #include <linux/blkdev.h>
-@@ -45,7 +45,7 @@ struct class *wrapper_get_block_class(void)
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) \
+	|| LTTNG_RHEL_KERNEL_RANGE(5,14,0,162,0,0, 5,15,0,0,0,0))
+@@ -47,7 +47,7 @@ struct class *wrapper_get_block_class(void)
  /*
   * Canary function to check for 'block_class' at compile time.
   *
@@ -52,17 +55,17 @@ index 4a59b68e..0d5ad90f 100644
   *
   *   extern struct class block_class;
   */
-@@ -104,4 +104,4 @@ struct device_type *wrapper_get_disk_type(void)
+@@ -106,4 +106,4 @@ struct device_type *wrapper_get_disk_type(void)
  
  #endif
  
 -#endif /* _LTTNG_WRAPPER_GENHD_H */
 +#endif /* _LTTNG_WRAPPER_BLKDEV_H */
 diff --git a/src/lttng-statedump-impl.c b/src/lttng-statedump-impl.c
-index 4d7b2921..0e753090 100644
+index 9d197ce..229517e 100644
 --- a/src/lttng-statedump-impl.c
 +++ b/src/lttng-statedump-impl.c
-@@ -41,7 +41,7 @@
+@@ -42,7 +42,7 @@
  #include <wrapper/namespace.h>
  #include <wrapper/irq.h>
  #include <wrapper/tracepoint.h>
@@ -72,5 +75,5 @@ index 4d7b2921..0e753090 100644
  #include <wrapper/fdtable.h>
  #include <wrapper/sched.h>
 -- 
-2.19.1
+2.35.7
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index a08386b053..a3e29ab7b7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d0d9f08888046474772a5d745d89d6a"
 
 inherit module
 
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "bf808b113544287cfe837a6382887fa66354ef5cc8216460cebbef3d27dc3581"
+SRC_URI[sha256sum] = "c6449f7ff12ab644a630692a556304e51525ca37d98aebf826796918be0f5da6"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.34.1


