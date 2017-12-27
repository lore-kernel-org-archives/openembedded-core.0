Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4F760069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 09:53:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Dec 2017 01:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,464,1508828400"; d="scan'208";a="19225449"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2017 01:53:08 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id A5C3B5801AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 01:53:07 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Dec 2017 11:53:51 +0200
Message-Id: <1514368431-18654-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] gstreamer1.0: upgrade to version 1.12.4
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
X-List-Received-Date: Wed, 27 Dec 2017 09:53:09 -0000

The fourth 1.12 bug-fix release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../gstreamer/{gst-validate_1.12.3.bb => gst-validate_1.12.4.bb}    | 4 ++--
 .../{gstreamer1.0-libav_1.12.3.bb => gstreamer1.0-libav_1.12.4.bb}  | 4 ++--
 .../{gstreamer1.0-omx_1.12.3.bb => gstreamer1.0-omx_1.12.4.bb}      | 4 ++--
 ...1.0-plugins-bad_1.12.3.bb => gstreamer1.0-plugins-bad_1.12.4.bb} | 4 ++--
 ...0-plugins-base_1.12.3.bb => gstreamer1.0-plugins-base_1.12.4.bb} | 4 ++--
 ...0-plugins-good_1.12.3.bb => gstreamer1.0-plugins-good_1.12.4.bb} | 4 ++--
 ...0-plugins-ugly_1.12.3.bb => gstreamer1.0-plugins-ugly_1.12.4.bb} | 4 ++--
 ...{gstreamer1.0-python_1.12.3.bb => gstreamer1.0-python_1.12.4.bb} | 4 ++--
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb | 6 ------
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb | 6 ++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb      | 5 -----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb      | 5 +++++
 .../gstreamer/{gstreamer1.0_1.12.3.bb => gstreamer1.0_1.12.4.bb}    | 4 ++--
 13 files changed, 29 insertions(+), 29 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.12.3.bb => gst-validate_1.12.4.bb} (81%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.12.3.bb => gstreamer1.0-libav_1.12.4.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.12.3.bb => gstreamer1.0-omx_1.12.4.bb} (69%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.3.bb => gstreamer1.0-plugins-bad_1.12.4.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.12.3.bb => gstreamer1.0-plugins-base_1.12.4.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.3.bb => gstreamer1.0-plugins-good_1.12.4.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.12.3.bb => gstreamer1.0-plugins-ugly_1.12.4.bb} (76%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.12.3.bb => gstreamer1.0-python_1.12.4.bb} (57%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.12.3.bb => gstreamer1.0_1.12.4.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
similarity index 81%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
index 8f54376..f662467 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
@@ -7,8 +7,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "623edc479a1e5c1e76bd7e1cf8393253"
-SRC_URI[sha256sum] = "5139949d20274fdd702492438eeab2c9e55aa82f60aca17db27ebd3faf08489e"
+SRC_URI[md5sum] = "bc074d49677081f9c27de11a09165746"
+SRC_URI[sha256sum] = "f9da9dfe6e5d6f5ba3b38c5752b42d3f927715904942b405c2924d3cb77afba1"
 
 DEPENDS = "json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
index 1476e2a..af547ba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch \
            "
-SRC_URI[md5sum] = "81f62d58279108698b321209fc6696ce"
-SRC_URI[sha256sum] = "015ef8cab6f7fb87c8fb42642486423eff3b6e6a6bccdcd6a189f436a3619650"
+SRC_URI[md5sum] = "8a851bf2e475e90a3fdac9506e3e4dbd"
+SRC_URI[sha256sum] = "2a56aa5d2d8cd912f2bce17f174713d2c417ca298f1f9c28ee66d4aa1e1d9e62"
 
 S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
index 15837d3..7f7eae3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "53d2ca9739f9189d9c1924d4af71e8a4"
-SRC_URI[sha256sum] = "eef5de8bab1bb495bfbc9d16af9837d7f55b47cb6b97819b3152c5899c85843c"
+SRC_URI[md5sum] = "eb8d5ae3b69cfeed9dc77c592106247e"
+SRC_URI[sha256sum] = "a025fa24242ec868fe0ff1e66d806a1070bcbc7c14a987a89cdc3395d0d56d5f"
 
 S = "${WORKDIR}/gst-omx-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
index 0380580..82c7ffc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
@@ -16,8 +16,8 @@ SRC_URI = " \
     file://0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch \
     file://0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch \
 "
-SRC_URI[md5sum] = "594a818b13fa89960b6e7c414340db38"
-SRC_URI[sha256sum] = "36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec"
+SRC_URI[md5sum] = "64bf16cf15edaab1c0e02c8dee7170d0"
+SRC_URI[sha256sum] = "0c7857be16686d5c1ba6e34bd338664d3d4599d32714a8eca5c8a41a101e2d08"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
index 04abe8c..dd895bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "e69d41472a9b08eaf9659cde5dc0a4a4"
-SRC_URI[sha256sum] = "d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5"
+SRC_URI[md5sum] = "b35b04071f69b8ab69a7f3a497ff0131"
+SRC_URI[sha256sum] = "4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
index afcb333..a060964 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
@@ -11,8 +11,8 @@ SRC_URI = " \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "6b56a7cc6c5fd031a9596ec123b2f285"
-SRC_URI[sha256sum] = "13e7f479296891fef5a686438f20ba7d534680becf2269ecc5ee24aa83b45f03"
+SRC_URI[md5sum] = "bdf4791a2b788ec6a149b81ff4032038"
+SRC_URI[sha256sum] = "649f49bec60892d47ee6731b92266974c723554da1c6649f21296097715eb957"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
index 5a5fccf..f833351 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "8a0ba8141b1548ee094eb97e7cf5471f"
-SRC_URI[sha256sum] = "e88ca584c94ea78eeecbf3af00ef7f134b66bdee7408aa4aa6c547235e060052"
+SRC_URI[md5sum] = "e2b836fb2747f6ae3a1a6f33a9d8c952"
+SRC_URI[sha256sum] = "1c165b8d888ed350acd8e6ac9f6fe06508e6fcc0a3afc6ccc9fbeb30df9be522"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
similarity index 57%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
index 3978b9d..faec356 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.4.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-python.inc
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "622125816c52a51205660d210f8e7b8b"
-SRC_URI[sha256sum] = "c3f529dec1294633132690806703b80bad5752eff482eaf81f209c2aba012ba7"
+SRC_URI[md5sum] = "f1fd046ea781736a794f9f552d77c50d"
+SRC_URI[sha256sum] = "20ce6af6615c9a440c1928c31259a78226516d06bf1a65f888c6d109826fa3ea"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
deleted file mode 100644
index 3876284..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer1.0-rtsp-server.inc
-
-SRC_URI[md5sum] = "83ae8adda3b9c6164cd2fba1efdde87e"
-SRC_URI[sha256sum] = "67255971bb16029a01de66b9f9687f20d8dbf3d3bd75feb48605d0723a7c74ec"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
new file mode 100644
index 0000000..da68dcb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.4.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-rtsp-server.inc
+
+SRC_URI[md5sum] = "ad70a9735f58da21d0f5cedf48ccadd3"
+SRC_URI[sha256sum] = "7660112ebd59838f1054796b38109dcbe32f0a040e3a252a68a81055aeaa56a9"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
deleted file mode 100644
index 7a82cdd..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require gstreamer1.0-vaapi.inc
-SRC_URI[md5sum] = "aa9ea10623f34680a39b32e243add26d"
-SRC_URI[sha256sum] = "f4cdafd8fd9606a490917c8b67336e835df1219580d55421c70480fd0913744d"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
new file mode 100644
index 0000000..1df2301
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.4.bb
@@ -0,0 +1,5 @@
+require gstreamer1.0-vaapi.inc
+SRC_URI[md5sum] = "2149982cdb348139bca946bb63766f4c"
+SRC_URI[sha256sum] = "1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
index 98928c9..bd6cde1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "33dfcb690304fccdaff178440de13334"
-SRC_URI[sha256sum] = "d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e"
+SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
+SRC_URI[sha256sum] = "5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.4.0


