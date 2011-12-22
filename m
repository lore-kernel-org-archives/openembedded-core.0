Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbv-0005N8-NW
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233733"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:10 -0800
Message-Id: <37a5aea77feb1cb7fc49da533d895ac6f686ebaf.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/26] libidn: Upgrade to 1.23
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 08:02:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libidn/{libidn_1.22.bb => libidn_1.23.bb}      |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.22.bb => libidn_1.23.bb} (86%)

diff --git a/meta/recipes-extended/libidn/libidn_1.22.bb b/meta/recipes-extended/libidn/libidn_1.23.bb
similarity index 86%
rename from meta/recipes-extended/libidn/libidn_1.22.bb
rename to meta/recipes-extended/libidn/libidn_1.23.bb
index 9bdb322..851b5fc 100644
--- a/meta/recipes-extended/libidn/libidn_1.22.bb
+++ b/meta/recipes-extended/libidn/libidn_1.23.bb
@@ -12,8 +12,9 @@ PR = "r0"
 inherit pkgconfig autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "893a1df0cf3b28b72d248382eaeaca71"
-SRC_URI[sha256sum] = "2f765e868795f5478900ec9f42cb0ecc6ca22e2a85a62763c0b13c7da2f588ed"
+
+SRC_URI[md5sum] = "f9a417270cc9b6bf763ae1f88e60191c"
+SRC_URI[sha256sum] = "25b42d75851ebae52e1c969353b74eefd3d6817f41c8d2a6db258f5ec60c5e6a"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+
 # so package command into a separate package
-- 
1.7.6.4



