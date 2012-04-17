Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKGNY-0001IB-R6
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 23:56:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2012 14:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133663351"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2012 14:46:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 14:46:32 -0700
Message-Id: <cad24a8ebe31104e0521b419a32b06b4cec3f93f.1334699033.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334699033.git.sgw@linux.intel.com>
References: <cover.1334699033.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334699033.git.sgw@linux.intel.com>
References: <cover.1334699033.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] lsb: Add DISTRO Info to the lsb-release
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
X-List-Received-Date: Tue, 17 Apr 2012 21:56:05 -0000

This is needed for distro checking code in the self-hosted-image

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index f2f25ba..e414d93 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -4,6 +4,8 @@ HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
 PR = "r2"
 
+DEPENDS="util-linux"
+
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}.tar.gz \
@@ -31,6 +33,9 @@ do_install(){
 		echo -n "core-4.1-${TARGET_ARCH}" >>  ${D}/etc/lsb-release
 	fi
 	echo "\"" >> ${D}/etc/lsb-release
+	echo "DISTRIB_ID=${DISTRO}" >> ${D}/etc/lsb-release
+	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}/etc/lsb-release
+	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}/etc/lsb-release
 	
 	if [ "${TARGET_ARCH}" == "i586" ];then
 		mkdir -p ${D}/etc/lsb-release.d
-- 
1.7.7.6



