Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E53A87C2FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 96so25577206wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wBZByrAWAHy1uHLFwezMpAB7SHqjpnfRgLPXtCs7u1k=;
	b=MAh0lq3QQEWeBxBf5m7S8G7VMEY9geJcselrwuVaahxf5X+4TQSx9NLoy55F2er1Pm
	AepxhK6GVfihrATKw++w61lotmkYL/emYBLYCqOUPWShmD/Ls1ARrLq6G6nLQUzdVInb
	BBc7IsAnnx40dPmlu4e74IuhlV62j0Yej03MQ1TZa2igjmifZLmEWAZT553vn6mH+ndp
	SU3LTEqNVbVLokJX5nZm0Ge3kFJzCu2128XwOFNhuRXWsbQ0cRHMZyy6ct0PcW5I7nKk
	biS5itA4NFAc/Smst6seNavPen/FrvziIsR9VFsK0Mt2To14SGJAylr+47+lwxXZtV7Y
	ogAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wBZByrAWAHy1uHLFwezMpAB7SHqjpnfRgLPXtCs7u1k=;
	b=WmjZXNw3Zr+PtxDqfYCIt1ajmZhrsleVm/+m9gvtE4sYGTmVqGjFZGYTu7kOABvozb
	ani5kwjtTcUAas+slvQ+ivL/008eTql4T4w9BiYjtGGobyJfWwfX4VJ8GVYRlviTJG+y
	Dc8b4d3fwwZADgtH5xPR6ByiX7GCdtZFDEu17rw7S3US9a6OPafK/JKw0ufohWToJMgP
	vP5nFSX/kHVYR6O8uA4URxCy1bb1XkyYbBxkSx1ZSfOLgc24zOwaEZxn53nxRK1WWgeT
	3CATwk+ibubn9zhA+hBrJse93KyEjTud6DVgixyX2+jfcdN5q8rVPM4h23lv6ByStNJy
	DhCQ==
X-Gm-Message-State: AJcUukcWNYyM305DN0D74tZJ7nBxqouxn7Z+u/9lAeVSXFgcFjnzXKV0
	TjDT6SklNZOg16YoEZnJwBpGAUjS
X-Google-Smtp-Source: ALg8bN7O68GrjrBIrvc9TMeNaqtJY70z2YznKSY8J1QGHWECQNmGgqJyKZZIxVJnZwILgN5dfjemrQ==
X-Received: by 2002:adf:df01:: with SMTP id y1mr30852836wrl.127.1548845996362; 
	Wed, 30 Jan 2019 02:59:56 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:29 +0100
Message-Id: <702d40bf32dbedc78bddf8a854563a79f43a640f.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 06/20] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:56 -0000

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


