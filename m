Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCC96AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 21:13:10 +0000 (UTC)
Received: by igrv9 with SMTP id v9so9145357igr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 14:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0K3fCIR/xdTlzlc5WCcObJmW9EPBa/TzX0el3+4HlL8=;
	b=uiKvhX7UKWsRfrPWzwTBzFUVZwlYiRa9ctNA5Qdvj1m3jlsF7qxNdSQPc7wrPwD13n
	CETuzpbcruHYvW7I2OlFbObpGTBUk1Ygf9RC5VEkttxkYMRyy5KvkHxHYpXIU1Am5YkZ
	S+sTv87VRRd94BGqtgLRHluviksIf1OG7SNfbweAL2ZUXdleOVPEaBlFBKJlErcNbyta
	LaZ1o0XxgDwPwuVOaj5yydxsIQCLP1/UzM2r71nlaC+e4ovNLomDQD4VBVvr0Vxilucj
	Uh+XRTEWaSQQ9rEpCDeknvIkZTZN0XkCuTE3E/7+07WWeJh5O9rBy6DrsFk9FJb2PmDP
	755g==
X-Received: by 10.50.13.98 with SMTP id g2mr199959igc.16.1435353191686;
	Fri, 26 Jun 2015 14:13:11 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	a82sm22338867ioe.22.2015.06.26.14.13.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jun 2015 14:13:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 14:13:04 -0700
Message-Id: <1435353184-13463-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-plugins-bad.inc: remove duplicate bzip2 dependency
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
X-List-Received-Date: Fri, 26 Jun 2015 21:13:14 -0000

Dependency on bzip2 is handled by the bz2 PACKAGECONFIG option, so
bzip2 does not need to be included in DEPENDS.

Also fix minor indent issue with bluez PACKAGECONFIG option.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 84a0a58..d34aca5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -2,7 +2,7 @@ require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
 
-DEPENDS += "gstreamer1.0-plugins-base bzip2 libpng jpeg"
+DEPENDS += "gstreamer1.0-plugins-base libpng jpeg"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
@@ -49,7 +49,7 @@ PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
-PACKAGECONFIG[bluez]          = "--enable-bluez,--disable-bluez,${BLUEZ}"
+PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
-- 
1.9.1


