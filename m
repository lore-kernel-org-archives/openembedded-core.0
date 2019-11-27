Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62BE77FC9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g206so7805057wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OwKKHVXb6zMiBoIU+SYWVdqWA/UlH1LOlDYiRn3mOGQ=;
	b=Zj+H9B+IMccwjjaxjhmcEMdpNK6ZReI5Eao4Ui+D97lnsnhZlHXHsx8knbl8JQ0Gf/
	+8UHTLYKILAjqUDBJdJ2j2LWgP3hiS3PDx6Rx7oTpukT1jH+SHSqCSoFQP4RKXzjtZ6s
	BvWCWzRYzSpH8yXW4ONVmafprkfkAmHtk/AEsg9n3BWVs/3IxmZccMTAIiASKzYVurI9
	mt0A9VXaEqAyrEJ7S+z1pIbAjqjgGgcBxHWtZ/sY+XYIkhIy+tpwuhHw60G4kmfrpHMX
	1elhnccfTIvL9/mZhnybOimkKfR8DZaLRvsMvPBo8J98COGguQ3ePIBEfjYM7IU05XGa
	eVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OwKKHVXb6zMiBoIU+SYWVdqWA/UlH1LOlDYiRn3mOGQ=;
	b=KH6YqOrLVvJGVjTwkO/8NJqwNtCMVFZqtq08hmD3A1zKRZ3NA0XwZuoQd0yEqUqLW7
	EqYzxYIeEsBBXQJ75rNXtRgbHbGgSGViBi85u3CppDJfC/BBHEaG4c1LnER0V44n8bsh
	d854lOgIqlnnpMl7VbtEk+ZtkY8/CzZ7EurTTAgR5QclJVuO0oPBMyY3FvQvamQU3IOn
	hLreLP9xyqvpuygwamY+m/Qpe3XR/qb6gW2VqkwVFTFIMnjUQxrJGeo8Kd9P+6v6AF/+
	oXJyGKmsFhol3FbfyPmkLt6wP17lFQQpi8dszcbMHXsBn6iN0P+46Eew/PhZe/Klq92I
	qyxQ==
X-Gm-Message-State: APjAAAWhmkh3b1xuzEHr/G8UEJheTxZz4RyU9JHx4Be6WhplVbThfxsl
	ax4dbrI9zwU4jsUWLQuV8J/eZd9S
X-Google-Smtp-Source: APXvYqx+t9Ga52Su3QF9h1PEH2NiJdEr7Dkv45KHL4Q4xpcuiWn84e4WYKsfaIuQKhvcdplbXVVuMA==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr5556372wmi.75.1574872818813; 
	Wed, 27 Nov 2019 08:40:18 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:40:00 +0100
Message-Id: <20191127164003.115980-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/14] sed: upgrade to 4.7
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:19 -0000

Drop both patches as they are no longer necessary.

Rewrite ptest support as it has been refactored upstream.

Ptest results:
TOTAL: 67
PASS: 59
SKIP: 8 (due to missing valgrind)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...charset_alias-when-building-for-musl.patch | 33 ----------
 meta/recipes-extended/sed/sed-4.2.2/run-ptest |  3 -
 .../sed/sed-4.2.2/sed-add-ptest.patch         | 66 -------------------
 meta/recipes-extended/sed/sed/run-ptest       |  5 ++
 meta/recipes-extended/sed/sed_4.2.2.bb        | 53 ---------------
 meta/recipes-extended/sed/sed_4.7.bb          | 61 +++++++++++++++++
 6 files changed, 66 insertions(+), 155 deletions(-)
 delete mode 100644 meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/sed/sed-4.2.2/run-ptest
 delete mode 100644 meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
 create mode 100644 meta/recipes-extended/sed/sed/run-ptest
 delete mode 100644 meta/recipes-extended/sed/sed_4.2.2.bb
 create mode 100644 meta/recipes-extended/sed/sed_4.7.bb

