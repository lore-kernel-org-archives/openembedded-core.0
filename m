Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0E2795D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:52 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id s10-v6so8445801edb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WWrOjln7pJP/TP7qrAf8tTCXH/fGvUSfWb/rLVuHWP8=;
	b=WyvnNC348vG5ySSxdUtYFvfsrdyQ6Y7Ae5q4FQWDyecJ+eDRP/l27qfAvdLsIKqWNr
	20asIzp/YyBXRzGXDZZUWqHnXB8DoaBKG0Jx4aeW66FAQ7y/NWITc/GktnV/j8Yci0RX
	jjokIhoCKAfPNaGQDt6Ox/EoDb5BmyPAHyWx5szaARVF++Q3qK37isE/sP0TvrZXX576
	lR8E3iuHKJiZgyYlmyWbRDkCByOw8STQoRaI2FoVZt5pM4EhfNdc8CbrXma4bM0Q7w/z
	NfuPtu/dphs8+kRKPk2QqqyVYlaqudOX55TsSi8wMeeg+7GUDwDyWQQ7fvT+aTZkfBb/
	rmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WWrOjln7pJP/TP7qrAf8tTCXH/fGvUSfWb/rLVuHWP8=;
	b=kiF7DmfCyaY8IUtTgV0VH3SZYttGUJgpkNWglSaf8o/gK6EvqExFLjQHguy5ZJTlSj
	BBqLsU4Fb6Sthsh8cYmwMpZfEsBiwDkmnypxqcK4Ya9A/UZrzBOoFAtC+P6tC0u3ucpZ
	RpyDnCSVlhn1VhVdwoa6AkUPGWhwhvtCLC0MVA2LU9po4m1qBvnnbIWaLOAafpXp7MiZ
	hAaUNU8P4HaxL225HT7FD2Mwh1nlGMumBpNe0kzduXfmI6moe6rZemd0Xf9Cun2GohvY
	HslH02f51boBiLlYXGdVN1yt/3wLsW9phZOgjePt0LjOdQRmqVTiN+PiM3wYvAtTeeQE
	ca5w==
X-Gm-Message-State: APzg51D/RyogyBa9yJf6cCVYxcoegSVXttA51CSr7MxUZjbbN4bsvDag
	hVjzTM9Cv6JHKOXcACWLbL90/M8p1ag=
X-Google-Smtp-Source: ANB0VdaGJ+Mclseku2nazf+nvwjia1TSS+o7vXngQtMVv8YRLmgO2JqFU9htN2i3pA7q/J9x7iivIQ==
X-Received: by 2002:a50:ad5a:: with SMTP id
	z26-v6mr2735991edc.142.1536229793266; 
	Thu, 06 Sep 2018 03:29:53 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:23 +0200
Message-Id: <1536229770-29600-14-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 14/21] gdbm: update to 1.18
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:52 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/gdbm/files/ptest.patch | 22 ++++++---------
 meta/recipes-support/gdbm/gdbm_1.14.1.bb    | 43 -----------------------------
 meta/recipes-support/gdbm/gdbm_1.18.bb      | 43 +++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-support/gdbm/gdbm_1.14.1.bb
 create mode 100644 meta/recipes-support/gdbm/gdbm_1.18.bb

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index b9461be..1e67dbd 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -1,4 +1,4 @@
-From 4e4b70a4a3dcf1fdbee9e68bed3b62f42b197a3a Mon Sep 17 00:00:00 2001
+From 41448708e163c8ec1f980464e7dd6741db427c8a Mon Sep 17 00:00:00 2001
 From: Josep Puigdemont <josep.puigdemont@enea.com>
 Date: Sun, 4 May 2014 16:02:07 +0200
 Subject: [PATCH] Add install-ptest rules.
@@ -9,14 +9,14 @@ Upstream-Status: Pending
 
 ---
  Makefile.am       |  5 +++++
