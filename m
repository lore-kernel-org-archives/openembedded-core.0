Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlYA-0000K7-1F
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490581"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:21:00 -0800
Message-Id: <e464537313f464a8f3f183f1c4c93d90c77e078a.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
Subject: [PATCH 07/10] libcheck: Update to 0.9.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 22:35:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{libcheck_0.9.8.bb => libcheck_0.9.9.bb}       |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.9.8.bb => libcheck_0.9.9.bb} (74%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.9.8.bb b/meta/recipes-support/libcheck/libcheck_0.9.9.bb
similarity index 74%
rename from meta/recipes-support/libcheck/libcheck_0.9.8.bb
rename to meta/recipes-support/libcheck/libcheck_0.9.9.bb
index e988d47..5ccce7a 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.8.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.9.bb
@@ -5,14 +5,15 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
            file://libcheck_fix_for_automake-1.12.patch \
           "
 
-SRC_URI[md5sum] = "5d75e9a6027cde79d2c339ef261e7470"
-SRC_URI[sha256sum] = "82acf956bb07584ffea2bf04d5989fe939c3e74ecf93133a21037fd0f7996a7f"
+SRC_URI[md5sum] = "f3702f2fcfc19ce3f62dca66c241a168"
+SRC_URI[sha256sum] = "1a7a9abb9d051e1b9da4149ce651436a29e20135a40bdb202bd7b2bef3878ac9"
+
 S = "${WORKDIR}/check-${PV}"
 
 inherit autotools pkgconfig
-- 
1.7.7.6



