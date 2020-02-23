Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 356 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 23 Feb 2020 20:30:58 UTC
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id EF96D60225
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 20:30:58 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 8A54E5BE;
	Sun, 23 Feb 2020 15:25:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute7.internal (MEProxy); Sun, 23 Feb 2020 15:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=jn+891Ng70fhpADueZRFpmt0Nd
	tX0mmtkf5XcLtDEGM=; b=D70DRm3cs9CoZ9OM9K40egRuAZfgSGqCb6O9Rh1lli
	K44FxoJaa0Lb2BajR/N4iBupXyeMv+nYClXd+uiL7m4B9raN28hQ5hSpx6GQBXkE
	fNDL/eOF3I+lTefSvHIEjSjZUris1AqltEgJnBE6yF3QAvTPD8apBCSXSYsztUS+
	pmMMSA6evOYG6VWpIF0VgZZ2neg/o9axC2E814jBYk/loELXLz7JSu5iZQdMgIIW
	9m3oE5cfe5gj3S000kA4nsYjGJTUWL72powoq4II6fNg8YZggdFCzuQhiKPHEFOh
	lsrV99G/q4XSMgF4kq8651M2zYokF456FRs4Cp2BM3Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jn+891Ng70fhpADue
	ZRFpmt0NdtX0mmtkf5XcLtDEGM=; b=Y5DxnheSN8Zg0IYm61pl1VFDEXb8kzsyE
	DlKQtomvMTcOXaxre1qISoM9mRBTxJPqEm7IM9L2Aaf6gLHMGZIAL/xnbCBmXy+P
	udFTJTeK6l46ONo2lODtCFCRwHBUbhTHMZTKUQpq7YYbQrIb8uFBq//CfL94cSM9
	t+eccuVX3E1TtfyV4cWu817zhZKJHYPmXvS5LbRidWj510HbXSRxIVwBePxwmT55
	d36gaDnVQomERg/6eQsh1WmRYDJQwQaoyudxOJl1eAV/aCYZvMdlBbANrrdiifpr
	Ez51TLLoD6kQRJzSAsjkBdi5iujDnbvnoosqZceXWCKaaSmsLhIgQ==
X-ME-Sender: <xms:nN9SXmCvC-YXrYjPYDnmdEQGS1aSIAy8JeLQARfspV0cEI658C1Aug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeekgddufeeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
	dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
	segrlhhishhtrghirhdvfedrmhgvqeenucfkphepjeefrdelfedrkeegrddvtdeknecuve
	hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgr
	ihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:nN9SXtbAJ-bNzNahwP4e5ZVotsgy2oWrkwcXi2_BLO6z-T7A1VuiDQ>
	<xmx:nN9SXpUUAh1V7MAXPZNboOoTU60vUh8RCpeHyivUXS5U2H55_i6PQA>
	<xmx:nN9SXkPRPOnoMVAWp-IYtLV-eZFJoNN6Taru6J60EB4BHB2peKP2bw>
	<xmx:nd9SXuQTRpEOz_CrQx-o2HDmdolBRKclX6WkpOGgdmARYP0vtp_-QA>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 579C8328005E;
	Sun, 23 Feb 2020 15:25:00 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 12:24:53 -0800
Message-Id: <20200223202453.22249-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] clutter: Build cluter with the GDK backend
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
X-List-Received-Date: Sun, 23 Feb 2020 20:30:59 -0000
Content-Transfer-Encoding: 8bit

ClutterActors can crash with strange segfaults when built without the GDK
backend but run ontop of GDK. To fix this let's add a PACKAGECONFIG to
enable/disable GDK backend support and enable it by default.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 5dc45ebf21..e0ac819e4c 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -24,11 +24,11 @@ ERDEPENDS_EVDEV = "xkeyboard-config"
 # Disable pretty much everything, override in platform specific set up
 EXTRA_OECONF += "--disable-quartz-backend	\
 	     	 --disable-win32-backend	\
-	     	 --disable-gdk-backend		\
 	     	 --disable-cex100-backend	\
 	     	 --disable-tslib-input		\
 	    	"
 
+PACKAGECONFIG[gdk] = "--enable-gdk-backend,--disable-gdk-backend,gtk+3"
 PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,${EDEPENDS_X11}"
 PACKAGECONFIG[glx] = ",,${EDEPENDS_X11} ${EDEPENDS_GLX}"
 PACKAGECONFIG[egl] = "--enable-egl-backend,--disable-egl-backend,${EDEPENDS_EGL}"
@@ -37,7 +37,7 @@ PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,${E
 PACKAGECONFIG[wayland-compositor] = "--enable-wayland-compositor,--disable-wayland-compositor,wayland"
 
 # Default configuration, distros might want to override
-PACKAGECONFIG ??= "egl \
+PACKAGECONFIG ??= "egl gdk \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11', '', d)}"
 
-- 
2.25.0


