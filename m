Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3626C335
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:47:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wANAloL8026878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:47:50 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Fri, 23 Nov 2018 02:47:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 19:04:52 +0800
Message-ID: <2eeddc7de335c80ca803d8acb55cd6916a4fe1ad.1542971027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542971027.git.liezhi.yang@windriver.com>
References: <cover.1542971027.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] recipes: Remove tab indentations in python code
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
X-List-Received-Date: Fri, 23 Nov 2018 10:47:49 -0000
Content-Type: text/plain

Use 4 spaces to replace a tab.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc              | 42 +++++++++++-----------
 meta/recipes-core/coreutils/coreutils_8.30.bb      |  8 ++---
 .../images/build-appliance-image_15.0.0.bb         |  6 ++--
 meta/recipes-devtools/python/python3_3.5.6.bb      |  2 +-
 .../net-tools/net-tools_1.60-26.bb                 |  8 ++---
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b8d8858..6abbb54 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -55,35 +55,35 @@ inherit cml1 systemd update-rc.d ptest
 
 # internal helper
 def busybox_cfg(feature, tokens, cnf, rem):
-	if type(tokens) == type(""):
-		tokens = [tokens]
-	rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
-	if feature:
-		cnf.extend([token + '=y' for token in tokens])
-	else:
-		cnf.extend(['# ' + token + ' is not set' for token in tokens])
+    if type(tokens) == type(""):
+        tokens = [tokens]
+    rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
+    if feature:
+        cnf.extend([token + '=y' for token in tokens])
+    else:
+        cnf.extend(['# ' + token + ' is not set' for token in tokens])
 
 # Map distro features to config settings
 def features_to_busybox_settings(d):
-	cnf, rem = ([], [])
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IPV6', cnf, rem)
-	busybox_cfg(True, 'CONFIG_LFS', cnf, rem)
-	busybox_cfg(True, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'nls', True, False, d), 'CONFIG_LOCALE_SUPPORT', cnf, rem)
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
-	return "\n".join(cnf), "\n".join(rem)
+    cnf, rem = ([], [])
+    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IPV6', cnf, rem)
+    busybox_cfg(True, 'CONFIG_LFS', cnf, rem)
+    busybox_cfg(True, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
+    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'nls', True, False, d), 'CONFIG_LOCALE_SUPPORT', cnf, rem)
+    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
+    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
+    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
+    return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_busybox_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
 def features_to_busybox_conf(d):
-	cnf, rem = features_to_busybox_settings(d)
-	return cnf
+    cnf, rem = features_to_busybox_settings(d)
+    return cnf
 def features_to_busybox_del(d):
-	cnf, rem = features_to_busybox_settings(d)
-	return rem
+    cnf, rem = features_to_busybox_settings(d)
+    return rem
 
 configmangle = '/CONFIG_EXTRA_CFLAGS/d; \
 		'
diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.30.bb
index 205ba4a..8f4ee55 100644
--- a/meta/recipes-core/coreutils/coreutils_8.30.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
@@ -129,11 +129,11 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
 
 python __anonymous() {
-	for prog in d.getVar('base_bindir_progs').split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
+    for prog in d.getVar('base_bindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 
-	for prog in d.getVar('sbindir_progs').split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir'), prog))
+    for prog in d.getVar('sbindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir'), prog))
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index f03ef96..e88eed9 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -116,9 +116,9 @@ IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
 addtask rootfs after do_unpack
 
 python () {
-	# Ensure we run these usually noexec tasks
-	d.delVarFlag("do_fetch", "noexec")
-	d.delVarFlag("do_unpack", "noexec")
+    # Ensure we run these usually noexec tasks
+    d.delVarFlag("do_fetch", "noexec")
+    d.delVarFlag("do_unpack", "noexec")
 }
 
 create_bundle_files () {
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 31f8ead..5408e3f 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -285,7 +285,7 @@ python(){
         for value in python_manifest[key]['files']:
             d.appendVar('FILES_' + pypackage, ' ' + value)
 
-    	# Add cached files
+        # Add cached files
         if include_pycs == '1':
             for value in python_manifest[key]['cached']:
                     d.appendVar('FILES_' + pypackage, ' ' + value)
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index a4e3285..b565fd0 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -121,10 +121,10 @@ ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
 ALTERNATIVE_PRIORITY[hostname.1] = "10"
 
 python __anonymous() {
-	for prog in d.getVar('base_sbindir_progs').split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
-	for prog in d.getVar('base_bindir_progs').split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
+    for prog in d.getVar('base_sbindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
+    for prog in d.getVar('base_bindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 }
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.7.4


