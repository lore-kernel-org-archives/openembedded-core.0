Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8857.1792858237691778599
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 09:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U06H/T0G;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3550c917fd3so2695696eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858237; x=1793463037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xERjdkOYNTI5Br/mLs2+Ta1x9dLja4e1Xuk9dBnCu4=;
        b=U06H/T0GzZEuQdhlj5gtAbS7rR2ih+O22nSZhtqVvX0T4VX0W6XMTTNpiTZGQJBiln
         OeUF4oHPOzwn7paLwdf42plYiSbGyJtB5DEwzAJotCeT8AYdrp8y/peJ+Re8b34APzCp
         +VlSj1NBxDQ1jAuMuFxXaIh3XNHe07NmSgWd4zEtcak2Q0vhxuAsd6kR64PvdsVAO0WZ
         43bf+ILLTJ8l7m6+qp2XQ4KTtJZJd5/O2dExTIpiE7YGSDkUPgFb4OFEMbKxGJmVOkIs
         ECUhwDw8KqhwBrob1auXNe7R7naJpFb1PQj7njmK7pPx41ueQ+F4mi/cvxBMXi4NtPfq
         Jdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858237; x=1793463037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xERjdkOYNTI5Br/mLs2+Ta1x9dLja4e1Xuk9dBnCu4=;
        b=uGlScqXn+gsEd2qKxosCGMYm/ZCfEKnbE+qabq25AfhHhWb7bS96yjDQVopGETqfPm
         CK8ILB+w7J3nIDck4cqbZRXJbeDOXCaZuIPHHJg/Q1KWMOzF/efEIr8NyUnjWOTYNxto
         Ti7pogaTmkmPWZf/DkBZjsoivptzA5mXPIGJq1D1CJMSHONndG8jagkHR5XTS3DsZQmh
         8DOf/1Vh4wbp0pgG2eB+j/f38oXXRsYyQ7Fcg9IZhXYi8qlEg2mbICVMO+ySZzQhGEIC
         KMFaoIMJWysgCFVfyMYu8oKiCJGvtAJ54YThU9UwR9/vAX1BK/YjmRt39axHYLa7sAbg
         oTzA==
X-Gm-Message-State: AFq9FYJZfF9/NRw7Gyt78dQliSzdiURjrT3kRfHReN4QnPSKbEUyzHND
	KMM1wQT3vdv9iDfSM6oDnI85Oc0UXWTOeVR2IVPkcnNf1n2BmnYUR3COgg/kTH36+OQ=
X-Gm-Gg: AYBFou3Ez5L1cbQN03uF+a24ssnpdnNxDBjOE++TKWXeb3qdWaZ7w//P/AMzMWaV5nP
	Lne9ruImaPZv18fQWMuh40dpzoqbNnsaYcy9smBMWAypTxf8XpR3KaTKPYsRoHtwIC4mdxmdbY2
	sN+kAQcHBIvOFgJXWKH7je8jZbyMroECJdEB9ly2ZNOOxn48MxDg8dtieLH1HysHG7G2BgWC0TV
	yqYnfRWMP2l7Sr09i+ZI+AkYKp/7+HUOIiJ8Kuid46NXje3KLjNVOEnOJF30haUwh9q3PigY5eh
	tT8JqyTCLhJpD/c4NTly4GPALnTM1aU9agCeSBkTzPFDUrKJCPp9aojweiVSXbepTYoOpKEU/+N
	avIe32dD44PoaduocD+LtNUq/ltKy73e57mD2v3Fc+JAn/uN1qXPIxOiWBmtQ9B39mlHMeiAWiL
	srk8blCou93Ki6wcN8BYQhAUBLATtnHD69VHfRFUhXqhYpM7D88SlAW1LiGlD9Nti7g7chZmXVH
	cAtT0uz1bHAJx9M67sLDtxjVo6TsAs33TGr4mocu1KSYHLr5N4PM1VidrSYak9VOfOhftLMcN13
	Hyw290UKEeH2wCK41WYa+98k0Nkgv48apHO/yerbTXlcVgTr7g62qfnxq2VXTFKwGQDFgHj3cRG
	UfSy2DW+n3Mam4YnHR3GzxHWcsiYoxPoOBeYkpNXeEfwvmNJcW9EAy3S0IkOGdQZP5dIR7FeLeA
	waIlC53y3orc9zLFjaur9uSJYPymtOe26WN2PbFyZBt4Y9+A7Jrlph6Crtp+ETz2RA3aI6W4/Ce
	pDeiFat4DlPg2gTIrLxRw==
X-Received: by 2002:a05:693c:4195:20b0:369:535f:4d12 with SMTP id 5a478bee46e88-369e833625amr4050825eec.3.1792858236656;
        Sat, 24 Oct 2026 09:10:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm10400190eec.28.2026.10.24.09.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:10:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/3] consolekit: Upgrade to ConsoleKit2 2.0.0
