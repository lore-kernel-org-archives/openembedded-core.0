Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA8860D25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 19:46:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so4107200wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 11:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=u5E5bU6mJb5kdLWo+VUQWTyP8IyRr3cys9Eq4OFEXa8=;
	b=pyfXuxHqFhGJkFadFsTOmaRzIOIP4TxylViXCOCdYWTe7/Y1j0wzr04UG84wMAo7HV
	y514Yew1/pf2CJq9ioRY1at2zM9vceU6A211bkUypVo+ajIapaAm3XPQ9yKT6A6PPRHP
	5/aCriiNLSGc5CmL8o5HCCmOqQh7nS1rJsrulxOJnbW9WofMzIhuEJQ/aGOr5gWqzvpY
	Qniqo66l+o6ov8PdiY1ASCcGlRPeldMcmaDZze7ARZT42kZu6Nw8fxUyE+R1+dBmPebm
	Fu1641JeEUGdPzWYaUdHidvF4m0qkO8C9ZV1HfOL2CrPXALxNAF5hEvV5z9jYwacbh0Y
	mSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u5E5bU6mJb5kdLWo+VUQWTyP8IyRr3cys9Eq4OFEXa8=;
	b=oq9K3pNyVAa8bMUkLZGb9+wJsK1QcU8wZChKoF7qCnSTVTBc8zXGJrDamIAwLTqrxv
	2sGtZidNOT8Qtr2Cb3tqhP6URAhuMEJwinMtuj9r2q/84WEFoEwhHMtD2RK8R1l1kCMh
	T+Z4F+6mIxfPIp+ey4Lbhn8bcxz+6yG2dkQmAP+Vtco8+Y8M8HEM5B1ywbQtmjz8KvvB
	e7aAp5fhNL1IGRi91tX2h6gwNQNO7WgxbotKtq5Vvzv9KONTr66fHnfUJH985fZ+m0PH
	CtF9yw87tSk9qbUTsBv9UoQ2YVC1c/gT0BANDgLNer0i2IVuMVN+OsXFPl82Dy6zjpsC
	znIw==
X-Gm-Message-State: APjAAAXFQiCQ0zzcvFQc3OF4PldwxGldvR2+taHnNZI812wdp45NAgw4
	Nn5rfRRQDoGR1hZhvI8vO0SUP6Li
X-Google-Smtp-Source: APXvYqxsXoWpdxPxZlSWwWk3Y8b+pEo0YVt/FcfiY88qON24vmekfCDWGIwi9galjXL0wnYtYjfrAQ==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr6237489wmc.185.1581104809678; 
	Fri, 07 Feb 2020 11:46:49 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69])
	by smtp.gmail.com with ESMTPSA id w8sm4667770wmm.0.2020.02.07.11.46.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 11:46:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 20:45:59 +0100
Message-Id: <20200207194559.527-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207194559.527-1-alex.kanavin@gmail.com>
References: <20200207194559.527-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] chkconfig: remove the recipe
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
X-List-Received-Date: Fri, 07 Feb 2020 19:46:50 -0000
Content-Transfer-Encoding: 8bit

chkconfig is one of the options for virtual/update-alternatives,
however opkg-utils have been used as the default for a very long time,
while chkconfig isn't anymore tested in any way, and is stuck
at a very old version due to newer versions requiring selinux.

