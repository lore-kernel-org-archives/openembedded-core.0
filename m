Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 91CB874FB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:43:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v63-v6so7565295pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 12:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A2yUNUrimozWLO6GK6EJ28wTxmdyMfKmLtZqqZyWIac=;
	b=K7LXUr5/my58jx1ANc4t9cBDbLQml3AxouDEqepX4kDRxXNYru/yZ+RbiTxdSUUMl1
	uq96G/veeayNDQpoLX7x2ltN55UXuw1Ky5pjxDxDD0WFG3ZQjBRVFl27b6hb1EPku9XY
	pDv9mVcSgeK2JSn2FP+T+Z6Db5tOFF19oQQ1KXeiGNecHI3F/MBU4McKSjtwhj/qARP6
	9pAAyz9cQCEncZMpx+0Vex+PtDZDU4h2tw+dTekG7rpK5GVHQ/bMfRZ+TM7wDDppfQvW
	2XW5rRV/2A11sfKEzVL3Ka/hB9pQlrQG9mqNC7HHVO63ymaD9GMyqk9hGT1bxuXYPo22
	TXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A2yUNUrimozWLO6GK6EJ28wTxmdyMfKmLtZqqZyWIac=;
	b=mH1+Kv5roBlHreNNcTwoTxz8yYHEdgfUzzOrcjaduLdZiUIBBi5NvUYMhKUSL+YC8G
	YZMTTj+sQ31g1zEmLctLG6hAkTRuqtFABRoZovQbcsH3dciaLncvZpAj5YjY/b1zhinX
	sKBMdpnJDtzWvVoXLLMal/XJUZrkqVDLhSPk4UWxT3/I7aXwudVBwi6lk7/vkwGYHCGN
	KL/d5PXYkNuDLdTn4BRMGGXUrc12ws99aUFtJplJhBbr2eNfdxb5jUiybYbd4atw4JV+
	v/gszrNXP6ftl7bSvP5rRZhosfMLJXRDsZoYZ9jjZtVN4aD8cQDAfhi97S/x/0epzJke
	DQCg==
X-Gm-Message-State: ALKqPwcgzNQUKUjgnCjjb6D5MFPEkM5cVjo9vp/Njihziu9OgcX06IBJ
	0T9QTihJvPzXlrFtKws/7WFVwQ==
X-Google-Smtp-Source: AB8JxZr9S/C3y5w3TM1LfoewGT3tdDJBxiRzSXHS4vjzR/b2/f+Vpwt4Eghl3dwkx3Cjk2cFA3c15w==
X-Received: by 2002:a65:6031:: with SMTP id
	p17-v6mr17000300pgu.311.1526931831603; 
	Mon, 21 May 2018 12:43:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:cda1:4d10:a5a1:339b])
	by smtp.gmail.com with ESMTPSA id
	v1-v6sm29723032pfd.2.2018.05.21.12.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 May 2018 12:43:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 12:43:47 -0700
Message-Id: <1526931828-20358-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
References: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/2] bind: update to 9.12.1
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
X-List-Received-Date: Mon, 21 May 2018 19:43:50 -0000

LIC_FILES_CHKSUM changed do to updated year
Requires python-ply package in core

removed:
dont-test-on-host.patch, no longer impliemented
drop use-python3-and-fix-install-lib-path.patch, they added the ability to pass in lib dir loctions
drop bind-confgen-build-unix.o-once.patch, fix included in update

Refresh other patches:
add python3 flag for PACKAGECONFIG to pull in python
add new config option --with-eddsa=

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
 ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
 .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
 .../bind/bind/bind-confgen-build-unix.o-once.patch | 48 ----------------------
 ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
 .../bind/bind/dont-test-on-host.patch              | 17 --------
 .../use-python3-and-fix-install-lib-path.patch     | 36 ----------------
 .../bind/{bind_9.10.6.bb => bind_9.12.1.bb}        | 21 ++++------
 8 files changed, 29 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
 rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.12.1.bb} (86%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
index 1e23c0f..6d73e18 100644
--- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
@@ -15,11 +15,11 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  configure.in | 23 +++--------------------
  1 file changed, 3 insertions(+), 20 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index 4da73a4..6f2a754 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2282,26 +2282,9 @@ case "$use_libxml2" in
+Index: bind-9.12.1/configure.in
+===================================================================
+--- bind-9.12.1.orig/configure.in
++++ bind-9.12.1/configure.in
+@@ -2569,26 +2569,9 @@ case "$use_libxml2" in
  		DST_LIBXML2_INC=""
  		;;
  	auto|yes)
