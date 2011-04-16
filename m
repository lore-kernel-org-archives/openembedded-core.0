Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzS7-0006IC-34
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 23:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="679865959"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2011 23:55:36 -0700
Message-Id: <9b5c2e08ce461631062001f63a119f63984db8f1.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 16:11:08 +0800
Date: Fri, 15 Apr 2011 23:55:36 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 50/58] openssl: upgrade to version 0.9.8r
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:56 -0000

From: Qing He <qing.he@intel.com>

[YOCTO #979]

from 0.9.8p
fixes CVE-2010-4180, CVE-2010-4252, CVE-2010-0014

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../configure-targets.patch                        |    1 +
 .../debian/ca.patch                                |    0
 .../debian/config-hurd.patch                       |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/engines-path.patch                      |    0
 .../debian/kfreebsd-pipe.patch                     |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/perl-path.diff                          |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/rc4-amd64.patch                         |    0
 .../debian/rehash-crt.patch                        |    0
 .../debian/rehash_pod.patch                        |    0
 .../debian/series                                  |    0
 .../debian/shared-lib-ext.patch                    |    0
 .../debian/stddef.patch                            |    0
 .../debian/version-script.patch                    |    0
 .../parallel-make-fix.patch                        |    2 ++
 .../shared-libs.patch                              |    2 ++
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../{openssl_0.9.8p.bb => openssl_0.9.8r.bb}       |    6 +++---
 25 files changed, 9 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/configure-targets.patch (97%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/config-hurd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/engines-path.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/kfreebsd-pipe.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/perl-path.diff (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/rc4-amd64.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/rehash-crt.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/rehash_pod.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/series (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/shared-lib-ext.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/stddef.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/parallel-make-fix.patch (95%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/shared-libs.patch (97%)
 rename meta/recipes-connectivity/openssl/{openssl_0.9.8p.bb => openssl_0.9.8r.bb} (86%)

diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/configure-targets.patch
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/configure-targets.patch
index 6fd2769..2317949 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8p/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/configure-targets.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 
 The number of colons are important :)
 
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/config-hurd.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/config-hurd.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/engines-path.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/engines-path.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/kfreebsd-pipe.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/kfreebsd-pipe.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/perl-path.diff b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/perl-path.diff
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/pkg-config.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/rc4-amd64.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/rc4-amd64.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/rehash-crt.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/rehash-crt.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/rehash_pod.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/rehash_pod.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/series b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/series
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/series
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/series
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/shared-lib-ext.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/shared-lib-ext.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/stddef.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/stddef.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/parallel-make-fix.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch
similarity index 95%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/parallel-make-fix.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch
index 60fab9d..bfddfc8 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8p/parallel-make-fix.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 fix the parallel build regarding shared libraries.
 
 Signed-off-by: Qing He <qing.he@intel.com>
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/shared-libs.patch
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8p/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8r/shared-libs.patch
index 10d9146..19de112 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8p/shared-libs.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/shared-libs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/Makefile.org b/Makefile.org
 index e87d623..25ff367 100644
 --- a/Makefile.org
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 68b3d7b..fe168c3 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -6,7 +6,7 @@ SECTION = "libs/network"
 
 # "openssl | SSLeay" dual license
 LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=83d26c69f6f0172ee7f795790424b453"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
 DEPENDS = "perl-native"
 
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8p.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
similarity index 86%
rename from meta/recipes-connectivity/openssl/openssl_0.9.8p.bb
rename to meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index f42b3cb..5fc38a3 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r3"
+PR = "r0"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
@@ -21,8 +21,8 @@ SRC_URI += "file://debian/ca.patch \
             file://debian/version-script.patch \
             file://debian/perl-path.diff"
 
-SRC_URI[md5sum] = "7f24047f70364c9eabc94899e356ce39"
-SRC_URI[sha256sum] = "b2645e2a2af221fa230b5ef6aa2b9388a875801b74cbddbb16be557f80f45242"
+SRC_URI[md5sum] = "0352932ea863bc02b056cda7c9ac5b79"
+SRC_URI[sha256sum] = "42b2368f786b05ed3be846838dce126b4e8e3dba8fb2e0ce83102df28c102fad"
 
 SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch"
-- 
1.7.1.1



