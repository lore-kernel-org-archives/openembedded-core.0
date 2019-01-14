Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 35B087C078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m1so9266131wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=V9Lh5bXqebP/XxwoFM2moUlgL9C/nRocbERUjbw0HB4=;
	b=eye3MaOiRQH+8zt0kEbkPY2X3dXBgsuU5eLRx5Y77heNOaKSATbt3dpcizUBUqsCZt
	xVn/y5XrIWCTWjrw2yl9+23Qmo4jUVLHlE3P+NKfC9HHuWgX90cvVNYcg6kihZJ/PXP9
	gtU3FR8Mg7dg7i6563/U7hhtHlg3K09oymGAOyAAPInUfVm9RSEP1MCWW81w0cgo5Eg3
	V2RCqZIyVD9ljIz6bVCQ7a7UFa1WiQrjDOYCrP21QgYn/WrAqePkBBB0bKfH1rCrtsfr
	3i5cYbnlm/7G3HNqCXfHeVG0sazIC+AN4iEFGJ0Do4m0BjZ29QPYbDxhLulgnUy956oF
	EYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=V9Lh5bXqebP/XxwoFM2moUlgL9C/nRocbERUjbw0HB4=;
	b=gPfw4ndKTVeTzRU8uG5iAMZufe8ih0e65zEnhe4QWUgWYG2kLSj6h17/mbIH32jjK/
	9TKJD1fOQtkauHHDG4s5K7uNjDdyBotwtMNe9ZhgLY3guwI9yHZI4N3bT7Y4lEzjc6Vx
	L1a5AgBypwS8Mlv5PAsa6bRpwyoi+yOpBUUtGMZtenS1HeeT2MUSTP3x9HZLJ85zGF+S
	rln3F9Uz51YnLNBHqD9GdPcK+LUYADUCp0j7XRtOG4p721YpX2FUpyQvyiYYp14Lzr8Z
	Abh0Qmy1t8dRuWDPY/dPqw2JRHQwwDPcfALDosYlvfUVcGSa1xtpGd+y4qXEcnJwbR13
	ehIA==
X-Gm-Message-State: AJcUukd5ec8zGo9h9b7SMz/FEmiVexipSIeDP128zP87szgKY2G5JEg9
	pe3x9ydeqVQ1+Ow9BpbfyG1dNMry
X-Google-Smtp-Source: ALg8bN5joo8OTWIA4MKfD7UnrxQ8O8hoeRE4QDzZWb1I47vB/2BO9+hOH9nMjJ18pnuC2etQyUnhNg==
X-Received: by 2002:a1c:2884:: with SMTP id o126mr12668761wmo.17.1547478218539;
	Mon, 14 Jan 2019 07:03:38 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:10 +0100
Message-Id: <ae5bda69a7be41ae5bb679d6ef5e25b1b26eeb34.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 14/23] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:38 -0000

As sdl is deprecated in favor of gtk+, it should not be the default.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6db1facc9a5..531f0a04c58 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -71,11 +71,11 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1


