Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 719E2787ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341201"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:55 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:33 -0800
Message-Id: <aee5b03920d42363ae719f8a6f1f0cdac11ddee4.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 12/13] python3-iniparse: use pypi.bbclass
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
X-List-Received-Date: Thu, 23 Nov 2017 18:14:54 -0000

* Simplify recipe by using pypi.bbclass

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python3-iniparse_0.4.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-iniparse_0.4.bb b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
index f51ce647c9..4eba9ecd34 100644
--- a/meta/recipes-devtools/python/python3-iniparse_0.4.bb
+++ b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
@@ -4,17 +4,14 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE-PSF;md5=1c78a5bb3584b353496d5f6f34edb4b2 \
                     file://LICENSE;md5=52f28065af11d69382693b45b5a8eb54"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/i/iniparse/iniparse-${PV}.tar.gz \
-           file://0001-Add-python-3-compatibility.patch "
+SRC_URI = "file://0001-Add-python-3-compatibility.patch "
+
 SRC_URI[md5sum] = "5e573e9e9733d97623881ce9bbe5eca6"
 SRC_URI[sha256sum] = "abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054"
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/iniparse/"
 
-inherit distutils3
+inherit pypi distutils3
 
 RDEPENDS_${PN} += "python3-core python3-six"
 DEPENDS += "python3-six"
 
 BBCLASSEXTEND = "native nativesdk"
-
-S = "${WORKDIR}/iniparse-${PV}"
-- 
2.13.6


