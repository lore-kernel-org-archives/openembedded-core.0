Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B95E78982
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:47:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I0l5cY016511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jul 2018 17:47:05 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 17 Jul 2018 17:47:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 18 Jul 2018 08:57:01 +0800
Message-ID: <8c23a9922f3670cdc069e6d7243d550f5693da79.1531875240.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1531875240.git.hongxu.jia@windriver.com>
References: <cover.1531875240.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] python-setuptools.inc: clean up useless local var-DISTUTILS_INSTALL_ARGS
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
X-List-Received-Date: Wed, 18 Jul 2018 00:47:05 -0000
Content-Type: text/plain

Since unify var-DISTUTILS_INSTALL_ARGS in distutils and setuptools,
The local var-DISTUTILS_INSTALL_ARGS broke do_install
...
error: option --script-dir not recognized
ERROR: python3 setup.py install execution failed.
...

[YOCTO #8446]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 25be446..512d1ce 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -16,9 +16,6 @@ DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
 DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR} \
-                           --script-dir=${bindir}"
-
 RDEPENDS_${PN}_class-native = "\
   ${PYTHON_PN}-distutils \
   ${PYTHON_PN}-compression \
-- 
2.7.4


