Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id BCD1474CEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:48:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q10-v6so794159wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vBdmr5RR0Deju/+ktDP+cqZJqkz8fsPuBXkLLsWhWoM=;
	b=y+pCUi5IHJ2PLMCW5AACynj6WDJ6908vac58DvKDZPFq01im79ziJjsced/pglqic3
	3X5soLhGguz+SazNGdgDHEy3iEGG8nBjfZxRfax76zr9WeLuEGmr4vT2rz8NA5apM7rY
	uFAxb1CNhSi6p8cgl/tAM4nWv4lUdd3f3jsslDQBV2VR2RHwLWLCz07eVmGtVRZnffWp
	8x4NfC7vG6GbU9CPNpZmwLnRvKOqkxqNiaZ+CggrV63HtrlEdLGSp4LgLmNtfrhYnaCa
	wyS/cmHWMxfRokDdMaUVfa8icyGj8F7kflA04fycZ6AvsYCrJQrxNAg9AZTEKq3zkQZJ
	hy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vBdmr5RR0Deju/+ktDP+cqZJqkz8fsPuBXkLLsWhWoM=;
	b=lnAWoWF8KrrM+48UHExg45v1OUYgteUhsDwnDtf72cG0zwWEdIO3ryHaI0HoUcmy1O
	kkikEFdFt3AOHtupxuCmT9bzHZKs8bDaVVR9P1awstcJM8VjvQGQgU4XSJiF7V17kqOu
	TIS8DUB2QwF0yvuzp8Lz5QGlY1w+gyHOzdiZiYfEH59O1Z9K6DM7ZYa2nibfK4T8GjkM
	NhXo4zKVjvkZvLvlAs06iDzGksqRjc/XFMGe3F4W0Pvjfx8nuPdc7RneMt+v2TL2lImw
	isBq5Sg6FhQ1ulR5y0ZJSPtagoIW1pPUw1E+Xja7bnX8GunS0R6cLZ+lDFyF3iAHSMp6
	fYWA==
X-Gm-Message-State: AOUpUlGxrDWJQIML7mvEqxvApBk7n0zL3SCpk4/k1IdTNiuHgfbv88lt
	aFc6AbxRIjyj6OlE5Gn9dPr1aTJJ/gw=
X-Google-Smtp-Source: AAOMgpcLj/xIugg+2pt0HuFyrTeFGJ1hgxKaB1SBFDGXHAddUoTCTpiFfobwUhJBs4m5ULMrp2tMtw==
X-Received: by 2002:adf:8ec2:: with SMTP id
	q60-v6mr8189443wrb.275.1532353731095; 
	Mon, 23 Jul 2018 06:48:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g75-v6sm9911969wmd.38.2018.07.23.06.48.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:48:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 14:48:48 +0100
Message-Id: <20180723134848.3698-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH V2] iputils: upgrade to s20190629
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
X-List-Received-Date: Mon, 23 Jul 2018 13:48:51 -0000

License-Update: change license checksums to check the License files themselves (BSD3 and GPL2),
and the tool-to-license file (LICENSE).  Changes to LICENSE will now be
detected.

Drop upstreamed patch.

Update libidn build-dependency to libidn2.

Patch in an install target and use that to install binaries, to avoid upstream
adding binaries that we don't ship.  Also ship all binaries that are installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../iputils/files/0001-Fix-build-on-MUSL.patch     | 95 ----------------------
 .../recipes-extended/iputils/iputils/install.patch | 26 ++++++
 meta/recipes-extended/iputils/iputils_s20161105.bb | 62 --------------
 meta/recipes-extended/iputils/iputils_s20180629.bb | 60 ++++++++++++++
 4 files changed, 86 insertions(+), 157 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/install.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils_s20161105.bb
 create mode 100644 meta/recipes-extended/iputils/iputils_s20180629.bb

