Return-Path: <jpuhlman@mvista.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8078675048
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:17:04 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id w12-v6so1800387pgc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 13:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jAtZJsCaf46VboN6edwR5rvVk+OQjwHuS/b5rWXM58I=;
	b=O27aZ+yk55MIob/eTcON7OUf9OAcjOUb7aKmtxn0ZkPi0fCMXqKsD0WNs+ptw82sFt
	upVunshPBlqVEQhjeMZrOwr5p+YFBtN5DSO+sPJ14hIo2R2TuDU6m9/1REPkMGi6ednA
	P7M+YjNA0EUVd9eiD3ekYPekgvpE/XBrpbK316wujLE+YwBGW60pb2OyrngQm9bkvusv
	X9gkQQowf8oaRLXQ2hjUDLDwWPa+507ygspRgoEz9hP44XA4liIxr8hO2aL9nxR2BOxR
	Gs1Hsb23RdGQmZec8zUYXIZ7mubrmVWvIl4luXJTmSy7qVcY1MidkypF242qnApC/V5K
	wwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jAtZJsCaf46VboN6edwR5rvVk+OQjwHuS/b5rWXM58I=;
	b=n2P4dYfHP0TB/n8mq+Y20N2GZSfVHzCh41oUYiHywlojIXlSizdKHMHSi2ZwalcVwA
	FjOzxlmPr8Ge5XWWAWdphhbEtAZSNbgLJjmqTSeXO22PQ2YYJKBAg+TRJXUS7E3WUJcK
	c00MREE6H2GnK5vVwMeeuvP9LLN6pRh8zB3VeVhu46Wt6O6ELB6QmDLgGC48Yh+46Be/
	Ik1ly9mULf6UGNBy/xUA8833xPqBr/xS38zbWFqKjXOqeTqDALCRK0F5T4SKe/A5YQja
	oWSDdYCyP+R/O3wl7GxapMJ05gacw/c7wZMyeYwXeYX+YeiMWjGWKDV+lXDWTHk+wUhC
	1VxA==
X-Gm-Message-State: APt69E26bi8atmNWLlaOCNL+mEODerx2fQ+GDtVmxGG50s81X/yc62gT
	r2ohvMf4J5GYhUUJhdolKNHCTi5Bq9Y=
X-Google-Smtp-Source: ADUXVKJMZ2muqwCw3nbB6rdP5F3myXR9IkDtOURQek8p5Ex67AhKBZzcGhjqq0IUnxSFOOolxnEH/Q==
X-Received: by 2002:a65:6008:: with SMTP id
	m8-v6mr5327554pgu.134.1528921025351; 
	Wed, 13 Jun 2018 13:17:05 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	a11-v6sm4297256pgq.32.2018.06.13.13.17.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 13:17:04 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 13:14:13 -0700
Message-Id: <1528920853-21696-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] Remove libdir specification from xorgproto .pc files
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
X-List-Received-Date: Wed, 13 Jun 2018 20:17:04 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../0001-Remove-libdir-specification.patch         | 468 +++++++++++++++++++++
 .../xorg-proto/xorgproto_2018.4.bb                 |   2 +
 2 files changed, 470 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch b/meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch
