Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B42966FF84
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661879"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:23 +0200
Message-Id: <37b3aef972a744e53c1f2b36875a0984c0d5326c.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/10] python-setuptools: update to 18.7.1
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:09 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{python-setuptools_18.2.bb => python-setuptools_18.7.1.bb}       | 5 +++--
 .../{python3-setuptools_18.2.bb => python3-setuptools_18.7.1.bb}     | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_18.2.bb => python-setuptools_18.7.1.bb} (84%)
 rename meta/recipes-devtools/python/{python3-setuptools_18.2.bb => python3-setuptools_18.7.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python-setuptools_18.2.bb b/meta/recipes-devtools/python/python-setuptools_18.7.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python-setuptools_18.2.bb
rename to meta/recipes-devtools/python/python-setuptools_18.7.1.bb
index 1de2b2e..1cc8774 100644
--- a/meta/recipes-devtools/python/python-setuptools_18.2.bb
+++ b/meta/recipes-devtools/python/python-setuptools_18.7.1.bb
@@ -14,8 +14,9 @@ DEPENDS_class-native += "python-native"
 inherit distutils
 
 SRC_URI = "https://pypi.python.org/packages/source/s/setuptools/setuptools-${PV}.tar.gz"
-SRC_URI[md5sum] = "52b4e48939ef311d7204f8fe940764f4"
-SRC_URI[sha256sum] = "0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
+SRC_URI[md5sum] = "a0984da9cd8d7b582e1fd7de67dfdbcc"
+SRC_URI[sha256sum] = "aff36c95035e0b311eacb1434e3f7e85f5ccaad477773847e582978f8f45bd74"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_18.2.bb b/meta/recipes-devtools/python/python3-setuptools_18.7.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools_18.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_18.7.1.bb
index 5687e30..eaf6e47 100644
--- a/meta/recipes-devtools/python/python3-setuptools_18.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_18.7.1.bb
@@ -11,9 +11,8 @@ DEPENDS_class-native += "python3-native"
 SRC_URI = " \
   http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "52b4e48939ef311d7204f8fe940764f4"
-SRC_URI[sha256sum] = "0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
-
+SRC_URI[md5sum] = "a0984da9cd8d7b582e1fd7de67dfdbcc"
+SRC_URI[sha256sum] = "aff36c95035e0b311eacb1434e3f7e85f5ccaad477773847e582978f8f45bd74"
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
2.6.2


