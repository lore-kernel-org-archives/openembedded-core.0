Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: M1anwlAP22IMM3JWnAjlBxln0y0nfUaciWyowr0k1gzE1U5kGQ3lBHhmDBcENwCqkb7xGC1KFc
 kdxZdu+K/Cyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917792"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917792"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:09 -0700
IronPort-SDR: iHBahBjlEnvrGVLRKKX5h+NFIeiRQvgIVpyLjirViMM5umcnAqRbEp14hOTp81uEtdtOwW799T
 eVuPMff8/r8g==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645750"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/15] linux-firmware: upgrade 20210208 -> 20210315
Date: Wed, 12 May 2021 16:35:38 +0800
Message-Id: <132014a299053b84f79611827d8d0eb88fb91275.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmware files, version changes

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f10b9dbb4fb8ccb9a427883370fbbeb6f394551)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20210208.bb => linux-firmware_20210315.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210208.bb => linux-firmware_20210315.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
index 78856cbf66..eb4ef51a3a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ef0565762eac313c409567b59dff00b2 \
+                    file://WHENCE;md5=e21a8cbddc1612bce56f06fe154a0743 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
+SRC_URI[sha256sum] = "a2348f03492713dca9aef202496c6e58f5e63ee5bec6a7bdfcf8b18ce7155e70"
 
 inherit allarch
 
-- 
2.31.1

