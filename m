Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AECD78CC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:51:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R8p9Be020609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:51:09 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:51:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 17:01:18 +0800
Message-ID: <4bf0c8a3692147bf218d2eb8553de81062cd22cd.1532682009.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532682009.git.liezhi.yang@windriver.com>
References: <cover.1532682009.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] python3-subunit: add it for oeqa
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
X-List-Received-Date: Fri, 27 Jul 2018 08:51:08 -0000
Content-Type: text/plain

- It is required by oeqa, add it so that we can add nativesdk-python3-subunit
  to buildtools-tarball.
- The original one is python-subunit_1.1.0.bb which is from meta-openstack
  layer, I divided it into python-subunit.inc and python3-subunit_1.1.0.bb
  and extended to nativesdk.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-subunit.inc       | 14 ++++++++++++++
 meta/recipes-devtools/python/python3-subunit_1.1.0.bb |  2 ++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-subunit.inc
 create mode 100644 meta/recipes-devtools/python/python3-subunit_1.1.0.bb

diff --git a/meta/recipes-devtools/python/python-subunit.inc b/meta/recipes-devtools/python/python-subunit.inc
new file mode 100644
index 0000000..e2edc20
--- /dev/null
+++ b/meta/recipes-devtools/python/python-subunit.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Python implementation of subunit test streaming protocol"
+HOMEPAGE = "https://pypi.python.org/pypi/python-subunit/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README;md5=e5b524e1b2c67c88fc64439ee4a850aa"
+
+PYPI_PACKAGE = "python-subunit"
+
+SRC_URI[md5sum] = "d2c09c93346077ced675c9f718e6a0f1"
+SRC_URI[sha256sum] = "d9a7606e9610828d68c1d2f0f5abbb421e34e518b8f4882c8b2e08176281bf88"
+
+inherit pypi
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-subunit_1.1.0.bb b/meta/recipes-devtools/python/python3-subunit_1.1.0.bb
new file mode 100644
index 0000000..2ece445
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-subunit_1.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-subunit.inc
-- 
2.7.4


