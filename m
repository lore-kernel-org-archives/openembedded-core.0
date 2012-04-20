Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7D-0005g9-0G
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167925"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:31 -0700
Message-Id: <80847ee65b6be37028dc13d557b9e00221ade522.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 40/43] lame: Upgrade to 3.99.5
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lame/{lame_3.99.3.bb => lame_3.99.5.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/lame/{lame_3.99.3.bb => lame_3.99.5.bb} (86%)

diff --git a/meta/recipes-multimedia/lame/lame_3.99.3.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
similarity index 86%
rename from meta/recipes-multimedia/lame/lame_3.99.3.bb
rename to meta/recipes-multimedia/lame/lame_3.99.5.bb
index 9248202..a0c4cf5 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.3.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -13,8 +13,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch"
 
-SRC_URI[md5sum] = "5ad31e33e70455eb3a7b79a5dd934fce"
-SRC_URI[sha256sum] = "d4ea3c8d00d2cc09338425a25dbfeb4d587942cb3c83a677c09aeb1e850c74cf"
+SRC_URI[md5sum] = "84835b313d4a8b68f5349816d33e07ce"
+SRC_URI[sha256sum] = "24346b4158e4af3bd9f2e194bb23eb473c75fb7377011523353196b19b9a23ff"
 
 inherit autotools
 
-- 
1.7.7.6



