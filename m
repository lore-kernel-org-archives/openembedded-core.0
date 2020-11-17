Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4JDgCGJTV9kMpIQKBKkUxoBye9toBR3ZoZJ41tiyriN3dQp1Ywone09uEUkdQiAL64UDW7qxH9
 +Z8jsjpmNa3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719959"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719959"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:21 -0800
IronPort-SDR: gHAEKFGzUN1UYdt8VLpb4M4lXQNSbEjX8nH27xa8pIZoNIEYO2OjByYp18VSm9ieFfN19sqvYD
 pBYT1SlKuD3g==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802945"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/19] alsa-utils: Fix license to GPLv2 only
Date: Tue, 17 Nov 2020 23:35:53 +0800
Message-Id: <e14646de7fb45605de33fc0b797dad013ec20414.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Parts of alsa-utils are v2 only, parts are v2 or later. The effect is
the end result is GPLv2 and there seems little value in marking everything
as being a mixture of both. Fix LICENSE to match reality.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9a17a991174b732597e21045763ea851f486a01)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-utils.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index b523a5a832..0a2e86fcc7 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -2,7 +2,8 @@ SUMMARY = "ALSA sound utilities"
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
-LICENSE = "GPLv2+"
+# Some parts are GPLv2+, some are only GPLv2 (e.g. axfer, alsactl) so result is GPLv2
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-- 
2.28.0

