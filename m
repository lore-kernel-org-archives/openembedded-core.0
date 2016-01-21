Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6F971E63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 17:57:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 21 Jan 2016 09:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,326,1449561600"; d="scan'208";a="33728874"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2016 09:57:11 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 17:58:00 +0000
Message-Id: <963acd46a261201df3f0bbb7bf882204c9d98bd0.1453399031.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453399031.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453399031.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3-pip: Upgrade to 8.0.0
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
X-List-Received-Date: Thu, 21 Jan 2016 17:57:17 -0000

LIC_FILES_CHKSUM changed, but LICESE still applies, dates changed

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/{python3-pip_7.1.2.bb => python3-pip_8.0.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_7.1.2.bb => python3-pip_8.0.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pip_7.1.2.bb b/meta/recipes-devtools/python/python3-pip_8.0.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pip_7.1.2.bb
rename to meta/recipes-devtools/python/python3-pip_8.0.0.bb
index 297b351..834ecda 100644
--- a/meta/recipes-devtools/python/python3-pip_7.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_8.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "The PyPA recommended tool for installing Python packages"
 sHOMEPAGEsss = "https://pypi.python.org/pypi/pip"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
 SRCNAME = "pip"
 DEPENDS += "python3 python3-setuptools-native"
@@ -10,8 +10,8 @@ DEPENDS += "python3 python3-setuptools-native"
 SRC_URI = " \
   http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "3823d2343d9f3aaab21cf9c917710196"
-SRC_URI[sha256sum] = "ca047986f0528cfa975a14fb9f7f106271d4e0c3fe1ddced6c1db2e7ae57a477"
+SRC_URI[md5sum] = "5601c4323464add1482291634142894d"
+SRC_URI[sha256sum] = "90112b296152f270cb8dddcd19b7b87488d9e002e8cf622e14c4da9c2f6319b1"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pip"
 
-- 
1.8.4.5


