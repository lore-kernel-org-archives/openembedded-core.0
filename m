Return-Path: <crg7475@mailbox.org>
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2207FA11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:17 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47wddt1sypzKmf3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1578837616; bh=VHcc5i4ye/BQwvA7HVwOo3PClkyctHrjE
	zcMELVlOmI=; b=WOKp7P3d5xdTqd7I77vCxjdlwBEHqR6LPRm3IoZsEYIXm3pGu
	c3J3BKiaAZRfeWFoEnvb3A7mQUxaEBdGM+hnmfIBn4Rz3q5rtSjx3e7m2NHr3YlC
	AsxQogCGKjRb6qE+qohbSPtaYluMc14f5XQQ4lZCPtnYecIR6x8t6USUYFTugScn
	xwTRRV3APwRP/mkCCm1WFYbat7OnSa8uIOqfDtECLmId5IcFxgq9+Ulm71iFnigu
	iMeK/IcF8diKZkVPKy5oaWaCsM+RvFg6Ejn6r9augRPdzR6iyZ67KpLccPVp1HNh
	TvX9ciqjXwtmsV3Y70P79JD8mztwPNBqix8oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc; bh=/kd8kFRs+VpBTQLg9Ev/kEEVcxgZR1SqXXneERZSOwA=;
	b=cTQOaQ5hIaqg0KaVAsphgveaaCz/1/yWRvbzzOO2DpeR+65hkP66j5o+Rx1Vom4LHfuV+c
	R1h9lsPTtXUm3eLW92O2l+ot0NjWXi/gfUEumXtn6Wb0cIR8NhMweMQhXskHMbU3CSgov8
	m2a15i5+kz4nbbtS7aW2XSzDl/uTHZHI2rUM/uppFEcmyZ4nWsVbsia0P2i4wi87Jbe2J/
	Hd1EQ+94UsnFoMVh3wTLsQLgG0xJZpf25h1fVRg6pQPzY5zzSRjqN5KLOqNl+l/hHUWR6b
	yoMC69Ssk/qg6ACDMm6pY2aeWvpk+ravaQhqOFyaf5ws+lzfJEY/Ek+N0NvWeQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id gG6SeUZCvBDt
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:16 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:43 +0100
Message-Id: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:18 -0000

* gstreamer1.0-plugins-common.inc
  The old gstreamer1.0-plugins.inc file, adapted for meson
* gstreamer1.0-plugins-packaging.inc
  The old gst-plugins-package.inc file, adapted for meson
* gstreamer1.0-ptest.inc
  Common code for meson based PTest support; autogenerates the run-ptest
  file and is designed to use the gnome-desktop-testing suite runner
  (which is why the .inc files inherits from ptest-gnome)

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
 .../gstreamer1.0-plugins-packaging.inc        | 70 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
 3 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
