Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 47573782E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a137-v6so3986762wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ea7bd00ysUBP9BXIQ8Om/bbsr875w4WFNqUdHY+KKzc=;
	b=AwDwzvTb7kbED9htPk5IQIo5n9yYJNOhNPX6/aFEdeXsGY1J4f2IgxxJDGa1sV0IWv
	KGQZC4koxUwAhF+JxuPuiUMRPer7TX/vEc3eOfEdIHvoWhQz67vI4x9Ris7acxYsCEjp
	/w/aagGDIjdCXYVHYLiJ8BAu0BF+71+CuQoimm3MMEbs4vA32ZqQo9dVvq2MK/3GzaU9
	lPABPJPcFUXgWFis/4hMtIf20T8jMMpFgQlz5MZ6H99LeB4eAM+YAnWMX5qcMUImKOON
	OI+mwGwqjmsySzMxqoblK38VhXh0xuIEvuD9EaC+54heodjlsE7hjfMefruGpZht5Kqx
	iAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ea7bd00ysUBP9BXIQ8Om/bbsr875w4WFNqUdHY+KKzc=;
	b=hL4EBpC/Jmq7u9P5y6L16hUo1JwewSL8MXv6ouaRrFvMSrHmArZq/c2oFYePr0fS5+
	NToZ1uYcc8PuVQ+zlWKZMX1ZXUrrACimN0tEeAalJDW8fhlbeqSEmysyYMc9GhbtbWEh
	gWz0xoAjSjDJuzPgkEWv3Q7B8nGiiDEG5zYXPOQTiuVVPhvhjHDdDW8Bv90Jh66LR8z1
	9kMR5BrOIfC/MyHaKjHbdKviGOci1pCfWZlvf+gqRrImzZ9Nnp7kgZZXSSp0Oyeyc7oN
	iQacaHMMKEbIG+UYvXs/185BNAdPMDBCEkODn90sXQNhcTo7LX6eJ/FWxI7XcRcN+TW8
	Qd4w==
X-Gm-Message-State: ALKqPwclKGcSqm3pHMU8VZs8a+ULLLSWu9GeajU2LYMAAemheIXU2+A2
	wENTVFRgxmU16J3BOIVRmhh3OQ==
X-Google-Smtp-Source: AB8JxZpC+4jp4G/wMTexLmf93+DhTQZgXTvWrGRqiCILTEJqHlWdadfhg+a+AGvZ6/6FoUOhJ6hNaw==
X-Received: by 2002:a1c:dca:: with SMTP id 193-v6mr2607579wmn.36.1526066468910;
	Fri, 11 May 2018 12:21:08 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f83-v6sm3840335wmh.32.2018.05.11.12.21.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:03 +0000
Message-Id: <20180511192103.7581-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192103.7581-1-Martin.Jansa@gmail.com>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
	<20180511192103.7581-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 5/5] qemu: use sdl2 instead of sdl1
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
X-List-Received-Date: Fri, 11 May 2018 19:21:08 -0000

* sdl1 since qemu-2.12.0 depends on x11 in DISTRO_FEATURES, switch to sdl2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9010a04792..8169e55e69 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,11 +74,11 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-	fdt sdl kvm \
-	${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
-	"
-PACKAGECONFIG_class-native ??= "fdt alsa kvm"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+    fdt sdl sdl2 kvm \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
+"
+PACKAGECONFIG_class-native ??= "fdt sdl sdl2 alsa kvm"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl sdl2 kvm"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
@@ -87,6 +87,9 @@ PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/includ
 PACKAGECONFIG_remove_darwin = "kvm"
 PACKAGECONFIG_remove_mingw32 = "kvm"
 
+# sdl1 can be used only together with x11 in DISTRO_FEATURES, because since:
+# https://github.com/qemu/qemu/commit/2ec78706d188df7d3dab43d07b19b05ef7800a44
+# it explicitly includes X11/Xlib.h for all gtk, sdl1 UI backends
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl"
 PACKAGECONFIG[sdl2] = "--with-sdlabi=2.0,--with-sdlabi=1.2,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
-- 
2.17.0


