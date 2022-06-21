Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994AECCA485
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:16:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.48350.1655842609402190144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HP6qf5CX;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id mf9so9506761ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NYWWkaWH5G9SUe/ZOnwa1CTbgYS/0R3esCflU1cQzoQ=;
        b=HP6qf5CXDDcQWGgIMIxttvDP0fAty2x+/oPSfQLqCDIhnCPmBjJneQKUyl7y/cjej9
         x4XrdY97Iy617HI8A7A+bAvAYY/APwf+t37OR8DhV80/JxdFVDtXd2NlZcdqnxIPwdnE
         F3sl+E+0kGCU0Km9Ec2ee//Bvypv8YJp7OXhfoXT4Ctdy2dZZqFF1U1LUVRpsw5r4hnv
         5lxRkObuhazR2JCG6PexfUHtaB0v/mV6Gz/YX3EaCUiyvlQ/T/VcsSGqNad6whZVL4fX
         GiSmE5vPxFsI9EACVm1JBN/BX5JozzmKs9OWucru/Lt7uLv3jn54vMGCfeqXS6coceyj
         rFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NYWWkaWH5G9SUe/ZOnwa1CTbgYS/0R3esCflU1cQzoQ=;
        b=veGNMKSx4Yqqfzsmb7MFsI8pNDwvDjCJqbIOaeZPI8MbSFKiCOZfcSVC1c9IWsu5Kl
         bnFkW3kUt9/mA6pZr7TiuFPR/yatzcnzfPeoUYce/JQoQjCQZ6h7XJja3GIxHOQEKa2K
         MKc3Rh4WzF+PpyGGGe2LFlXz1KBdVhljm2i6vNrFmyQ0PQz4HUEfbzkIMIYFaI20usD1
         3Xvbbf+YkW7hn+B1wQcAga/oKXR8EAgWgwEF+u505aJAh8CM7Y7yYTYj+sT9WW3hqHX+
         tCnM7IgWaGWMPOlE6Jf6fIiV3Cjmbowy/ApiUjyt6kndVjuE4o2F24ALlaN3zhytgEDY
         v5tg==
X-Gm-Message-State: AJIora/WJUXVjjJIz8AA9a23iTh53Dd9pkSLRPlXkve/Dkx3vuYrs3fp
	9DNJtUvPWgt2IYaKZIWnJdzDWt0shYxltA==
X-Google-Smtp-Source: 
 AGRyM1tLzrLjpsgrBhMiEGloLfIMsEMfcqfnm9+YILwgINCgxbi8ZHv4WniWI/bGgEcQmtQsGHX2xA==
X-Received: by 2002:a17:907:1c18:b0:711:c83b:8a14 with SMTP id
 nc24-20020a1709071c1800b00711c83b8a14mr26376605ejc.379.1655842607906;
        Tue, 21 Jun 2022 13:16:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/18] mesa: update 22.0.3 -> 22.1.2