new file mode 100644
index 0000000..48296f7
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xorgproto/0001-Remove-libdir-specification.patch
@@ -0,0 +1,468 @@
+Upstream-Status: Submitted
+
+https://cgit.freedesktop.org/xorg/proto/xorgproto/commit/?id=91c1c8e1490c970379efb16784003426faec806e
+
+From 6feb974e0deb3355908c30e07293d82a3f6996ed Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Mon, 11 Jun 2018 16:42:43 +0000
+Subject: [PATCH] Remove libdir specification.
+
+Currently the pc files define libdir, however they are installed into
+/usr/share, which means they should be architecture agnostic. In a
+multilib system, xorg-proto built for each multilib abi, the value of
+libdir is going to be different. These should either be installed in
+<libdir>/pkgconfig or they shouldn't define libdir, espeically since
+they don't actually use the definition. This specifically causes an
+issue when trying to install both abis at the same time, since they are
+not binary identical, something like rpm will complain that they
+
+---
+ applewmproto.pc.in     | 1 -
+ bigreqsproto.pc.in     | 1 -
+ compositeproto.pc.in   | 1 -
+ damageproto.pc.in      | 1 -
+ dmxproto.pc.in         | 1 -
+ dri2proto.pc.in        | 1 -
+ dri3proto.pc.in        | 1 -
+ evieproto.pc.in        | 1 -
+ fixesproto.pc.in       | 1 -
+ fontcacheproto.pc.in   | 1 -
+ fontsproto.pc.in       | 1 -
+ glproto.pc.in          | 1 -
+ inputproto.pc.in       | 1 -
+ kbproto.pc.in          | 1 -
+ lg3dproto.pc.in        | 1 -
+ presentproto.pc.in     | 1 -
+ printproto.pc.in       | 1 -
+ randrproto.pc.in       | 1 -
+ recordproto.pc.in      | 1 -
+ renderproto.pc.in      | 1 -
+ resourceproto.pc.in    | 1 -
+ scrnsaverproto.pc.in   | 1 -
+ trapproto.pc.in        | 1 -
+ videoproto.pc.in       | 1 -
+ windowswmproto.pc.in   | 1 -
+ xcalibrateproto.pc.in  | 1 -
+ xcmiscproto.pc.in      | 1 -
+ xextproto.pc.in        | 1 -
+ xf86bigfontproto.pc.in | 1 -
+ xf86dgaproto.pc.in     | 1 -
+ xf86driproto.pc.in     | 1 -
+ xf86miscproto.pc.in    | 1 -
+ xf86rushproto.pc.in    | 1 -
+ xf86vidmodeproto.pc.in | 1 -
+ xineramaproto.pc.in    | 1 -
+ xproto.pc.in           | 1 -
+ xproxymngproto.pc.in   | 1 -
+ 37 files changed, 37 deletions(-)
+
+diff --git a/applewmproto.pc.in b/applewmproto.pc.in
+index 17841ac..3227b21 100644
+--- a/applewmproto.pc.in
++++ b/applewmproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: AppleWMProto
+diff --git a/bigreqsproto.pc.in b/bigreqsproto.pc.in
+index 94577ed..e21bb59 100644
+--- a/bigreqsproto.pc.in
++++ b/bigreqsproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: BigReqsProto
+diff --git a/compositeproto.pc.in b/compositeproto.pc.in
+index da429c7..b0dada1 100644
+--- a/compositeproto.pc.in
++++ b/compositeproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: CompositeExt
+diff --git a/damageproto.pc.in b/damageproto.pc.in
+index 6fd9ef1..bfd5244 100644
+--- a/damageproto.pc.in
++++ b/damageproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: DamageProto
+diff --git a/dmxproto.pc.in b/dmxproto.pc.in
+index e82ee7d..d140e1c 100644
+--- a/dmxproto.pc.in
++++ b/dmxproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: DMXProto
+diff --git a/dri2proto.pc.in b/dri2proto.pc.in
+index cb5b171..fa9d24d 100644
+--- a/dri2proto.pc.in
++++ b/dri2proto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: DRI2Proto
+diff --git a/dri3proto.pc.in b/dri3proto.pc.in
+index e42d60e..20da358 100644
+--- a/dri3proto.pc.in
++++ b/dri3proto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: DRI3Proto
+diff --git a/evieproto.pc.in b/evieproto.pc.in
+index 64e0ec4..fd5442b 100644
+--- a/evieproto.pc.in
++++ b/evieproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: EvIEExt
+diff --git a/fixesproto.pc.in b/fixesproto.pc.in
+index f8258e2..c7fcb81 100644
+--- a/fixesproto.pc.in
++++ b/fixesproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: FixesProto
+diff --git a/fontcacheproto.pc.in b/fontcacheproto.pc.in
+index eb4238b..8ffffe9 100644
+--- a/fontcacheproto.pc.in
++++ b/fontcacheproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: FontcacheProto
+diff --git a/fontsproto.pc.in b/fontsproto.pc.in
+index 9d22354..ebb61a4 100644
+--- a/fontsproto.pc.in
++++ b/fontsproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: FontsProto
+diff --git a/glproto.pc.in b/glproto.pc.in
+index b951db5..e97bfc9 100644
+--- a/glproto.pc.in
++++ b/glproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: GLProto
+diff --git a/inputproto.pc.in b/inputproto.pc.in
+index 1eb6619..270b95c 100644
+--- a/inputproto.pc.in
++++ b/inputproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: InputProto
+diff --git a/kbproto.pc.in b/kbproto.pc.in
+index bdd39f1..32a172d 100644
+--- a/kbproto.pc.in
++++ b/kbproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: KBProto
+diff --git a/lg3dproto.pc.in b/lg3dproto.pc.in
+index 3930ad7..43fba29 100644
+--- a/lg3dproto.pc.in
++++ b/lg3dproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: Lg3dProto
+diff --git a/presentproto.pc.in b/presentproto.pc.in
+index 6ec4b7d..55b84dc 100644
+--- a/presentproto.pc.in
++++ b/presentproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: PresentProto
+diff --git a/printproto.pc.in b/printproto.pc.in
+index 8a2e2d6..a2da66d 100644
+--- a/printproto.pc.in
++++ b/printproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: PrintProto
+diff --git a/randrproto.pc.in b/randrproto.pc.in
+index 5a5edb2..6d60cbb 100644
+--- a/randrproto.pc.in
++++ b/randrproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: RandrProto
+diff --git a/recordproto.pc.in b/recordproto.pc.in
+index 0ff4c0b..a87aa82 100644
+--- a/recordproto.pc.in
++++ b/recordproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: RecordProto
+diff --git a/renderproto.pc.in b/renderproto.pc.in
+index e6028ac..34b15e0 100644
+--- a/renderproto.pc.in
++++ b/renderproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: RenderProto
+diff --git a/resourceproto.pc.in b/resourceproto.pc.in
+index a409db9..f927cbb 100644
+--- a/resourceproto.pc.in
++++ b/resourceproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: ResourceProto
+diff --git a/scrnsaverproto.pc.in b/scrnsaverproto.pc.in
+index 6556a2c..fd9d368 100644
+--- a/scrnsaverproto.pc.in
++++ b/scrnsaverproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: ScrnSaverProto
+diff --git a/trapproto.pc.in b/trapproto.pc.in
+index 8cb0aa8..8a220b9 100644
+--- a/trapproto.pc.in
++++ b/trapproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: TrapProto
+diff --git a/videoproto.pc.in b/videoproto.pc.in
+index 14b907a..5c22f7a 100644
+--- a/videoproto.pc.in
++++ b/videoproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: VideoProto
+diff --git a/windowswmproto.pc.in b/windowswmproto.pc.in
+index 0a2ec0b..ec56e82 100644
+--- a/windowswmproto.pc.in
++++ b/windowswmproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: WindowsWMProto
+diff --git a/xcalibrateproto.pc.in b/xcalibrateproto.pc.in
+index 40b6fd0..f1ea5de 100644
+--- a/xcalibrateproto.pc.in
++++ b/xcalibrateproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: XCalibrate
+diff --git a/xcmiscproto.pc.in b/xcmiscproto.pc.in
+index 0dfbf21..b72bbc6 100644
+--- a/xcmiscproto.pc.in
++++ b/xcmiscproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XCMiscProto
+diff --git a/xextproto.pc.in b/xextproto.pc.in
+index f66eeae..9419c91 100644
+--- a/xextproto.pc.in
++++ b/xextproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XExtProto
+diff --git a/xf86bigfontproto.pc.in b/xf86bigfontproto.pc.in
+index 18c5647..4a67be6 100644
+--- a/xf86bigfontproto.pc.in
++++ b/xf86bigfontproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XF86BigFontProto
+diff --git a/xf86dgaproto.pc.in b/xf86dgaproto.pc.in
+index 5c5f8b1..e029cd4 100644
+--- a/xf86dgaproto.pc.in
++++ b/xf86dgaproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XF86DGAProto
+diff --git a/xf86driproto.pc.in b/xf86driproto.pc.in
+index 93df292..c8faf14 100644
+--- a/xf86driproto.pc.in
++++ b/xf86driproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XF86DRIProto
+diff --git a/xf86miscproto.pc.in b/xf86miscproto.pc.in
+index af73fa3..05d5d9e 100644
+--- a/xf86miscproto.pc.in
++++ b/xf86miscproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XF86MiscProto
+diff --git a/xf86rushproto.pc.in b/xf86rushproto.pc.in
+index fc5f63b..1c7ff1b 100644
+--- a/xf86rushproto.pc.in
++++ b/xf86rushproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XF86RushProto
+diff --git a/xf86vidmodeproto.pc.in b/xf86vidmodeproto.pc.in
+index fcb74f2..ef062b3 100644
+--- a/xf86vidmodeproto.pc.in
++++ b/xf86vidmodeproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XF86VidModeProto
+diff --git a/xineramaproto.pc.in b/xineramaproto.pc.in
+index 1ffd37d..9172f1e 100644
+--- a/xineramaproto.pc.in
++++ b/xineramaproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XineramaProto
+diff --git a/xproto.pc.in b/xproto.pc.in
+index 8ff2d3d..899316a 100644
+--- a/xproto.pc.in
++++ b/xproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ includex11dir=@includedir@/X11
+  
+diff --git a/xproxymngproto.pc.in b/xproxymngproto.pc.in
+index 5c6fad6..1a81e28 100644
+--- a/xproxymngproto.pc.in
++++ b/xproxymngproto.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+  
+ Name: XProxyManagementProtocol
+-- 
+2.11.1
+
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
index f48a22b..cec6e87 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
@@ -8,6 +8,8 @@ the core protocol and (many) extensions for the X Window System"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=b9e051107d5628966739a0b2e9b32676"
 
+SRC_URI += "file://0001-Remove-libdir-specification.patch"
+
 SRC_URI[md5sum] = "81557ca47ee66a4e54590fcdadd28114"
 SRC_URI[sha256sum] = "fee885e0512899ea5280c593fdb2735beb1693ad170c22ebcc844470eec415a0"
 
-- 
2.6.4


