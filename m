Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T20fq-0000SA-5d
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 16:03:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134986142"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:50:46 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 15:55:18 +0300
Message-Id: <1345121720-25925-5-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 4/6] iptables: upgrade to 1.4.15
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
 .../{iptables_1.4.14.bb => iptables_1.4.15.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.4.14.bb => iptables_1.4.15.bb} (91%)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.14.bb b/meta/recipes-extended/iptables/iptables_1.4.15.bb
similarity index 91%
rename from meta/recipes-extended/iptables/iptables_1.4.14.bb
rename to meta/recipes-extended/iptables/iptables_1.4.15.bb
index 4396ccf..a6297f3 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.14.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.15.bb
@@ -24,8 +24,8 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch"
 
-SRC_URI[md5sum] = "5ab24ad683f76689cfe7e0c73f44855d"
-SRC_URI[sha256sum] = "9be675696f41cd4f35cc332b667d285fe9489ca93c8e1f77804bd04b3315a522"
+SRC_URI[md5sum] = "8bf564ea8348522fc1db727868828def"
+SRC_URI[sha256sum] = "867c144e60075e7bebe6fcecf0b65169d5e2d1fa5ceec2ebd9780cd5026123ea"
 
 inherit autotools
 
-- 
1.7.9.5



