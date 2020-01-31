Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E45D60631
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 20:21:42 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so9355597wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 12:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OCALxMFDKXEktVseIui2xQlL/JneTsoTJWcqUbwX36U=;
	b=Ch3aXYCJ6AA3uDR3CQYL+qTFCZKulEOKXwmWrlCyRb2CVh+sYGzT6vul3QA9DFYIDQ
	tV/LPhIBHYacPn/bD7+Fw74fY6ZPM09XLX6ioEnigtmeyJXBiH937hFpml52BtFYZ/wq
	9khixlUbTJ9LpVoeSeR1FzfpW4cBwsKlvFgK9U8q2ydC0aLFtVwRuJ0RtD+vthTKrm14
	huOGArmzsuPQ+rWJSw/TsfIKte4Bc5qP0FpfYVm6onYwX9vDcGvqd3jApM8PbqxmW9ef
	jMx0JxTEoa7PMZQg5GTojwR7yPVUTGyY7WLftUJcj0BWwD/5a5xcKVCkeiADWQjV+Nas
	5Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OCALxMFDKXEktVseIui2xQlL/JneTsoTJWcqUbwX36U=;
	b=sZsnFCQgf679TymVtLudb69uGaCSb9lSJPh25jIRiI5Wr1jpQzGYoAjU7d/Zy0vSjN
	ULYOl4tR9wOw34ejyhK//KGjr8m0H4Q9jCwXxbb6HbsCYgGs7hp1Va0PsqUABzidZf3C
	RcTkFxTXZZtioVQXQJyv4GC2eBWj7DkiYkUmzuw4HoPqPLDbCd1lJcNTMOfpdZo5SDt2
	AgyfOZMF2XUGz/sB4yxAJR7k6DOV1+1yg/9K4LGCbMzlHm7Pk5fdsPsqznNLBxAFKlpk
	y9e29tpTZV4k4f8PmL5mOZsPnzrwg+gZcmXNA13WyCAs7UH9pI+uUnyrl/q0X91A5PAd
	rQpg==
X-Gm-Message-State: APjAAAW8xAPJj13e4WTs23sHxIed2UrGYgySdr10TzR+T4nUv205GxZ6
	g5u6aJ2uqxqJEio45DTA+lmXJGHv
X-Google-Smtp-Source: APXvYqwWxru1YpwEXi6U807EYa5HPU0IBzRlZ9VvDtMSC97M11dEJbt9ViAVxelywN0/+hASs8uCFA==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr14271270wme.6.1580502102437; 
	Fri, 31 Jan 2020 12:21:42 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	q3sm11855307wmj.38.2020.01.31.12.21.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jan 2020 12:21:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 21:21:10 +0100
Message-Id: <20200131202110.4197-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] chkconfig: remove the recipe
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
X-List-Received-Date: Fri, 31 Jan 2020 20:21:42 -0000
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
index a80e85a2f60..c68e9edf634 100644
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
index ea6d567301c..9a70b189a43 100644
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
index 87fa8eb6055..00000000000
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
index 96d19387910..00000000000
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
index d21dd697042..00000000000
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


