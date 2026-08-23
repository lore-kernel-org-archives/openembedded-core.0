Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF8BC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 08:01:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10685.1787472082389461741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 01:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k4759voX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 317E01A17BE
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 08:01:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0565160378
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 08:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DEEA11C77E0E;
	Sun, 23 Aug 2026 10:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787472075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HQaG4ecfoGCL24Y9c7MI1o3TyuLPWuDWcrPuNPN7Q24=;
	b=k4759voXa9pgBGezI8CJaxZbRJiG5tWu5O8jV7UKCEexywLhTCUrwx23/B4HkHOQGnEkl0
	gFx8ivqDJ2540kxYxwvA/ksAP0hmHiutK1rE0DXkpfUL5N6dj0tGcEn8jsBU6VR54Gb4lM
	Nsu9eDC8bisG5ihGriZ3EwM08vwpxpUuRTq9eUy+5mP9DVh1/Yo10Mz7gTcd9fOwxdddTI
	mSu64TtQNgSXr8sOGdoN8UhV3t0EB42ZZwSjbkUc8Jv4pkalKRraPQL5jjAHvSDmarOrDz
	fyUVWmVrzs1g1WounBKRyEjLU2CluZy21upfZbh/cRQrGgMIugEpjZbyKLRQHw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 23 Aug 2026 10:01:10 +0200
Subject: [PATCH] meta/meta-selftest: Remove more trailing whitespaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-mathieu-whitespaces-v1-1-934f374c9215@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMaoimoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNj3dzEkozM1FLd8ozMktTigsTk1GJdsxQzC9PUNIu0ZAsTJaDOgqL
 UtMwKsKnRsbW1AG4JYlNlAAAA
X-Change-ID: 20260823-mathieu-whitespaces-6d685ef8fc84
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787472071; l=10372;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=dhbNNm8/TvUP+0X5YrQiUm8lStGwgkw0Gb9gQae7E6o=;
 b=D0SnL7Va8BYc/p2JBVoY+vzY71Vmkpm2Ax/mQX8PALMQdEmmDZTY9mwUe4sqsbJoxjAeA5p/p
 IKl512icy8HBRrw4Y/UgFc5zb/+K15eSpOvfGGy0gnviO4zLNEKMPVr
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 08:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244021

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 6 +++---
 meta/classes-recipe/binconfig.bbclass                    | 2 +-
 meta/classes-recipe/gconf.bbclass                        | 2 +-
 meta/classes-recipe/gtk-icon-cache.bbclass               | 2 +-
 meta/classes-recipe/npm.bbclass                          | 6 +++---
 meta/classes-recipe/populate_sdk_base.bbclass            | 2 +-
 meta/classes-recipe/syslinux.bbclass                     | 8 ++++----
 meta/classes/multilib.bbclass                            | 4 ++--
 meta/classes/terminal.bbclass                            | 2 +-
 meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc      | 2 +-
 meta/conf/machine/include/powerpc/arch-powerpc.inc       | 2 +-
 meta/recipes-support/vim/vim.inc                         | 2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 0ceb6ed58455..2bff6dc885ba 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -33,14 +33,14 @@ SUMMARY = "An example kernel recipe that uses the linux-yocto and oe-core"
 #
 #   defconfig: When a defconfig is provided, the linux-yocto configuration
 #              uses the filename as a trigger to use a 'allnoconfig' baseline
-#              before merging the defconfig into the build. 
+#              before merging the defconfig into the build.
 #
-#              If the defconfig file was created with make_savedefconfig, 
+#              If the defconfig file was created with make_savedefconfig,
 #              not all options are specified, and should be restored with their
 #              defaults, not set to 'n'. To properly expand a defconfig like
 #              this, specify: KCONFIG_MODE="--alldefconfig" in the kernel
 #              recipe.
-#   
+#
 #   example configuration addition:
 #            SRC_URI += "file://smp.cfg"
 #   example patch addition (for kernel v4.x only):
diff --git a/meta/classes-recipe/binconfig.bbclass b/meta/classes-recipe/binconfig.bbclass
index 427dba7f1f78..c4ab16cab458 100644
--- a/meta/classes-recipe/binconfig.bbclass
+++ b/meta/classes-recipe/binconfig.bbclass
@@ -5,7 +5,7 @@
 #
 
 FILES:${PN}-dev += "${bindir}/*-config"
- 
+
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
     s = "-e ''"