@@ -49,6 +49,3 @@ index 4da73a4..6f2a754 100644
  		fi
  		;;
  esac
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
index 1215093..9d87303 100644
--- a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
@@ -7,11 +7,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  lib/dns/gen.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/lib/dns/gen.c b/lib/dns/gen.c
-index 7a7dafb..51a0435 100644
---- a/lib/dns/gen.c
-+++ b/lib/dns/gen.c
-@@ -148,7 +148,7 @@ static const char copyright[] =
+Index: bind-9.12.1/lib/dns/gen.c
+===================================================================
+--- bind-9.12.1.orig/lib/dns/gen.c
++++ bind-9.12.1/lib/dns/gen.c
+@@ -130,7 +130,7 @@ static const char copyright[] =
  #define TYPECLASSBUF (TYPECLASSLEN + 1)
  #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
  #define ATTRIBUTESIZE 256
@@ -20,6 +20,3 @@ index 7a7dafb..51a0435 100644
  
  static struct cc {
  	struct cc *next;
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
index 1ed858c..1e34746 100644
--- a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
@@ -13,11 +13,11 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  lib/dns/gen.c |    4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/lib/dns/gen.c b/lib/dns/gen.c
-index 51a0435..3d7214f 100644
---- a/lib/dns/gen.c
-+++ b/lib/dns/gen.c
-@@ -148,7 +148,11 @@ static const char copyright[] =
+Index: bind-9.12.1/lib/dns/gen.c
+===================================================================
+--- bind-9.12.1.orig/lib/dns/gen.c
++++ bind-9.12.1/lib/dns/gen.c
+@@ -130,7 +130,11 @@ static const char copyright[] =
  #define TYPECLASSBUF (TYPECLASSLEN + 1)
  #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
  #define ATTRIBUTESIZE 256
@@ -29,6 +29,3 @@ index 51a0435..3d7214f 100644
  
  static struct cc {
  	struct cc *next;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
deleted file mode 100644
index 8bc4ea3..0000000
--- a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 9b40619ff6fddfef2758ba797789f8487f412df3 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 16 Feb 2015 00:50:01 -0800
-Subject: [PATCH] confgen: don't build unix.o twice
-
-Fixed:
-unix/os.o: file not recognized: File truncated
-collect2: error: ld returned 1 exit status
-
-This is because os.o was built twice:
-* The implicity rule (depends on unix/os.o)
-* The "make all" in unix subdir (depends on unix/os.o)
-
-Depend on subdirs which is unix only rather than unix/os.o will fix the
-problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Update context(trailing whitespace) for version 9.10.5-P3.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- bin/confgen/Makefile.in |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bin/confgen/Makefile.in b/bin/confgen/Makefile.in
-index dca272f..02becce 100644
---- a/bin/confgen/Makefile.in
-+++ b/bin/confgen/Makefile.in
-@@ -74,11 +74,11 @@ rndc-confgen.@O@: rndc-confgen.c
- ddns-confgen.@O@: ddns-confgen.c
- 	${LIBTOOL_MODE_COMPILE} ${CC} ${ALL_CFLAGS} -c ${srcdir}/ddns-confgen.c
- 
--rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS}
-+rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
- 	export BASEOBJS="rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
- 	${FINALBUILDCMD}
- 
--ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS}
-+ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
- 	export BASEOBJS="ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
- 	${FINALBUILDCMD}
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 13df3bb..55ed504 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -31,11 +31,11 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
-index c9ef3a601343..17a1f613e9ac 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2139,7 +2139,7 @@ case "$use_libjson" in
+Index: bind-9.12.1/configure.in
+===================================================================
+--- bind-9.12.1.orig/configure.in
++++ bind-9.12.1/configure.in
+@@ -2610,7 +2610,7 @@ case "$use_libjson" in
  		libjson_libs=""
  		;;
  	auto|yes)
@@ -44,6 +44,3 @@ index c9ef3a601343..17a1f613e9ac 100644
  		do
  			if test -f "${d}/include/json/json.h"
  			then
