Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E8AF56025E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 03:30:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p1so8985452pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 19:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yyspGHehfHAxJ7nYs8ujJ/klOQDVCDSr481VGKQPp5E=;
	b=PE2fE9QhK0kzcT6St2kqWhFUfmvRVYzMvkB7EZD5JjELpjQVO0hoIEDjXVU+RhzJZH
	bXsYxjmSqiKwUaVg8Rg+v4R+9tk5fkRv5HPOaX6gnv6vBZ9CaDp5FLQAX8Yc3AQBa3VU
	8tk42vvI/CAFQyKz2sdfmcblU82TXckKqhjUvY/zE9vNL9VMRdR+0qgfa3PRhAF9KmYG
	Y+3o69hp+6sr4nhunAK50B8x28L/qcDgmYDM78RmEyCzIqkOgNZvduyNP71wE4HIHYvd
	FwAMoqovpKaQi1ZT4R4k11LT+FMk/aNLlIqiZE/9khZzFwmxC0sTQSMWKbtKidUXHcfX
	cvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yyspGHehfHAxJ7nYs8ujJ/klOQDVCDSr481VGKQPp5E=;
	b=o/RGQLLc0b4bqCmnGceDpaI1eGiexsqdKNV0B/OfQTMvW/Md178sELubJeVM5usHpB
	nQngIoBsvQeLMzty+T6qirU4CJ4Ze/WpydyWTHx0E8EX5T77QPR76sPIiTcsTSSUKeMt
	2MYObXc1HcbRmtYwZ3T4QCtvsUObnYhmUTQ9MbElipoc8+fBQRgDQTB0J0dTBTFrRK19
	k9TxUiuaiKT1wvUPXrzKlDsBL/TRk9BoriXvN5aRXzU0BWqobDzcYtC2gEKvbBWA+pZT
	3KYLAsorshjsfheMBsxxhkpuuybjbdrtyCKa5pwiUJ4qRx2kBaDlrKIIR0CwKqmfy9E7
	+P7w==
X-Gm-Message-State: AKwxytczjoi3/zT545sEXwx8VBXZwxnaEtYNggRrFlmJVCKhHHENGV0j
	q+6NhNdRlRpc/GW3R0FLhElyRw==
X-Google-Smtp-Source: ACJfBouH7s3XyAyMKujp9pz0nsWe59rFzlWBdlAB0WI+DUiIQubm8+7I3P9eEkEZ+zyVbnhuQLQfBA==
X-Received: by 10.98.144.79 with SMTP id a76mr13252513pfe.15.1516073444356;
	Mon, 15 Jan 2018 19:30:44 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	u86sm1227303pfa.39.2018.01.15.19.30.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Jan 2018 19:30:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jan 2018 19:30:38 -0800
Message-Id: <1516073438-17110-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel: drop unnecessary True options from calls to getVar
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jan 2018 03:30:44 -0000

The older style calls (plus a bashism in kernel.bbclass, fixed
separately) were introduced via the recent change to add support for
multiple kernel packages:

  http://git.openembedded.org/openembedded-core/commit/?id=6c8c899849d101fd1b86aad0b8eed05c7c785924

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel-module-split.bbclass         |  6 +++---
 meta/classes/kernel.bbclass                      | 12 ++++++------
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc        |  2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 73c7f18..67ab416 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -30,7 +30,7 @@ do_install_append() {
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 
-KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME", True) or "kernel" }-modules"
+KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-modules"
 
 KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
@@ -129,8 +129,8 @@ python split_kernel_module_packages () {
            postfix = format.split('%s')[1]
            d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
 
-    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True) or "kernel"
-    kernel_version = d.getVar("KERNEL_VERSION", True)
+    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
+    kernel_version = d.getVar("KERNEL_VERSION")
 
     module_regex = '^(.*)\.k?o$'
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c42f85c..a36f4f9 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,9 +1,9 @@
 inherit linux-kernel-base kernel-module-split
 
 KERNEL_PACKAGE_NAME ??= "kernel"
-KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
+KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
-PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
+PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
@@ -37,8 +37,8 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION')
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
-    pn = d.getVar("PN", True)
-    kpn = d.getVar("KERNEL_PACKAGE_NAME", True)
+    pn = d.getVar("PN")
+    kpn = d.getVar("KERNEL_PACKAGE_NAME")
 
     # XXX Remove this after bug 11905 is resolved
     #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
@@ -52,7 +52,7 @@ python __anonymous () {
     # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
     # may build in parallel with the default kernel without clobbering.
     if kpn != "kernel":
-        workdir = d.getVar("WORKDIR", True)
+        workdir = d.getVar("WORKDIR")
         sourceDir = os.path.join(workdir, 'kernel-source')
         artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
         d.setVar("STAGING_KERNEL_DIR", sourceDir)
@@ -62,7 +62,7 @@ python __anonymous () {
     type = d.getVar('KERNEL_IMAGETYPE') or ""
     alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
     types = d.getVar('KERNEL_IMAGETYPES') or ""
-    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
+    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
     if type not in types.split():
         types = (type + ' ' + types).strip()
     if alttype not in types.split():
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 40d6e4a..8938ab8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # to build multiple virtual/kernel providers, e.g. as dependency of
 # core-image-rt-sdk, core-image-rt.
 python () {
-    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index ed65f77..a89c08d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # to build multiple virtual/kernel providers, e.g. as dependency of
 # core-image-rt-sdk, core-image-rt.
 python () {
-    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index e1547e9..949d477 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # to build multiple virtual/kernel providers, e.g. as dependency of
 # core-image-rt-sdk, core-image-rt.
 python () {
-    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index fa25629..99931b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # to build multiple virtual/kernel providers, e.g. as dependency of
 # core-image-rt-sdk, core-image-rt.
 python () {
-    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 8a70eb5..87c0674 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -12,7 +12,7 @@ INC_PR = "r4"
 # PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
 # by the use of AUTOREV SRCREVs, which are the default for this recipe.
 python () {
-    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN", True):
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != d.getVar("PN"):
         d.delVar("BB_DONT_CACHE")
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN")))
 }
-- 
1.9.1


