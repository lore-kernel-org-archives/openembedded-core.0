Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B2F3970031
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287631"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:15 +0000
Message-Id: <e65d444e65c265b7d85a49ff7bec93a20c4aeec6.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 9/9] python3-pip: Upgrade from 8.0.0 to 8.1.2
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:11 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/{python3-pip_8.0.0.bb => python3-pip_8.1.2.bb}        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_8.0.0.bb => python3-pip_8.1.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pip_8.0.0.bb b/meta/recipes-devtools/python/python3-pip_8.1.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pip_8.0.0.bb
rename to meta/recipes-devtools/python/python3-pip_8.1.2.bb
index 834ecda..e319dff 100644
--- a/meta/recipes-devtools/python/python3-pip_8.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_8.1.2.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 SRCNAME = "pip"
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI = " \
-  http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "5601c4323464add1482291634142894d"
-SRC_URI[sha256sum] = "90112b296152f270cb8dddcd19b7b87488d9e002e8cf622e14c4da9c2f6319b1"
+SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "87083c0b9867963b29f7aba3613e8f4a"
+SRC_URI[sha256sum] = "4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pip"
 
-- 
2.6.6


