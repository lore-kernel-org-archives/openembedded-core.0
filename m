Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D6C0E76FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539671"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:16 +0300
Message-Id: <5a95fbeee8fe4cf2055400b1e69ecfb5b3b45ddc.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/12] python-async: update to 0.6.2
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:54 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/{python-async_0.6.1.bb => python-async_0.6.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-async_0.6.1.bb => python-async_0.6.2.bb} (77%)

diff --git a/meta/recipes-devtools/python/python-async_0.6.1.bb b/meta/recipes-devtools/python/python-async_0.6.2.bb
similarity index 77%
rename from meta/recipes-devtools/python/python-async_0.6.1.bb
rename to meta/recipes-devtools/python/python-async_0.6.2.bb
index 1794820..8ed0b03 100644
--- a/meta/recipes-devtools/python/python-async_0.6.1.bb
+++ b/meta/recipes-devtools/python/python-async_0.6.2.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
 
 SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
-SRC_URI[md5sum] = "6f0e2ced1fe85f8410b9bde11be08587"
-SRC_URI[sha256sum] = "41d14cc0456e03f34d13af284f65821d07d05c20e621bcaebd38f9ab5095d5d1"
+SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
+SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
 S = "${WORKDIR}/async-${PV}"
 
-- 
2.1.4


