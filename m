Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id E95B3612D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 05:49:57 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so7138669pab.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 22:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tE4uf+JuAjrfiYv5JKpPp/LodIaGj7YtFYfjdeQDS+Q=;
	b=bBJ7zPVCybgPLJWG55MiTz08yNIX7NV5I196yWTqFlXNsIO5FdtF2atFpLJapWFN8S
	ZoIBqpOPcNzWA/guOpD5Q9ZvapRlZPNaZNkB1ijKqqEJa8LgzY8CDCLUTqckp81gmBz6
	TE/w7JytKzTag1GSYh1RBBvCkkZ+69czZH4SJgAAiD9HFJOQa14GrYUC0C8okM/2aeCt
	kIypcMrQMuVEFbhPxRvrD7udEFIR8GCzXNnmhWjYfWf3Mt8fufI8iXqJ/pd4DvftSyI9
	aDXhBZv78xKnwxs1byldjM3VZPwgvaqAvThZq2JYDxoSPFYrKJN4CWxk3YL01EjdRWTc
	WlzA==
X-Received: by 10.66.234.71 with SMTP id uc7mr1005403pac.10.1372830599261;
	Tue, 02 Jul 2013 22:49:59 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kq2sm32365988pab.19.2013.07.02.22.49.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 22:49:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 16:04:20 +1000
Message-Id: <1372831460-6435-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1372831460-6435-1-git-send-email-net147@gmail.com>
References: <1372831460-6435-1-git-send-email-net147@gmail.com>
Subject: [PATCH 1/1] xf86-video-modesetting: upgrade to 0.8.0
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
X-List-Received-Date: Wed, 03 Jul 2013 05:49:58 -0000

Removed patch integrated upstream.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...ort-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch | 31 ----------------------
 .../xorg-driver/xf86-video-modesetting_0.7.0.bb    |  9 -------
 .../xorg-driver/xf86-video-modesetting_0.8.0.bb    |  7 +++++
 3 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch
deleted file mode 100644
index c351757..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From cba29fd8c2f605ed66718aa3a6b5833deb5d4cf9 Mon Sep 17 00:00:00 2001
-From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
-Date: Wed, 3 Apr 2013 12:08:44 +0200
-Subject: [PATCH] support 32 bpp pixmaps when 24 bpp fb is used.
-
-Fixes background corruption in ubuntu.
-
-Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
----
- src/driver.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/driver.c b/src/driver.c
-index 06d6d53..742aadd 100644
---- a/src/driver.c
-+++ b/src/driver.c
-@@ -650,7 +650,7 @@ PreInit(ScrnInfoPtr pScrn, int flags)
- #endif
-     drmmode_get_default_bpp(pScrn, &ms->drmmode, &defaultdepth, &defaultbpp);
-     if (defaultdepth == 24 && defaultbpp == 24)
--	    bppflags = Support24bppFb;
-+	    bppflags = SupportConvert32to24 | Support24bppFb;
-     else
- 	    bppflags = PreferConvert24to32 | SupportConvert24to32 | Support32bppFb;
-     
--- 
-1.8.3
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
deleted file mode 100644
index 9f43402..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
-
-DESCRIPTION = "X.Org X server -- modesetting display driver"
-
-SRC_URI += "file://support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch"
-
-SRC_URI[md5sum] = "38e64eb09cef9bdf1de400bbe9818321"
-SRC_URI[sha256sum] = "2bc55f776eaee7b4e13df13238d36c4facf1cdca095a11519baf2376f5c996ac"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
new file mode 100644
index 0000000..035f47d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
+
+DESCRIPTION = "X.Org X server -- modesetting display driver"
+
+SRC_URI[md5sum] = "1a25d6210257d4e493daf048f8b705a9"
+SRC_URI[sha256sum] = "13dc349e9aa50987ab2479d27d6879cda2c1f9ad8c8d3a1422a2f53c36f047f8"
-- 
1.8.3


