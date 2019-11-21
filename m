Return-Path: <tanuk@iki.fi>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
	[66.111.4.221])
	by mail.openembedded.org (Postfix) with ESMTP id 620D97F377
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 14:06:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5F35D4970
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:06:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Nov 2019 09:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lKAS7eiCVD39zbqOh
	9ZDnRrHNUrhxqeJr4+xpwy1Pak=; b=aXGoWuRJgYFQGipNTM4MLtJgXmK0TBJ1J
	UpogZURpMxpTQ3VaXoMcjp0Hd5ZRnlXdGw2sIjFI6hx2bD/ceHXOHs5fldwPR/JQ
	0fCvHRopyrCg2pP7gZcd8esCwmpGpWucNPKLRZVpR7ylmmaAOWEgcnPBHeLfdlWY
	rRn8KaLLbtg7jBULQnirILb8FO20L/U7DmAR0emnZv3QL0UEeFiCeVB//3PTrdzA
	cYLfvo1ppHxSk4vKYUmmiInvfJSTXMEK44yNbuqI9ilP+GdO1MfJnmCuaRU9ftFg
	J7vRdMZzNJxx8SpsSh+Mh1rLBYHqOcpJGNmUHZZnCy/YmOzbN2X5w==
X-ME-Sender: <xms:85nWXRI9BuuUqWhvJE5Y34swdsSa8SNroDN3vVRzJwVy0ETHfebicg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehvddgieduucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucgorfhhihhshhhinhhgqdfkphfpvghtfihorhhkuc
	dlfedttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefv
	rghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinh
	epfhhrvggvuggvshhkthhophdrohhrghdprhgvphhrohguuhgtihgslhgvqdgsuhhilhgu
	shdrohhrghenucfkphepudeliedrvdeggedrudeluddruddtieenucfrrghrrghmpehmrg
	hilhhfrhhomhepthgrnhhukhesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:85nWXX6i1972eNCwpJELI2ULECy1BANPw6_EIGdU0SvVdDjPjehsng>
	<xmx:85nWXTBOKjpOb0k-t19GngylV5ns1pUEBmmtZ8fsnfT8u-gW_S91wg>
	<xmx:85nWXRK73XSagz4P92hz-VugWI1ZH2lzDAn_CZ4w-2qCOcXEaaFOhg>
	<xmx:85nWXfwnMlLA1vYpuqW7QhrSuH5iHAZOyTX05CVy7BeBWeQ0uQEGKg>
Received: from localhost.localdomain (unknown [196.244.191.106])
	by mail.messagingengine.com (Postfix) with ESMTPA id 55C5380061
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:06:42 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 16:06:24 +0200
Message-Id: <20191121140624.36423-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pulseaudio: 12.2 -> 13.0
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
X-List-Received-Date: Thu, 21 Nov 2019 14:06:42 -0000
Content-Transfer-Encoding: 8bit

Release notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/13.0/

Dropped intltool-native from DEPENDS. The .desktop file translations
don't need intltool any more, gettext is enough.

Dropped upstreamed patches:
0001-alsa-Fix-inclusion-of-use-case.h.patch
0001-introduce-a-special-build-flag-to-explicitly-disable.patch

Added a new package: pulseaudio-pa-info. It contains the new pa-info
script.

