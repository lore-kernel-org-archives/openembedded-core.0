Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 496707F0D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:22:27 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v24so10521782ljg.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CFuRHG/dSGf0qBrTKJeZgduBBVCj1d+cXUPXybJcsRM=;
	b=yEuOkT4y0dxzYsqw32zAFMzR2vOjoeDHHymdMlfyIqnuFmVaED9cnGd5vc6oUdwhZ+
	XnVAgl9GDg3bD3n63yLvgMDbTxiftGAdQ18miZ6lI7jy0jUDOcVGeKTyeklEaAwtiDp8
	HtEXAD6rRxSKkSy/hvTT/P55L8s/Kw2ifNppGBVn1C+dqc1vRYdXJEEiAnM2+CpFTcAQ
	2V9aWL6al6oJqoEfc5bfqIP//J7zjdeCH6sCMTcCm3qEZE1U3A3DTy8pv9Spip/FGm+b
	ATG3qNkoN8N4R1I5A8iNufEtVLNNNQ3UA0llOX6CVrUd9e4LagrkNV/qFUdLXIjkIRsi
	fSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CFuRHG/dSGf0qBrTKJeZgduBBVCj1d+cXUPXybJcsRM=;
	b=Tk4pWnRdFLK11uBn5WCwVEXHapburS12vvoRAwk5xpLknJjas2B4/zt1gFoKM47Qul
	lNCO4mQiNw09C4U93EcuhPIqLrFWHNY7oRJz6DB+ppBZwvAPyJa6ptaoy83MF18yB3Gz
	Nf5UivXPTuP4iI2RDVsH849mSv2GDY/Wu4BG3XRc1H8HQbnXVYKaRibWc80oPC5wNW9i
	8lCWuWosHBDemU+JTWz/j+B7gSQZcnYtud54o9JUqSt/3bW05PxdgiVaQJjpHCgHAmJa
	n6Q5mRgs/XmIpD9J/XrBFsDrCZ3zb7IRZyLPN7RXzB8nv+ud9ryLyL3bqn9kTK1H8GaU
	YLZw==
X-Gm-Message-State: APjAAAUYCLPsY3jMQs7t82ceChrtLM8yZ+5O7U6J/oKPXSrpqkSoIZcf
	acpdnXpQXNnuRRNENsu9g5voksY4
X-Google-Smtp-Source: APXvYqxt64XVMgeaLxUe1kT2XMAU1HTLCpAmrSrlav+JCQqNPHjutYtn1tRFU9dRhpaJ80IVXDviaw==
X-Received: by 2002:a2e:5d92:: with SMTP id v18mr7021592lje.9.1562962947151;
	Fri, 12 Jul 2019 13:22:27 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z85sm1608746ljb.101.2019.07.12.13.22.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 13:22:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 22:22:14 +0200
Message-Id: <20190712202216.29218-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/3] xorgproto: update to 2019.1
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
X-List-Received-Date: Fri, 12 Jul 2019 20:22:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-Remove-libdir-specification.patch    | 468 ------------------
 ...orgproto_2018.4.bb => xorgproto_2019.1.bb} |   6 +-
 2 files changed, 2 insertions(+), 472 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2018.4.bb => xorgproto_2019.1.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch b/meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch
