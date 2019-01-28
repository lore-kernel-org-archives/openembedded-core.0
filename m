Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id CCA1A7C483
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m1so13857195wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wBZByrAWAHy1uHLFwezMpAB7SHqjpnfRgLPXtCs7u1k=;
	b=Kqg0wGv+U3ANkDGGt//ydLi0VaMItCxjhgAjLFZYCH+381YqYK0c2CDpDxlVTWldCM
	KLBMxa5q3VQfKchW9IYEF9CaqwByd4Pe9RWXX9fl6LQUKWlvGKRt7Htvs+D5wD8UZcwr
	a5BotvvZHQ0erpIIgytnabD2JCo6NBOdHx28fxh3gUFyTQYMy1xSNvyuejj+SE08RnEC
	iCls9Yw4+2ccHdNvrtfPdKhwyK5S/B1uLez4zQS3K7oF4ajzB/gP5C4W5zZbMI2kdzhS
	Lby/o1jxheO5fiI37u1TZTiYIb1VD4MQnGD7v5KvUsNezVtT/fGeVLLknqdx3sHk8Noj
	g2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wBZByrAWAHy1uHLFwezMpAB7SHqjpnfRgLPXtCs7u1k=;
	b=gwQMjzapxZ2hN5jD+4criJ06YVOp9g2vTXxebWHWwvbS5KmUQ6lslB7RKWdmpzBHn1
	sCy2V63UO6JNPJ8EqkHhqppRKVuI2FxPAOOeLe25VrSiv6SrIEPL01eRojU476ohwyG/
	MtUm05a3SMCaDqEaKkha+mWzvLT13z5Ae8q5/XtPLCDxekqsGsJ/GAvLXHgxcU6LI8X4
	tp8HrpHnIj3jg7/qtimNBKH9yPIPufaNdR2S8tdli3zB3zcpptwi2D4IvSPufz30dbyB
	cs9hycjoTmrNJUCoLv3s9frxPtB4NBkGrOhkQFfPf0aThr/0WA5LXLEh/LoabtUUYN+0
	wqdA==
X-Gm-Message-State: AJcUukf8MGY8OgZjgoIvUKSBhVLBpOVxmv+2Q7JH8KhiPQgSloHIHAq7
	bLqV97f7OAIFQjXT0uFUl3bkvW6S
X-Google-Smtp-Source: ALg8bN4A5Bgimmd1QckWqLyksdSjEJG0Khey39+YgLOzwz3zE+L43uI0GoqxX4xAM1k80LGmsHFARg==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr16936325wmi.61.1548679637169; 
	Mon, 28 Jan 2019 04:47:17 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:40 +0100
Message-Id: <dbac4482e686777481ed14eeb176f48692e479cc.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 09/24] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:17 -0000

Except for ming32/darwin, which do not support them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b05c1cee9eb..b6c98a4923b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,15 +74,15 @@ PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-native ??= "fdt alsa kvm"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
 
-# Disable kvm on targets that do not support it
-PACKAGECONFIG_remove_darwin = "kvm"
-PACKAGECONFIG_remove_mingw32 = "kvm"
+# Disable kvm/virgl/mesa on targets that do not support it
+PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
+PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl --with-sdlabi=2.0,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
-- 
2.17.1


