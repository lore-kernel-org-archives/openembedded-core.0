Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id B8F2E771A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:35:27 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi1so4068912pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=lt0dbNaPJJ3CVSVI4M+nQ8jUDtQHVJkd9UYbyphsaQc=;
	b=dgTAG2JIxHETiDhMZFiT51BW7X7+hMpWbxg7wQPWjC/V9smets7fXvHErjuB2VXYIJ
	2m5oT3Lk2F6twiOIkDUdSUrQntQ4vnD6lIVO2XF6lK5FPGExEVbZVKS+TjPl5qV+2/sV
	ZKaqHa/Mc806FPGGWNKxniZktOefI0Y8HZh7B7P9wOQS57Zc4BTezMS5A+xNobX6TAn9
	8vp0QNzfjeZrtAFax/LNScnpktMMaRIW0vRn/tKGYZmLeZF6fgjfdG9c1XCxFpq1DpQz
	2fjAfIZ5Dj91WJEEzgwtEGu3vk0IvbQiJS0OD/yIfZn6ok155d136vehyGbwoIFj6g2b
	ppHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=lt0dbNaPJJ3CVSVI4M+nQ8jUDtQHVJkd9UYbyphsaQc=;
	b=ag6CKFdS2gnMvG3lysGUY9WstRNXonZqv8fRuKvoWqEbIQB4nxPnHZrUozIFJGs6G+
	y5Z2C4TCgFHNKe7tag6jh/sAVVQtjVA2hcsdsUjhPxm4zVIpluxg7TABJEO3RvQHbagS
	+vHBqJQ5/ScXNhCunmYmh8oGunKEospkqusRNXacokxI2QxjmyeX3EBv1Qs0jZMc3qvL
	du3qagSc50xTE49Ri3LJctyMdAWNZW5C6bYbkQ1xkvqsMAJBtJ1MFD3ehwfBsnOVzOCf
	y3L4JRQNpvoBXWxCj82bATgADibliayI1roFfWJNozQ+S6oyX9HYWiQFeygYB6Cr58Iz
	+i8A==
X-Gm-Message-State: AG10YOQfzfG9mwgrwqdqA6OCuRSazSTIMbw7q9MC7bg0bYbrXtZLR40BAbUl51ZiePHUHQ==
X-Received: by 10.66.141.71 with SMTP id rm7mr16630697pab.32.1454099728125;
	Fri, 29 Jan 2016 12:35:28 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r80sm858016pfi.9.2016.01.29.12.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:35:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 12:35:16 -0800
Message-Id: <111d4662c643b6b45a686f5c7ffa936f65c2c09c.1454099596.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
Subject: [PATCH 1/6] qemu: Security fix CVE-2015-8504
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
X-List-Received-Date: Fri, 29 Jan 2016 20:35:27 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8504 Qemu: ui: vnc: avoid floating point exception

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-8504.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch
new file mode 100644
index 0000000..9e66021
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch
@@ -0,0 +1,51 @@
+From 4c65fed8bdf96780735dbdb92a8bd0d6b6526cc3 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 3 Dec 2015 18:54:17 +0530
+Subject: [PATCH] ui: vnc: avoid floating point exception
+
+While sending 'SetPixelFormat' messages to a VNC server,
+the client could set the 'red-max', 'green-max' and 'blue-max'
+values to be zero. This leads to a floating point exception in
+write_png_palette while doing frame buffer updates.
+
+Reported-by: Lian Yihan <lianyihan@360.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commitdiff;h=4c65fed8bdf96780735dbdb92a8
+
+CVE: CVE-2015-8504
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ui/vnc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: qemu-2.4.0/ui/vnc.c
+===================================================================
+--- qemu-2.4.0.orig/ui/vnc.c
++++ qemu-2.4.0/ui/vnc.c
+@@ -2189,15 +2189,15 @@ static void set_pixel_format(VncState *v
+         return;
+     }
+ 
+-    vs->client_pf.rmax = red_max;
++    vs->client_pf.rmax = red_max ? red_max : 0xFF;
+     vs->client_pf.rbits = hweight_long(red_max);
+     vs->client_pf.rshift = red_shift;
+     vs->client_pf.rmask = red_max << red_shift;
+-    vs->client_pf.gmax = green_max;
++    vs->client_pf.gmax = green_max ? green_max : 0xFF;
+     vs->client_pf.gbits = hweight_long(green_max);
+     vs->client_pf.gshift = green_shift;
+     vs->client_pf.gmask = green_max << green_shift;
+-    vs->client_pf.bmax = blue_max;
++    vs->client_pf.bmax = blue_max ? blue_max : 0xFF;
+     vs->client_pf.bbits = hweight_long(blue_max);
+     vs->client_pf.bshift = blue_shift;
+     vs->client_pf.bmask = blue_max << blue_shift;
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 1505b80..fec1061 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix2.patch \
             file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
+            file://CVE-2015-8504.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.3.5


