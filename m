Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D83EE7CBDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:33:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j125so2177238wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eE+e52cM5R4nKW0VrjHAG6R5Bw2bK1JhSFj/ZxTAuJI=;
	b=iUxKkKA3lCfQu7+Jnp77A7VLr5FiJNH1jX/ua9mylowebjb8tgedfFnodzFkJ7uvos
	thva9KvcFxgAiY9I8xtS/F7zXR5B8Nn2DLUNVMUiWXsu3EuXhFDFpOQ2fu1LiogSJCxK
	Z6AnYaiXNGBMmcTfNgEA2/2HKwh9ybVcH0z1KXDLYQOWucgAbrb5ikiuDzD8A23zs0mv
	jd/qztfcAzrD2P5p5xrBtr4SD501tjjD25mJ1CwIys44+dIfMhmIdLwTRTXLy5oy4mXO
	QfBdggUvaeTapn9uN/+V5/CJ5i//lBC2FyjhZMExwMWDBAq+1nsS9EA9NCn12JFrp39E
	4pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eE+e52cM5R4nKW0VrjHAG6R5Bw2bK1JhSFj/ZxTAuJI=;
	b=YJRQHuhIyiWFjndMMwpMjZNoNbBbMr5dDi8qEntiPK7XMttWFF+vgrCfr1crOsNo2c
	oXKZnTiKkdfwxDaFNjOFQWRu4e4EfOY98f/WGQTJ9KRHFuYrJFz2HelX4FP4rqjQwXH5
	vjeiBWJ1Qm8nsaGYb0P2tDRrAgjF1BKJXfekiqPcmB1Pz4iCqNMK/epWH83npxARlntH
	jB9cCGMdIthpqp+yzBpxAGgjB3sIGX6VjgiNUq0xiI7VIfKH2ftO6CYzGWXUtSpTcVIn
	MoIwIwkPdROPJFFyyi7W4LsseEfuJC0kLcLXFctab/A5OIT49OJ+aIuM0FNRA62i7T4Z
	VcOA==
X-Gm-Message-State: AHQUAuYKcOjMGQkaoejuqkqcJNMfoS1vN2GYK1PKvsJyAbAQMWu2HlKb
	Do8htwA1KdyO+PysSFQKrTMh/UnX
X-Google-Smtp-Source: AHgI3Ibx6USP+zsg34bx0aPIgJ528FkHdQQYJlU1s6edrmbgAf1tpV0/mLHdqMYQbQqLWiseh21U4A==
X-Received: by 2002:a1c:ef11:: with SMTP id n17mr2680311wmh.112.1550846036249; 
	Fri, 22 Feb 2019 06:33:56 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.33.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:33:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:37 +0100
Message-Id: <296658f75576781b5e8f36c95bec204a65482af7.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Fri, 22 Feb 2019 14:33:56 -0000

Except for ming32/darwin, which do not support them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c127434b020..95e9e0ede77 100644
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