Date: Tue, 21 Jun 2022 22:16:22 +0200
Message-Id: <20220621201637.1378306-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167171

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...wkmsDRI2Extension-instead-of-driDRI2.patch | 113 ++++++++++++++++++
 .../{mesa-gl_22.0.3.bb => mesa-gl_22.1.2.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |   3 +-
 .../mesa/{mesa_22.0.3.bb => mesa_22.1.2.bb}   |   0
 4 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.3.bb => mesa-gl_22.1.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.3.bb => mesa_22.1.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch b/meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch
new file mode 100644
index 0000000000..db25e16f4a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch
@@ -0,0 +1,113 @@
+From feb4ec510b1328fdd9aa77305d3273d1f9c7e124 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 9 Jun 2022 11:42:05 +0200
+Subject: [PATCH] swrast_kms: use swkmsDRI2Extension instead of
+ driDRI2Extension
+
+This set of changes:
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15649
+
+caused a regression in Xorg when using swrast_kms:
+   (EE) AIGLX error: Calling driver entry point failed
+
+This commit changes the swrast_kms driver to use a dedicated screen init function
+(which I believe was overlooked); I also took the opportunity to rename the
+associated plumbling to have swrast-specific names.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16942]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/gallium/frontends/dri/dri2.c       | 16 ++++++++--------
+ src/gallium/frontends/dri/dri_screen.h |  4 ++--
+ src/gallium/frontends/dri/dri_util.c   |  2 +-
+ src/gallium/targets/dri/target.c       |  2 +-
+ 4 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/src/gallium/frontends/dri/dri2.c b/src/gallium/frontends/dri/dri2.c
+index 63ac9d5..de33789 100644
+--- a/src/gallium/frontends/dri/dri2.c
++++ b/src/gallium/frontends/dri/dri2.c
+@@ -2508,7 +2508,7 @@ release_pipe:
+  * Returns the struct gl_config supported by this driver.
+  */
+ static const __DRIconfig **
+-dri_kms_init_screen(__DRIscreen * sPriv)
++dri_swrast_kms_init_screen(__DRIscreen * sPriv)
+ {
+ #if defined(GALLIUM_SOFTPIPE)
+    const __DRIconfig **configs;
+@@ -2613,8 +2613,8 @@ static const struct __DRIDriverVtableExtensionRec galliumdrm_vtable = {
+  * hook. The latter is used to explicitly initialise the kms_swrast driver
+  * rather than selecting the approapriate driver as suggested by the loader.
+  */
+-const struct __DriverAPIRec dri_kms_driver_api = {
+-   .InitScreen = dri_kms_init_screen,
++const struct __DriverAPIRec dri_swrast_kms_driver_api = {
++   .InitScreen = dri_swrast_kms_init_screen,
+    .DestroyScreen = dri_destroy_screen,
+    .CreateBuffer = dri2_create_buffer,
+    .DestroyBuffer = dri_destroy_buffer,
+@@ -2633,17 +2633,17 @@ const __DRIextension *galliumdrm_driver_extensions[] = {
+     NULL
+ };
+ 
+-static const struct __DRIDriverVtableExtensionRec dri_kms_vtable = {
++static const struct __DRIDriverVtableExtensionRec dri_swrast_kms_vtable = {
+    .base = { __DRI_DRIVER_VTABLE, 1 },
+-   .vtable = &dri_kms_driver_api,
++   .vtable = &dri_swrast_kms_driver_api,
+ };
+ 
+-const __DRIextension *dri_kms_driver_extensions[] = {
++const __DRIextension *dri_swrast_kms_driver_extensions[] = {
+     &driCoreExtension.base,
+     &driImageDriverExtension.base,
+-    &driDRI2Extension.base,
++    &swkmsDRI2Extension.base,
+     &gallium_config_options.base,
+-    &dri_kms_vtable.base,
++    &dri_swrast_kms_vtable.base,
+     NULL
+ };
+ 
+diff --git a/src/gallium/frontends/dri/dri_screen.h b/src/gallium/frontends/dri/dri_screen.h
+index 0ee2feb..0bb8817 100644
+--- a/src/gallium/frontends/dri/dri_screen.h
++++ b/src/gallium/frontends/dri/dri_screen.h
+@@ -168,8 +168,8 @@ dri_destroy_screen_helper(struct dri_screen * screen);
+ void
+ dri_destroy_screen(__DRIscreen * sPriv);
+ 
+-extern const struct __DriverAPIRec dri_kms_driver_api;
+-extern const __DRIextension *dri_kms_driver_extensions[];
++extern const struct __DriverAPIRec dri_swrast_kms_driver_api;
++extern const __DRIextension *dri_swrast_kms_driver_extensions[];
+ extern const struct __DriverAPIRec galliumdrm_driver_api;
+ extern const __DRIextension *galliumdrm_driver_extensions[];
+ extern const struct __DriverAPIRec galliumsw_driver_api;
+diff --git a/src/gallium/frontends/dri/dri_util.c b/src/gallium/frontends/dri/dri_util.c
+index 8d60526..03614e1 100644
+--- a/src/gallium/frontends/dri/dri_util.c
++++ b/src/gallium/frontends/dri/dri_util.c
+@@ -187,7 +187,7 @@ swkmsCreateNewScreen(int scrn, int fd,
+ 		     const __DRIconfig ***driver_configs, void *data)
+ {
+    return driCreateNewScreen2(scrn, fd, extensions,
+-                              dri_kms_driver_extensions,
++                              dri_swrast_kms_driver_extensions,
+                               driver_configs, data);
+ }
+ 
+diff --git a/src/gallium/targets/dri/target.c b/src/gallium/targets/dri/target.c
+index 9b78351..e02b03b 100644
+--- a/src/gallium/targets/dri/target.c
++++ b/src/gallium/targets/dri/target.c
+@@ -25,7 +25,7 @@ const __DRIextension **__driDriverGetExtensions_kms_swrast(void);
+ 
+ PUBLIC const __DRIextension **__driDriverGetExtensions_kms_swrast(void)
+ {
+-   return dri_kms_driver_extensions;
++   return dri_swrast_kms_driver_extensions;
+ }
+ 
+ #endif
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.1.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3c26b23ed5..83705fc34d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,9 +21,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
+           file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
            "
 
-SRC_URI[sha256sum] = "9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9"
+SRC_URI[sha256sum] = "0971226b4a6a3d10cfc255736b33e4017e18c14c9db1e53863ac1f8ae0deb9ea"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.3.bb b/meta/recipes-graphics/mesa/mesa_22.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_22.1.2.bb
-- 
2.30.2


