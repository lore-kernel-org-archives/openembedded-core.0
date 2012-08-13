Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T0wgM-0003v6-Cz
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 17:35:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Aug 2012 08:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,761,1336374000"; d="scan'208";a="207670935"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2012 08:22:59 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 17:27:31 +0300
Message-Id: <1344868052-15607-3-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
References: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/3] glproto: upgrade to 1.4.16
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
X-List-Received-Date: Mon, 13 Aug 2012 15:35:54 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{glproto_1.4.15.bb => glproto_1.4.16.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.15.bb => glproto_1.4.16.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.15.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/glproto_1.4.15.bb
rename to meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
index 955f44b..e8ad93b 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.15.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "d1ff0c1acc605689919c1ee2fc9b5582"
-SRC_URI[sha256sum] = "990356ebe2e8966aa643287c9a485777957a49299dfb211654df5ff212dec171"
+SRC_URI[md5sum] = "3847963c1b88fd04a030b932b0aece07"
+SRC_URI[sha256sum] = "54dd663a7f5ed702f2ff035b79edf770c2f850867ac0d55742f696bfc8b2598d"
-- 
1.7.9.5



