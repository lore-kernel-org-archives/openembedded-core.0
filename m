Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B6BC86003C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Dec 2017 02:46:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2017 18:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,443,1508828400"; 
   d="scan'208";a="4567718"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by fmsmga007.fm.intel.com with ESMTP; 22 Dec 2017 18:46:31 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 18:46:17 -0800
Message-Id: <20171223024617.9674-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] bmap-tools: fix RDEPENDS and update SRC_URI
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
X-List-Received-Date: Sat, 23 Dec 2017 02:46:30 -0000

* RDEPENDS are now all the python3 versions
* Upstream SRC_URI has moved to github.com/intel/bmap-tools
* Missing RDEPENDS on python3-setuptools added
  - Provides import for pkg_resources

Fixes [YOCTO #12148]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
index 7454f9db75..70b6e91347 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
@@ -9,12 +9,12 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/01org/bmap-tools.git"
+SRC_URI = "git://github.com/intel/bmap-tools.git"
 SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} = "python-core python-compression python-mmap"
+RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools"
 
 inherit python3native
 inherit setuptools3
-- 
2.13.6


