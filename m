Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA8960D37
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2014 08:32:11 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w61so14419233wes.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2014 00:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OXW6z1Mw35b/PyFrFuclrs+gfTroU85PLEZGCUumIFw=;
	b=k/AWW4eWJSVMy0YEmApbFyg2P4usuMCZ8WxVFby/7go03l2fFaOd58k0z6OATehfws
	X2UcFm81vX2YScgjg1Km6q2PlZ+nDkpy3WSfLOBtUjun/H5rkiVuzRuLLKaGH9qhMQt2
	N0RRc4LjaQR0ptmxJvlHtXIuKXOvRGk4nA6KJ7TOrbLWD7YSt4ygMQclLeKM65XoaWMA
	bfWxmohIzrhuw+NkjQRFKXYzeKL3EZ2WxvRePF2AY7Z/mZLQebEGn9y7fdpHH6wd/vtP
	WP2sIL+rEb+R+He6WL+bQenqyb+HUMuDZzsGwD4EgawvpCm0crjz87dKf6d9EzSnI8cv
	ybUQ==
X-Gm-Message-State: ALoCoQnTdvfTr9ZC9CPKK5B2zd1ltoEK2D9I8IbLeqh36nL4M9YRC/j6smRD9DVei60rZrUkQHTx
X-Received: by 10.180.93.196 with SMTP id cw4mr4885855wib.39.1388824331840;
	Sat, 04 Jan 2014 00:32:11 -0800 (PST)
Received: from localhost ([2001:610:612:0:223:32ff:fece:c738])
	by mx.google.com with ESMTPSA id bc5sm6560449wib.4.2014.01.04.00.32.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 00:32:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2014 09:32:14 +0100
Message-Id: <1388824334-14836-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] xf86-video-modesetting: update to 0.8.1
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
X-List-Received-Date: Sat, 04 Jan 2014 08:32:14 -0000

This fixes a build error with recent Xorg libs

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb | 8 --------
 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.1.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.1.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
deleted file mode 100644
index b13db41..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
-
-SUMMARY = "X.Org X server -- modesetting display driver"
-DESCRIPTION = "Provides a generic kernel modesetting display driver for the X.Org X server."
-
-SRC_URI[md5sum] = "1a25d6210257d4e493daf048f8b705a9"
-SRC_URI[sha256sum] = "13dc349e9aa50987ab2479d27d6879cda2c1f9ad8c8d3a1422a2f53c36f047f8"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.1.bb
new file mode 100644
index 0000000..5bb8926
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.8.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
+
+SUMMARY = "X.Org X server -- modesetting display driver"
+DESCRIPTION = "Provides a generic kernel modesetting display driver for the X.Org X server."
+
+SRC_URI[md5sum] = "eb275e1ff0031897bcf23e2e5cb8655a"
+SRC_URI[sha256sum] = "3ba8d8d7cb679497abc6486e2e843f8ea1582d830a27448ed4c90413e58312ca"
-- 
1.8.4.2


