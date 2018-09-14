Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id CEF7E799D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:04:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p5-v6so4412135plk.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vNsQ346SfbecWJlFUYUg+mtCvTxkIn3zf5Yf0gLEu3E=;
	b=Q5O1upwCacaerla1IggKIDC/EnE9hIoJtixDNRIuhW04zzBZuBJqkXtgNnxW13ChBK
	zNa1S9vqlK246DhCvmGDzbdv0Q9/qoF9HUxy+5po7pYNr5qYsbSweEUxIgj5EO5Xh9+v
	uGu4t4gaw8q6ab5UX+PBgeCJWT0UbqGQMbkM0qDFuFbZGOQ1Yg3R4U098AVvH830iqpt
	gdnBHQYqsMurnGAf+JXkUOoq71Ipy/O7KPB97fSEpby+jyvdV49VOBmTp1204/7/hzc/
	S/gSWcB4QlHRwiwhMzLBZhHsg+TiXoktJIVrpIJd/vCXO7AUizNrzlkKOo+bU0p3S4g3
	XsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vNsQ346SfbecWJlFUYUg+mtCvTxkIn3zf5Yf0gLEu3E=;
	b=reqtYxEx4Aa+/TeL9MGl3Y1sbVtehbzlNK7Y1OsJz62507Iyf9R6NPP0dAHlx4GBsf
	AOZYrnPrZpnboLylhCws2djrlnByF7g4M1j15z2c5CGFr/HrXfjTEu1ibxRxBDolslr1
	qX2Q49P2ZpUTBGPSnaAalTPC5iZl1i+zeZ4LdpWPW6etQ0Q1sWb4tq4rJAMB5xnb88Zp
	jpahCvEGoM7d2+h0q0q+Ezt9r1ZrNmVGtPcVYNZsETZlkMMMeMam7licJCLekYgfMag4
	ljro/eYdArLdZg0T9fjTCPOZIzBiOcefE1s8fJUUJ1G5kuYORnt/6M0WYzFjdQENx3d6
	2C1w==
X-Gm-Message-State: APzg51BCpfTq84GYBudgkWAhRirgoTVSCIdMTy2bRqL7/owfplTSQ8Ob
	BGfe63zaaJd5TJWM+fOMzz8=
X-Google-Smtp-Source: ANB0VdahPyo9Qh4K/yZAUh5acbJDAwiWLG6KXWmPEqJ70JBx2cz27//DfQhSvUcgvRj9gb2O0LcSOw==
X-Received: by 2002:a17:902:e004:: with SMTP id
	ca4-v6mr12607879plb.252.1536941048976; 
	Fri, 14 Sep 2018 09:04:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6807:cebe:ef5d:c52e])
	by smtp.gmail.com with ESMTPSA id
	70-v6sm10519620pfz.27.2018.09.14.09.04.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 09:04:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 09:04:04 -0700
Message-Id: <1536941045-3581-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
References: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/3] xf86-video-fbdev: update to 0.5.0
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
X-List-Received-Date: Fri, 14 Sep 2018 16:04:08 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb | 9 ---------
 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
deleted file mode 100644
index 52e9bd1..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-
-SUMMARY = "X.Org X server -- fbdev display driver"
-DESCRIPTION = "fbdev is an Xorg driver for framebuffer devices. This is a non-accelerated driver."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
-
-SRC_URI[md5sum] = "3931c0e19d441cc576dc088f9eb9fd73"
-SRC_URI[sha256sum] = "9dd4b326498223abbfdf786089a46ea3db4fa6bbd341308eb48a9e00bc3fd51b"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb
new file mode 100644
index 0000000..7b4ac88
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- fbdev display driver"
+DESCRIPTION = "fbdev is an Xorg driver for framebuffer devices. This is a non-accelerated driver."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
+
+SRC_URI[md5sum] = "f07475655376be5a124d8187aacd87b6"
+SRC_URI[sha256sum] = "dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699"
-- 
2.7.4


