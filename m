Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UaMoB-0002iT-V7
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 11:07:15 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 09A80D20DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2013 10:48:06 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 10:48:35 +0200
Message-Id: <1368089317-27254-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <518A6122.5060309@linux.intel.com>
References: <518A6122.5060309@linux.intel.com>
Subject: [PATCH v2 1/3] gdb: add 7.6 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 09:07:42 -0000
X-List-Received-Date: Thu, 09 May 2013 09:07:42 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../gdb/{gdb_7.5.1.bb => gdb-7.6.inc}                |  5 +++--
 ...s-canadian_7.5.1.bb => gdb-cross-canadian_7.6.bb} |  5 +----
 .../gdb/{gdb-cross_7.5.1.bb => gdb-cross_7.6.bb}     |  5 +----
 .../gdb/gdb/gdbserver-cflags-last.diff               | 20 +++++++++++++-------
 meta/recipes-devtools/gdb/gdb_7.6.bb                 |  2 ++
 5 files changed, 20 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb_7.5.1.bb => gdb-7.6.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.5.1.bb => gdb-cross-canadian_7.6.bb} (67%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.5.1.bb => gdb-cross_7.6.bb} (56%)
 create mode 100644 meta/recipes-devtools/gdb/gdb_7.6.bb

diff --git a/meta/recipes-devtools/gdb/gdb_7.5.1.bb b/meta/recipes-devtools/gdb/gdb-7.6.inc
similarity index 70%
rename from meta/recipes-devtools/gdb/gdb_7.5.1.bb
rename to meta/recipes-devtools/gdb/gdb-7.6.inc
index 0645b56..00cb6ee 100644
--- a/meta/recipes-devtools/gdb/gdb_7.5.1.bb
+++ b/meta/recipes-devtools/gdb/gdb-7.6.inc
@@ -1,9 +1,10 @@
-require gdb.inc
 LICENSE="GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-PR = "${INC_PR}.0"
 
 S = "${WORKDIR}/${BPN}-${PV}"
+
+SRC_URI[md5sum] = "a9836707337e5f7bf76a009a8904f470"
+SRC_URI[sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
similarity index 67%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
index c15aa7a..a2194a1 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
@@ -1,8 +1,5 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
-
-PR = "${INC_PR}.0"
+require gdb-7.6.inc
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
-
-S = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
similarity index 56%
rename from meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.6.bb
index a14d0ba..62f6937 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
@@ -1,7 +1,4 @@
 require gdb-cross.inc
+require gdb-7.6.inc
 
 SRC_URI += "file://sim-install-6.6.patch"
-
-PR = "${INC_PR}.0"
-
-S = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
index 8256f17..4dfc419 100644
--- a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
+++ b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
@@ -1,10 +1,14 @@
 Upstream-Status: Pending
 
-Index: gdb/gdbserver/Makefile.in
-===================================================================
---- gdb/gdbserver/Makefile.in.orig	2011-03-09 23:32:02.000000000 -0800
-+++ gdb/gdbserver/Makefile.in	2011-08-05 21:16:43.592202579 -0700
-@@ -94,10 +94,10 @@
+---
+ gdb/gdbserver/Makefile.in |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- gdb/gdbserver/Makefile.in.orig
++++ gdb/gdbserver/Makefile.in
+@@ -118,14 +118,14 @@ WARN_CFLAGS_NO_FORMAT = `echo " $(WARN_C
+ # CFLAGS is specifically reserved for setting from the command line
+ # when running make.  I.E.  "make CFLAGS=-Wmissing-prototypes".
  CFLAGS = @CFLAGS@
  
  # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
@@ -12,8 +16,10 @@ Index: gdb/gdbserver/Makefile.in
 +INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
  INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
--INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS)
-+INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS}
+-INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
++INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS} -DGDBSERVER
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
+ LDFLAGS = @LDFLAGS@
+ INTERNAL_LDFLAGS = $(LDFLAGS) @RDYNAMIC@
diff --git a/meta/recipes-devtools/gdb/gdb_7.6.bb b/meta/recipes-devtools/gdb/gdb_7.6.bb
new file mode 100644
index 0000000..6b38812
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb_7.6.bb
@@ -0,0 +1,2 @@
+require gdb.inc
+require gdb-7.6.inc
-- 
1.8.1.2



