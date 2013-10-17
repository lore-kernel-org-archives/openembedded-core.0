Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1115A6CFF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:24 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040013"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:25 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:12 +0300
Message-Id: <a9fc2ccfc12410d3fa3d83c5794b7d30f13f5b3d.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/8] python-setuptools: upgrade to 1.1.6
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:24 -0000

The license line moved to another line.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ptools_0.6c11.bb => python-setuptools_1.1.6.bb} |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_0.6c11.bb => python-setuptools_1.1.6.bb} (76%)

diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_1.1.6.bb
similarity index 76%
rename from meta/recipes-devtools/python/python-setuptools_0.6c11.bb
rename to meta/recipes-devtools/python/python-setuptools_1.1.6.bb
index f09a312..ddaa303 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_1.1.6.bb
@@ -2,10 +2,9 @@ DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=107;endline=107;md5=8a314270dd7a8dbca741775415f1716e"
 
 SRCNAME = "setuptools"
-PR = "ml5"
 DEPENDS += "python"
 DEPENDS_class-native += "python-native"
 
@@ -35,7 +34,7 @@ RDEPENDS_${PN}_class-native = "\
   python-compression \
 "
 
-SRC_URI[md5sum] = "7df2a529a074f613b509fb44feefe74e"
-SRC_URI[sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
+SRC_URI[md5sum] = "ee82ea53def4480191061997409d2996"
+SRC_URI[sha256sum] = "e5a60b88138def225c29cbf13ee20f1c176f200450e286dcc7d192963a67723a"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


