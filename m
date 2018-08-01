Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 450DB78DD0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:03:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7183k5C022742
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 01:03:46 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 01:03:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 16:14:02 +0800
Message-ID: <e56d774b3fbf6f3d8f932f47fc1ff94910a0f5cc.1533111205.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533111205.git.liezhi.yang@windriver.com>
References: <cover.1533111205.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] python3-subunit: 1.1.0 -> 1.3.0
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
X-List-Received-Date: Wed, 01 Aug 2018 08:03:45 -0000
Content-Type: text/plain

The license file changes from README to README.rst, and the lines which
contains license info is from 1 to 20. The license is still Apache-2.0.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-subunit.inc                     | 6 +++---
 .../python/{python3-subunit_1.1.0.bb => python3-subunit_1.3.0.bb}   | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.1.0.bb => python3-subunit_1.3.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-subunit.inc b/meta/recipes-devtools/python/python-subunit.inc
index f893e7a..afaaa51 100644
--- a/meta/recipes-devtools/python/python-subunit.inc
+++ b/meta/recipes-devtools/python/python-subunit.inc
@@ -2,12 +2,12 @@ SUMMARY = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.python.org/pypi/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=e5b524e1b2c67c88fc64439ee4a850aa"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[md5sum] = "d2c09c93346077ced675c9f718e6a0f1"
-SRC_URI[sha256sum] = "d9a7606e9610828d68c1d2f0f5abbb421e34e518b8f4882c8b2e08176281bf88"
+SRC_URI[md5sum] = "16d468a3aeafe6c60a0c3b2b9132d65b"
+SRC_URI[sha256sum] = "9607edbee4c1e5a30ff88549ce8d9feb0b9bcbcb5e55033a9d76e86075465cbb"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-subunit_1.1.0.bb b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-subunit_1.1.0.bb
rename to meta/recipes-devtools/python/python3-subunit_1.3.0.bb
-- 
2.7.4


