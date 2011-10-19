Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGf2g-0002vD-8k
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 00:55:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 15:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64819072"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.35])
	by orsmga001.jf.intel.com with ESMTP; 19 Oct 2011 15:49:28 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 15:49:24 -0700
Message-Id: <f9bbdddc7ed21c16150343fff50e4daf46678cff.1319064437.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319064436.git.josh@linux.intel.com>
References: <cover.1319064436.git.josh@linux.intel.com>
In-Reply-To: <cover.1319064436.git.josh@linux.intel.com>
References: <cover.1319064436.git.josh@linux.intel.com>
Subject: [PATCH 2/4] tzdata: updated SRC_URI and update to 2011k
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
X-List-Received-Date: Wed, 19 Oct 2011 22:55:22 -0000

tzdata is now hosted by IANA at http://www.iana.org/time-zones

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../tzdata/{tzdata_2011k.bb => tzdata_2011l.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011k.bb => tzdata_2011l.bb} (96%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2011k.bb b/meta/recipes-extended/tzdata/tzdata_2011l.bb
similarity index 96%
rename from meta/recipes-extended/tzdata/tzdata_2011k.bb
rename to meta/recipes-extended/tzdata/tzdata_2011l.bb
index 45f2c4d..140f8ed 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011k.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011l.bb
@@ -12,10 +12,10 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"
+SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "9da1c2d4d1a01f9f504b73ccd371830f"
-SRC_URI[tzdata.sha256sum] = "51f7d2a42b7fb9465feced642a6676afdf8b04a071e55f3fef1f0925bd67ef21"
+SRC_URI[tzdata.md5sum] = "bae1b93673e1aef80186c90dfd493f1c"
+SRC_URI[tzdata.sha256sum] = "cb9fec68a19c9c3b900bb71f3ca20d0051a863f765387b52fc2d144a5bbb0c7d"
 
 S = "${WORKDIR}"
 
-- 
1.7.6.4



