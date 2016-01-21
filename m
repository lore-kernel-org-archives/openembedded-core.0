Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 88D107317C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:47 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id x5so1828365obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x0YDEMw/YUZXdecCurkKb830szdh3KwgoXErqBrCv38=;
	b=sxjIxoAm1CZ9fIDn+qNzcKqLmy+CS78O2a2jpUSlNthktRadGe/BjS+W2IqmM1/RWS
	X/C+BBNiaiqryGvkmWO/qjc9sKiTnoUJ8nmxqA2W10IK1Jb3Gj7fFm7GrzHzezVQigHF
	s4F/2gLwjRGhtr6yopZfT1/beKCbc1FeK8PccYazlE4OJcpy8mUU8s9EKOKY5SIhSo+m
	0boDsCd5v8n8ABUCdfLR99ysZMdS4fC3zdUTetm/JaLBpENHGVuUST7MRqHug6AGfmWI
	qVSFy3Y8KdlhUlc2HuOGtRQxZkE8pKtb1mXwBpwWAf0jBIXvpL94ML2LcDAO1eY51dBH
	mJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x0YDEMw/YUZXdecCurkKb830szdh3KwgoXErqBrCv38=;
	b=XR1GB9++2oTKyigvuL5peoc+LHBiEpNQvhrZH19OO2BBPh1rtyIBv+eN+8uVxx9Kr7
	WqofgVNGjFxrwAS6uUU3KV+LhNO/FbpGU2lCj2qS11dPrF6y5nhUYXzRjeKvsj0gu7jO
	UFvf/oW2YB1fNrZzmBsG4X/WBgegUGYbrLbpNJaJt660RcL9ldHE78HATsrEeJDAkilU
	jwDfZx39p0MOOrSYunlvM8sOvvX6wmnCVXpOzYL7f4U0RnGtM6wbRafRtE0JwTct0kmz
	Mhmv9Yu2hfz9MC4aB6foRDiMRdeOyoZuD6KJ1QMc4b2AnDKF9IBeyK5ek7uxc5JCMaQt
	1E1g==
X-Gm-Message-State: ALoCoQmo0aq/SerTt6Ipce9bilFbAv52N1n/L+DVl1H2eV357IzTh/7FCB72tjaKhTRT18auKSWwVIcSsviUZ+KxcM6BkuTsKg==
X-Received: by 10.182.108.229 with SMTP id hn5mr31600488obb.75.1453344228052; 
	Wed, 20 Jan 2016 18:43:48 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:06 -0800
Message-Id: <1453344203-7118-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 08/25] gstreamer1.0-plugins-ugly: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:47 -0000

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


