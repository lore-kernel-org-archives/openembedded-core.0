Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T20fp-0000SC-Jk
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 16:03:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134986132"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:50:44 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 15:55:17 +0300
Message-Id: <1345121720-25925-4-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 3/6] iproute2: upgrade to 3.5.0
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
X-List-Received-Date: Thu, 16 Aug 2012 14:03:48 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../configure-cross.patch                          |    0
 .../{iproute2_3.4.0.bb => iproute2_3.5.0.bb}       |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.4.0 => iproute2-3.5.0}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.4.0.bb => iproute2_3.5.0.bb} (51%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.5.0/configure-cross.patch
similarity index 100%
rename from meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
rename to meta/recipes-connectivity/iproute2/iproute2-3.5.0/configure-cross.patch
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.5.0.bb
similarity index 51%
rename from meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.5.0.bb
index cf1d521..1e8b073 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.5.0.bb
@@ -5,5 +5,5 @@ PR = "r0"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch"
 
-SRC_URI[md5sum] = "879d3fac4e90809598b2864ec4a0cbf8"
-SRC_URI[sha256sum] = "38e846e412b2fa235a447b50c20ad1e9770d1b3ed4d3ab18ca0b18c6e8b79ba4"
+SRC_URI[md5sum] = "ab1fc3512c852ba0a929f6e589804e78"
+SRC_URI[sha256sum] = "ea885642b1d9f8c843a325b85926a75bd36fb4801b37c7707cbd397fb120aa3d"
-- 
1.7.9.5



