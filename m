Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 194177F0EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 05:55:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2019 22:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="187929465"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.185.125])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2019 22:55:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 13:55:27 +0800
Message-Id: <20190719055529.25447-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] python: include CVE patches for python-native as well
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
X-List-Received-Date: Fri, 19 Jul 2019 05:55:33 -0000
Content-Transfer-Encoding: 8bit

Also avoids maintaining a different set of patches for both.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python.inc       | 5 +++++
 meta/recipes-devtools/python/python_2.7.16.bb | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 779df53521..8d0e90862c 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -8,6 +8,11 @@ INC_PR = "r1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://bpo-35907-cve-2019-9948.patch \
+           file://bpo-35907-cve-2019-9948-fix.patch \
+           file://bpo-36216-cve-2019-9636.patch \
+           file://bpo-36216-cve-2019-9636-fix.patch \
+           file://CVE-2019-9740.patch \
            "
 
 SRC_URI[md5sum] = "30157d85a2c0479c09ea2cbe61f2aaf5"
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index b943a89885..c093f84a35 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -30,11 +30,6 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
-    file://bpo-35907-cve-2019-9948.patch \
-    file://bpo-35907-cve-2019-9948-fix.patch \
-    file://bpo-36216-cve-2019-9636.patch \
-    file://bpo-36216-cve-2019-9636-fix.patch \
-    file://CVE-2019-9740.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.20.1


