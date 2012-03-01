Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30XG-0007yt-Kl
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:34:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 23:26:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113168886"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 23:26:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:26:07 -0800
Message-Id: <fe7a704e74a2122d82cbf253cc9a8a62acfeb618.1330586641.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
Subject: [PATCH 4/7] glproto: Update to 1.4.15
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
X-List-Received-Date: Thu, 01 Mar 2012 07:34:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{glproto_1.4.14.bb => glproto_1.4.15.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.14.bb => glproto_1.4.15.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.14.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.15.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/glproto_1.4.14.bb
rename to meta/recipes-graphics/xorg-proto/glproto_1.4.15.bb
index 76d9502..955f44b 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.14.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.15.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "f48257daf0017f7a7667e5bf48ca3578"
-SRC_URI[sha256sum] = "7aaf555a100a63c67dbffc63153dcaaa3de1a36e605a2e98fce63f64089ff999"
+SRC_URI[md5sum] = "d1ff0c1acc605689919c1ee2fc9b5582"
+SRC_URI[sha256sum] = "990356ebe2e8966aa643287c9a485777957a49299dfb211654df5ff212dec171"
-- 
1.7.7.6



