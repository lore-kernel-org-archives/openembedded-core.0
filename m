Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id E2DBD7D735
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 09:19:54 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 4so6888110wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EZlg9TVYvFF42m9oEeDhz6P8nbmBRzYu/uDUXv6KCF8=;
	b=cOsHevoMWQOp19Kh2EsKHmKIeyB49hHRCxOOFW9Vqqdzs3pVT4IXP47DuXbm7F1Ff6
	27Ao7fX2Nr7CLTPPvmAl8sRyT/DVzycsVI+hd5pNUoRXTKDwChHLG07fX6Hog4/wVJEP
	noXD/+4xk6rnW3RFLSnNg+xSYY8R59gaool3vVQtAAjosSpNfVPxnBrgE1Ymmlx2z9Cg
	jH4bQZ6Doqg1YzTvh8aQKmkGRY9Whw11xDYKLNSUhmBSpJuQ4/Ghc50c4sCDPSH3tQAa
	whtI3nuAmhApE4vrv6WEfpam1S/BQVIJnW8M0n9pIVaV36DHEJ1jg2Udbi/kUxg55Mv/
	AU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EZlg9TVYvFF42m9oEeDhz6P8nbmBRzYu/uDUXv6KCF8=;
	b=rPRrn+4rY5OT4SjFprc0m2/CPUaOm6Z0P3O+Jq4S28R2dZUfcmeMPu/BEa5piiXSqH
	uRbcIaObz4wvd6UWpsVGsDUu3mbt3Zb6vs0Oej/UEGkz5rI1j6gvPdbjwXVFotq9h2m6
	HQgjhMgd3Q4KuT+4Z9NelCGhClTh5ThB8RRykrC98JKma+UyoG1x9IYHrzMYRO+we8KP
	fNzWeT4/uU/OdxkHCl4hQI1occ0RO9BimAZMmrVHYJEyFtwB+MR16ufIMvZOM4hOEZNr
	2wQxP5AL5Y7+4O2WhU3phICzz4+EwVFEB2ASEa4nXdOPpYYKHJtFwDAq/Ql16qI4IAXZ
	pOvQ==
X-Gm-Message-State: APjAAAWx+E2NWxCeRwDRQ6rb+wsqxeDkbLbDJmm/UFuMikzNSLc0vb2u
	uN6pah5WVy79E9lGpiD1BfB+Oj1h
X-Google-Smtp-Source: APXvYqzzyD7zI4l/ROgVh1z59n4VXZw2Y+7Wd6fujsrgJPDzzkXVkf1q8UyG8aiKM6eN87ocvkfSvg==
X-Received: by 2002:a1c:c00b:: with SMTP id q11mr11370533wmf.38.1556356795117; 
	Sat, 27 Apr 2019 02:19:55 -0700 (PDT)
Received: from ed029f36bf25.fritz.box
	(ip5b413250.dynamic.kabel-deutschland.de. [91.65.50.80])
	by smtp.gmail.com with ESMTPSA id
	v12sm5392866wrw.23.2019.04.27.02.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Apr 2019 02:19:54 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
X-Google-Original-From: Changhyeok Bae <changhyeok.bae@gmail.comd>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Apr 2019 09:19:37 +0000
Message-Id: <1556356777-78549-1-git-send-email-changhyeok.bae@gmail.comd>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] iputils: update to s20190324
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
X-List-Received-Date: Sat, 27 Apr 2019 09:19:55 -0000

From: Changhyeok Bae <changhyeok.bae@gmail.com>

build system is changed to meson.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iputils/iputils/ai_canonidn.patch              | 58 --------------------
 .../recipes-extended/iputils/iputils/install.patch | 26 ---------
 meta/recipes-extended/iputils/iputils_s20180629.bb | 61 ----------------------
 meta/recipes-extended/iputils/iputils_s20190324.bb | 55 +++++++++++++++++++
 4 files changed, 55 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/ai_canonidn.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils/install.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils_s20180629.bb
 create mode 100644 meta/recipes-extended/iputils/iputils_s20190324.bb

