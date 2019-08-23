Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1DA7F35F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 21:56:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k1so10144152wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=STI+7VRlV3yVN8sdT5FfSPjF7aeJahuSdcTF8zIb/y8=;
	b=iQUhGdOs91Lxqxv5PYhQT37jgjfcTbqZwn4e2llvX9vBKDzjConLQR22kuKAnrAE08
	nutQwA3XfuZDd8zoiO6u+2vpLknHtjZbyB3o4RcYJ2VLXpLeEvwajbAIVVG6HtscUJit
	9w7cWuAQPvum96LC+9j/cX6hPHCXyZPJbe3EB5XQAlyvQpiH0My1wIB7Hq/EAgH/QgdS
	gF/FxyTj41EkmdpVTsiy71eaeqgI7ACPlviSsGyvAYdWSqO15zH5GuSD80avk4A2a9bH
	vcob4bMpbprtwuHDbJKiY0MksgELOC+fkke2V5Lk5pJ2UbBe/pjLBYSmOQ2NftcxbJfZ
	/LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=STI+7VRlV3yVN8sdT5FfSPjF7aeJahuSdcTF8zIb/y8=;
	b=jcCR/Om268xp7731h/CIjfXLoUXJwBeEHY7iEGrspoXkfVgF/cZSS8e0nWL8MBIOov
	Pn8e+d6x86WrcUjXmRbxWP/bC46invcnmS0IW5JMgU533eei9CahaMoOpjl6ZcdZNuKt
	YuNe2bv954lcOz6S6uzKEIO0EC4QAslZrBHsAfBalq28XcMRmI35mZLACfQ7IrPVTD5E
	yty7mPu7hf7JjwkQpixW9waOZo7iOd+lGZUraf592IeVpp5pzSX5+BEgHuh3D1lYQVe+
	Y8xGI/486zJ+n4myeudmPerEPlLVvAt0plLc5ensfogfGPtqqlGPJ4PBGylhFhU63Fi0
	wA7A==
X-Gm-Message-State: APjAAAVgKr9CvAsEw0U1pugfhmOTft5dRJ1aE+yCwvPjMQSjuPx+gGVo
	fWHfBZYV4/GspTWBLoxELy+Qj9XoT6M=
X-Google-Smtp-Source: APXvYqwHcI2CsPGNXAvc03gPo4uji2FE6By0sqzbPsf6XtxgHixPoNn2AgYIgpm2X0c8cK4sjzgDHg==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr7589883wmi.27.1566597419409; 
	Fri, 23 Aug 2019 14:56:59 -0700 (PDT)
Received: from cmtcleu60844809.rd.corpintra.net
	([2a02:8109:b5c0:1428:ddc0:95d5:be7d:53aa])
	by smtp.gmail.com with ESMTPSA id
	i30sm8824696wmb.20.2019.08.23.14.56.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 23 Aug 2019 14:56:58 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 23:56:53 +0200
Message-Id: <20190823215653.27040-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] iputils: upgrade to s20190709
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
X-List-Received-Date: Fri, 23 Aug 2019 21:56:59 -0000
Content-Transfer-Encoding: 8bit

build system is changed to meson.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iputils/iputils/ai_canonidn.patch         | 58 ------------------
 .../iputils/iputils/install.patch             | 26 --------
 .../iputils/iputils_s20180629.bb              | 61 -------------------
 .../iputils/iputils_s20190709.bb              | 55 +++++++++++++++++
 4 files changed, 55 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/ai_canonidn.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils/install.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils_s20180629.bb
 create mode 100644 meta/recipes-extended/iputils/iputils_s20190709.bb

diff --git a/meta/recipes-extended/iputils/iputils/ai_canonidn.patch b/meta/recipes-extended/iputils/iputils/ai_canonidn.patch
deleted file mode 100644
index cd91267b78..0000000000
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
index abfefd7a58..0000000000
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
index eff44be1bd..0000000000
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
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
new file mode 100644
index 0000000000..34a6c68260
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
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
+SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
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
+PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
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
2.23.0


