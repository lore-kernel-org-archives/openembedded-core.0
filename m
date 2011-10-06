Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgh-0008V4-15
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495948"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:57 -0700
Message-Id: <7ce856415312240fa55491657bd8e198f41203be.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 18/21] tzdata: Update to 2011k
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../tzdata/{tzdata_2011i.bb => tzdata_2011k.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011i.bb => tzdata_2011k.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2011i.bb b/meta/recipes-extended/tzdata/tzdata_2011k.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2011i.bb
rename to meta/recipes-extended/tzdata/tzdata_2011k.bb
index f507b7e..45f2c4d 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011i.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011k.bb
@@ -14,8 +14,8 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
 
 SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "c7a86ec34f30f8d6aa77ef94902a3047"
-SRC_URI[tzdata.sha256sum] = "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
+SRC_URI[tzdata.md5sum] = "9da1c2d4d1a01f9f504b73ccd371830f"
+SRC_URI[tzdata.sha256sum] = "51f7d2a42b7fb9465feced642a6676afdf8b04a071e55f3fef1f0925bd67ef21"
 
 S = "${WORKDIR}"
 
-- 
1.7.6.2



