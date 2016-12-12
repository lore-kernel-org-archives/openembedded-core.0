Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 086DE71A90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 12 Dec 2016 02:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="41586360"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2016 02:12:09 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6EE726A4006;
	Mon, 12 Dec 2016 02:11:21 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:47 +0200
Message-Id: <2bb33bfa27925cd8bac716c15e7f7efaa636c56f.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/12] xf86-video-omap: Upgrade 0.4.4 -> 0.4.5
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:08 -0000

Support ABI 23.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-video-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.4.bb => xf86-video-omap_0.4.5.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.4.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.4.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
index 7895449..e652394 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
@@ -24,8 +24,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xf86driproto"
 
-SRC_URI[md5sum] = "a364e151a537948f75bb8c9b840a31da"
-SRC_URI[sha256sum] = "a7192690b8638f5c8d611a1bae07cc13081e22edd4070f37a2f5c3f8d79e7ebc"
+SRC_URI[md5sum] = "3b8ea5e8fba63355c0dc6681c49d5fe5"
+SRC_URI[sha256sum] = "93e7d42107521e61f61980eaea64fb452e87b7b94272e48938ac8d904ccfab5a"
 
 CFLAGS += " -I${STAGING_INCDIR}/xorg "
 
-- 
2.1.4