diff --git a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
deleted file mode 100644
index ce8cfebbb03..00000000000
--- a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From c6c5966d9fae27bc2f0a34ab59b999555111bd2d Mon Sep 17 00:00:00 2001
-From: Aric Belsito <lluixhi@gmail.com>
-Date: Sun, 29 Oct 2017 23:17:03 +0100
-Subject: [PATCH] Fix build on MUSL
-
-Add missing AI_IDN and NI_IDN declarations.
-
-Bug: https://bugs.gentoo.org/503914
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- arping.c      |  7 +++++++
- ping.h        | 11 +++++++++++
- tracepath.c   |  8 ++++++++
- traceroute6.c |  4 ++++
- 4 files changed, 30 insertions(+)
-
-diff --git a/arping.c b/arping.c
-index 1a3f40b..531d29d 100644
---- a/arping.c
-+++ b/arping.c
-@@ -45,6 +45,13 @@ struct sysfs_devattr_values;
- #ifdef USE_IDN
- #include <idna.h>
- #include <locale.h>
-+
-+#ifndef AI_IDN
-+#define AI_IDN 0x0040
-+#endif
-+#ifndef AI_CANONIDN
-+#define AI_CANONIDN 0x0080
-+#endif
- #endif
- 
- #include "SNAPSHOT.h"
-diff --git a/ping.h b/ping.h
-index 749f3ff..227315f 100644
---- a/ping.h
-+++ b/ping.h
-@@ -38,6 +38,17 @@
- #include <locale.h>
- #include <idna.h>
- #include <stringprep.h>
-+
-+#ifndef AI_IDN
-+#define AI_IDN 0x0040
-+#endif
-+#ifndef AI_CANONIDN
-+#define AI_CANONIDN 0x0080
-+#endif
-+#ifndef NI_IDN
-+#define NI_IDN 32
-+#endif
-+
- #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
- #define getnameinfo_flags NI_IDN
- #else
-diff --git a/tracepath.c b/tracepath.c
-index 74a829d..dcec5b9 100644
---- a/tracepath.c
-+++ b/tracepath.c
-@@ -30,6 +30,14 @@
- #ifdef USE_IDN
- #include <idna.h>
- #include <locale.h>
-+
-+#ifndef AI_IDN
-+#define AI_IDN 0x0040
-+#endif
-+#ifndef NI_IDN
-+#define NI_IDN 32
-+#endif
-+
- #define getnameinfo_flags	NI_IDN
- #else
- #define getnameinfo_flags	0
-diff --git a/traceroute6.c b/traceroute6.c
-index 48fc5c5..8d1eebf 100644
---- a/traceroute6.c
-+++ b/traceroute6.c
-@@ -251,6 +251,10 @@
- #include <idna.h>
- #include <locale.h>
- 
-+#ifndef NI_IDN
-+#define NI_IDN 32
-+#endif
-+
- #define getnameinfo_flags	NI_IDN
- #else
- #define getnameinfo_flags	0
--- 
-2.15.1
-
diff --git a/meta/recipes-extended/iputils/iputils/install.patch b/meta/recipes-extended/iputils/iputils/install.patch
new file mode 100644
index 00000000000..eb295bd5d66
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/install.patch
@@ -0,0 +1,26 @@
+Add a simple install rule so that we always install the binaries that were built.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From e1ca30ef905bd9ee70e328aae0e9c1688b01582f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross@burtonini.com>
+Date: Mon, 23 Jul 2018 14:21:03 +0100
+Subject: [PATCH] Add install
+
+---
+ Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 17fc5c9..5ae586b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -231,3 +231,7 @@ rpm:
+ 	@$(RPMBUILD) -ta --define 'current yes' $(RPMTMP)/iputils.tar.bz2
+ 	@rm -f $(RPMTMP)/iputils.tar.bz2
+ 
++install:
++	for t in $(TARGETS); do \
++		install -D $$t $(DESTDIR)$(bindir)/$$t; \
++	done
diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb b/meta/recipes-extended/iputils/iputils_s20161105.bb
deleted file mode 100644
index 0125739b034..00000000000
--- a/meta/recipes-extended/iputils/iputils_s20161105.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY = "Network monitoring tools"
-DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
-tracepath, tracepath6, ping, ping6 and arping."
-HOMEPAGE = "https://github.com/iputils/iputils"
-SECTION = "console/network"
-
-LICENSE = "BSD & GPLv2+"
-
-LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f00766dd278d82 \
-                    file://tracepath.c;beginline=1;endline=10;md5=0ecea2bf60bff2f3d840096d87647f3d \
-                    file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \
-                    file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
-
-DEPENDS = "gnutls libcap libgcrypt"
-
-SRC_URI = "git://github.com/iputils/iputils \
-           file://0001-Fix-build-on-MUSL.patch \
-           "
-S = "${WORKDIR}/git"
-SRCREV = "bffc0e957b98d626ab4cea218c89251201425442"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn"
-
-do_compile () {
-	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
-}
-
-do_install () {
-	install -m 0755 -d ${D}${base_bindir}
-	# SUID root programs
-	install -m 4555 ping ${D}${base_bindir}/ping
-	install -m 4555 traceroute6 ${D}${base_bindir}/
-	install -m 4555 clockdiff ${D}${base_bindir}/
-	# Other programgs
-	for i in arping tracepath; do
-	  install -m 0755 $i ${D}${base_bindir}/
-	done
-}
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-
-ALTERNATIVE_${PN}-ping = "ping"
-ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
-
-PACKAGES += "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff"
-
-ALLOW_EMPTY_${PN} = "1"
-RDEPENDS_${PN} += "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff"
-
-FILES_${PN}	= ""
-FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
-FILES_${PN}-arping = "${base_bindir}/arping"
-FILES_${PN}-tracepath = "${base_bindir}/tracepath"
-FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
-FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
diff --git a/meta/recipes-extended/iputils/iputils_s20180629.bb b/meta/recipes-extended/iputils/iputils_s20180629.bb
new file mode 100644
index 00000000000..8b75ef6b620
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils_s20180629.bb
@@ -0,0 +1,60 @@
+SUMMARY = "Network monitoring tools"
+DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
+tracepath, tracepath6, ping, ping6 and arping."
+HOMEPAGE = "https://github.com/iputils/iputils"
+SECTION = "console/network"
+
+LICENSE = "BSD & GPLv2+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b792e38abdc59f766a3153908f23e766 \
+                    file://LICENSE.BSD3;md5=0f00d99239d922ffd13cabef83b33444 \
+                    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "gnutls libcap libgcrypt"
+
+SRC_URI = "git://github.com/iputils/iputils \
+           file://install.patch"
+SRCREV = "f6aac8dbe3f8c45c53424854a3312bdd8cdd58d3"
+
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn2"
+
+do_compile () {
+	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} bindir=${base_bindir} install
+	for b in ping traceroute6 clockdiff; do
+		chmod u+s ${D}${base_bindir}/$b
+	done
+}
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-ping = "ping"
+ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
+
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff ${PN}-tftpd ${PN}-rarpd ${PN}-rdisc"
+PACKAGES += "${SPLITPKGS}"
+
+ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN} += "${SPLITPKGS}"
+
+FILES_${PN}	= ""
+FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES_${PN}-arping = "${base_bindir}/arping"
+FILES_${PN}-tracepath = "${base_bindir}/tracepath"
+FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
+FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
+FILES_${PN}-tftpd = "${base_bindir}/tftpd"
+FILES_${PN}-rarpd = "${base_bindir}/rarpd"
+FILES_${PN}-rdisc = "${base_bindir}/rdisc"
-- 
2.11.0


