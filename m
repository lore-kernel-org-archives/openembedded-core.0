Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 13B466093B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 22:49:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 30 Oct 2017 15:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,321,1505804400"; d="scan'208";a="169742790"
Received: from wsclemen-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.19])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2017 15:49:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Oct 2017 11:49:15 +1300
Message-Id: <20171030224915.32638-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Mon, 30 Oct 2017 22:49:56 -0000

Several of the recipes here were using http URLs for source hosted on
pypi - pypi apparently no longer supports http so switch to https
instead.

Fixes [YOCTO #12286].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 recipes-devtools/python/python-gevent_1.0.1.bb    | 2 +-
 recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
 recipes-devtools/python/python-sphinx_1.4.1.bb    | 2 +-
 recipes-devtools/python/python-webob_1.6.0.bb     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
index 47f1267..8ac1295 100644
--- a/recipes-devtools/python/python-gevent_1.0.1.bb
+++ b/recipes-devtools/python/python-gevent_1.0.1.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
 
 SRCNAME = "gevent"
 
-SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
 SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
 
diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
index 95d6eec..9814d3d 100644
--- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
+++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
@@ -14,7 +14,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
 
 SRCNAME = "M2Crypto"
-SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
            file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
 "
 
diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
index 835b369..b4ae86b 100644
--- a/recipes-devtools/python/python-sphinx_1.4.1.bb
+++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
 PR = "r0"
 SRCNAME = "Sphinx"
 
-SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
 SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.6.0.bb
index 71c74ff..93f2acf 100644
--- a/recipes-devtools/python/python-webob_1.6.0.bb
+++ b/recipes-devtools/python/python-webob_1.6.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
 PR = "r0"
 SRCNAME = "WebOb"
 
-SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
 SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
-- 
2.9.5


