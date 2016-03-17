Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1086B60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 05:18:33 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id y89so64057481qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=c99OoOaLdg6qpO+RXrunAtWFkwk0CBflI6NhQpMLjrE=;
	b=REIeaUc/r600hWSV5m93TFgal8KcF1le4mmtQGML10JvQEA0hq4gZMvhJGkO1M3USV
	2JotIJuJLJdynphkQ25FK6i4cq55QoxWqPF74ggDmoVY6p8xCp6I9UiWNbzivMHKeujt
	LY3QBjNB2MfmZzdW25gnu15wk7cDBShRt+yYCjJwaPRp29NcVD/yJpYzY5n2hFdQDwGk
	xWGyNXdUCy9zCrEEZh9c6tUz8KT7lFglExqteE/qTnKSvsILF4S7ttIP6H0HzrBsTifm
	L90v3Z2E3y6D4c2tYFalWwc7xJdDmex+7SgNo2Vo2ER2oWNRp5X1wjehZgkQPfv3EU+6
	HfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=c99OoOaLdg6qpO+RXrunAtWFkwk0CBflI6NhQpMLjrE=;
	b=gVDDD1Jdvg59wqFvbzYiV/9tU7YnWvIvsjwvPcsZpmTaqJ82F9PZ/dcLMt2dxksoUv
	3pZOD2n9G4ncoCcQhLgYWyyTDZS0TMbvkVSLCEDoX44SshRb4xp1AJZjHQD7s8Ti94XE
	m9Ni4jWZ/Ri1V7XAgAsS/xi6CqQzbbyN0ZmYsYBb1rgQ8iBepLeMvjYXQb94FEu3RVzf
	cIndVcJyyOEH158BCdwm1TRvafFMtN7+ju3X1RPANGS8If0y9H5wp7SIMihaZAqQd9fK
	JRWNqyqzalYw8FTId0gQcm8S/8gtXYMDEyFVaa3sZbc+XUoW1Kfvgwj5gLnUAn61eZlq
	19yQ==
X-Gm-Message-State: AD7BkJJ7FycP4GgxIUtSF+q1oZ85zWbS9hBuQUoI0CcnK6wMlNqW6nUXHeVnkInlQyqZ7w==
X-Received: by 10.141.23.211 with SMTP id z202mr7684701qhd.52.1458191914342;
	Wed, 16 Mar 2016 22:18:34 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	i46sm2216771qgd.19.2016.03.16.22.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Mar 2016 22:18:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 05:18:16 +0000
Message-Id: <7b4bb195a30eeb6a4dae474082023372c8906259.1458191793.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] xcb-util-image: Fix build with clang
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
X-List-Received-Date: Thu, 17 Mar 2016 05:18:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-lib/xcb-util-image/clang.patch            | 24 ++++++++++++++++++++++
 .../xorg-lib/xcb-util-image_0.4.0.bb               |  5 ++++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-image/clang.patch

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-image/clang.patch b/meta/recipes-graphics/xorg-lib/xcb-util-image/clang.patch
new file mode 100644
index 0000000..11e9094
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-image/clang.patch
@@ -0,0 +1,24 @@
+Make clang happy since it squashes the control warning, ideally it will never reach that return value due to assert
+but there is a chance when NDEBUG is defined
+
+| In file included from ../../xcb-util-image-0.4.0/image/xcb_image.c:37:
+| ../../xcb-util-image-0.4.0/image/xcb_bitops.h:210:1: error: control may reach end of non-void function [-Werror,-Wreturn-type]
+| }
+| ^
+| 1 error generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: xcb-util-image-0.4.0/image/xcb_bitops.h
+===================================================================
+--- xcb-util-image-0.4.0.orig/image/xcb_bitops.h
++++ xcb-util-image-0.4.0/image/xcb_bitops.h
+@@ -207,6 +207,7 @@ xcb_host_byte_order(void) {
+       return XCB_IMAGE_ORDER_LSB_FIRST;
+   }
+   assert(0);
++  return -1;
+ }
+ 
+ #endif /* __XCB_BITOPS_H__ */
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.0.bb b/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.0.bb
index 91464b6..c6bb5a6 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.0.bb
@@ -6,5 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://image/xcb_image.c;endline=24;md5=eafdf965cfb89955fdedf75054223fb4 \
                     file://image/xcb_image.h;beginline=4;endline=27;md5=48cd25ae55e7de525fe1e1a3a7672e1c"
 
+SRC_URI += "file://clang.patch \
+"
+
 SRC_URI[md5sum] = "08fe8ffecc8d4e37c0ade7906b3f4c87"
-SRC_URI[sha256sum] = "2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc"
\ No newline at end of file
+SRC_URI[sha256sum] = "2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc"
-- 
1.9.1


