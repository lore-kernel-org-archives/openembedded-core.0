Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7595E7319F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739825"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:39 +0200
Message-Id: <c95f9675f301dbb34b50972699f14292f3867590.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/17] gptfdisk: update to 1.0.1
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/fdisk/{gptfdisk_1.0.0.bb => gptfdisk_1.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.0.bb => gptfdisk_1.0.1.bb} (86%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
similarity index 86%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
index 2dd3b5b..9f1daf3 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "util-linux popt ncurses"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "2061f917af084215898d4fea04d8388f"
-SRC_URI[sha256sum] = "5b66956743a799fc0471cdb032665c1391e82f9c5b3f1d7d726d29fe2ba01d6c"
+SRC_URI[md5sum] = "d7f3d306b083123bcc6f5941efade586"
+SRC_URI[sha256sum] = "864c8aee2efdda50346804d7e6230407d5f42a8ae754df70404dd8b2fdfaeac7"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.6.2


