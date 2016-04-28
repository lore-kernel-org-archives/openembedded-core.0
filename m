Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3052E76FFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:25:31 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 2B16B38F77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 20:25:32 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 20:25:14 +0200
Message-Id: <1461867918-2638-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
References: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-oe][PATCH v2 4/8] gstreamer1.0-plugins-good: upgrade to version 1.8.1
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
X-List-Received-Date: Thu, 28 Apr 2016 18:25:32 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch | 6 +++---
 ...1.0-plugins-good_1.6.3.bb => gstreamer1.0-plugins-good_1.8.1.bb} | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)
 mode change 100755 => 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.6.3.bb => gstreamer1.0-plugins-good_1.8.1.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
old mode 100755
new mode 100644
index d1973d4..a2cbb70
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
@@ -17,7 +17,7 @@ diff --git a/gst/rtp/gstrtpmp4gpay.c b/gst/rtp/gstrtpmp4gpay.c
 index 7913d9a..1749d39 100644
 --- a/gst/rtp/gstrtpmp4gpay.c
 +++ b/gst/rtp/gstrtpmp4gpay.c
-@@ -390,6 +390,7 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
+@@ -391,6 +391,7 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
    const GValue *codec_data;
    const gchar *media_type = NULL;
    gboolean res;
@@ -25,7 +25,7 @@ index 7913d9a..1749d39 100644
  
    rtpmp4gpay = GST_RTP_MP4G_PAY (payload);
  
-@@ -400,7 +401,6 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
+@@ -401,7 +402,6 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
      GST_LOG_OBJECT (rtpmp4gpay, "got codec_data");
      if (G_VALUE_TYPE (codec_data) == GST_TYPE_BUFFER) {
        GstBuffer *buffer;
@@ -33,7 +33,7 @@ index 7913d9a..1749d39 100644
  
        buffer = gst_value_get_buffer (codec_data);
        GST_LOG_OBJECT (rtpmp4gpay, "configuring codec_data");
-@@ -426,6 +426,23 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
+@@ -427,6 +427,23 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
  
        rtpmp4gpay->config = gst_buffer_copy (buffer);
      }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.1.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.1.bb
index 0b4f436..26e3c6f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.1.bb
@@ -7,9 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
     file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
+    file://avoid-including-sys-poll.h-directly.patch \
+    file://ensure-valid-sentinel-for-gst_structure_get.patch \
 "
 
-SRC_URI[md5sum] = "a1958df7aa498b42793e2f2048673815"
-SRC_URI[sha256sum] = "24b19db70b2a83461ebddfe20033db432dadfdb5d4b54ffb1dfa0d830134a177"
+SRC_URI[md5sum] = "3eabe7277681b9bef8a64c312de03d47"
+SRC_URI[sha256sum] = "2103e17921d67894e82eafdd64fb9b06518599952fd93e625bfbc83ffead0972"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
2.5.0


