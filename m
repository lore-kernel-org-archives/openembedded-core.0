Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82C3578447
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 06:21:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2018 22:21:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,463,1511856000"; d="scan'208";a="24708784"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.239])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2018 22:21:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 14:21:30 +0800
Message-Id: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] maintainers.inc: update ownership
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
X-List-Received-Date: Mon, 05 Feb 2018 06:21:44 -0000

I propose to take over gstreamer stack and x264. Remove libav entry since
the recipe was removed from oe-core. Change ownership of libva* since Wei Tee
is no longer working on oe-core.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 33 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 34f3d81..5f1cb79 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -237,19 +237,19 @@ RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-grub = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-grub-efi = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-gsettings-desktop-schemas = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gst-examples = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gst-validate = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0 = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-libav = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-omx = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-meta-base = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-bad = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-base = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-good = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-ugly = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-python = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-rtsp-server = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi = "Wei Tee Ng <wei.tee.ng@intel.com>"
+RECIPE_MAINTAINER_pn-gst-examples = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gst-validate = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0 = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-libav = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-omx = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-meta-base = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-bad = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-base = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-good = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-ugly = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-python = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-rtsp-server = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-gtk+ = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gtk+3 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -312,7 +312,6 @@ RECIPE_MAINTAINER_pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.co
 RECIPE_MAINTAINER_pn-libart-lgpl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libassuan = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libatomic-ops = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libav = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
@@ -405,8 +404,8 @@ RECIPE_MAINTAINER_pn-liburi-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libusb-compat = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libuser = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-libva = "Wei Tee Ng <wei.tee.ng@intel.com>"
-RECIPE_MAINTAINER_pn-libva-utils = "Wei Tee Ng <wei.tee.ng@intel.com>"
+RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libwebp = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libx11 = "Armin Kuster <akuster@mvista.com>"
@@ -745,7 +744,7 @@ RECIPE_MAINTAINER_pn-wireless-tools = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-x11-common = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-x11perf = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-x264 = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-x264 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-xauth = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xcb-proto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xcb-util = "Armin Kuster <akuster@mvista.com>"
-- 
2.7.4


