Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 99587609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 18:10:38 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id y19so5117606wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XoegILY37F3RDRkScq6pWiO01cJo787J6mlP9NUc8eY=;
	b=foDaj4qixwQG3dHBPB/MYOWFFL0MbOxSrTN93M0Z1bbuGcU3NVka0RE/mWsLwPM+Un
	k9X14MSWtrRh9mYh1yhpyNaA0ZeGCCXZxEiJ084P3PGTS74Ht8FUpGfeXXIfHJCO0Z4a
	fGSR6HRxlqglRebgkg017K4R/NqABRXS1lo7/Mj4bgqD+/XqXpxSvzcTjSXD2xUuLT3w
	+aaSqf0R0nu/sXbsbZ+cZGG2EawgBq1scHIM/RNTSRSX7xtCxLXiKuaxiDIb+HEJ1Xo8
	ki+bxnh7J7A0WSAtaVkinNAOkEx2PeMmaFbM5H4BJPDQC1ACEvGuhZb3LPmgvwG2muLD
	BUBQ==
X-Gm-Message-State: ALoCoQly6T73eaPbbjGJBjlRL8aI4T34OGEmeoe/GZT3Q3QXyI1AXxxUubbxi76zLrXYYTjdJPBU
X-Received: by 10.180.21.161 with SMTP id w1mr8014558wie.44.1423678238890;
	Wed, 11 Feb 2015 10:10:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hn2sm2309857wjc.5.2015.02.11.10.10.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 10:10:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 18:08:28 +0000
Message-Id: <1423678110-27633-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1423678110-27633-1-git-send-email-ross.burton@intel.com>
References: <1423678110-27633-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] gstreamer1.0-plugins-good: ship equaliser presets in right package
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
X-List-Received-Date: Wed, 11 Feb 2015 18:10:45 -0000

The equaliser presets were packaged into ${PN} which was rarely installed, so
move the files to the right subpackage.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index b33ab2b..37217f0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -55,3 +55,4 @@ EXTRA_OECONF += " \
     ${GSTREAMER_1_0_ORC} \
 "
 
+FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
-- 
1.7.10.4