Date: Sat, 24 Oct 2026 09:10:31 -0700
Message-ID: <20261024161033.4140130-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 16:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248594
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

ConsoleKit is unmaintained since 0.4.6 (2011); ConsoleKit2 is the
maintained fork used by FreeBSD and others. Keep the recipe
name so existing consumers continue to work.

* Use git fetcher, upstream does not publish release tarballs
* Drop add-polkit-configure-argument.patch, polkit support is now
  selectable via --enable/--disable-polkit
* Refresh sepbuildfix.patch
* X11 is now optional, so drop REQUIRED_DISTRO_FEATURES = "x11" and
  add an x11 PACKAGECONFIG
* Add explicit PACKAGECONFIGs for automagic dependencies (selinux,
  udev/libdrm, libevdev, udev-acl) and disable cgmanager
* AC_CONFIG_AUX_DIR is autotools/, point AUTOTOOLS_AUXDIR there so
  config.rpath is found
* Pre-seed AC_CHECK_FILE result for /sys/class/tty/tty0/active
* Drop -Wno-error=incompatible-pointer-types, no longer needed

Note that 2.0.0 changes session and seat IDs on D-Bus from object
paths to bare IDs, which needs a matching fix in polkit's ConsoleKit
backend.

https://github.com/ConsoleKit2/ConsoleKit2/releases/tag/2.0.0

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../add-polkit-configure-argument.patch       | 33 ----------
 .../consolekit/consolekit/sepbuildfix.patch   | 18 ++---
 .../consolekit/consolekit_0.4.6.bb            | 53 ---------------
 .../consolekit/consolekit_2.0.0.bb            | 66 +++++++++++++++++++
 4 files changed, 76 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch
 delete mode 100644 meta/recipes-support/consolekit/consolekit_0.4.6.bb
 create mode 100644 meta/recipes-support/consolekit/consolekit_2.0.0.bb

diff --git a/meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch b/meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch
deleted file mode 100644
index ad879d466b..0000000000
--- a/meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
---- ConsoleKit-0.4.6.orig/configure.ac
-+++ ConsoleKit-0.4.6/configure.ac
-@@ -56,10 +56,24 @@ PKG_CHECK_MODULES(CONSOLE_KIT,
-   gthread-2.0 >= $GLIB_REQUIRED_VERSION
- )
-
--PKG_CHECK_MODULES(POLKIT,
--  polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
--  have_polkit=yes,
--  have_polkit=no)
-+AC_ARG_WITH([polkit],
-+  [AS_HELP_STRING([--with-polkit],
-+    [support PolicyKit @<:@default=check@:>@])],
-+  [],
-+  [with_polkit=check])
-+
-+AS_IF([test "x$with_polkit" != xno],
-+  [PKG_CHECK_MODULES(POLKIT,
-+     polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
-+     have_polkit=yes,
-+     [if test "x$with_polkit" != xcheck; then
-+       AC_MSG_FAILURE(
-+         [--with-polkit was given, but test for polkit failed])
-+      else
-+        have_polkit=no
-+      fi
-+     ])])
-+
- if test "x$have_polkit" = "xyes" ; then
-        AC_DEFINE(HAVE_POLKIT, [], [Define if we have polkit])
- fi
diff --git a/meta/recipes-support/consolekit/consolekit/sepbuildfix.patch b/meta/recipes-support/consolekit/consolekit/sepbuildfix.patch
index f2f9b9c682..21b1eaad8a 100644
--- a/meta/recipes-support/consolekit/consolekit/sepbuildfix.patch
+++ b/meta/recipes-support/consolekit/consolekit/sepbuildfix.patch
@@ -1,16 +1,18 @@
-Fix builds in the case of seprate source from the build directory.
+Fix builds in the case of separate source from the build directory.
 
 RP 2013/4/17
 
 Upstream-Status: Pending
-
-Index: pam-ck-connector/Makefile.am
-===================================================================
---- consolekit/pam-ck-connector.orig/Makefile.am	2010-09-03 13:54:31.000000000 +0000
-+++ consolekit/pam-ck-connector/Makefile.am	2013-04-17 09:06:49.093524918 +0000
-@@ -4,7 +4,7 @@
+---
+ pam-ck-connector/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+diff --git a/pam-ck-connector/Makefile.am b/pam-ck-connector/Makefile.am
+index 7778d16..9b960a7 100644
+--- a/pam-ck-connector/Makefile.am
++++ b/pam-ck-connector/Makefile.am
+@@ -4,7 +4,7 @@ if ENABLE_PAM_MODULE
  
