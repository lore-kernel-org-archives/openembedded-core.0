Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T20fp-0000SA-56
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 16:03:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134986120"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:50:42 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 15:55:16 +0300
Message-Id: <1345121720-25925-3-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/6] ofono: upgrade to 1.10
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
X-List-Received-Date: Thu, 16 Aug 2012 14:03:45 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../ofono/{ofono_1.8.bb => ofono_1.10.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.8.bb => ofono_1.10.bb} (63%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.8.bb b/meta/recipes-connectivity/ofono/ofono_1.10.bb
similarity index 63%
rename from meta/recipes-connectivity/ofono/ofono_1.8.bb
rename to meta/recipes-connectivity/ofono/ofono_1.10.bb
index 86767f1..1aa137f 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.8.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.10.bb
@@ -4,10 +4,10 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
   file://ofono \
 "
-PR = "r1"
+PR = "r0"
 
-SRC_URI[md5sum] = "e457ea13db22bb2de77767c867dcc4d3"
-SRC_URI[sha256sum] = "164b413068e810281a5e6c9bb90d5002d80f1c30bef2f3ffdbe70f963079524d"
+SRC_URI[md5sum] = "dab284efb8cc4143d6f53d0fcc37b696"
+SRC_URI[sha256sum] = "e7931ac0dbe165eb0e16a38b7cb4acca59b704f356ec13583d58027135e3efa5"
 
 
 EXTRA_OECONF += "\
-- 
1.7.9.5



