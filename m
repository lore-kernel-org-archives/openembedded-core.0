Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaKXS-00043x-BX
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 07:09:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2012 21:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,276,1352102400"; d="scan'208";a="221530195"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2012 21:54:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2012 21:54:35 -0800
Message-Id: <cc96780d9f6b4ee20936802862eef1649f764416.1353304234.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
Subject: [PATCH 02/17] libcheck: Update to 0.9.9
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
X-List-Received-Date: Mon, 19 Nov 2012 06:09:18 -0000

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



