Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T0wgP-0003v6-DJ
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 17:35:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Aug 2012 08:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,761,1336374000"; d="scan'208";a="207670975"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2012 08:23:02 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 17:27:32 +0300
Message-Id: <1344868052-15607-4-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
References: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 3/3] dri2proto: upgrade to 2.8
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
X-List-Received-Date: Mon, 13 Aug 2012 15:36:01 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{dri2proto_2.6.bb => dri2proto_2.8.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{dri2proto_2.6.bb => dri2proto_2.8.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_2.6.bb b/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-proto/dri2proto_2.6.bb
rename to meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
index 99c089a..fd27ed5 100644
--- a/meta/recipes-graphics/xorg-proto/dri2proto_2.6.bb
+++ b/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
@@ -12,5 +12,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e396fa91834f8786032cad2da5638f3 \
 
 PR = "r0"
 
-SRC_URI[md5sum] = "2eb74959684f47c862081099059a11ab"
-SRC_URI[sha256sum] = "ad82c0b28c19fcd3f91ea1f93956cb666526b41b91f239773b5854b9b1a3b909"
+SRC_URI[md5sum] = "b2721d5d24c04d9980a0c6540cb5396a"
+SRC_URI[sha256sum] = "f9b55476def44fc7c459b2537d17dbc731e36ed5d416af7ca0b1e2e676f8aa04"
-- 
1.7.9.5