diff --git a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4bab4c1..00000000000
--- a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/sed/sed-4.2.2/run-ptest b/meta/recipes-extended/sed/sed-4.2.2/run-ptest
deleted file mode 100644
index 7c0f62770e7..00000000000
--- a/meta/recipes-extended/sed/sed-4.2.2/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-make -C testsuite -k runtest-TESTS
diff --git a/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch b/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
deleted file mode 100644
index 0293900fbf3..00000000000
--- a/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-sed: add ptest
-
-ptest needs buildtest-TESTS and runtest-TESTS targets.
-serial-tests is required to generate those targets.
-
-And fix following error after add serial-tests.
-
-[snip]
-help2man: can't get `--help' info from ../sed/sed
-make[2]: *** [sed.1] Error 2
-[snip]
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- configure.ac          |    2 +-
- doc/Makefile.am       |    2 +-
- testsuite/Makefile.am |    6 ++++++
- 3 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9d33ec9..4f0c532 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,7 +4,7 @@ AC_CONFIG_AUX_DIR(build-aux)
- AC_CONFIG_SRCDIR([sed/sed.c])
- AM_CONFIG_HEADER(config.h:config_h.in)
- AC_PREREQ(2.60)
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([serial-tests])
- 
- SED_FEATURE_VERSION=4.2.2
- AC_DEFINE_UNQUOTED(SED_FEATURE_VERSION, "$SED_FEATURE_VERSION",
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index af6975c..6fd8c9a 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -25,7 +25,7 @@ $(srcdir)/s-texi: sed-in.texi $(srcdir)/groupify.sed
- 	fi
- 	echo stamp > $(srcdir)/s-texi
- 
--sed.1: $(top_srcdir)/sed/sed.c $(top_srcdir)/configure.ac $(srcdir)/sed.x
-+_sed.1: $(top_srcdir)/sed/sed.c $(top_srcdir)/configure.ac $(srcdir)/sed.x
- 	$(HELP2MAN) --name "stream editor for filtering and transforming text" \
- 	  -p sed --include $(srcdir)/sed.x -o $(srcdir)/sed.1 $(SED) 
- 
-diff --git a/testsuite/Makefile.am b/testsuite/Makefile.am
-index d80e72c..b05f01e 100644
---- a/testsuite/Makefile.am
-+++ b/testsuite/Makefile.am
-@@ -99,5 +99,11 @@ EXTRA_DIST = \
- # automake makes `check' depend on $(TESTS).  Declare
- # dummy targets for $(TESTS) so that make does not complain.
- 
-+install-ptest:
-+	cd $(BUILDDIR); tar -c --exclude=*.o $(TESTDIR) | ( cd $(DESTDIR) && tar -xf - )
-+	for i in $(EXTRA_DIST) tst-regex2.c; do install $(srcdir)/$$i $(DESTDIR)/$(TESTDIR); done
-+	sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/bash/sh/' -i $(DESTDIR)/$(TESTDIR)/Makefile
-+	for i in `grep -rl "../sed/sed" $(DESTDIR)/$(TESTDIR)`; do sed -e 's/..\/sed\/sed/sed/' -i $$i; done
-+
- .PHONY: $(SEDTESTS)
- $(SEDTESTS):
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/sed/sed/run-ptest b/meta/recipes-extended/sed/sed/run-ptest
new file mode 100644
index 00000000000..993d7d5d75e
--- /dev/null
+++ b/meta/recipes-extended/sed/sed/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+chown nobody testsuite
+chown nobody ../ptest
+su nobody -c "make test-suite.log"
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
deleted file mode 100644
index 8e436bad803..00000000000
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Stream EDitor (text filtering utility)"
-HOMEPAGE = "http://www.gnu.org/software/sed/"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://sed/sed.h;beginline=1;endline=17;md5=767ab3a06d7584f6fd0469abaec4412f"
-SECTION = "console/utils"
-
-SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
-           file://sed-add-ptest.patch \
-	   file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://run-ptest \
-"
-
-SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
-SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
-
-inherit autotools texinfo update-alternatives gettext ptest
-RDEPENDS_${PN}-ptest += "make"
-RRECOMMENDS_${PN}-ptest_append_libc-glibc = " locale-base-ru-ru"
-
-EXTRA_OECONF = "--disable-acl \
-                ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-regex-tests', '', d)}"
-
-do_install () {
-	autotools_do_install
-	install -d ${D}${base_bindir}
-	if [ ! ${D}${bindir} -ef ${D}${base_bindir} ]; then
-	    mv ${D}${bindir}/sed ${D}${base_bindir}/sed
-	    rmdir ${D}${bindir}/
-	fi
-}
-
-ALTERNATIVE_${PN} = "sed"
-ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
-ALTERNATIVE_PRIORITY = "100"
-
-TESTDIR = "testsuite"
-
-do_compile_ptest() {
-	oe_runmake -C ${TESTDIR} buildtest-TESTS
-}
-
-do_install_ptest() {
-	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
-	sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-	    -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
-}
-
-RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sed', '', d)}"
diff --git a/meta/recipes-extended/sed/sed_4.7.bb b/meta/recipes-extended/sed/sed_4.7.bb
new file mode 100644
index 00000000000..312f07f0479
--- /dev/null
+++ b/meta/recipes-extended/sed/sed_4.7.bb
@@ -0,0 +1,61 @@
+SUMMARY = "Stream EDitor (text filtering utility)"
+HOMEPAGE = "http://www.gnu.org/software/sed/"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
+                    file://sed/sed.h;beginline=1;endline=15;md5=e869c874e5472ba89f63f381b0e93475"
+SECTION = "console/utils"
+
+SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.xz \
+           file://run-ptest \
+"
+
+SRC_URI[md5sum] = "777ddfd9d71dd06711fe91f0925e1573"
+SRC_URI[sha256sum] = "2885768cd0a29ff8d58a6280a270ff161f6a3deb5690b2be6c49f46d4c67bd6a"
+
+inherit autotools texinfo update-alternatives gettext ptest
+RDEPENDS_${PN}-ptest += "make gawk perl perl-module-filehandle perl-module-file-compare perl-module-file-find perl-module-file-temp perl-module-file-stat"
+RRECOMMENDS_${PN}-ptest_append_libc-glibc = " locale-base-ru-ru locale-base-en-us locale-base-el-gr.iso-8859-7"
+
+EXTRA_OECONF = "--disable-acl \
+               "
+
+do_install () {
+	autotools_do_install
+	install -d ${D}${base_bindir}
+	if [ ! ${D}${bindir} -ef ${D}${base_bindir} ]; then
+	    mv ${D}${bindir}/sed ${D}${base_bindir}/sed
+	    rmdir ${D}${bindir}/
+	fi
+}
+
+ALTERNATIVE_${PN} = "sed"
+ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
+ALTERNATIVE_PRIORITY = "100"
+
+do_compile_ptest() {
+	oe_runmake testsuite/get-mb-cur-max testsuite/test-mbrtowc
+}
+
+do_install_ptest() {
+        cp -rf ${S}/testsuite/ ${D}${PTEST_PATH}
+        cp -rf ${B}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+        cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}/
+        cp ${B}/Makefile ${D}${PTEST_PATH}
+        cp ${S}/init.cfg ${D}${PTEST_PATH}
+
+        sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/bash/sh/' -i ${D}${PTEST_PATH}/Makefile
+        for i in `grep -rl "sed/sed" ${D}${PTEST_PATH}`; do sed -e 's/..\/sed\/sed/sed/' -i $i; done
+
+	sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+	    -e 's:abs_top_builddir =.*:abs_top_builddir = ..:g' \
+	    -e 's:abs_top_srcdir =.*:abs_top_srcdir = ..:g' \
+	    -e 's:abs_srcdir =.*:abs_srcdir = ..:g' \
+	    -e 's:top_srcdir =.*:top_srcdir = ..:g' \
+	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+	    -i ${D}${PTEST_PATH}/Makefile
+}
+
+RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sed', '', d)}"
-- 
2.17.1