BlueZ 4 support was removed in this version. That's not visible in the
recipe, but I noticed that the BlueZ 4 modules were still being built in
12.2, since they hadn't been explicitly disabled in the recipe.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../pulseaudio/pulseaudio.inc                 |  27 ++-
 ...001-alsa-Fix-inclusion-of-use-case.h.patch |  46 -----
 ...ial-build-flag-to-explicitly-disable.patch | 161 ------------------
 ...{pulseaudio_12.2.bb => pulseaudio_13.0.bb} |   6 +-
 4 files changed, 26 insertions(+), 214 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_12.2.bb => pulseaudio_13.0.bb} (58%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ec51d8b279..4e32b27087 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -56,7 +56,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
                     file://src/pulsecore/filter/biquad.h;beginline=1;endline=4;md5=6d46d1365206528a20137355924233c1 \
 "
 
-DEPENDS = "libatomic-ops libsndfile1 libtool intltool-native"
+DEPENDS = "libatomic-ops libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0"
 DEPENDS += "speexdsp libxml-parser-perl-native libcap"
@@ -158,12 +158,22 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
 
+PACKAGES =+ "\
+             libpulse \
+             libpulse-mainloop-glib \
+             libpulse-simple \
+             libpulsecommon \
+             libpulsecore \
+             ${PN}-pa-info \
+             ${PN}-server \
+             ${PN}-misc \
+             "
+
 # The console-kit module is included here explicitly so bitbake can map to the
 # RDEPENDS we define for it in this recipe, and thereby ensure that when
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
-PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainloop-glib \
-             pulseaudio-server pulseaudio-misc ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio-module-console-kit', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio-module-console-kit', '', d)}"
 
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
@@ -183,6 +193,7 @@ FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}/cmake"   
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
+FILES_${PN}-pa-info = "${bindir}/pa-info"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
@@ -214,6 +225,16 @@ python populate_packages_prepend() {
     do_split_packages(d, plugindir, r'^lib(.*)\.so$', '${PN}-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
 }
 
+# pa-info is a bash script that collects information about the audio setup.
+# It's primarily useful for attaching an information dump when reporting bugs.
+RDEPENDS_${PN}-pa-info = "\
+                          alsa-utils-amixer \
+                          alsa-utils-aplay \
+                          alsa-utils-scripts \
+                          bash \
+                          ${PN}-server \
+                          "
+
 RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-filter-apply \
     pulseaudio-module-filter-heuristics \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch
deleted file mode 100644
index 15026a2f83..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b89d33bb182c42db5ad3987b0e91b7bf62f421e8 Mon Sep 17 00:00:00 2001
-From: Takashi Iwai <tiwai@suse.de>
-Date: Sun, 21 Apr 2019 11:59:30 +0200
-Subject: [PATCH] alsa: Fix inclusion of use-case.h
-
-The recent change in ALSA upstream stripped -I$include/alsa path from
-pkgconfig.  We already fixed for this change in some places but still
-the code for UCM was overlooked, and this resulted in the unresolved
-symbols in alsa card module. Fix them as well.
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
-Upstream-Status: Backport
----
- configure.ac                | 2 +-
- src/modules/alsa/alsa-ucm.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c004bd70d..b44ed1595 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -826,7 +826,7 @@ AS_IF([test "x$enable_alsa" = "xyes" && test "x$HAVE_ALSA" = "x0"],
- AS_IF([test "x$HAVE_ALSA" = "x1"],
-     [
-         save_CPPFLAGS="$CPPFLAGS"; CPPFLAGS="$CPPFLAGS $ASOUNDLIB_CFLAGS"
--        AC_CHECK_HEADERS([use-case.h], HAVE_ALSA_UCM=1, HAVE_ALSA_UCM=0)
-+        AC_CHECK_HEADERS([alsa/use-case.h], HAVE_ALSA_UCM=1, HAVE_ALSA_UCM=0)
-         CPPFLAGS="$save_CPPFLAGS"
-     ],
-     HAVE_ALSA_UCM=0)
-diff --git a/src/modules/alsa/alsa-ucm.h b/src/modules/alsa/alsa-ucm.h
-index 53abf3f90..c926f3cc3 100644
---- a/src/modules/alsa/alsa-ucm.h
-+++ b/src/modules/alsa/alsa-ucm.h
-@@ -23,7 +23,7 @@
- ***/
- 
- #ifdef HAVE_ALSA_UCM
--#include <use-case.h>
-+#include <alsa/use-case.h>
- #else
- typedef void snd_use_case_mgr_t;
- #endif
--- 
-2.21.0
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch
deleted file mode 100644
index b7e9cd8c5c..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 36feb98e568221e24286615730888d5f6ff323f0 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 7 Dec 2018 15:12:38 +0800
-Subject: [PATCH] introduce a special build flag to explicitly disables running
- from build tree
-
-It is helpful to improve reproducibility build [1] since
-PA_SRCDIR/PA_BUILDDIR contains build path, disable running
-from build tree could drop these macros at precompilation.
-
-[1] https://reproducible-builds.org/
-
-Upstream-Status: Submitted [pulseaudio-discuss@lists.freedesktop.org]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Acked-by: Tanu Kaskinen <tanuk@iki.fi>
----
- configure.ac                             | 10 ++++++++++
- src/daemon/daemon-conf.c                 |  4 +++-
- src/daemon/main.c                        |  6 ++++++
- src/modules/alsa/alsa-mixer.c            |  4 ++++
- src/modules/gconf/module-gconf.c         |  2 +-
- src/modules/gsettings/module-gsettings.c |  2 +-
- src/pulsecore/core-util.c                |  4 +++-
- 7 files changed, 28 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c9c414f..8b345ef 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -998,6 +998,16 @@ AS_IF([test "x$enable_asyncns" = "xyes" && test "x$HAVE_LIBASYNCNS" = "x0"],
- AM_CONDITIONAL([HAVE_LIBASYNCNS], [test "x$HAVE_LIBASYNCNS" = x1])
- AS_IF([test "x$HAVE_LIBASYNCNS" = "x1"], AC_DEFINE([HAVE_LIBASYNCNS], 1, [Have libasyncns?]))
- 
-+#### Running from build tree (optional) ####
-+
-+AC_ARG_ENABLE([running-from-build-tree],
-+    AS_HELP_STRING([--disable-running-from-build-tree],[Disable running from build tree]))
-+
-+AS_IF([test "x$enable_running_from_build_tree" != "xno"],
-+      AC_DEFINE([HAVE_RUNNING_FROM_BUILD_TREE], 1, [Have running from build tree]))
-+
-+AC_SUBST(HAVE_RUNNING_FROM_BUILD_TREE)
-+
- #### TCP wrappers (optional) ####
- 
- AC_ARG_ENABLE([tcpwrap],
-diff --git a/src/daemon/daemon-conf.c b/src/daemon/daemon-conf.c
-index 9883126..f01eff4 100644
---- a/src/daemon/daemon-conf.c
-+++ b/src/daemon/daemon-conf.c
-@@ -155,12 +155,14 @@ pa_daemon_conf *pa_daemon_conf_new(void) {
-     c->dl_search_path = pa_sprintf_malloc("%s" PA_PATH_SEP "lib" PA_PATH_SEP "pulse-%d.%d" PA_PATH_SEP "modules",
-                                           pa_win32_get_toplevel(NULL), PA_MAJOR, PA_MINOR);
- #else
-+#ifdef HAVE_RUNNING_FROM_BUILD_TREE
-     if (pa_run_from_build_tree()) {
-         pa_log_notice("Detected that we are run from the build tree, fixing search path.");
-         c->dl_search_path = pa_xstrdup(PA_BUILDDIR);
-     } else
--        c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
- #endif
-+        c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
-+#endif //Endof #ifdef OS_IS_WIN32
- 
-     return c;
- }
-diff --git a/src/daemon/main.c b/src/daemon/main.c
-index c80fa94..1e00388 100644
---- a/src/daemon/main.c
-+++ b/src/daemon/main.c
-@@ -932,6 +932,12 @@ int main(int argc, char *argv[]) {
- 
-     pa_log_debug("Running in VM: %s", pa_yes_no(pa_running_in_vm()));
- 
-+#ifdef HAVE_RUNNING_FROM_BUILD_TREE
-+    pa_log_debug("Running from build tree: %s", pa_yes_no(pa_run_from_build_tree()));
-+#else
-+    pa_log_debug("Running from build tree: no");
-+#endif
-+
- #ifdef __OPTIMIZE__
-     pa_log_debug("Optimized build: yes");
- #else
-diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
-index a524d6d..670f646 100644
---- a/src/modules/alsa/alsa-mixer.c
-+++ b/src/modules/alsa/alsa-mixer.c
-@@ -2571,9 +2571,11 @@ static int path_verify(pa_alsa_path *p) {
- }
- 
- static const char *get_default_paths_dir(void) {
-+#ifdef HAVE_RUNNING_FROM_BUILD_TREE
-     if (pa_run_from_build_tree())
-         return PA_SRCDIR "/modules/alsa/mixer/paths/";
-     else
-+#endif
-         return PA_ALSA_PATHS_DIR;
- }
- 
-@@ -4455,7 +4457,9 @@ pa_alsa_profile_set* pa_alsa_profile_set_new(const char *fname, const pa_channel
-         fname = "default.conf";
- 
-     fn = pa_maybe_prefix_path(fname,
-+#ifdef HAVE_RUNNING_FROM_BUILD_TREE
-                               pa_run_from_build_tree() ? PA_SRCDIR "/modules/alsa/mixer/profile-sets/" :
-+#endif
-                               PA_ALSA_PROFILE_SETS_DIR);
- 
-     r = pa_config_parse(fn, NULL, items, NULL, false, ps);
-diff --git a/src/modules/gconf/module-gconf.c b/src/modules/gconf/module-gconf.c
-index c0f4dde..76a1f19 100644
---- a/src/modules/gconf/module-gconf.c
-+++ b/src/modules/gconf/module-gconf.c
-@@ -51,7 +51,7 @@ int pa__init(pa_module*m) {
-     u->buf_fill = 0;
- 
-     if ((u->fd = pa_start_child_for_read(
--#if defined(__linux__) && !defined(__OPTIMIZE__)
-+#if defined(__linux__) && defined(HAVE_RUNNING_FROM_BUILD_TREE)
-                               pa_run_from_build_tree() ? PA_BUILDDIR "/gconf-helper" :
- #endif
-                  PA_GCONF_HELPER, NULL, &u->pid)) < 0)
-diff --git a/src/modules/gsettings/module-gsettings.c b/src/modules/gsettings/module-gsettings.c
-index 330eca1..209c857 100644
---- a/src/modules/gsettings/module-gsettings.c
-+++ b/src/modules/gsettings/module-gsettings.c
-@@ -51,7 +51,7 @@ int pa__init(pa_module*m) {
-     u->buf_fill = 0;
- 
-     if ((u->fd = pa_start_child_for_read(
--#if defined(__linux__) && !defined(__OPTIMIZE__)
-+#if defined(__linux__) && defined(HAVE_RUNNING_FROM_BUILD_TREE)
-                               pa_run_from_build_tree() ? PA_BUILDDIR "/gsettings-helper" :
- #endif
-                  PA_GSETTINGS_HELPER, NULL, &u->pid)) < 0)
-diff --git a/src/pulsecore/core-util.c b/src/pulsecore/core-util.c
-index 64e9f21..f85dd20 100644
---- a/src/pulsecore/core-util.c
-+++ b/src/pulsecore/core-util.c
-@@ -3436,15 +3436,17 @@ void pa_reset_personality(void) {
- }
- 
- bool pa_run_from_build_tree(void) {
--    char *rp;
-     static bool b = false;
- 
-+#ifdef HAVE_RUNNING_FROM_BUILD_TREE
-+    char *rp;
-     PA_ONCE_BEGIN {
-         if ((rp = pa_readlink("/proc/self/exe"))) {
-             b = pa_startswith(rp, PA_BUILDDIR);
-             pa_xfree(rp);
-         }
-     } PA_ONCE_END;
-+#endif
- 
-     return b;
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
similarity index 58%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
index 88b4975a66..7f8ebc2090 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
@@ -2,13 +2,11 @@ require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
-           file://0001-introduce-a-special-build-flag-to-explicitly-disable.patch \
-           file://0001-alsa-Fix-inclusion-of-use-case.h.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://volatiles.04_pulse \
            "
-SRC_URI[md5sum] = "c42f1f1465e8df9859d023dc184734bf"
-SRC_URI[sha256sum] = "809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055"
+SRC_URI[md5sum] = "e41d606f90254ed45c90520faf83d95c"
+SRC_URI[sha256sum] = "961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057"
 
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
-- 
2.20.1


