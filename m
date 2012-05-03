Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQh-0006go-IW
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:06:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772226"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:52 -0700
Message-Id: <b0bb9664c303af01fb0724f7d8635ea43f8e8cb9.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 33/36] xauth: Update to 1.0.7
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
X-List-Received-Date: Thu, 03 May 2012 02:06:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{xauth_1.0.6.bb => xauth_1.0.7.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.6.bb => xauth_1.0.7.bb} (69%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb b/meta/recipes-graphics/xorg-app/xauth_1.0.7.bb
similarity index 69%
rename from meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.0.7.bb
index c43d0eb..9a5de54 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.0.7.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxau libxext libxmu"
 PR = "${INC_PR}.0"
 PE = "1"
 
-SRC_URI[md5sum] = "105f5b00bb9293b3db36f7e500d4f950"
-SRC_URI[sha256sum] = "a686406951f0ed6be45bc26182a1423e2cdffad2d492b33ff3fbf72f7bcb6b0b"
+SRC_URI[md5sum] = "cbcbd8f2156a53b609800bec4c6b6c0e"
+SRC_URI[sha256sum] = "84f78c08ebc6687e2e36c9ff1f5610988c6a03fc5bf51ef89aec4d155de3028d"
-- 
1.7.7.6



