Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47F0265EAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482007"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:13 -0700
Message-Id: <06c0930e320d25880f1fab734179e949b1ffce46.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 03/10] liburcu: Update to 0.8.4
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:40 -0000

Removed patch fixed upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-support/liburcu/liburcu/fixsepbuild.patch | 19 -------------------
 .../liburcu/{liburcu_0.8.1.bb => liburcu_0.8.4.bb}    |  6 +++---
 2 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/fixsepbuild.patch
 rename meta/recipes-support/liburcu/{liburcu_0.8.1.bb => liburcu_0.8.4.bb} (77%)

diff --git a/meta/recipes-support/liburcu/liburcu/fixsepbuild.patch b/meta/recipes-support/liburcu/liburcu/fixsepbuild.patch
deleted file mode 100644
index 9cd0ab9..0000000
--- a/meta/recipes-support/liburcu/liburcu/fixsepbuild.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Pending
-
-Fix out of tree build for doc examples
-
-Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
-
-Index: userspace-rcu-0.8.0/doc/examples/Makefile.am
-===================================================================
---- userspace-rcu-0.8.0.orig/doc/examples/Makefile.am	2013-08-30 21:25:20.000000000 +0300
-+++ userspace-rcu-0.8.0/doc/examples/Makefile.am	2013-10-21 17:52:34.774597179 +0300
-@@ -128,7 +128,7 @@
- 			cp -fR $(srcdir)/$$subdir $(builddir); \
- 		done; \
- 	fi
--	$(MAKE) -f dist-files/Makefile AM_CPPFLAGS="$(CPPFLAGS) -I../../../urcu/ -I../../../" AM_CFLAGS='$(CFLAGS)' AM_LDFLAGS='$(LDFLAGS) -L../../../.libs/ -Wl,-rpath="$(PWD)/../../.libs/"' $(AM_MAKEFLAGS) all
-+	$(MAKE) -f dist-files/Makefile AM_CPPFLAGS="$(CPPFLAGS) -I$(top_srcdir) -I../../../urcu/ -I../../../" AM_CFLAGS='$(CFLAGS)' AM_LDFLAGS='$(LDFLAGS) -L../../../.libs/ -Wl,-rpath="$(PWD)/../../.libs/"' $(AM_MAKEFLAGS) all
- 
- clean-local:
- 	$(MAKE) -f dist-files/Makefile $(AM_MAKEFLAGS) clean
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.1.bb b/meta/recipes-support/liburcu/liburcu_0.8.4.bb
similarity index 77%
rename from meta/recipes-support/liburcu/liburcu_0.8.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.8.4.bb
index a9e7b2c..cd7af24 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.4.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-           file://fixsepbuild.patch"
+          "
 
-SRC_URI[md5sum] = "c0c0613bcce3b6954a050faa6dec6f51"
-SRC_URI[sha256sum] = "8008f697b030d7d3043ebd3a72be63cefc9242ed2d50520d30211e3908a4e01e"
+SRC_URI[md5sum] = "2ca6671b20a550aa0e8020a1a9a96fd4"
+SRC_URI[sha256sum] = "96c0a157e94a15b1506efe9aedd98145e6eb41a3fbcf5b0d118b7a783b22fe12"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.8.3.1


