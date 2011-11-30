Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVYDv-0008Eo-NF
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:40:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 16:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81378104"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 16:33:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:33:44 -0800
Message-Id: <0aaf7849338974834bc560e3c7b57fc110631c03.1322606832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
Subject: [PATCH 08/11] clutter-box2d: Update git recipe
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
X-List-Received-Date: Wed, 30 Nov 2011 00:40:32 -0000

Several changes and fixes exist unreleased in git with version 0.12.1,
update to build the latest available.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index bfd46b2..554ce81 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -2,12 +2,13 @@ require clutter-box2d.inc
 
 LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6b"
 
-SRCREV = "4799ac10ae8cb7da936a2b999aba58fe62eb1ee3"
-PV = "0.10.1+git${SRCPV}"
+SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
+PV = "0.12.1+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.gnome.org/clutter-box2d.git"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "clutter-1.6"
+DEPENDS += "clutter-1.8"
+PROVIDES = "clutter-box2d-1.6"
-- 
1.7.7.3



