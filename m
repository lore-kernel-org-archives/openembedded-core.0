Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 06601784D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279577"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:43 +0300
Message-Id: <d8d07071866bfeac6bccb8e50f099d9cb3113d2a.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/32] icu: update to 59.1
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:28 -0000

License checksum change due to copyright year update.

Latest icu will not compile with anything less than C++11, so
drop the enforcement of an earlier C++ version. This should be okay,
as there is now a fix in place for the problem of mixing native gcc 4/5
compiled code:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=c21cec84886d9c70396e9be0ceb9a8ef300b54be

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/uninative-flags.inc          | 4 ----
 meta/recipes-support/icu/{icu_58.2.bb => icu_59.1.bb} | 6 +++---
 2 files changed, 3 insertions(+), 7 deletions(-)
 rename meta/recipes-support/icu/{icu_58.2.bb => icu_59.1.bb} (77%)

diff --git a/meta/conf/distro/include/uninative-flags.inc b/meta/conf/distro/include/uninative-flags.inc
index f5b15471a4b..febf2a53e52 100644
--- a/meta/conf/distro/include/uninative-flags.inc
+++ b/meta/conf/distro/include/uninative-flags.inc
@@ -1,7 +1,3 @@
-# icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
-# therefore pass one
-BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
-
 # Some distros (ubuntu 16.10, debian-testing) default to gcc configured with
 # --enable-default-pie (see gcc -v). This breaks e.g. prelink-native on a pie
 # default system if binutils-native was built on a system which is not pie default
diff --git a/meta/recipes-support/icu/icu_58.2.bb b/meta/recipes-support/icu/icu_59.1.bb
similarity index 77%
rename from meta/recipes-support/icu/icu_58.2.bb
rename to meta/recipes-support/icu/icu_59.1.bb
index 4d062ebf941..55087c336dc 100644
--- a/meta/recipes-support/icu/icu_58.2.bb
+++ b/meta/recipes-support/icu/icu_59.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=1b3b75c1777cd49ad5c6a24cd338cfc9"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=fe9e1f2c500466d8f18df2cd068e4b74"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -21,8 +21,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "fac212b32b7ec7ab007a12dff1f3aea1"
-SRC_URI[sha256sum] = "2b0a4410153a9b20de0e20c7d8b66049a72aef244b53683d0d7521371683da0c"
+SRC_URI[md5sum] = "54923fa9fab5b2b83f235fb72523de37"
+SRC_URI[sha256sum] = "7132fdaf9379429d004005217f10e00b7d2319d0fea22bdfddef8991c45b75fe"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.11.0


