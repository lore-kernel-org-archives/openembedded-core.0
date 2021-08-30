Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789600"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789600"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469326"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 7/9] linux-firmware: upgrade 20210511 -> 20210818
Date: Mon, 30 Aug 2021 15:33:58 +0800
Message-Id: <37c6df10e8d9b997b3631ee1e7b1cad39353d926.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630306698.git.anuj.mittal@intel.com>
References: <cover.1630306698.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: new firmware files, copyright years, file names
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfceaba4f38771047dfdfdfdbf16b794006dfd78)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...inux-firmware_20210511.bb => linux-firmware_20210818.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210511.bb => linux-firmware_20210818.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
index 513932984e..7f6db18b69 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
@@ -97,7 +97,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
                     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
-                    file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
+                    file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=727d0d4e2d420f41d89d098f6322e779 \
+                    file://WHENCE;md5=15ad289bf2359e8ecf613f3b04f72fab \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417"
+SRC_URI[sha256sum] = "bef3d317c348d962b3a1b95cb4e19ea4f282e18112b2c669cff74f9267ce3893"
 
 inherit allarch
 
-- 
2.31.1

