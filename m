Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id E04BB7F33D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:51:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:51:59 -0800
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; d="scan'208";a="196061707"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.67.150])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:51:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:51:45 +0800
Message-Id: <20191118085149.19903-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191118085149.19903-1-anuj.mittal@intel.com>
References: <20191118085149.19903-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] eudev: upgrade 3.2.8 -> 3.2.9
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
X-List-Received-Date: Mon, 18 Nov 2019 08:51:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/udev/{eudev_3.2.8.bb => eudev_3.2.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.2.8.bb => eudev_3.2.9.bb} (95%)

diff --git a/meta/recipes-core/udev/eudev_3.2.8.bb b/meta/recipes-core/udev/eudev_3.2.9.bb
similarity index 95%
rename from meta/recipes-core/udev/eudev_3.2.8.bb
rename to meta/recipes-core/udev/eudev_3.2.9.bb
index eecf64e550..1acf604098 100644
--- a/meta/recipes-core/udev/eudev_3.2.8.bb
+++ b/meta/recipes-core/udev/eudev_3.2.9.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://udev.rules \
 "
 
-SRC_URI[md5sum] = "ce166b3fdd910c2a4a840378f48fedaf"
-SRC_URI[sha256sum] = "61e4948e9e51271c3cce2bb5311a30b206dd03ef011062e6c627fb007e43f6b8"
+SRC_URI[md5sum] = "dedfb1964f6098fe9320de827957331f"
+SRC_URI[sha256sum] = "89618619084a19e1451d373c43f141b469c9fd09767973d73dd268b92074d4fc"
 
 inherit autotools update-rc.d qemu pkgconfig distro_features_check
 
-- 
2.21.0