deleted file mode 100644
index 48296f7844..0000000000
--- a/meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch
+++ /dev/null
@@ -1,468 +0,0 @@
-Upstream-Status: Submitted
-
-https://cgit.freedesktop.org/xorg/proto/xorgproto/commit/?id=91c1c8e1490c970379efb16784003426faec806e
-
-From 6feb974e0deb3355908c30e07293d82a3f6996ed Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Mon, 11 Jun 2018 16:42:43 +0000
-Subject: [PATCH] Remove libdir specification.
-
-Currently the pc files define libdir, however they are installed into
-/usr/share, which means they should be architecture agnostic. In a
-multilib system, xorg-proto built for each multilib abi, the value of
-libdir is going to be different. These should either be installed in
-<libdir>/pkgconfig or they shouldn't define libdir, espeically since
-they don't actually use the definition. This specifically causes an
-issue when trying to install both abis at the same time, since they are
-not binary identical, something like rpm will complain that they
-
----
- applewmproto.pc.in     | 1 -
- bigreqsproto.pc.in     | 1 -
- compositeproto.pc.in   | 1 -
- damageproto.pc.in      | 1 -
- dmxproto.pc.in         | 1 -
- dri2proto.pc.in        | 1 -
- dri3proto.pc.in        | 1 -
- evieproto.pc.in        | 1 -
- fixesproto.pc.in       | 1 -
- fontcacheproto.pc.in   | 1 -
- fontsproto.pc.in       | 1 -
- glproto.pc.in          | 1 -
- inputproto.pc.in       | 1 -
- kbproto.pc.in          | 1 -
- lg3dproto.pc.in        | 1 -
- presentproto.pc.in     | 1 -
- printproto.pc.in       | 1 -
- randrproto.pc.in       | 1 -
- recordproto.pc.in      | 1 -
- renderproto.pc.in      | 1 -
- resourceproto.pc.in    | 1 -
- scrnsaverproto.pc.in   | 1 -
- trapproto.pc.in        | 1 -
- videoproto.pc.in       | 1 -
- windowswmproto.pc.in   | 1 -
- xcalibrateproto.pc.in  | 1 -
- xcmiscproto.pc.in      | 1 -
- xextproto.pc.in        | 1 -
- xf86bigfontproto.pc.in | 1 -
- xf86dgaproto.pc.in     | 1 -
- xf86driproto.pc.in     | 1 -
- xf86miscproto.pc.in    | 1 -
- xf86rushproto.pc.in    | 1 -
- xf86vidmodeproto.pc.in | 1 -
- xineramaproto.pc.in    | 1 -
- xproto.pc.in           | 1 -
- xproxymngproto.pc.in   | 1 -
- 37 files changed, 37 deletions(-)
-
-diff --git a/applewmproto.pc.in b/applewmproto.pc.in
-index 17841ac..3227b21 100644
---- a/applewmproto.pc.in
-+++ b/applewmproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: AppleWMProto
-diff --git a/bigreqsproto.pc.in b/bigreqsproto.pc.in
-index 94577ed..e21bb59 100644
---- a/bigreqsproto.pc.in
-+++ b/bigreqsproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: BigReqsProto
-diff --git a/compositeproto.pc.in b/compositeproto.pc.in
-index da429c7..b0dada1 100644
---- a/compositeproto.pc.in
-+++ b/compositeproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: CompositeExt
-diff --git a/damageproto.pc.in b/damageproto.pc.in
-index 6fd9ef1..bfd5244 100644
---- a/damageproto.pc.in
-+++ b/damageproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: DamageProto
-diff --git a/dmxproto.pc.in b/dmxproto.pc.in
-index e82ee7d..d140e1c 100644
---- a/dmxproto.pc.in
-+++ b/dmxproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: DMXProto
-diff --git a/dri2proto.pc.in b/dri2proto.pc.in
-index cb5b171..fa9d24d 100644
---- a/dri2proto.pc.in
-+++ b/dri2proto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: DRI2Proto
-diff --git a/dri3proto.pc.in b/dri3proto.pc.in
-index e42d60e..20da358 100644
---- a/dri3proto.pc.in
-+++ b/dri3proto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: DRI3Proto
-diff --git a/evieproto.pc.in b/evieproto.pc.in
-index 64e0ec4..fd5442b 100644
---- a/evieproto.pc.in
-+++ b/evieproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: EvIEExt
-diff --git a/fixesproto.pc.in b/fixesproto.pc.in
-index f8258e2..c7fcb81 100644
---- a/fixesproto.pc.in
-+++ b/fixesproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: FixesProto
-diff --git a/fontcacheproto.pc.in b/fontcacheproto.pc.in
-index eb4238b..8ffffe9 100644
---- a/fontcacheproto.pc.in
-+++ b/fontcacheproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: FontcacheProto
-diff --git a/fontsproto.pc.in b/fontsproto.pc.in
-index 9d22354..ebb61a4 100644
---- a/fontsproto.pc.in
-+++ b/fontsproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: FontsProto
-diff --git a/glproto.pc.in b/glproto.pc.in
-index b951db5..e97bfc9 100644
---- a/glproto.pc.in
-+++ b/glproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: GLProto
-diff --git a/inputproto.pc.in b/inputproto.pc.in
-index 1eb6619..270b95c 100644
---- a/inputproto.pc.in
-+++ b/inputproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: InputProto
-diff --git a/kbproto.pc.in b/kbproto.pc.in
-index bdd39f1..32a172d 100644
---- a/kbproto.pc.in
-+++ b/kbproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: KBProto
-diff --git a/lg3dproto.pc.in b/lg3dproto.pc.in
-index 3930ad7..43fba29 100644
---- a/lg3dproto.pc.in
-+++ b/lg3dproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: Lg3dProto
-diff --git a/presentproto.pc.in b/presentproto.pc.in
-index 6ec4b7d..55b84dc 100644
---- a/presentproto.pc.in
-+++ b/presentproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: PresentProto
-diff --git a/printproto.pc.in b/printproto.pc.in
-index 8a2e2d6..a2da66d 100644
---- a/printproto.pc.in
-+++ b/printproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: PrintProto
-diff --git a/randrproto.pc.in b/randrproto.pc.in
-index 5a5edb2..6d60cbb 100644
---- a/randrproto.pc.in
-+++ b/randrproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: RandrProto
-diff --git a/recordproto.pc.in b/recordproto.pc.in
-index 0ff4c0b..a87aa82 100644
---- a/recordproto.pc.in
-+++ b/recordproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: RecordProto
-diff --git a/renderproto.pc.in b/renderproto.pc.in
-index e6028ac..34b15e0 100644
---- a/renderproto.pc.in
-+++ b/renderproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: RenderProto
-diff --git a/resourceproto.pc.in b/resourceproto.pc.in
-index a409db9..f927cbb 100644
---- a/resourceproto.pc.in
-+++ b/resourceproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: ResourceProto
-diff --git a/scrnsaverproto.pc.in b/scrnsaverproto.pc.in
-index 6556a2c..fd9d368 100644
---- a/scrnsaverproto.pc.in
-+++ b/scrnsaverproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: ScrnSaverProto
-diff --git a/trapproto.pc.in b/trapproto.pc.in
-index 8cb0aa8..8a220b9 100644
---- a/trapproto.pc.in
-+++ b/trapproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: TrapProto
-diff --git a/videoproto.pc.in b/videoproto.pc.in
-index 14b907a..5c22f7a 100644
---- a/videoproto.pc.in
-+++ b/videoproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: VideoProto
-diff --git a/windowswmproto.pc.in b/windowswmproto.pc.in
-index 0a2ec0b..ec56e82 100644
---- a/windowswmproto.pc.in
-+++ b/windowswmproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: WindowsWMProto
-diff --git a/xcalibrateproto.pc.in b/xcalibrateproto.pc.in
-index 40b6fd0..f1ea5de 100644
---- a/xcalibrateproto.pc.in
-+++ b/xcalibrateproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- 
- Name: XCalibrate
-diff --git a/xcmiscproto.pc.in b/xcmiscproto.pc.in
-index 0dfbf21..b72bbc6 100644
---- a/xcmiscproto.pc.in
-+++ b/xcmiscproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XCMiscProto
-diff --git a/xextproto.pc.in b/xextproto.pc.in
-index f66eeae..9419c91 100644
---- a/xextproto.pc.in
-+++ b/xextproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XExtProto
-diff --git a/xf86bigfontproto.pc.in b/xf86bigfontproto.pc.in
-index 18c5647..4a67be6 100644
---- a/xf86bigfontproto.pc.in
-+++ b/xf86bigfontproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XF86BigFontProto
-diff --git a/xf86dgaproto.pc.in b/xf86dgaproto.pc.in
-index 5c5f8b1..e029cd4 100644
---- a/xf86dgaproto.pc.in
-+++ b/xf86dgaproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XF86DGAProto
-diff --git a/xf86driproto.pc.in b/xf86driproto.pc.in
-index 93df292..c8faf14 100644
---- a/xf86driproto.pc.in
-+++ b/xf86driproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XF86DRIProto
-diff --git a/xf86miscproto.pc.in b/xf86miscproto.pc.in
-index af73fa3..05d5d9e 100644
---- a/xf86miscproto.pc.in
-+++ b/xf86miscproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XF86MiscProto
-diff --git a/xf86rushproto.pc.in b/xf86rushproto.pc.in
-index fc5f63b..1c7ff1b 100644
---- a/xf86rushproto.pc.in
-+++ b/xf86rushproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XF86RushProto
-diff --git a/xf86vidmodeproto.pc.in b/xf86vidmodeproto.pc.in
-index fcb74f2..ef062b3 100644
---- a/xf86vidmodeproto.pc.in
-+++ b/xf86vidmodeproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XF86VidModeProto
-diff --git a/xineramaproto.pc.in b/xineramaproto.pc.in
-index 1ffd37d..9172f1e 100644
---- a/xineramaproto.pc.in
-+++ b/xineramaproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XineramaProto
-diff --git a/xproto.pc.in b/xproto.pc.in
-index 8ff2d3d..899316a 100644
---- a/xproto.pc.in
-+++ b/xproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
- includex11dir=@includedir@/X11
-  
-diff --git a/xproxymngproto.pc.in b/xproxymngproto.pc.in
-index 5c6fad6..1a81e28 100644
---- a/xproxymngproto.pc.in
-+++ b/xproxymngproto.pc.in
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- includedir=@includedir@
-  
- Name: XProxyManagementProtocol
--- 
-2.11.1
-
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2019.1.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2019.1.bb
index cec6e87559..2c7ce2a56c 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2019.1.bb
@@ -8,9 +8,7 @@ the core protocol and (many) extensions for the X Window System"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=b9e051107d5628966739a0b2e9b32676"
 
-SRC_URI += "file://0001-Remove-libdir-specification.patch"
-
-SRC_URI[md5sum] = "81557ca47ee66a4e54590fcdadd28114"
-SRC_URI[sha256sum] = "fee885e0512899ea5280c593fdb2735beb1693ad170c22ebcc844470eec415a0"
+SRC_URI[md5sum] = "802ccb9e977ba3cf94ba798ddb2898a4"
+SRC_URI[sha256sum] = "a6daaa7a6cbc8e374032d83ff7f47d41be98f1e0f4475d66a4da3aa766a0d49b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


