Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UDxU4-0006pR-Q2
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 14:37:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Mar 2013 05:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,807,1355126400"; d="scan'208";a="274068947"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2013 05:20:41 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 15:21:42 +0200
Message-Id: <1362748902-24053-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] package_deb.bbclass: set DPKG_ARCH_arm to "armel"
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
X-List-Received-Date: Fri, 08 Mar 2013 13:37:20 -0000

- the system should be using "armel" by default, not "arm"

[YOCTO #3741]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/package_deb.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 2f27800..3174184 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -7,6 +7,7 @@ inherit package
 IMAGE_PKGTYPE ?= "deb"
 
 DPKG_ARCH ?= "${TARGET_ARCH}" 
+DPKG_ARCH_arm ?= "armel"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
-- 
1.7.11.7