[YOCTO #11264]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 -
 .../packagegroups/packagegroup-self-hosted.bb |  1 -
 .../chkconfig-alternatives-native_1.3.59.bb   | 44 ------------
 .../chkconfig/chkconfig/replace_caddr_t.patch | 33 ---------
 .../chkconfig/chkconfig_1.3.58.bb             | 71 -------------------
 5 files changed, 151 deletions(-)
 delete mode 100644 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
 delete mode 100644 meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
 delete mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a80e85a2f6..c68e9edf63 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -94,8 +94,6 @@ RECIPE_MAINTAINER_pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-chkconfig = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-chkconfig-alternatives-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-clutter-1.0 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Ross Burton <ross.burton@intel.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index ea6d567301..9a70b189a4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -108,7 +108,6 @@ RDEPENDS_packagegroup-self-hosted-debug = " \
 
 RDEPENDS_packagegroup-self-hosted-extended = "\
     bzip2 \
-    chkconfig \
     chrpath \
     cpio \
     curl \
diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
deleted file mode 100644
index 87fa8eb605..0000000000
--- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-require recipes-extended/chkconfig/chkconfig_1.3.58.bb
-
-SUMMARY = "${SUMMARY_chkconfig-alternatives}"
-DESCRIPTION = "${DESCRIPTION_chkconfig-alternatives}"
-DEPENDS = ""
-PROVIDES += "virtual/update-alternatives-native"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-# The sysroot branch is 1.3.59 + some git commits from master + --sysroot
-# support for alternatives.
-SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
-S = "${WORKDIR}/git"
-UPSTREAM_CHECK_GITTAGREGEX = "chkconfig-(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
-PV = "1.3.59+${SRCPV}"
-
-inherit native
-
-# We want our native recipes to build using the target paths rather than paths
-# into the sysroot, as we may use them to construct the rootfs. As such, we
-# only adjust the paths to match the metadata for the target, not native.
-obey_variables () {
-	sed -i 's,ALTERNATIVES_ROOT,OPKG_OFFLINE_ROOT,' ${S}/alternatives.c
-}
-
-do_compile () {
-	oe_runmake alternatives
-}
-
-do_install () {
-	install -d ${D}${sysconfdir}/alternatives \
-	           ${D}${localstatedir}/lib/alternatives
-
-	install -D -m 0755 alternatives ${D}${bindir}/alternatives
-	install -D -m 0644 alternatives.8 ${D}${mandir}/man8/alternatives.8
-
-	ln -s alternatives ${D}${bindir}/update-alternatives
-	ln -s alternatives.8 ${D}${mandir}/man8/update-alternatives.8
-}
-
-do_install_append_linuxstdbase() {
-	rm -rf ${D}${libdir}/lsb
-}
diff --git a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
deleted file mode 100644
index 96d1938791..0000000000
--- a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-caddr_t is a legacy BSD type which was rejected by the POSIX standard.
-Use void * instead.
-
-sys/unitstd.h is not needed and moreover its not available on all C library
-implementations e.g. musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: chkconfig-1.3.58/alternatives.c
-===================================================================
---- chkconfig-1.3.58.orig/alternatives.c
-+++ chkconfig-1.3.58/alternatives.c
-@@ -22,7 +22,6 @@
- #include <stdio.h>
- #include <string.h>
- #include <sys/stat.h>
--#include <sys/unistd.h>
- #include <unistd.h>
- 
- #define	FLAGS_TEST	(1 << 0)
-Index: chkconfig-1.3.58/leveldb.c
-===================================================================
---- chkconfig-1.3.58.orig/leveldb.c
-+++ chkconfig-1.3.58/leveldb.c
-@@ -442,7 +442,7 @@ int parseServiceInfo(int fd, char * name
-     fstat(fd, &sb);
- 
-     bufstart = mmap(NULL, sb.st_size, PROT_READ, MAP_SHARED, fd, 0);
--    if (bufstart == ((caddr_t) -1)) {
-+    if (bufstart == ((void*) -1)) {
- 	close(fd);
- 	return -1;
-     }
diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
deleted file mode 100644
index d21dd69704..0000000000
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
-DESCRIPTION = "Chkconfig is a basic system utility.  It updates and queries runlevel \
-information for system services.  Chkconfig manipulates the numerous \
-symbolic links in /etc/rc.d, to relieve system administrators of some \
-of the drudgery of manually editing the symbolic links."
-
-RECIPE_NO_UPDATE_REASON = "Version 1.5 requires selinux"
-
-HOMEPAGE = "https://github.com/fedora-sysv"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
-
-DEPENDS = "libnewt popt"
-PROVIDES += "virtual/update-alternatives"
-
-PR = "r7"
-
-S = "${WORKDIR}/${BPN}-${BPN}-${PV}"
-
-SRC_URI = "git://github.com/fedora-sysv/chkconfig.git \
-           file://replace_caddr_t.patch \
-          "
-
-SRCREV = "3e0b3909ff6328d232b27b9c32f1a9309c6cd0a4"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git"
-
-inherit gettext
-
-# Makefile uses RPM_OPT_FLAGS to construct CFLAGS
-#
-EXTRA_OEMAKE = "\
-    'RPM_OPT_FLAGS=${CFLAGS}' \
-    'LDFLAGS=${LDFLAGS}' \
-    'BINDIR=${base_sbindir}' \
-    'SBINDIR=${sbindir}' \
-    'MANDIR=${mandir}' \
-    'ALTDIR=${localstatedir}/lib/alternatives' \
-    'ALTDATADIR=${sysconfdir}/alternatives' \
-"
-
-do_unpack[postfuncs] += "obey_variables"
-do_unpack[vardeps] += "obey_variables"
-obey_variables () {
-	sed -i -e 's,/etc,${sysconfdir},; s,/lib/systemd,${base_libdir}/systemd,' ${S}/leveldb.h
-	sed -i -e 's,/etc/alternatives,${sysconfdir}/alternatives,' \
-	       -e 's,/var/lib/alternatives,${localstatedir}/lib/alternatives,' \
-	       -e 's,/usr/share/locale,${datadir}/locale,' ${S}/alternatives.c
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' \
-		'BINDIR=${sbindir}' install
-	install -d ${D}${sysconfdir}/chkconfig.d
-}
-
-PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
-SUMMARY_${PN}-alternatives = "Maintain symbolic links determining default commands"
-DESCRIPTION_${PN}-alternatives = "alternatives creates, removes, maintains and displays \
-information about the symbolic links comprising the alternatives system."
-SUMMARY_${PN}-alternatives-doc = "${SUMMARY_${PN}-alternatives} - Documentation files"
-DESCRIPTION_${PN}-alternatives-doc = "${DESCRIPTION_${PN}-alternatives}  \
-This package contains documentation."
-RPROVIDES_${PN}-alternatives += "update-alternatives"
-RCONFLICTS_${PN}-alternatives = "update-alternatives-opkg update-alternatives-dpkg"
-FILES_${PN}-alternatives = "${sbindir}/alternatives ${sbindir}/update-alternatives \
-			    ${sysconfdir}/alternatives ${localstatedir}/lib/alternatives"
-FILES_${PN}-alternatives-doc = "${mandir}/man8/alternatives.8 \
-                                ${mandir}/man8/update-alternatives.8"
-- 
2.25.0


