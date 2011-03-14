Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Pz73j-0006HV-0m
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 13:39:39 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2011 05:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,315,1297065600"; d="scan'208";a="897016424"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2011 05:01:41 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Pz6MI-0005Fv-BH; Mon, 14 Mar 2011 19:54:46 +0800
Message-Id: <d3e843d9e26a4954fa77a21dbfa7f756fad9dbd4.1300103431.git.qing.he@intel.com>
In-Reply-To: <cover.1300103431.git.qing.he@intel.com>
References: <cover.1300103431.git.qing.he@intel.com>
Old-Date: Mon, 14 Mar 2011 13:40:52 +0800
Date: Mon, 14 Mar 2011 19:54:46 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 3/4] zypper: add machine arch support
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
X-List-Received-Date: Mon, 14 Mar 2011 12:39:39 -0000

From: Qing He <qing.he@intel.com>

Since libzypp is now of ${MACHINE_ARCH}, change zypper to base
on this arch to.

Signed-off-by: Qing He <qing.he@intel.com>
---
 meta/recipes-extended/zypper/zypper_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index af6bd49..9258477 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 
 DEPENDS  = "libzypp augeas"
 RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
-PR = "r4"
+PR = "r5"
 
 inherit cmake
 
@@ -18,3 +18,5 @@ SRC_URI = "git://gitorious.org/opensuse/zypper.git;protocol=git \
 S = "${WORKDIR}/git"
 
 PV = "1.5.3-git${SRCPV}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.0