- tests/Makefile.am | 12 +++++++++++-
- 2 files changed, 16 insertions(+), 1 deletion(-)
+ tests/Makefile.am | 11 +++++++++++
+ 2 files changed, 16 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4cdc734..24b99f0 100644
+index ecc03df..9fbbda5 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -45,3 +45,8 @@ ChangeLog:
+@@ -55,3 +55,8 @@ ChangeLog:
                  awk -f $(top_srcdir)/git2chg.awk                            \
                      -v append=$(top_srcdir)/$(prev_change_log) > ChangeLog; \
          fi
@@ -26,14 +26,13 @@ index 4cdc734..24b99f0 100644
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3dbb580..22ffc44 100644
+index dbe17dd..06f537f 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -130,4 +130,14 @@ dtfetch_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
- dtdel_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
- d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+@@ -169,3 +169,14 @@ EXTRA_DIST += \
+   gdbmtool/base.exp\
+   config/default.exp
  
--
 +buildtests: $(check_PROGRAMS) $(TESTSUITE)
 +
 +install-ptest: $(check_PROGRAMS) $(TESTSUITE)
@@ -45,6 +44,3 @@ index 3dbb580..22ffc44 100644
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +		fi \
 +	done
--- 
-2.11.0
-
diff --git a/meta/recipes-support/gdbm/gdbm_1.14.1.bb b/meta/recipes-support/gdbm/gdbm_1.14.1.bb
deleted file mode 100644
index 54e5696..0000000
--- a/meta/recipes-support/gdbm/gdbm_1.14.1.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Key/value database library with extensible hashing"
-HOMEPAGE = "http://www.gnu.org/software/gdbm/"
-SECTION = "libs"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
-
-
-SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
-           file://run-ptest \
-           file://ptest.patch \
-          "
-
-SRC_URI[md5sum] = "c2ddcb3897efa0f57484af2bd4f4f848"
-SRC_URI[sha256sum] = "cdceff00ffe014495bed3aed71c7910aa88bf29379f795abc0f46d4ee5f8bc5f"
-
-inherit autotools gettext texinfo lib_package ptest
-
-# Needed for dbm python module
-EXTRA_OECONF = "-enable-libgdbm-compat"
-
-# Stop presence of dbm/nbdm on the host contaminating builds
-CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_install_append () {
-    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other packages to find
-    # these headers
-    install -d ${D}${includedir}/gdbm
-    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
-    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
-}
-
-RDEPENDS_${PN}-ptest += "diffutils"
-
-do_compile_ptest() {
-    oe_runmake -C tests buildtests
-}
-
-PACKAGES =+ "${PN}-compat \
-            "
-FILES_${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS} \
-                     "
diff --git a/meta/recipes-support/gdbm/gdbm_1.18.bb b/meta/recipes-support/gdbm/gdbm_1.18.bb
new file mode 100644
index 0000000..2d2016d
--- /dev/null
+++ b/meta/recipes-support/gdbm/gdbm_1.18.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Key/value database library with extensible hashing"
+HOMEPAGE = "http://www.gnu.org/software/gdbm/"
+SECTION = "libs"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
+
+
+SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
+           file://run-ptest \
+           file://ptest.patch \
+          "
+
+SRC_URI[md5sum] = "e316f8e4a3e7e4f23955be65d54fec48"
+SRC_URI[sha256sum] = "b8822cb4769e2d759c828c06f196614936c88c141c3132b18252fe25c2b635ce"
+
+inherit autotools gettext texinfo lib_package ptest
+
+# Needed for dbm python module
+EXTRA_OECONF = "-enable-libgdbm-compat"
+
+# Stop presence of dbm/nbdm on the host contaminating builds
+CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install_append () {
+    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other packages to find
+    # these headers
+    install -d ${D}${includedir}/gdbm
+    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
+    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
+}
+
+RDEPENDS_${PN}-ptest += "diffutils"
+
+do_compile_ptest() {
+    oe_runmake -C tests buildtests
+}
+
+PACKAGES =+ "${PN}-compat \
+            "
+FILES_${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS} \
+                     "
-- 
2.7.4


