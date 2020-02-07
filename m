Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2E360CC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 19:46:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so319387wru.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xz2LiZhHz56Pz0K74caU0Y30daQytzk3b1PBX+TRT8w=;
	b=Qz35zZwh4SUMh+BsqrINq46/fx7PG9UkrAimJtXKD0gzMUt14ZUmWxbBTDre3pfxO6
	9CE5ow8qcliu9BhA9o0teKUwe7dqR2rZBnbjwuFVU2ZeZCtrgn/jvPt0Nm5+mvooNNyd
	HcWzq8w9dnAGCCe6Bh9k+z0bcygXQCEhY/VrL8kGBhw30iUGJsgkD/aZWWz9uEnjN5+L
	i6/ArEd4+CO2W2py2qWLfwBUEMClBpZwbpYuCUfbPHsblpPlb3un+L/q0bdiE31+DOO3
	6P6l/i20oGBBh0LAsAJm60Bn6xYhBOkITsbO+ri5SJMgC0gCHdyDKCutMQIUrGyGX3Ln
	2Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xz2LiZhHz56Pz0K74caU0Y30daQytzk3b1PBX+TRT8w=;
	b=May06DRQ/GAW4GfzM3/bp8bKuqNIlu3l6X9NgLKM479579wtgZxVtNqhq2N0eGM4kT
	2eET5aA0afslin4NhfmjrqeKctmgGslUAm1CdyqLE3f32jfyS7gwSX5picFgFHGiTM/a
	bd8fBpvnXF/xPphkSzCqhIEafki16ibVQensbGU9b2oP/AYIJIQ8OzS2O+rMUFHmfah3
	ytwQGFJeNkfP8eHN9cTZlrq9kk7e6CV8XHTO7sAur9p2npSLeSqQGtEz9FD/FtWpC0m1
	dh21ExsLzgfFuL3qJ9GnkkYPQqWittRSB1z9EbWOHcTKdaoVPnvomFrAbd8vz9K+UjSj
	9TEg==
X-Gm-Message-State: APjAAAW6I6qfFZzoe3KfaJn6x5fPlht+ZTJHwPSIsrCSEOOQJFyIFVBZ
	wjfdlb9vAnyVhdfbmaD1D98XF6nr
X-Google-Smtp-Source: APXvYqy+XWyIatJaSM8WQspKo64drM3XQGQczG2Jk7jo1axagjlxACkXQOhpFpjSSRt/crNZVvI1vA==
X-Received: by 2002:adf:f0ca:: with SMTP id x10mr600976wro.423.1581104808719; 
	Fri, 07 Feb 2020 11:46:48 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69])
	by smtp.gmail.com with ESMTPSA id w8sm4667770wmm.0.2020.02.07.11.46.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 11:46:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 20:45:58 +0100
Message-Id: <20200207194559.527-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207194559.527-1-alex.kanavin@gmail.com>
References: <20200207194559.527-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] xserver-xorg: upgrade 1.20.6 -> 1.20.7
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
X-List-Received-Date: Fri, 07 Feb 2020 19:46:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e_display.c-add-missing-mi.h-include.patch | 23 +++++++++++++++++++
 ...-xorg_1.20.6.bb => xserver-xorg_1.20.7.bb} | 13 ++++++-----
 2 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.6.bb => xserver-xorg_1.20.7.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch
new file mode 100644
index 0000000000..4b8e43f1e4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch
@@ -0,0 +1,23 @@
+From 84338444179cab7ede1252a11b66e3b8f657e6a4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 7 Feb 2020 20:36:45 +0100
+Subject: [PATCH] drmmode_display.c: add missing mi.h include
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ hw/xfree86/drivers/modesetting/drmmode_display.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hw/xfree86/drivers/modesetting/drmmode_display.c b/hw/xfree86/drivers/modesetting/drmmode_display.c
+index e18cc37..3445cce 100644
+--- a/hw/xfree86/drivers/modesetting/drmmode_display.c
++++ b/hw/xfree86/drivers/modesetting/drmmode_display.c
+@@ -46,6 +46,7 @@
+ #include "xf86Crtc.h"
+ #include "drmmode_display.h"
+ #include "present.h"
++#include "mi.h"
+ 
+ #include <cursorstr.h>
+ 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
index a1cd490394..998b98a76c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
@@ -1,12 +1,13 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-            file://pkgconfig.patch \
-            file://0001-test-xtest-Initialize-array-with-braces.patch \
-            file://sdksyms-no-build-path.patch \
-            "
-SRC_URI[md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
-SRC_URI[sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
+           file://pkgconfig.patch \
+           file://0001-test-xtest-Initialize-array-with-braces.patch \
+           file://sdksyms-no-build-path.patch \
+           file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
+           "
+SRC_URI[md5sum] = "d2e96355ad47244c675bce38db2b48a9"
+SRC_URI[sha256sum] = "bd5986f010f34f5b3d6bc99fe395ecb1e0dead15a26807e0c832701809a06ea1"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.0


