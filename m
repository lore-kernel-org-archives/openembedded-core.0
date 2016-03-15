Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id C8EAE6FF01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 07:10:20 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id u110so7001189qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 00:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c99OoOaLdg6qpO+RXrunAtWFkwk0CBflI6NhQpMLjrE=;
	b=tlSpGWHLBRMXirHq48+7ylBki0vN//LC2Lhr5fkI6akBbgamzNxF8xnVZHBI1ieO7h
	r7fA+w8EVE0ZClWa7ry7hGD/DHkxbMOQORbiD0IVxJCnD3xEgtKq+XDt/FKt9CNhVYTX
	lFXEmubPPSO7og2GnEbmXhZna6bBGn/+SZ/V66lD6lFhGJYaAIRuJYbNsWNdoCs6REKZ
	Oah+vQBiLaxMHwtl7KXjlvXW6f705zimP8zEApNYwEM7cBJALH4FD0SXYXxOj6ad5Y0i
	92z87CV57iW2CcvhblBSJJ7Y+Suzt0jXxq8vz8ai7RwxvQezMY5H/uyMmjX3/AF0Ei+K
	CtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c99OoOaLdg6qpO+RXrunAtWFkwk0CBflI6NhQpMLjrE=;
	b=maTVi3WVMWItEvDbHyWFVFJZGrejf5X/O+5JbYW+pcvjgnLGegz/11mFduiYsUh3mw
	5lZRVXCJv7s5/09iYcoVjPEpulazmt2XVQ7TDkYaaj78k9BfpdgeMiBa2HLiGLAhYRhw
	71FzhQZuWtI3HnRFhEsupOR6STEzczIDni0pNonWAZtv4YbWlXJtNeEFeXC8wJZbGDe6
	gZrznZQ71GTw53RogflvXy2zb5kXyNm1hAXFlMI6hLOupJHO5VS+/IW+XYFaUo2DZuxU
	LjZczDvPMfRm0zKLc7adfj9EEnYyHbrXtTYOiYUF6i8Pc/eh+yw6v618riFLciH6dKoC
	IxIQ==
X-Gm-Message-State: AD7BkJIgVRkBFczLxhUoprOUAHT39ffTJIbWVY1fHJEwbOYbRQmJ9TZt5+7ZTGtdiWKUFw==
X-Received: by 10.141.6.136 with SMTP id i130mr37274768qhd.21.1458025820944;
	Tue, 15 Mar 2016 00:10:20 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	r6sm12039452qhb.49.2016.03.15.00.10.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Mar 2016 00:10:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 07:10:12 +0000
Message-Id: <1458025812-19302-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458025812-19302-1-git-send-email-raj.khem@gmail.com>
References: <1458025812-19302-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] xcb-util-image: Fix build with clang
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
X-List-Received-Date: Tue, 15 Mar 2016 07:10:21 -0000

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


