Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC3C731A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739835"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:41 +0200
Message-Id: <e51bfd9752fbda255578e0d79b675461e5dcb97c.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/17] pytnon-pexpect: update to 4.0.1
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:23 -0000

LICENSE checksum changed to an additional copyright attribution line

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/{python-pexpect_3.3.bb => python-pexpect_4.0.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-pexpect_3.3.bb => python-pexpect_4.0.1.bb} (69%)

diff --git a/meta/recipes-devtools/python/python-pexpect_3.3.bb b/meta/recipes-devtools/python/python-pexpect_4.0.1.bb
similarity index 69%
rename from meta/recipes-devtools/python/python-pexpect_3.3.bb
rename to meta/recipes-devtools/python/python-pexpect_4.0.1.bb
index 5318405..7f142a3 100644
--- a/meta/recipes-devtools/python/python-pexpect_3.3.bb
+++ b/meta/recipes-devtools/python/python-pexpect_4.0.1.bb
@@ -2,11 +2,11 @@ SUMMARY = "A Pure Python Expect like Module for Python"
 HOMEPAGE = "http://pexpect.readthedocs.org/"
 SECTION = "devel/python"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c25d9a0770ba69a9965acc894e9f3644"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=66c2378a96b307d56bfb3a9e58edafa8"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/pexpect/pexpect-${PV}.tar.gz"
-SRC_URI[md5sum] = "0de72541d3f1374b795472fed841dce8"
-SRC_URI[sha256sum] = "dfea618d43e83cfff21504f18f98019ba520f330e4142e5185ef7c73527de5ba"
+SRC_URI[md5sum] = "056df81e6ca7081f1015b4b147b977b7"
+SRC_URI[sha256sum] = "232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
-- 
2.6.2


