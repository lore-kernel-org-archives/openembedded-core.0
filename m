Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGIAj-0002QY-Ts
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 00:30:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Oct 2011 15:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,366,1315206000"; d="scan'208";a="63915362"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.46])
	by azsmga001.ch.intel.com with ESMTP; 18 Oct 2011 15:24:17 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 15:24:12 -0700
Message-Id: <f90833637d03ce25b7d84641c29fb60c90c375fa.1318976197.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1318976197.git.josh@linux.intel.com>
References: <cover.1318976197.git.josh@linux.intel.com>
In-Reply-To: <cover.1318976197.git.josh@linux.intel.com>
References: <cover.1318976197.git.josh@linux.intel.com>
Subject: [PATCH 2/2] tzdata: updated SRC_URI and update to 2011k
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
X-List-Received-Date: Tue, 18 Oct 2011 22:30:10 -0000

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



