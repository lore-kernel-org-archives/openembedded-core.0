Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 082F771191
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239771"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:54:04 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:48 +0300
Message-Id: <0b2ec311bd3b05ef957149e0e42eaefd73140ef2.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
Subject: [PATCH 6/7] gstreamer1.0-rtsp-server: upgrade to 1.4.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Aug 2014 18:54:56 -0000

Bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...amer1.0-rtsp-server_1.4.0.bb => gstreamer1.0-rtsp-server_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.4.0.bb => gstreamer1.0-rtsp-server_1.4.1.bb} (44%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb
similarity index 44%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb
index 66aa886..1f34be0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.1.bb
@@ -2,5 +2,5 @@ include gstreamer1.0-rtsp-server.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
-SRC_URI[md5sum] = "974af05dbf867cade89b8d3101e3f197"
-SRC_URI[sha256sum] = "800a93ee6de8ca3946fbb2fa3878e41af44e27dde76c9399e30b93ba3e0bffe8"
+SRC_URI[md5sum] = "e39f8643eb363611c342d87088a29aa0"
+SRC_URI[sha256sum] = "10aeacc774e99d81607aeb2748c0a1c6736425b8ae3a9caf8db3cd0c4a08d06e"
-- 
1.9.1


