Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.30194.1601886970311502976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 01:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: siew.hoon.lim@intel.com)
IronPort-SDR: ek+gTeuKvkUXZrMTxHuXP34ONkVbbwVZcK47Fcudw24ZTaYkRSILhOwLl9IPHa4SBQgrrlKoEP
 nFyFrng56R/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="224976297"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="224976297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 01:36:02 -0700
IronPort-SDR: eqSu4tx4WFXrToQkd6u1BmznmycnbE+YIao+fKsmpXAHmc1oAAy+l+lWUIHc6YAO5/95IXzAYT
 sITMXLLGEpxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="459403087"
Received: from unknown (HELO slim50-desktop.png.intel.com) ([10.221.79.121])
  by orsmga004.jf.intel.com with ESMTP; 05 Oct 2020 01:36:00 -0700
From: "Lim Siew Hoon" <siew.hoon.lim@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Alliance for Open Media: new library
Date: Mon,  5 Oct 2020 16:35:06 +0800
Message-Id: <20201005083506.30022-1-siew.hoon.lim@intel.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
Signed-off-by: Lim Siew Hoon <siew.hoon.lim@intel.com>
---
 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb

diff --git a/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
new file mode 100644
index 000000000..4b388d57f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Alliance for Open Media - AV1 Codec Library"
+DESCRIPTION = "Alliance for Open Media AV1 codec library"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5"
+
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
+
+SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
+
+S = "${WORKDIR}/git"
+
+DEPENDS_append = " yasm-native"
+
+inherit pkgconfig cmake perlnative python3native
+EXTRA_OECMAKE_append = " -DBUILD_SHARED_LIBS=1"
-- 
2.17.1