new file mode 100644
index 0000000000..ccf55500a9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
@@ -0,0 +1,47 @@
+# This .inc file contains the common setup for the gstreamer1.0-plugins-*
+# plugin set recipes.
+
+# SUMMARY is set in the actual .bb recipes
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
+SECTION = "multimedia"
+
+DEPENDS = "gstreamer1.0 glib-2.0-native"
+
+inherit gettext meson pkgconfig upstream-version-is-even
+
+require gstreamer1.0-plugins-packaging.inc
+
+# Orc enables runtime JIT compilation of data processing routines from Orc
+# bytecode to SIMD instructions for various architectures (currently SSE, MMX,
+# MIPS, Altivec and NEON are supported).
+# This value is used in the PACKAGECONFIG values for each plugin set recipe.
+# By modifying it, Orc can be enabled/disabled in all of these recipes at once.
+GSTREAMER_ORC ?= "orc"
+
+PACKAGECONFIG[orc] = "-Dorc=enabled,-Dorc=disabled,orc orc-native"
+
+# TODO: put this in a gettext.bbclass patch (with variables to allow for
+# configuring the option name and the enabled/disabled values).
+def gettext_oemeson(d):
+    if d.getVar('USE_NLS') == 'no':
+        return '-Dnls=disabled'
+    # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
+    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cross-canadian'):
+        return '-Dnls=disabled'
+    return '-Dnls=enabled'
+
+# Not all plugin sets contain examples, so the -Dexamples
+# option needs to be added conditionally.
+GST_PLUGIN_SET_HAS_EXAMPLES ?= "1"
+
+EXTRA_OEMESON += " \
+    ${@bb.utils.contains('GST_PLUGIN_SET_HAS_EXAMPLES', '1', '-Dexamples=disabled', '', d)} \
+    ${@gettext_oemeson(d)} \
+"
+
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
+
+# Dynamically generate packages for all enabled plugins
+PACKAGES_DYNAMIC = "^${PN}-.*"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
new file mode 100644
index 0000000000..9a7a1b6afe
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
@@ -0,0 +1,70 @@
+# This .inc file contains functionality for automatically splitting
+# built plugins into individual packages for each plugin. A -meta
+# package is also set up that has no files of its own, but contains
+# the names of all plugin packages in its RDEPENDS list.
+#
+# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,
+# but can be used in any recipe that produces GStreamer plugins.
+
+PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
+PACKAGESPLITFUNCS_append = " set_gstreamer10_metapkg_rdepends "
+
+python split_gstreamer10_packages () {
+    gst_libdir = d.expand('${libdir}/gstreamer-1.0')
+    postinst = d.getVar('plugin_postinst')
+    glibdir = d.getVar('libdir')
+
+    # GStreamer libraries
+    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*', 'lib%s', 'GStreamer 1.0 %s library', extra_depends='', allow_links=True)
+    # GStreamer plugin shared objects
+    do_split_packages(d, gst_libdir, r'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer 1.0 plugin for %s', postinst=postinst, extra_depends='')
+    # GObject introspection files for GStreamer plugins
+    do_split_packages(d, glibdir+'/girepository-1.0', r'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'), 'GStreamer 1.0 typelib file for %s', postinst=postinst, extra_depends='')
+    # Static GStreamer libraries for development
+    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer 1.0 plugin for %s (static development files)', extra_depends='${PN}-staticdev')
+}
+
+python set_gstreamer10_metapkg_rdepends () {
+    import os
+    import oe.utils
+
+    # Go through all generated packages (excluding the main package and
+    # the -meta package itself) and add them to the -meta package as RDEPENDS.
+
+    pn = d.getVar('PN')
+    metapkg =  pn + '-meta'
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    d.setVar('FILES_' + metapkg, "")
+    blacklist = [ pn, pn + '-meta' ]
+    metapkg_rdepends = []
+    pkgdest = d.getVar('PKGDEST')
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg not in blacklist and pkg not in metapkg_rdepends:
+            # See if the package is empty by looking at the contents of its PKGDEST subdirectory.
+            # If this subdirectory is empty, then the package is.
+            # Empty packages do not get added to the meta package's RDEPENDS
+            pkgdir = os.path.join(pkgdest, pkg)
+            if os.path.exists(pkgdir):
+                dir_contents = os.listdir(pkgdir) or []
+            else:
+                dir_contents = []
+            is_empty = len(dir_contents) == 0
+            if not is_empty:
+                metapkg_rdepends.append(pkg)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
+}
+
+# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
+# so we need them even when empty (like in gst-plugins-good case)
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dev = "1"
+ALLOW_EMPTY_${PN}-staticdev = "1"
+
+PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
+
+FILES_${PN} = ""
+FILES_${PN}-apps = "${bindir}"
+FILES_${PN}-glib = "${datadir}/glib-2.0"
+
+RRECOMMENDS_${PN} += "${PN}-meta"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
new file mode 100644
index 0000000000..74368c4cd8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
@@ -0,0 +1,21 @@
+inherit ptest-gnome
+
+TEST_FILES_PATH = "${datadir}/installed-tests/gstreamer-1.0/test-files"
+RUN_PTEST_FILE = "${D}${PTEST_PATH}/run-ptest"
+
+EXTRA_OEMESON += "-Dtest-files-path=${TEST_FILES_PATH}"
+
+# Using do_install_ptest_base instead of do_install_ptest, since
+# the default do_install_ptest_base is hardcoded to expect Makefiles.
+do_install_ptest_base() {
+    # Generate run-ptest file
+    echo "#!/usr/bin/env sh" > "${RUN_PTEST_FILE}"
+    echo "gnome-desktop-testing-runner ${GST_TEST_SUITE_NAME}" >> "${RUN_PTEST_FILE}"
+    chmod 0755 "${RUN_PTEST_FILE}"
+
+    # Install additional files required by tests
+    if [ -d "${S}/tests/files" ] ; then
+        install -d "${D}/${TEST_FILES_PATH}"
+        install -m 0644 "${S}/tests/files"/* "${D}/${TEST_FILES_PATH}"
+    fi
+}
-- 
2.17.1


