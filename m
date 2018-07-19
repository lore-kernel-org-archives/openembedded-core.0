Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 974F678A9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:49:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6JEn3uF021803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jul 2018 07:49:03 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 19 Jul 2018 07:49:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 22:59:05 +0800
Message-ID: <0d2dc731b289b393f4d5b379292954d1c275138c.1532012164.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532012164.git.hongxu.jia@windriver.com>
References: <cover.1532012164.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 19 Jul 2018 14:49:02 -0000
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
index ab1c013..6dd772d 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -13,9 +13,6 @@ SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a9
 
 DEPENDS += "${PYTHON_PN}"
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR} \
-                           --script-dir=${bindir}"
-
 RDEPENDS_${PN} = "\
   ${PYTHON_PN}-compile \
   ${PYTHON_PN}-compression \
-- 
2.7.4


