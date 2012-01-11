Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rl3Pi-0005A7-29
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 20:00:46 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0BIqk2l020538;
	Wed, 11 Jan 2012 10:52:50 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 11 Jan 2012 13:52:22 -0500
Message-Id: <4c600d9c5302f8db28e6af0190b41711f750b755.1326307011.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 4/5] tslib: enable big endian support for qemuppc
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
X-List-Received-Date: Wed, 11 Jan 2012 19:00:46 -0000

From: Liming Wang <liming.wang@windriver.com>

This enables wacom tablet/touchscreen support on qemuppc.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 meta/recipes-graphics/tslib/tslib_1.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
index f47116f..54ff3d4 100644
--- a/meta/recipes-graphics/tslib/tslib_1.0.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "92b2eb55b1e4ef7e2c0347069389390e"
 SRC_URI[sha256sum] = "9c40d914e4f6fe00bdd77137d671c7ce4f211686228f2eb8b2d3c2360bc249c8"
 SRC_URI_append_qemumips += " file://32bitBE-support.patch"
+SRC_URI_append_qemuppc += " file://32bitBE-support.patch"
 
 
 inherit autotools pkgconfig
-- 
1.7.4.1