diff --git a/meta/classes-recipe/gconf.bbclass b/meta/classes-recipe/gconf.bbclass
index b81851bc78e0..70e29a220e91 100644
--- a/meta/classes-recipe/gconf.bbclass
+++ b/meta/classes-recipe/gconf.bbclass
@@ -51,7 +51,7 @@ python populate_packages:append () {
     import re
     packages = d.getVar('PACKAGES').split()
     pkgdest =  d.getVar('PKGDEST')
-    
+
     for pkg in packages:
         schema_dir = '%s/%s/etc/gconf/schemas' % (pkgdest, pkg)
         schemas = []
diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-recipe/gtk-icon-cache.bbclass
index 1c573264e0ab..2161a908ae08 100644
--- a/meta/classes-recipe/gtk-icon-cache.bbclass
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass
@@ -59,7 +59,7 @@ fi
 python populate_packages:append () {
     packages = d.getVar('PACKAGES').split()
     pkgdest =  d.getVar('PKGDEST')
-    
+
     for pkg in packages:
         icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, d.getVar('datadir'))
         if not os.path.exists(icon_dir):
diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 84ee9ebf7f47..f351e1845e39 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -226,17 +226,17 @@ python npm_do_configure() {
     if has_shrinkwrap_file:
         foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
         foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
-    
+
     # Manage Peer Dependencies
     if has_shrinkwrap_file:
         packages = orig_shrinkwrap.get("packages", {})
         peer_deps = packages.get("", {}).get("peerDependencies", {})
         package_runtime_dependencies = d.getVar("RDEPENDS:%s" % d.getVar("PN"))
-        
+
         for peer_dep in peer_deps:
             peer_dep_yocto_name = npm_package(peer_dep)
             if peer_dep_yocto_name not in package_runtime_dependencies:
-                bb.warn(peer_dep + " is a peer dependencie that is not in RDEPENDS variable. " + 
+                bb.warn(peer_dep + " is a peer dependencie that is not in RDEPENDS variable. " +
                 "Please add this peer dependencie to the RDEPENDS variable as %s and generate its recipe with devtool"
                 % peer_dep_yocto_name)
 
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b2e6f1cae9eb..f32e9add019a 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -247,7 +247,7 @@ def populate_sdk_common(d):
     oe.packagedata.runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, ld)
     d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK"))
     d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY"))
-    
+
     # create target/host SDK manifests
     create_manifest(d, manifest_dir=d.getVar('SDK_DIR'),
                     manifest_type=Manifest.MANIFEST_TYPE_SDK_HOST)
diff --git a/meta/classes-recipe/syslinux.bbclass b/meta/classes-recipe/syslinux.bbclass
index be3b898b4dca..1237ec173050 100644
--- a/meta/classes-recipe/syslinux.bbclass
+++ b/meta/classes-recipe/syslinux.bbclass
@@ -83,12 +83,12 @@ python build_syslinux_cfg () {
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
         return
-        
+
     labels = d.getVar('LABELS')
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
         return
-    
+
     if labels == []:
         bb.debug(1, "No labels, nothing to do")
         return
@@ -149,7 +149,7 @@ python build_syslinux_cfg () {
         splash = d.getVar('SYSLINUX_SPLASH')
         if splash:
             cfgfile.write('menu background splash.lss\n')
-    
+
     for label in labels.split():
         localdata = bb.data.createCopy(d)
 
@@ -158,7 +158,7 @@ python build_syslinux_cfg () {
             bb.fatal('OVERRIDES not defined')
 
         localdata.setVar('OVERRIDES', label + ':' + overrides)
-    
+
         btypes = [ [ "", syslinux_default_console ] ]
         if menu and syslinux_serial:
             btypes = [ [ "Graphics console ", syslinux_default_console  ],
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 7266f6661d9b..55b8aee882e4 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -74,7 +74,7 @@ python multilib_virtclass_handler () {
 
     # Expand this since this won't work correctly once we set a multilib into place
     d.setVar("ALL_MULTILIB_PACKAGE_ARCHS", d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
- 
+
     override = ":virtclass-multilib-" + variant
 
     skip_msg = d.getVarFlag('SKIP_RECIPE', d.getVar('PN'))
@@ -212,7 +212,7 @@ def reset_alternative_priority(d):
                 d.setVarFlag('ALTERNATIVE_PRIORITY', alt_name, reset_priority)
 
 # The processes in do_package can add to the PACKAGES list and there can be variable overrides
-# which are then exposed, but would not renamed by the original class extend rename code. We 
+# which are then exposed, but would not renamed by the original class extend rename code. We
 # therefore have to rerun the rename operation after PACKAGES is updated
 # renameVar is effectively a no-op on unset variables
 PACKAGESPLITFUNCS:append = " do_rename_package_variables"
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index fa715fa342a6..3e5bd7964c38 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -46,7 +46,7 @@ def emit_terminal_func(command, envdata, d):
 def oe_terminal(command, title, d):
     import oe.data
     import oe.terminal
-    
+
     envdata = bb.data.init()
 
     for v in os.environ:
diff --git a/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc b/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
index c584b47d180c..939b9887cc1e 100644
--- a/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
@@ -1,4 +1,4 @@
-# Configurations for the Intel PXA27x Appications Processor Family. 
+# Configurations for the Intel PXA27x Appications Processor Family.
 # Please use tune-xscale for PXA255/PXA26x based processors.
 
 DEFAULTTUNE ?= "iwmmxt"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 0719477c4141..5644c2c1e5c7 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -29,7 +29,7 @@ TUNEVALID[altivec] = "Altivec"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'altivec', ' -maltivec', '', d)}"
 
 # Basic tune definitions
-AVAILTUNES += "powerpc powerpc-nf powerpcle powerpcle-nf" 
+AVAILTUNES += "powerpc powerpc-nf powerpcle powerpcle-nf"
 
 TUNE_FEATURES:tune-powerpc-nf = "m32 fpu-soft bigendian"
 BASE_LIB:tune-powerpc-nf = "lib"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c1a193376b43..6f3ef9d6c81a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -102,7 +102,7 @@ do_install() {
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
-    
+
     # Install example vimrc from runtime files
     install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 

---
base-commit: fa6475327ee04b43d886363e8559f18592f52f61
change-id: 20260823-mathieu-whitespaces-6d685ef8fc84

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


