Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIq-00041r-3O
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360932"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:37 -0700
Message-Id: <78d4a8d095faa3915e0a53ee2fb4afe6429928c2.1317193250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/29] sysprof: update to version 1.1.8
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:36 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

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
1.7.6



