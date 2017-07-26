Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E29277A61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 10:43:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 03:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="882975518"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2017 03:43:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 13:41:02 +0300
Message-Id: <20170726104103.13050-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170726104103.13050-1-alexander.kanavin@linux.intel.com>
References: <20170726104103.13050-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] eudev: update to 3.2.2
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
X-List-Received-Date: Wed, 26 Jul 2017 10:43:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/udev/{eudev_3.2.1.bb => eudev_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.2.1.bb => eudev_3.2.2.bb} (96%)

diff --git a/meta/recipes-core/udev/eudev_3.2.1.bb b/meta/recipes-core/udev/eudev_3.2.2.bb
similarity index 96%
rename from meta/recipes-core/udev/eudev_3.2.1.bb
rename to meta/recipes-core/udev/eudev_3.2.2.bb
index bdfb5441ade..78fef2c1441 100644
--- a/meta/recipes-core/udev/eudev_3.2.1.bb
+++ b/meta/recipes-core/udev/eudev_3.2.2.bb
@@ -23,8 +23,8 @@ SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz;downloadfilena
 "
 UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 
-SRC_URI[md5sum] = "a2aae16bc432eac0e71c1267c384e295"
-SRC_URI[sha256sum] = "88f530c1540750e6daa91b5eaeebf88e761e6f0c86515c1c28eedfd871f027c6"
+SRC_URI[md5sum] = "1a0faad3a88ade3475e8c0ddef78e30b"
+SRC_URI[sha256sum] = "80628191448886846ab9cc0e2af6782358a0afb81d5b4f8cd9d982d2626cca31"
 
 inherit autotools update-rc.d qemu pkgconfig
 
-- 
2.13.2


