Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7P-00084I-If
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453925"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:59 -0700
Message-Id: <84d9cd65c43b69908e12b0fda4bcc8a56aa58792.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/19] ofono: upgrade to 1.6
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:55 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* 1.5 is not compatible with glib-2.32 and newer
  | In file included from gisi/client.h:30:0,
  |                  from gisi/client.c:33:
  |/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include/glib-2.0/glib/gtypes.h:28:2: error: #error "Only <glib.h> can be included directly."

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/ofono/ofono_1.5.bb |   14 --------------
 meta/recipes-connectivity/ofono/ofono_1.6.bb |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.5.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.6.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb b/meta/recipes-connectivity/ofono/ofono_1.5.bb
deleted file mode 100644
index dad813f..0000000
--- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ofono.inc
-
-PR = "r1"
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
-	          file://ofono"
-
-EXTRA_OECONF += "\
-    --enable-test \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
-"
-
-SRC_URI[md5sum] = "a54935a2a86b90300410c6c033284f6c"
-SRC_URI[sha256sum] = "3a70608c17f3dca34c1e057aacdf836021322dfdcaf9edc777119eafe48076b3"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.6.bb b/meta/recipes-connectivity/ofono/ofono_1.6.bb
new file mode 100644
index 0000000..386ffee
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
@@ -0,0 +1,15 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
+  file://ofono \
+"
+SRC_URI[md5sum] = "d863b2b650a525cf75056085398bc8ef"
+SRC_URI[sha256sum] = "63e38ea1cf35b00ecbab7611c6caa2adcd33eb10495f7a9f72013d4ab7a14c98"
+
+
+EXTRA_OECONF += "\
+    --enable-test \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+"
+
-- 
1.7.7.6



