Return-Path: <n.wesp@phytec.de>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Nov 2019 14:46:37 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 394A87F65C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1574346696; x=1576938696;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GO7z6VEPXBjlOtHsP6Laww/uRcbTI1EiBLG0bgkrCYI=;
	b=RGqaqIFRteaa9XwNUVEfPiwok+boDk5h20DvhXIP75/wLMkAwZdKR8xLO3vCTkgP
	8AJnMEWujHQ24am01wM8z8EQOK4IOEvbJXnHQjzFMB3AKpqUQo31VoTw48JU4n3s
	dHuvLBpN9aazwcuWpJesDVTlAec6H/d0zaTAwZyZLVU=;
X-AuditID: c39127d2-e0fff7000000408f-31-5dd69fc893d7
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	A9.09.16527.8CF96DD5; Thu, 21 Nov 2019 15:31:36 +0100 (CET)
Received: from lws-wesp.phytec.de ([172.16.23.121])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019112115313612-82 ; Thu, 21 Nov 2019 15:31:36 +0100 
From: Norbert Wesp <n.wesp@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 15:31:32 +0100
Message-Id: <20191121143132.6094-1-n.wesp@phytec.de>
X-Mailer: git-send-email 2.17.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 21.11.2019 15:31:36,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 21.11.2019 15:31:36,
	Serialize complete at 21.11.2019 15:31:36
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJMWRmVeSWpSXmKPExsWyRoCBS/fE/GuxBtN2cVnc+fmO3YHR49zG
	FYwBjFFcNimpOZllqUX6dglcGeeOfGAs2MdbcW6iSANjH3cXIyeHhICJxKO+x2xdjFwcQgJb
	GSUufz7KDOGcZpRYsPkCO0gVm4CqRPuZG0AJDg4RAR2JNx+9QMLCAqESZy//YgGxWYBKfk54
	wAZi8wINvfShlQ1igbzE6g0HwGZKCDQySVzcvZUdIiEkcXrxWeYJjNwLGBlWMQrlZiZnpxZl
	ZusVZFSWpCbrpaRuYgR67/BE9Us7GPvmeBxiZOJgPMQowcGsJMK75/qVWCHelMTKqtSi/Pii
	0pzU4kOM0hwsSuK8G3hLwoQE0hNLUrNTUwtSi2CyTBycUg2MWWnJed2xBzw7jPkOHH6VtEJ4
	q+/T8K9Zs+/XJ5v+XaPWetnifNkNO7YHXIyr5rz6yahhW+hxZ/3PcywnjVO2iJ503TM7fn/F
	tkUnE4K8pp96mc5ecLJt5elJ5udizQ5cOvZrreIc0Ukrst8b2Rk83ewkKqJkObWywfp/hcbb
	lY6vC0y+Mx3zVGIpzkg01GIuKk4EAANAVBzMAQAA
Subject: [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG option for zbar
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
X-List-Received-Date: Thu, 21 Nov 2019 14:46:38 -0000

As a recipe for zbar was added 2016-12-26,
we can add an option in PACKAGECONFIG for it.

Signed-off-by: Norbert Wesp <n.wesp@phytec.de>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index 1731be84410..ed3efab29fe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -82,12 +82,13 @@ PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-nat
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[webrtc]          = "--enable-webrtc,--disable-webrtc,libnice"
 PACKAGECONFIG[webrtcdsp]       = "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-audio-processing"
+PACKAGECONFIG[zbar]            = "--enable-zbar,--disable-zbar,zbar"
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
 #   openni2 winks direct3d directsound winscreencap apple_media iqa
 #   android_media avc bs2b chromaprint dts fdkaac gme gsm kate ladspa
 #   lv2 mpeg2enc mplex musepack nvenc ofa opensles soundtouch
-#   spandsp teletextdec vdpau wasapi wpe x265 zbar
+#   spandsp teletextdec vdpau wasapi wpe x265
 
 EXTRA_OECONF += " \
     --enable-decklink \
@@ -131,7 +132,6 @@ EXTRA_OECONF += " \
     --disable-winscreencap \
     --disable-wpe \
     --disable-x265 \
-    --disable-zbar \
     ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
 "
 
-- 
2.17.1