- INCLUDES = 					\
+ AM_CFLAGS = 					\
  	$(LIBDBUS_CFLAGS)			\
 -	-I$(top_builddir)/libck-connector	\
 +	-I$(top_srcdir)/libck-connector	\
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
deleted file mode 100644
index acef3483bb..0000000000
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Framework for defining and tracking users, login sessions, and seats"
-DESCRIPTION = "It provides a mechanism for software to react to changes \
-of any of these items or of any of the metadata associated with them."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ConsoleKit"
-BUGTRACKER = "https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
-
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
-
-DEPENDS = "glib-2.0 glib-2.0-native dbus dbus-glib virtual/libx11"
-RDEPENDS:${PN} += "base-files"
-
-inherit autotools pkgconfig features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
-           file://sepbuildfix.patch \
-           file://add-polkit-configure-argument.patch \
-"
-
-SRC_URI[sha256sum] = "b41d17e06f80059589fbeefe96ad07bcc564c49e65516da1caf975146475565c"
-
-S = "${UNPACKDIR}/ConsoleKit-${PV}"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd polkit', d)}"
-
-PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
-PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/,--with-systemdsystemunitdir="
-
-# Fails to build with GCC14 with incompatible pointer error warning being treated as error
-CFLAGS += "-Wno-error=incompatible-pointer-types"
-
-FILES:${PN} += "${exec_prefix}/lib/ConsoleKit \
-                ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
-                ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
-
-PACKAGES =+ "pam-plugin-ck-connector"
-FILES:pam-plugin-ck-connector += "${base_libdir}/security/*.so"
-RDEPENDS:pam-plugin-ck-connector += "${PN}"
-
-do_install:append() {
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -d ${D}${sysconfdir}/tmpfiles.d
-		echo "d ${localstatedir}/log/ConsoleKit - - - -" \
-			> ${D}${sysconfdir}/tmpfiles.d/consolekit.conf
-	fi
-
-	# Remove /var/ directories as the daemon creates them as required
-	rm -rf ${D}${localstatedir}
-}
diff --git a/meta/recipes-support/consolekit/consolekit_2.0.0.bb b/meta/recipes-support/consolekit/consolekit_2.0.0.bb
new file mode 100644
index 0000000000..05207f9db3
--- /dev/null
+++ b/meta/recipes-support/consolekit/consolekit_2.0.0.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Framework for defining and tracking users, login sessions, and seats"
+DESCRIPTION = "ConsoleKit2 provides a mechanism for software to react to changes \
+of any of these items or of any of the metadata associated with them."
+HOMEPAGE = "https://github.com/ConsoleKit2/ConsoleKit2"
+BUGTRACKER = "https://github.com/ConsoleKit2/ConsoleKit2/issues"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://src/main.c;endline=19;md5=c343c20c262ac4b97f0ab08665f3058d"
+
+DEPENDS = "glib-2.0 glib-2.0-native dbus zlib"
+RDEPENDS:${PN} += "base-files"
+
+inherit autotools pkgconfig gettext gobject-introspection gtk-doc
+
+SRC_URI = "git://github.com/ConsoleKit2/ConsoleKit2.git;protocol=https;branch=master;tag=${PV} \
+           file://sepbuildfix.patch \
+"
+SRCREV = "cbaab28b42a9126448edd093a68e1f8ea6930982"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd polkit selinux x11', d)} udev"
+
+PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
+PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/,--without-systemdsystemunitdir"
+PACKAGECONFIG[selinux] = "--enable-libselinux,--disable-libselinux,libselinux"
+# udev backend for device management with a session controller needs both libudev and libdrm
+PACKAGECONFIG[udev] = "--enable-libudev --enable-libdrm,--disable-libudev --disable-libdrm,udev libdrm"
+PACKAGECONFIG[evdev] = "--enable-libevdev,--disable-libevdev,libevdev"
+PACKAGECONFIG[udev-acl] = "--enable-udev-acl,--disable-udev-acl,udev acl"
+PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11"
+
+AUTOTOOLS_AUXDIR = "${S}/autotools"
+
+do_configure:prepend() {
+	mkdir -p ${AUTOTOOLS_AUXDIR}
+}
+
+# AC_CHECK_FILE cannot be used when cross compiling, all supported kernels
+# provide VT change signalling via sysfs
+CACHED_CONFIGUREVARS += "ac_cv_file__sys_class_tty_tty0_active=yes"
+
+EXTRA_OECONF = "--disable-libcgmanager \
+                --disable-docbook-docs \
+                --disable-tests \
+"
+
+FILES:${PN} += "${exec_prefix}/lib/ConsoleKit \
+                ${libdir}/ConsoleKit ${systemd_unitdir} ${base_libdir} \
+                ${datadir}/dbus-1 ${datadir}/polkit-1 \
+                ${sysconfdir}/X11/xinit/xinitrc.d"
+
+PACKAGES =+ "pam-plugin-ck-connector"
+FILES:pam-plugin-ck-connector += "${base_libdir}/security/*.so"
+RDEPENDS:pam-plugin-ck-connector += "${PN}"
+
+do_install:append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d ${localstatedir}/log/ConsoleKit - - - -" \
+			> ${D}${sysconfdir}/tmpfiles.d/consolekit.conf
+	fi
+
+	# Remove /var/ directories as the daemon creates them as required
+	rm -rf ${D}${localstatedir}
+}
