Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C64CC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 03:42:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.60214.1722483736507011439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 20:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VDIBsqIG;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc5296e214so49834175ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 20:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722483735; x=1723088535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nv2+kSR2Fyt5yPzzIE9yOKwZ3oEfalhsMXyxqWiXgYs=;
        b=VDIBsqIGU0ZFwGYB77iYQigImNwbsrZpmAuwhs9NY9nN8o5smhOqcMKjEq53uGKbQv
         /xU0BhDsLKLm53t0hgC95uMj8dJZYPOyLdhBK1N39j35tUBo4Do7yHFpzqZgA7o36gnQ
         2Bwpy8yw7l0rupl9vf40QCxk9bWS9gnjzWeCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483735; x=1723088535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nv2+kSR2Fyt5yPzzIE9yOKwZ3oEfalhsMXyxqWiXgYs=;
        b=NuFp4wwvt/2aSio0GilPVhRZDMoLv/bYFlp6hg/NeUus4QTu7gh/wWAsFjJh+H4Wgc
         S5OZzRsxy+K12r52PSMLWQOYBYy1WngA2di3Nk8q5LVbdCXse6AzMSJWsS5EToc5qi5A
         WCItW6IexeU4uEeD99/StsfS3MNkTGEm0zj63L2Gx6tsDbQ6sUaNK20ihe8Ax9GAGfMX
         +JwFgSw4ze9Semx/VX7d2DWC+0z32aSFbotYmBV41l+Q4k6elklsNK3bTdmbHXz2ZvwG
         Zdbu562HnxXWTeJx3AMu6vsuZQQzEw7kZerwX9CWk+Cm/EscyyI1svy3xSqUsd7ZT0k4
         nckg==
X-Gm-Message-State: AOJu0Yxr8nDhpwE7Ptk9letRJzguBi9MBSaW8HAb0ixYpgkPGRcmWnRE
	B1NlDlbuvlrC3Q/vSLUYFzrjKdU1NtSg2KHB0FVGHB6gcjxtTF2Fmu5+XoQZf6JFEa6q7je3hFz
	u
X-Google-Smtp-Source: AGHT+IHU2KtSnZMdGz+VUSFVPmLY8CJpSyveWatZmnQ5SJi1e1xbykb4KmtaRWkC/E7OKA3T2oQWfg==
X-Received: by 2002:a17:902:d2d2:b0:1fd:9420:1073 with SMTP id d9443c01a7336-1ff4d103156mr19862635ad.43.1722483735399;
        Wed, 31 Jul 2024 20:42:15 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.45.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f94ba7sm128224935ad.248.2024.07.31.20.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:42:15 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [OE-core][kirkstone][PATCH] lttng-modules: Upgrade 2.13.9 -> 2.13.14
Date: Thu,  1 Aug 2024 09:12:00 +0530
Message-Id: <20240801034200.5630-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 03:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202720

From: Siddharth Doshi <sdoshi@mvista.com>

Update LIC_FILES_CHKSUM due to License file modification

Note: Upgrade lttng-modules to 2.13.14 to fix fcheck error which occurs
with commit 782202de6478f68caaed4567017095ad906c4eef in kernel "file: Rename fcheck
lookup_fd_rcu" which does replaces fcheck with lookup_fd_rcu.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../0009-Rename-genhd-wrapper-to-blkdev.patch | 19 +++++++++++--------
 ...les_2.13.9.bb => lttng-modules_2.13.14.bb} |  6 +++---
 2 files changed, 14 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.9.bb => lttng-modules_2.13.14.bb} (86%)

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
similarity index 86%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index a08386b053..5ab32188f2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -3,20 +3,20 @@ SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d0d9f08888046474772a5d745d89d6a"
 
 inherit module
 
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+	   file://0001-me.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "bf808b113544287cfe837a6382887fa66354ef5cc8216460cebbef3d27dc3581"
+SRC_URI[sha256sum] = "c6449f7ff12ab644a630692a556304e51525ca37d98aebf826796918be0f5da6"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.34.1


