Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8Cyf-0004vZ-3w
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:52:33 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 93DFE2FEA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 11:22:57 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 08:22:56 -0700
Message-Id: <d06312446b38e41e99dc21b145d1d85e85472dce.1331824888.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 93DFE2FEA2.5CAE8
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/4] at: upgrade to 3.1.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 15:52:33 -0000

Moved patches into a common directory.
Added SOB to use-ldflags.patch.
Removed nonstripbinaries patch which was included in this release.
Minor formatting cleanups.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../at/{at_3.1.12.bb => at_3.1.13.bb}              |   13 ++++-----
 .../configure-add-enable-pam.patch                 |    0
 .../at/{at-3.1.12 => files}/configure.patch        |    0
 .../fix_parallel_build_error.patch                 |    0
 .../at/files/nonstripbinaries.patch                |   26 --------------------
 .../at/{at-3.1.12 => files}/pam.conf.patch         |    0
 meta/recipes-extended/at/files/use-ldflags.patch   |    5 ++-
 7 files changed, 9 insertions(+), 35 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.12.bb => at_3.1.13.bb} (88%)
 rename meta/recipes-extended/at/{at-3.1.12 => files}/configure-add-enable-pam.patch (100%)
 rename meta/recipes-extended/at/{at-3.1.12 => files}/configure.patch (100%)
 rename meta/recipes-extended/at/{at-3.1.12 => files}/fix_parallel_build_error.patch (100%)
 delete mode 100644 meta/recipes-extended/at/files/nonstripbinaries.patch
 rename meta/recipes-extended/at/{at-3.1.12 => files}/pam.conf.patch (100%)

diff --git a/meta/recipes-extended/at/at_3.1.12.bb b/meta/recipes-extended/at/at_3.1.13.bb
similarity index 88%
rename from meta/recipes-extended/at/at_3.1.12.bb
rename to meta/recipes-extended/at/at_3.1.13.bb
index f2017b7..bcc08aa 100644
--- a/meta/recipes-extended/at/at_3.1.12.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -11,12 +11,11 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r7"
+PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
     file://use-ldflags.patch \
-    file://nonstripbinaries.patch \
     file://fix_parallel_build_error.patch \
     file://posixtm.c \
     file://posixtm.h \
@@ -27,8 +26,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "1e67991776148fb319fd77a2e599a765"
-SRC_URI[sha256sum] = "7c55c6ab4fbe8add9e68f31b2b0ebf3fe805c9a4e7cfb2623a3d8a4789cc18f3"
+SRC_URI[md5sum] = "1da61af6c29e323abaaf13ee1a8dad79"
+SRC_URI[sha256sum] = "3a8b90868d615d21a92f4986ea9a823886329af8fae8dd7ab4eed9b273bca072"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
@@ -39,6 +38,8 @@ EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
 
 inherit autotools
 
+PARALLEL_MAKE = ""
+
 do_compile_prepend () {
 	cp -f ${WORKDIR}/posixtm.[ch] ${S}
 }
@@ -49,7 +50,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${sysconfdir}/rcS.d
 	install -m 0755    ${WORKDIR}/S99at		${D}${sysconfdir}/init.d/atd
-	ln -sf		../init.d/atd		${D}${sysconfdir}/rcS.d/S99at
+	ln -sf ../init.d/atd ${D}${sysconfdir}/rcS.d/S99at
 	cp -r ${D}/usr/doc/at ${D}${docdir}/
 	rm -rf ${D}/usr/doc
 
@@ -60,5 +61,3 @@ do_install () {
 		fi
 	done
 }
-
-PARALLEL_MAKE = ""
diff --git a/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch b/meta/recipes-extended/at/files/configure-add-enable-pam.patch
similarity index 100%
rename from meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
rename to meta/recipes-extended/at/files/configure-add-enable-pam.patch
diff --git a/meta/recipes-extended/at/at-3.1.12/configure.patch b/meta/recipes-extended/at/files/configure.patch
similarity index 100%
rename from meta/recipes-extended/at/at-3.1.12/configure.patch
rename to meta/recipes-extended/at/files/configure.patch
diff --git a/meta/recipes-extended/at/at-3.1.12/fix_parallel_build_error.patch b/meta/recipes-extended/at/files/fix_parallel_build_error.patch
similarity index 100%
rename from meta/recipes-extended/at/at-3.1.12/fix_parallel_build_error.patch
rename to meta/recipes-extended/at/files/fix_parallel_build_error.patch
diff --git a/meta/recipes-extended/at/files/nonstripbinaries.patch b/meta/recipes-extended/at/files/nonstripbinaries.patch
deleted file mode 100644
index 2b251db..0000000
--- a/meta/recipes-extended/at/files/nonstripbinaries.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-#Because remove nonrootinstall patch, the stripping of the binaries can not
-#be handled.
-#This patch is to handle the stripping of the binaries.
-#Mei Lei<lei.mei@intel.com> make this change
-diff --git at-3.1.12.orig/Makefile.in at-3.1.12/Makefile.in
-index dae6b7d..71a5d89 100644
---- at-3.1.12.orig/Makefile.in
-+++ at-3.1.12/Makefile.in
-@@ -97,14 +97,14 @@ install: all
- 	chmod 600 $(IROOT)$(LFILE)
- 	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(IROOT)$(LFILE)
- 	test -f $(IROOT)$(etcdir)/at.allow || test -f $(IROOT)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(IROOT)$(etcdir)/
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s at $(IROOT)$(bindir)
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(IROOT)$(bindir)
- 	$(LN_S) -f at $(IROOT)$(bindir)/atq
- 	$(LN_S) -f at $(IROOT)$(bindir)/atrm
- 	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
- 	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
- 	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
- 	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 -s atd $(IROOT)$(sbindir)
-+	$(INSTALL) -g root -o root -m 755 atd $(IROOT)$(sbindir)
- 	$(INSTALL) -g root -o root -m 755 atrun $(IROOT)$(sbindir)
- 	$(INSTALL) -g root -o root -m 644 at.1 $(IROOT)$(man1dir)/
- 	cd $(IROOT)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
diff --git a/meta/recipes-extended/at/at-3.1.12/pam.conf.patch b/meta/recipes-extended/at/files/pam.conf.patch
similarity index 100%
rename from meta/recipes-extended/at/at-3.1.12/pam.conf.patch
rename to meta/recipes-extended/at/files/pam.conf.patch
diff --git a/meta/recipes-extended/at/files/use-ldflags.patch b/meta/recipes-extended/at/files/use-ldflags.patch
index fdd1908..4c69800 100644
--- a/meta/recipes-extended/at/files/use-ldflags.patch
+++ b/meta/recipes-extended/at/files/use-ldflags.patch
@@ -1,8 +1,9 @@
 Upstream-Status: Pending
 
-# Ensure use of $LDFLAGS during build
-# Derived from an OE patch for at-3.1.8
+Ensure use of $LDFLAGS during build
+Derived from an OE patch for at-3.1.8
 
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 --- at-3.1.12.orig/Makefile.in	2009-11-23 07:11:52.000000000 -0800
 +++ at-3.1.12/Makefile.in	2010-07-20 16:28:04.000000000 -0700
 @@ -65,13 +65,13 @@
-- 
1.7.5.4



