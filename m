Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SG2kS-0005Qp-E8
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 08:34:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2012 23:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138358694"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2012 23:25:02 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 14:20:04 +0800
Message-Id: <af03fd7f8452c7795fce23e3276e456dc431266f.1333693070.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1333693070.git.lianhao.lu@intel.com>
References: <cover.1333693070.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] connman: ensure ofono package is generated.
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
X-List-Received-Date: Fri, 06 Apr 2012 06:34:16 -0000

Make sure ofono package is generated when buidling connman, because
dynamic package connman-plugin-ofono has a RDEPENDS on ofono.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 1a6dd1b..3ed5667 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -39,6 +39,8 @@ EXTRA_OECONF += "\
     --disable-ntpd \
 "
 
+do_package[depends] = "${MLPREFIX}ofono:do_package"
+
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
-- 
1.7.0.4



