Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TBTIv-0002Ln-A6
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:27:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 09:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,406,1344236400"; d="scan'208";a="220783466"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 09:14:42 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 18:19:48 +0300
Message-Id: <9ee1f982eec6babd8cec2ccc189d37cb3f15fa02.1347376068.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
Subject: [PATCH 3/5] libexif: upgrade to 0.6.21
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:27:13 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{libexif_0.6.20.bb => libexif_0.6.21.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libexif/{libexif_0.6.20.bb => libexif_0.6.21.bb} (74%)

diff --git a/meta/recipes-support/libexif/libexif_0.6.20.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
similarity index 74%
rename from meta/recipes-support/libexif/libexif_0.6.20.bb
rename to meta/recipes-support/libexif/libexif_0.6.21.bb
index f233d3f..301c25d 100644
--- a/meta/recipes-support/libexif/libexif_0.6.20.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.21.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
-SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
+SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
+SRC_URI[sha256sum] = "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
 
 inherit autotools gettext
 
-- 
1.7.9.5



