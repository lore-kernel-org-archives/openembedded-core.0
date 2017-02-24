Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 34E2577519
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:05:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 08:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; d="scan'208";a="68691500"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 24 Feb 2017 08:05:30 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 036A06A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:05:28 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:07:08 +0200
Message-Id: <1487952428-22486-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1487952428-22486-1-git-send-email-maxin.john@intel.com>
References: <1487952428-22486-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] gstreamer: update to 1.10.4
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
X-List-Received-Date: Fri, 24 Feb 2017 16:05:29 -0000

bug-fix release:
 *) Various fixes for crashes, assertions, deadlocks and memory leaks on
fuzzed input files and in other situations (CVE-2017-5847, CVE-2017-5848)
 *) gst-libav was updated to ffmpeg 3.2.4, fixing a couple of CVEs

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../{gstreamer1.0-libav_1.10.3.bb => gstreamer1.0-libav_1.10.4.bb}  | 4 ++--
 .../{gstreamer1.0-omx_1.10.3.bb => gstreamer1.0-omx_1.10.4.bb}      | 5 +++--
 ...1.0-plugins-bad_1.10.3.bb => gstreamer1.0-plugins-bad_1.10.4.bb} | 4 ++--
 ...0-plugins-base_1.10.3.bb => gstreamer1.0-plugins-base_1.10.4.bb} | 4 ++--
 ...0-plugins-good_1.10.3.bb => gstreamer1.0-plugins-good_1.10.4.bb} | 4 ++--
 ...0-plugins-ugly_1.10.3.bb => gstreamer1.0-plugins-ugly_1.10.4.bb} | 4 ++--
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb | 6 ------
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb | 6 ++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb      | 5 -----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb      | 5 +++++
 .../gstreamer/{gstreamer1.0_1.10.3.bb => gstreamer1.0_1.10.4.bb}    | 4 ++--
 11 files changed, 26 insertions(+), 25 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.3.bb => gstreamer1.0-libav_1.10.4.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.3.bb => gstreamer1.0-omx_1.10.4.bb} (68%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.3.bb => gstreamer1.0-plugins-bad_1.10.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.3.bb => gstreamer1.0-plugins-base_1.10.4.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.3.bb => gstreamer1.0-plugins-good_1.10.4.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.3.bb => gstreamer1.0-plugins-ugly_1.10.4.bb} (76%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.3.bb => gstreamer1.0_1.10.4.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
index 39afbeb..59d81db 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
     file://mips64_cpu_detection.patch \
 "
-SRC_URI[md5sum] = "ce1ea598f07c8bf728a33c7da39ec308"
-SRC_URI[sha256sum] = "9a6bc165b1862b18b98d9f1755c43806e4839a80f69ec7ea9a2dab61b65752a9"
+SRC_URI[md5sum] = "e2bdd9fde6ca3ff7efffb93df121f4fd"
+SRC_URI[sha256sum] = "6ca0feca75e3d48315e07f20ec37cf6260ed1e9dde58df355febd5016246268b"
 
 S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
similarity index 68%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
index 7d06a56..dfeefa5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.4.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
-SRC_URI[md5sum] = "1eead212796151d6ac08e091bacbd190"
-SRC_URI[sha256sum] = "dd88451e175df7a6b6f619eff0f43a6078054ec7068787b19faf89af94cdb6e1"
+
+SRC_URI[md5sum] = "cedb230f1c47d0cf4b575d70dff66ff2"
+SRC_URI[sha256sum] = "45072925cf262f0fd528fab78f0de52734e46a5a88aa802fae51c67c09c81aa2"
 
 S = "${WORKDIR}/gst-omx-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 5bb1543..0bb4053 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
 "
-SRC_URI[md5sum] = "e59798c86a670041de2e61856ea43d2a"
-SRC_URI[sha256sum] = "24099351fb6984c9e7560de06e072ff2e33d0b2db38b8fcc7afefb536e5094e7"
+SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
+SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb
index e02974c..7c81670 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "12fe89a5536a0c7536c19875928637c2"
-SRC_URI[sha256sum] = "e6299617d705a0cbfb535107c1d3a8fc0f0967f14193a8c5c7583f46a88b1710"
+SRC_URI[md5sum] = "f6b46f8fac01eb773d556e3efc369e86"
+SRC_URI[sha256sum] = "f6d245b6b3d4cb733f81ebb021074c525ece83db0c10e932794b339b8d935eb7"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
index 0fc899c..fd5369a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "fd841c574c081dc205ac07b587704fc8"
-SRC_URI[sha256sum] = "4e07e93e34d4b93208f1579c21e7d91a236577b36f128a5332ffee85b4465955"
+SRC_URI[md5sum] = "cc0cc13cdb07d4237600b6886b81f31d"
+SRC_URI[sha256sum] = "8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea816ce74d7e"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
index 87d5ba2..92a2caa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "198b7a8eff3e0206d3b5660389df83ef"
-SRC_URI[sha256sum] = "c91597d03abff9df435ad4892eae44df1ee14159c7cc7317ac9d2766ff446bd2"
+SRC_URI[md5sum] = "c68d0509c9980b0b70a4b836ff73fff1"
+SRC_URI[sha256sum] = "6386c77ca8459cba431ed0b63da780c7062c7cc48055d222024d8eaf198ffa59"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb
deleted file mode 100644
index b1c56c0..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer1.0-rtsp-server.inc
-
-SRC_URI[md5sum] = "2c6bdf872443a8b5bb567462c267bdb1"
-SRC_URI[sha256sum] = "baf9f7d229711cb3d823a447a930132f809b3321eab3535491bb01c8a21566fe"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
new file mode 100644
index 0000000..6aa9a53
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-rtsp-server.inc
+
+SRC_URI[md5sum] = "ef587fa6393e09bc26f884510596e305"
+SRC_URI[sha256sum] = "2f6e12fd4e3568ee190dc24e57e4c3a878971c3a3fb6904a9674404fac256de6"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb
deleted file mode 100644
index ae0b709..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require gstreamer1.0-vaapi.inc
-SRC_URI[md5sum] = "ddd78e8f24b4736ad856c0de88531277"
-SRC_URI[sha256sum] = "cea827066a152a6afa1d0c43544dfbda285238156d4c3b77f9d4037bbe79361e"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
new file mode 100644
index 0000000..c4a884d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
@@ -0,0 +1,5 @@
+require gstreamer1.0-vaapi.inc
+SRC_URI[md5sum] = "318af17f906637570b61dd7be9b5581d"
+SRC_URI[sha256sum] = "03e690621594d9f9495d86c7dac8b8590b3a150462770ed070dc76f66a70de75"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
index ae2c1cf..2a67993 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://deterministic-unwind.patch \
 "
-SRC_URI[md5sum] = "8c1806916107f79e88bc6ab5f6f7754e"
-SRC_URI[sha256sum] = "85b9dc1b2991f224fa90d534ec57014896c479e061dc9fa1bc16ae17cbebb63d"
+SRC_URI[md5sum] = "7c91a97e4a2dc81eafd59d0a2f8b0d6e"
+SRC_URI[sha256sum] = "50c2f5af50a6cc6c0a3f3ed43bdd8b5e2bff00bacfb766d4be139ec06d8b5218"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.4.0


