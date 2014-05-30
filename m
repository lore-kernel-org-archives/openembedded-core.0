Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D5E4B6FDFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 15:12:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2014 08:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,941,1392192000"; d="scan'208";a="439037678"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2014 08:11:58 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 May 2014 18:15:32 +0300
Message-Id: <906187fe8d042b350b7fd2c179672eb48bb35689.1401462904.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1401462904.git.cristian.iorga@intel.com>
References: <cover.1401462904.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1401462904.git.cristian.iorga@intel.com>
References: <cover.1401462904.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] libogg: upgrade to 1.3.2
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
X-List-Received-Date: Fri, 30 May 2014 15:12:32 -0000

- Switched to BP variable.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/libogg/{libogg_1.3.1.bb => libogg_1.3.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.1.bb => libogg_1.3.2.bb} (71%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.1.bb b/meta/recipes-multimedia/libogg/libogg_1.3.2.bb
similarity index 71%
rename from meta/recipes-multimedia/libogg/libogg_1.3.1.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.2.bb
index 0c12e07..0142e0f 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.1.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.2.bb
@@ -9,9 +9,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://include/ogg/ogg.h;beginline=1;endline=11;md5=eda812856f13a3b1326eb8f020cc3b0b"
 
-SRC_URI = "http://downloads.xiph.org/releases/ogg/libogg-${PV}.tar.xz"
+SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "ca25d8da0ddfc8c6cbbf78d847a209fe"
-SRC_URI[sha256sum] = "3a5bad78d81afb78908326d11761c0fb1a0662ee7150b6ad587cc586838cdcfa"
+SRC_URI[md5sum] = "5c3a34309d8b98640827e5d0991a4015"
+SRC_URI[sha256sum] = "3f687ccdd5ac8b52d76328fbbfebc70c459a40ea891dbf3dccb74a210826e79b"
 
 inherit autotools pkgconfig
-- 
1.9.1


