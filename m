Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1S01QE-0001qf-5R
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 02:55:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 17:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119901756"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.54])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 17:46:46 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 17:46:44 -0800
Message-Id: <490f81f39196d3186d8e6e519508ddd26118e827.1329875013.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1329875013.git.josh@linux.intel.com>
References: <cover.1329875013.git.josh@linux.intel.com>
In-Reply-To: <cover.1329875013.git.josh@linux.intel.com>
References: <cover.1329875013.git.josh@linux.intel.com>
Subject: [PATCH 3/3] netbase: remove redundant assignments
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
X-List-Received-Date: Wed, 22 Feb 2012 01:55:10 -0000

There's no need to explicitly set PACKAGE_ARCH = MACHINE_ARCH, base.bbclass
takes care of setting this value for us based on the interfaces for those
machines being an OVERRIDE.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/netbase/netbase_4.47.bb |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-core/netbase/netbase_4.47.bb
index ddfa8ad..3aa4915 100644
--- a/meta/recipes-core/netbase/netbase_4.47.bb
+++ b/meta/recipes-core/netbase/netbase_4.47.bb
@@ -47,7 +47,3 @@ do_install () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
-
-PACKAGE_ARCH_qemuarm = "${MACHINE_ARCH}"
-PACKAGE_ARCH_qemux86 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_qemux86-64 = "${MACHINE_ARCH}"
-- 
1.7.7.6



