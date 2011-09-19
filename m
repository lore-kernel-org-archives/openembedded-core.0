Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R5Uit-0006fQ-RN
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 05:40:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Sep 2011 20:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,403,1312182000"; d="scan'208";a="18313584"
Received: from unknown (HELO [10.255.14.162]) ([10.255.14.162])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Sep 2011 20:35:33 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 22:35:17 -0500
Message-ID: <1316403317.2404.15.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 2/2] sysprof: update to version 1.1.8
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
X-List-Received-Date: Mon, 19 Sep 2011 03:40:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Also removes unused SCR_URI checksums.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 1af5822..10bde04 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ libglade"
 
-SRCREV = "38a6af1f0a45e528fd2842983da71e0f23c70d6a"
-PR = r1
-PV = "1.1.6+git${SRCPV}"
+SRCREV = "4692f85f625f4fd969cef4ab5dc47cc4655c87f9"
+PR = "r2"
+PV = "1.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/sysprof;protocol=git \
            file://define-NT_GNU_BUILD_ID.patch \
@@ -16,9 +16,6 @@ SRC_URI_append_arm  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
 SRC_URI_append_powerpc = " file://ppc-macro-fix.patch"
 
-SRC_URI[md5sum]    = "80902a7b3d6f7cb83eb6b47e87538747"
-SRC_URI[sha256sum] = "1c6403278fa4f3b37a1fb9f0784e496dce1703fe84ac03b2650bf469133a0cb3"
-
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
1.7.0.4





