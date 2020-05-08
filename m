Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.8266.1588935408768524625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 03:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: t8n+QN/evpqdMHQ+qM+Vwvv5iWjd46aIPY875WwzTOCUGVmbZMXDheNw19E0qP93nF4H4NbTxg
 HTkcKtMwRNyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 03:56:48 -0700
IronPort-SDR: DYIeMP9UpRVDW0csN1Zy0VlEdpjp3uI0a3V5279cT5HN/9fR2qAvhowBQjb71Xta7aLu+Moglx
 bHb5oQxTt5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; 
   d="scan'208";a="251821583"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga008.fm.intel.com with ESMTP; 08 May 2020 03:56:47 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libva: upgrade 2.6.1 -> 2.7.1
Date: Fri,  8 May 2020 19:03:09 +0800
Message-Id: <20200508110310.29937-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

For release details:
https://github.com/intel/libva/releases/tag/2.7.1
https://github.com/intel/libva/releases/tag/2.7.0

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva-initial_2.6.1.bb => libva-initial_2.7.1.bb}   | 3 +--
 meta/recipes-graphics/libva/{libva_2.6.1.bb => libva_2.7.1.bb} | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.6.1.bb => libva-initial_2.7.1.bb} (50%)
 rename meta/recipes-graphics/libva/{libva_2.6.1.bb => libva_2.7.1.bb} (84%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/recipes-graphics/libva/libva-initial_2.7.1.bb
similarity index 50%
rename from meta/recipes-graphics/libva/libva-initial_2.6.1.bb
rename to meta/recipes-graphics/libva/libva-initial_2.7.1.bb
index 2c845238da..3e2b806c6d 100644
--- a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva-initial_2.7.1.bb
@@ -1,8 +1,7 @@
 require libva.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
-SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
+SRC_URI[sha256sum] = "a00ff19d9f969259b9784172adad7788dbf3de827d985c5d27c230efd5d98a04"
 
 do_install_append () {
 	rm -f ${D}${libdir}/*.so*
diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.7.1.bb
similarity index 84%
rename from meta/recipes-graphics/libva/libva_2.6.1.bb
rename to meta/recipes-graphics/libva/libva_2.7.1.bb
index e8cb8678bc..b2deb017ac 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.7.1.bb
@@ -1,8 +1,7 @@
 require libva.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
-SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
+SRC_URI[sha256sum] = "a00ff19d9f969259b9784172adad7788dbf3de827d985c5d27c230efd5d98a04"
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
-- 
2.17.1

