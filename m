Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7C87F731B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739841"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:42 +0200
Message-Id: <18b02c02edcd10a9f5f14e18ca32f37572d54350.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/17] python3-pip: update to 7.1.2
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/{python3-pip_6.1.1.bb => python3-pip_7.1.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_6.1.1.bb => python3-pip_7.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pip_6.1.1.bb b/meta/recipes-devtools/python/python3-pip_7.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pip_6.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_7.1.2.bb
index 58916d4..297b351 100644
--- a/meta/recipes-devtools/python/python3-pip_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_7.1.2.bb
@@ -10,8 +10,8 @@ DEPENDS += "python3 python3-setuptools-native"
 SRC_URI = " \
   http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "6b19e0a934d982a5a4b798e957cb6d45"
-SRC_URI[sha256sum] = "89f3b626d225e08e7f20d85044afa40f612eb3284484169813dc2d0631f2a556"
+SRC_URI[md5sum] = "3823d2343d9f3aaab21cf9c917710196"
+SRC_URI[sha256sum] = "ca047986f0528cfa975a14fb9f7f106271d4e0c3fe1ddced6c1db2e7ae57a477"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pip"
 
-- 
2.6.2


