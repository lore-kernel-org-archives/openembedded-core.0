Return-Path: <cristiana.voicu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 362C66B59C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:45:25 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2013 06:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,839,1367996400"; d="scan'208";a="279405811"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 06:45:23 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 16:46:12 +0300
Message-Id: <06a01304db7ca6bc605947b809400868dfe72b67.1375969277.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
References: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1375969277.git.cristiana.voicu@intel.com>
References: <cover.1375969277.git.cristiana.voicu@intel.com>
Subject: [PATCH 4/5] systemtap: upgrade to 2.3
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
X-List-Received-Date: Thu, 08 Aug 2013 13:45:25 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb  |    2 --
 meta/recipes-kernel/systemtap/systemtap_git.inc |    4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 9bba5a9..a0db074 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -10,8 +10,6 @@ RDEPENDS_${PN} += "python bash"
 RDEPENDS_${PN}_class-native += "python-native"
 RDEPENDS_${PN}_class-nativesdk += "python-native"
 
-PR = "r1"
-
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi \
             --disable-server --disable-grapher "
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 7be6c2b..0632746 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,8 +1,8 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "addec813fed4c712d6ea752f6e4f23e602b87fad"
-PV = "2.1+git${SRCPV}"
+SRCREV = "e58138572ebddac9498b93c76770eeca7d45e3b1"
+PV = "2.3+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
-- 
1.7.9.5