diff --git a/meta/recipes-extended/iputils/iputils/ai_canonidn.patch b/meta/recipes-extended/iputils/iputils/ai_canonidn.patch
deleted file mode 100644
index cd91267..0000000
--- a/meta/recipes-extended/iputils/iputils/ai_canonidn.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 714e2b458c151c5bdfe93647445cd00dd8e36fff Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sat, 21 Jul 2018 17:46:14 +0200
-Subject: [PATCH] ping: Fix AI_CANONIDN usage on some systems
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Commit 99f67db used AI_CANONIDN in a way, which broke compilation on
-systems where AI_CANONIDN is not defined in netdb.h (e.g. glibc < 2.3.4,
-alternative libcs that don't support IDN: e.g. current musl 1.1.19 and
-uClibc-ng 1.0.30) when not using the system libidn2.
-
-Fixes: 99f67db ping: Fix ping name encoded using ACE on C locale
-
-Reported-by: Nicholas Fish
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-
----
- ping.c | 2 +-
- ping.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ping.c b/ping.c
-index 733477f..b241815 100644
---- a/ping.c
-+++ b/ping.c
-@@ -207,9 +207,9 @@ main(int argc, char **argv)
- 
- #ifdef USE_IDN
- 	setlocale(LC_ALL, "");
--#endif
- 	if (!strcmp(setlocale(LC_ALL, NULL), "C"))
- 		hints.ai_flags &= ~ AI_CANONIDN;
-+#endif
- 
- 	/* Support being called using `ping4` or `ping6` symlinks */
- 	if (argv[0][strlen(argv[0])-1] == '4')
-diff --git a/ping.h b/ping.h
-index 3e09685..8a0c4ef 100644
---- a/ping.h
-+++ b/ping.h
-@@ -28,7 +28,6 @@
- #include <netinet/icmp6.h>
- #include <linux/filter.h>
- #include <resolv.h>
--#include <locale.h>
- 
- #ifdef CAPABILITIES
- #include <sys/prctl.h>
-@@ -36,6 +35,7 @@
- #endif
- 
- #ifdef USE_IDN
-+#include <locale.h>
- #include <idn2.h>
- #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
- #define getnameinfo_flags NI_IDN
diff --git a/meta/recipes-extended/iputils/iputils/install.patch b/meta/recipes-extended/iputils/iputils/install.patch
deleted file mode 100644
index abfefd7..0000000
--- a/meta/recipes-extended/iputils/iputils/install.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5c8c3b04d73304679340f893636e87691992053b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross@burtonini.com>
-Date: Mon, 23 Jul 2018 14:21:03 +0100
-Subject: [PATCH] Add install
-
-Add a simple install rule so that we always install the binaries that were built.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 17fc5c9..e0c2784 100644
---- a/Makefile
-+++ b/Makefile
-@@ -231,3 +231,7 @@ rpm:
- 	@$(RPMBUILD) -ta --define 'current yes' $(RPMTMP)/iputils.tar.bz2
- 	@rm -f $(RPMTMP)/iputils.tar.bz2
- 
-+install:
-+	for t in $(TARGETS); do \
-+		install -D $$t $(DESTDIR)$(bindir)/$$t; \
-+	done
diff --git a/meta/recipes-extended/iputils/iputils_s20180629.bb b/meta/recipes-extended/iputils/iputils_s20180629.bb
deleted file mode 100644
index eff44be..0000000
--- a/meta/recipes-extended/iputils/iputils_s20180629.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-SUMMARY = "Network monitoring tools"
-DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
-tracepath, tracepath6, ping, ping6 and arping."
-HOMEPAGE = "https://github.com/iputils/iputils"
-SECTION = "console/network"
-
-LICENSE = "BSD & GPLv2+"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b792e38abdc59f766a3153908f23e766 \
-                    file://LICENSE.BSD3;md5=0f00d99239d922ffd13cabef83b33444 \
-                    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "gnutls libcap libgcrypt"
-
-SRC_URI = "git://github.com/iputils/iputils \
-           file://ai_canonidn.patch \
-           file://install.patch"
-SRCREV = "f6aac8dbe3f8c45c53424854a3312bdd8cdd58d3"
-
-S = "${WORKDIR}/git"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn2"
-
-do_compile () {
-	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
-}
-
-do_install() {
-	oe_runmake DESTDIR=${D} bindir=${base_bindir} install
-	for b in ping traceroute6 clockdiff; do
-		chmod u+s ${D}${base_bindir}/$b
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
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff ${PN}-tftpd ${PN}-rarpd ${PN}-rdisc"
-PACKAGES += "${SPLITPKGS}"
-
-ALLOW_EMPTY_${PN} = "1"
-RDEPENDS_${PN} += "${SPLITPKGS}"
-
-FILES_${PN}	= ""
-FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
-FILES_${PN}-arping = "${base_bindir}/arping"
-FILES_${PN}-tracepath = "${base_bindir}/tracepath"
-FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
-FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
-FILES_${PN}-tftpd = "${base_bindir}/tftpd"
-FILES_${PN}-rarpd = "${base_bindir}/rarpd"
-FILES_${PN}-rdisc = "${base_bindir}/rdisc"
diff --git a/meta/recipes-extended/iputils/iputils_s20190324.bb b/meta/recipes-extended/iputils/iputils_s20190324.bb
new file mode 100644
index 0000000..ffdfd79
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils_s20190324.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Network monitoring tools"
+DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
+tracepath, tracepath6, ping, ping6 and arping."
+HOMEPAGE = "https://github.com/iputils/iputils"
+SECTION = "console/network"
+
+LICENSE = "BSD & GPLv2+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
+
+DEPENDS = "gnutls"
+
+SRC_URI = "git://github.com/iputils/iputils"
+
+SRCREV = "991916bf6ee6469285621e47038ee7aeab6ce9e8"
+
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
+
+PACKAGECONFIG ??= "libcap libgcrypt rarpd traceroute6"
+PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
+PACKAGECONFIG[libgcrypt] = "-DUSE_CRYPTO=gcrypt, -DUSE_CRYPTO=none, libgcrypt"
+PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
+PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
+PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
+PACKAGECONFIG[traceroute6] = "-DBUILD_TRACEROUTE6=true,-DBUILD_TRACEROUTE6=false,"
+
+inherit meson update-alternatives
+
+EXTRA_OEMESON += "--prefix=/"
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-ping = "ping"
+ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
+
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-traceroute6 ${PN}-clockdiff ${PN}-tftpd ${PN}-rarpd ${PN}-rdisc ${PN}-ninfod"
+PACKAGES += "${SPLITPKGS}"
+
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-rarpd = "1"
+ALLOW_EMPTY_${PN}-traceroute6 = "1"
+RDEPENDS_${PN} += "${SPLITPKGS}"
+
+FILES_${PN} = ""
+FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES_${PN}-arping = "${base_bindir}/arping"
+FILES_${PN}-tracepath = "${base_bindir}/tracepath"
+FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
+FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
+FILES_${PN}-tftpd = "${base_bindir}/tftpd"
+FILES_${PN}-rarpd = "${base_sbindir}/rarpd"
+FILES_${PN}-rdisc = "${base_sbindir}/rdisc"
+FILES_${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"
-- 
2.7.4


