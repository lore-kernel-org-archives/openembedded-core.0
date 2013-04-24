Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7f2-0007V9-9R
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916445"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:04 -0700
Message-Id: <70336cc2bc8c3b890a4cb7d5765d3c688dc00714.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 11/18] libgcrypt: Update to 1.5.1
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:50 -0000

Remove automake patch as it is now supported by upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libgcrypt-1.5.0/obsolete_automake_macros.patch        | 15 ---------------
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb         |  9 ---------
 meta/recipes-support/libgcrypt/libgcrypt_1.5.1.bb         |  4 ++++
 3 files changed, 4 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.1.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch b/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
deleted file mode 100644
index 0dbfded..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [https://bugs.g10code.com/gnupg/issue1459]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libgcrypt-1.5.0/configure.ac libgcrypt-1.5.0/configure.ac
---- libgcrypt-1.5.0/configure.ac	2011-06-29 11:53:22.000000000 +0300
-+++ libgcrypt-1.5.0/configure.ac	2013-01-03 07:12:26.854793677 +0200
-@@ -59,7 +59,7 @@
-
- AC_CONFIG_SRCDIR([src/libgcrypt.vers])
- AM_INIT_AUTOMAKE([])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_LIBOBJ_DIR([compat])
- AC_CANONICAL_HOST
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
deleted file mode 100644
index 058c2d5..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libgcrypt.inc
-
-PR = "r2"
-
-SRC_URI += "file://obsolete_automake_macros.patch"
-
-SRC_URI[md5sum] = "78f8f8bec4580f75b25816f7896d0389"
-SRC_URI[sha256sum] = "cc98b1f64c9ae3b0185099cef4ac6c436a849095edf87f34157f0bb10e187990"
-
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.5.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.5.1.bb
new file mode 100644
index 0000000..fea0ab7
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.5.1.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "9963b67d84978727f5795e7ff92385de"
+SRC_URI[sha256sum] = "d7f5cb694286b24d91836c728dfcac9e8eead80a02c5e2ac78d8b84983154455"
-- 
1.8.0.2



