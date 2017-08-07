Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 95CC06FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 11:48:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 04:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="136607123"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2017 04:48:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:45:04 +0300
Message-Id: <20170807114504.28410-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/7] gptfdisk: update to 1.0.3
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
X-List-Received-Date: Mon, 07 Aug 2017 11:48:34 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/fdisk/{gptfdisk_1.0.1.bb => gptfdisk_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.1.bb => gptfdisk_1.0.3.bb} (86%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
similarity index 86%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
index d62a903a709..4d617e3e46f 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "util-linux popt ncurses"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "d7f3d306b083123bcc6f5941efade586"
-SRC_URI[sha256sum] = "864c8aee2efdda50346804d7e6230407d5f42a8ae754df70404dd8b2fdfaeac7"
+SRC_URI[md5sum] = "07b625a583b66c8c5840be5923f3e3fe"
+SRC_URI[sha256sum] = "89fd5aec35c409d610a36cb49c65b442058565ed84042f767bba614b8fc91b5c"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.13.2