--- 
-2.4.2
-
diff --git a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
deleted file mode 100644
index b02ecb1..0000000
--- a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: bind-9.9.5/bin/Makefile.in
-===================================================================
---- bind-9.9.5.orig/bin/Makefile.in
-+++ bind-9.9.5/bin/Makefile.in
-@@ -19,7 +19,7 @@ srcdir =	@srcdir@
- VPATH =		@srcdir@
- top_srcdir =	@top_srcdir@
- 
--SUBDIRS =	named rndc dig delv dnssec tools tests nsupdate \
-+SUBDIRS =	named rndc dig delv dnssec tools nsupdate \
- 		check confgen @PYTHON_TOOLS@ @PKCS11_TOOLS@
- TARGETS =
- 
diff --git a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch b/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
deleted file mode 100644
index 9829f15..0000000
--- a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Use python3 rather default python which maybe links to python2 for oe. And add
-option for setup.py to install files to right directory.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/bin/python/Makefile.in b/bin/python/Makefile.in
-index a43a3c1..2e727f2 100644
---- a/bin/python/Makefile.in
-+++ b/bin/python/Makefile.in
-@@ -55,9 +55,9 @@ install:: ${TARGETS} installdirs
- 	${INSTALL_DATA} ${srcdir}/dnssec-coverage.8 ${DESTDIR}${mandir}/man8
- 	if test -n "${PYTHON}" ; then \
- 		if test -n "${DESTDIR}" ; then \
--			${PYTHON} ${srcdir}/setup.py install --root=${DESTDIR} --prefix=${prefix} ; \
-+			${PYTHON} ${srcdir}/setup.py install --root=${DESTDIR} --prefix=${prefix} --install-lib=${PYTHON_SITEPACKAGES_DIR} ; \
- 		else \
--			${PYTHON} ${srcdir}/setup.py install --prefix=${prefix} ; \
-+			${PYTHON} ${srcdir}/setup.py install --prefix=${prefix} --install-lib=${PYTHON_SITEPACKAGES_DIR} ; \
- 		fi \
- 	fi
- 
-diff --git a/configure.in b/configure.in
-index 314bb90..867923e 100644
---- a/configure.in
-+++ b/configure.in
-@@ -227,7 +227,7 @@ AC_ARG_WITH(python,
- [  --with-python=PATH      specify path to python interpreter],
-     use_python="$withval", use_python="unspec")
- 
--python="python python3 python3.5 python3.4 python3.3 python3.2 python2 python2.7"
-+python="python3 python3.5 python3.4 python3.3 python3.2 python2 python2.7"
- 
- testargparse='try: import argparse
- except: exit(1)'
diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.12.1.bb
similarity index 86%
rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
rename to meta/recipes-connectivity/bind/bind_9.12.1.bb
index 20c8d7b..9bfe01a 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.12.1.bb
@@ -3,28 +3,25 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
 
-DEPENDS = "openssl libcap"
+DEPENDS = "openssl libcap zlib"
 
 SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
            file://make-etc-initd-bind-stop-work.patch \
-           file://dont-test-on-host.patch \
            file://generate-rndc-key.sh \
            file://named.service \
            file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
-           file://bind-confgen-build-unix.o-once.patch \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
-           file://use-python3-and-fix-install-lib-path.patch \
            "
 
-SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
-SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
+SRC_URI[md5sum] = "ec20f2d6aff50651296fad962d19ccfa"
+SRC_URI[sha256sum] = "16e446425c35e48b651ddf1171d2115ebf32b07670b652e1030a174038937510"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
@@ -33,21 +30,22 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --disable-devpoll --enable-epoll --with-gost=no \
-                 --with-gssapi=no --with-ecdsa=yes \
+                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no\
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
                "
 
-inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
+inherit autotools update-rc.d systemd useradd pkgconfig python3native
 
 export PYTHON_SITEPACKAGES_DIR
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
-PACKAGECONFIG ?= "readline"
+PACKAGECONFIG ?= "readline python3"
 PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
 PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
+PACKAGECONFIG[python3] = "--with-python=${PYTHON},--without-python, python3-native python3-ply-native, python3-core"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
@@ -60,7 +58,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
 
 PARALLEL_MAKE = ""
 
-RDEPENDS_${PN} = "python3-core"
 RDEPENDS_${PN}-dev = ""
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
@@ -88,7 +85,7 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds ${D}${sbindir}/dnssec-keymgr
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
-- 
2.7.4


