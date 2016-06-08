Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 88312731D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287624"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:08 +0000
Message-Id: <14aa778dff99575ffddece33255feb1dcb4d6922.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/9] python-setuptools: Upgrade to 22.0.5
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

Source location changed on pypi, this must be changed on all other recipes as well,
License also changed to MIT

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc             | 10 +++++-----
 .../{python-setuptools_19.4.bb => python-setuptools_22.0.5.bb} |  0
 ...python3-setuptools_19.4.bb => python3-setuptools_22.0.5.bb} |  0
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_19.4.bb => python-setuptools_22.0.5.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_19.4.bb => python3-setuptools_22.0.5.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 0917e88..53a514b 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -1,16 +1,16 @@
 SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
 SECTION = "devel/python"
-LICENSE = "PSF | ZPL-2.0"
+LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://setup.py;beginline=78;endline=78;md5=8a314270dd7a8dbca741775415f1716e"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=134;endline=134;md5=3e8df024d6c1442d18e84acf8fbbc475"
 
 SRCNAME = "setuptools"
 
-SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c5a7d90c1e0acf8c4ec5c2bf31bc25b5"
-SRC_URI[sha256sum] = "214bf29933f47cf25e6faa569f710731728a07a19cae91ea64f826051f68a8cf"
+SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"
+SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_19.4.bb b/meta/recipes-devtools/python/python-setuptools_22.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_19.4.bb
rename to meta/recipes-devtools/python/python-setuptools_22.0.5.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_19.4.bb b/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_19.4.bb
rename to meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
-- 
2.6.6


