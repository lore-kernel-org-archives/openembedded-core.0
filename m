Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 94E617317D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:19 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id oj9so2022715obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x0YDEMw/YUZXdecCurkKb830szdh3KwgoXErqBrCv38=;
	b=lLSIZLJ2FRLOnFcpMvw3faJhUQFwIbmGqFisB6xdMcMSgZm7ed1285SiRr/WUhrcsg
	geUwKABnpvnGdFrgPWsh61GfHZzzrFFwJaBZ9N/+XvI8SkT/TKY2NSrQGaps2NFjcrlr
	7w8mrkS2ihGt20Yt1AYSRyFICP0qVOZxz0wIxlPClOEgjdc8KFg4sTlAbiBNX1jFejg9
	ihOZfB6g0BWFoBwlyCzY90qLtMZb8URpl+2TyEeJJGw2RleBwLVPTEEwaNyuaZ5XRr8P
	ud73AQWTJlqIezg9dNkjdLSG8cM45lSO1GlSOpNDJY5sL9USpz1I3Dxt30IPUpjvgYBv
	cvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x0YDEMw/YUZXdecCurkKb830szdh3KwgoXErqBrCv38=;
	b=JVykmCyTaPSZ63zSWQpg+YDgwtKy/VVGysLPIUJLLARxWFKq+NnX+NWMQPJNPCxPvV
	KyyQorGvsyyl3HncWLt00qswLwr5yzLBm+YDkLLWQDG6r7TUQ/FeeuBXtHgF7Ih2wKKn
	p8nnN+Ht2x82XjYOpUMKcU7/YPNWlySDxPxSuNbHwHFRIyrQ8rhg5t95TRn+Q35Kxx94
	ddEiR/b0i5HTpkgIPtcpjhfZs5ZpqhCDx1f0fy1qOTVTh7ILFMAC369fU33VNY5aN4fu
	NgwKc9YQFa4psRn8D8H2cndnXZp0wnuM1qqCWV2bsHUJB8fyNrus5GiqVu07TIL46RVN
	nKzA==
X-Gm-Message-State: ALoCoQmvSigOxY/IqprkBqXyfzM+b6gyNbeA3KvGPGcRtP7/N+X7t2ftLKoJx7griJ07SzcoMRP3RSk2jhBPeGfYknGXN585uw==
X-Received: by 10.182.142.105 with SMTP id rv9mr32868871obb.66.1453354640542; 
	Wed, 20 Jan 2016 21:37:20 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:19 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:26 -0800
Message-Id: <1453354610-19218-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 08/32] gstreamer1.0-plugins-ugly: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:19 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-ugly.inc                | 14 ++++++--------
 .../gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb           |  3 +--
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb             |  7 +++----
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index eb49e22..869022a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -7,26 +7,24 @@ DEPENDS += "gstreamer1.0-plugins-base libid3tag"
 
 inherit gettext
 
-
 PACKAGECONFIG ??= " \
-    orc a52dec lame mad mpeg2dec \
-    "
+    a52dec lame mad mpeg2dec orc \
+"
 
 PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
+PACKAGECONFIG[amrnb]    = "--enable-amrnb,--disable-amrnb,opencore-amr"
+PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
 PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
 PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
 PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
 PACKAGECONFIG[mad]      = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
 PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
-PACKAGECONFIG[amrnb]    = "--enable-amrnb,--disable-amrnb,opencore-amr"
-PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
-
 
 EXTRA_OECONF += " \
     --disable-sidplay \
     --disable-twolame \
-    "
+"
 
-FILES_${PN}-x264 += "${datadir}/gstreamer-1.0/presets/GstX264Enc.prs"
 FILES_${PN}-amrnb += "${datadir}/gstreamer-1.0/presets/GstAmrnbEnc.prs"
+FILES_${PN}-x264 += "${datadir}/gstreamer-1.0/presets/GstX264Enc.prs"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
index 67b72fa..d935f6d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
@@ -1,10 +1,9 @@
 include gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
+                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
 SRC_URI[md5sum] = "0f0e30336e3155443cd5bfec5c215d56"
 SRC_URI[sha256sum] = "e7f1b6321c8667fabc0dedce3998a3c6e90ce9ce9dea7186d33dc4359f9e9845"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index dcf5ffc..e06b5ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -3,15 +3,14 @@ DEFAULT_PREFERENCE = "-1"
 include gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
-
-S = "${WORKDIR}/git"
+                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
 SRCREV = "06b8ac10cee85c5c304ca320997aa8f44295a66f"
 
+S = "${WORKDIR}/git"
+
 do_configure_prepend() {
 	cd ${S}
 	./autogen.sh --noconfigure
 	cd ${B}
 }
-
-- 
1.9.1


