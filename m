Return-Path: <prvs=269e48055=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id A1EC17F968
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1578491658; x=1610027658;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=nWjO2IE/aQ+KM2vZQ+A/l6wsIRtgB1BsLNufpH5ITiw=;
	b=hxNFQ9c/utBFr2Y+rfRh4XUs2sj8Dy7nLydUFgfXKW7ULbOLFrZ7miLK
	R6tgD9/rvezzU9leq7Rp3vdK2eFCcKkAwvp2ftys6CYtYEF6ncGxMy3wE
	NAf2bGf2VMXntjc7GOkcCW5S1wmFGphK6+krfvrAl6oaigiPobkmTY2sG
	kIk99lIdHkjk/u1yV7Q0BwjEbJDqS/3c7p1y3Wfc4vklxFOu34N3XIg5A
	5vCjGbp8SK9nWaD2bAMw6XDFRbq8X12hwo7qkQUw69eI3n/jki1qVnvSL
	ydkQ9yvNDtNpaSHuRB2xfhKjiZujkXExNhCaamsrrYmBtA2XrxKU3Sw0F A==;
IronPort-SDR: UaPyVBQTqhax6AoZWNMpjhK3WX5nq0PGuh0DVN21TdBhhl85eNjC4IAJ9icfkLNgBe3MCkvzBZ
	hiPOBm1NgKbeoHmLHKYHCOnO0v8VLFlxB9+gxw74K09Fu1K2MNP7sHwmLmeMCxoN7SGRZNEtSO
	LlhZr5eqdCcnXowPW7algwSQy1oudFLbPuCkV3tw+PmtHoI1mHO+T/lX5rXXSu8N/Sn/RzVJtW
	TbN+/9MWmTnfkns/+yC7ghC8YcQIuE8TOn4YNCarGZb94SIWVOCQY4Be5y1EP4FCV7XGwdMUSe
	tVE=
X-IronPort-AV: E=Sophos;i="5.69,410,1571695200"; d="scan'208";a="21903713"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jan 2020 14:54:04 +0100
Message-ID: <20200108135404.153669-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [PATCH] gstreamer1.0-plugins-bad: Add packageconfig for vdpau acceleration
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
X-List-Received-Date: Wed, 08 Jan 2020 13:54:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

libvdpau support was added to meta-oe by commit bf1de4db2 ("libvdpau:
Add recipe") in 2016. Therefore add a packageconfig for the
corresponding gstreamer plugin.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index ed3efab29f..85568b414a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -75,6 +75,7 @@ PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
 PACKAGECONFIG[ttml]            = "--enable-ttml,--disable-ttml,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
+PACKAGECONFIG[vdpau]           = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan-loader"
@@ -88,7 +89,7 @@ PACKAGECONFIG[zbar]            = "--enable-zbar,--disable-zbar,zbar"
 #   openni2 winks direct3d directsound winscreencap apple_media iqa
 #   android_media avc bs2b chromaprint dts fdkaac gme gsm kate ladspa
 #   lv2 mpeg2enc mplex musepack nvenc ofa opensles soundtouch
-#   spandsp teletextdec vdpau wasapi wpe x265
+#   spandsp teletextdec wasapi wpe x265
 
 EXTRA_OECONF += " \
     --enable-decklink \
@@ -125,7 +126,6 @@ EXTRA_OECONF += " \
     --disable-spandsp \
     --disable-srt \
     --disable-teletextdec \
-    --disable-vdpau \
     --disable-wasapi \
     --disable-wildmidi \
     --disable-winks \
-- 
2.24.1


