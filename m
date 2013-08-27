Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D34AD61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:00:10 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Aug 2013 08:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,968,1367996400"; d="scan'208";a="287368505"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Aug 2013 08:00:10 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 17:59:35 +0300
Message-Id: <1a3ab5e723c4bffe25866b3e926bb90c51c36dc2.1377613447.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
Subject: [PATCH 1/5] python-docutils: add version 0.11 from meta-oe
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
X-List-Received-Date: Tue, 27 Aug 2013 15:00:11 -0000

Docutils is a text processing system for processing plaintext
documentation into useful formats(HTML, XML, man-pages). This is
required by the Midori web-browser.

* Update 0.5 from meta-oe to 0.11.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../python/python-docutils_0.11.bb                 |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-docutils_0.11.bb

diff --git a/meta/recipes-devtools/python/python-docutils_0.11.bb b/meta/recipes-devtools/python/python-docutils_0.11.bb
new file mode 100644
index 0000000..7987244
--- /dev/null
+++ b/meta/recipes-devtools/python/python-docutils_0.11.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Text processing system"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "PSF & BSD-2-Clause & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=da0d261d1db78ab21ce86c79364a4098"
+
+DEPENDS = "python"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
+SRC_URI[md5sum] = "20ac380a18b369824276864d98ec0ad6"
+SRC_URI[sha256sum] = "9af4166adf364447289c5c697bb83c52f1d6f57e77849abcccd6a4a18a5e7ec9"
+
+S = "${WORKDIR}/docutils-${PV}"
+
+inherit distutils
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.9.5


