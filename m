Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Ua34K-0001ku-NI
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 14:02:02 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 52DCCD22DD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2013 13:43:28 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 13:43:56 +0200
Message-Id: <1368013438-15107-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/4] gdb: add 7.6 version
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
X-List-Received-Date: Wed, 08 May 2013 12:02:18 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/gdb/gdb-7.6.inc              | 11 ++++++++++
 .../gdb/gdb-7.6/gdbserver-cflags-last.diff         | 25 ++++++++++++++++++++++
 .../recipes-devtools/gdb/gdb-cross-canadian_7.6.bb |  5 +++++
 meta/recipes-devtools/gdb/gdb-cross_7.6.bb         |  4 ++++
 meta/recipes-devtools/gdb/gdb_7.6.bb               |  3 +++
 5 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb-7.6.inc
 create mode 100644 meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.6.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb_7.6.bb

diff --git a/meta/recipes-devtools/gdb/gdb-7.6.inc b/meta/recipes-devtools/gdb/gdb-7.6.inc
new file mode 100644
index 0000000..20c4ea1
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-7.6.inc
@@ -0,0 +1,11 @@
+LICENSE="GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+
+PR = "${INC_PR}.0"
+S = "${WORKDIR}/${BPN}-${PV}"
+
+SRC_URI[md5sum] = "a9836707337e5f7bf76a009a8904f470"
+SRC_URI[sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
diff --git a/meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff b/meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff
new file mode 100644
index 0000000..4dfc419
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-7.6/gdbserver-cflags-last.diff
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+---
+ gdb/gdbserver/Makefile.in |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- gdb/gdbserver/Makefile.in.orig
++++ gdb/gdbserver/Makefile.in
+@@ -118,14 +118,14 @@ WARN_CFLAGS_NO_FORMAT = `echo " $(WARN_C
+ # CFLAGS is specifically reserved for setting from the command line
+ # when running make.  I.E.  "make CFLAGS=-Wmissing-prototypes".
+ CFLAGS = @CFLAGS@
+ 
+ # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
+-INTERNAL_CFLAGS_BASE =  ${CFLAGS} ${GLOBAL_CFLAGS} \
++INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
+ 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
+ INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
+-INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
++INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS} -DGDBSERVER
+ 
+ # LDFLAGS is specifically reserved for setting from the command line
+ # when running make.
+ LDFLAGS = @LDFLAGS@
+ INTERNAL_LDFLAGS = $(LDFLAGS) @RDYNAMIC@
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
new file mode 100644
index 0000000..a2194a1
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
@@ -0,0 +1,5 @@
+require gdb-common.inc
+require gdb-cross-canadian.inc
+require gdb-7.6.inc
+
+GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.6.bb b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
new file mode 100644
index 0000000..62f6937
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
@@ -0,0 +1,4 @@
+require gdb-cross.inc
+require gdb-7.6.inc
+
+SRC_URI += "file://sim-install-6.6.patch"
diff --git a/meta/recipes-devtools/gdb/gdb_7.6.bb b/meta/recipes-devtools/gdb/gdb_7.6.bb
new file mode 100644
index 0000000..0c9818d
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb_7.6.bb
@@ -0,0 +1,3 @@
+require gdb.inc
+require gdb-7.6.inc
+
-- 
1.8.1.2



