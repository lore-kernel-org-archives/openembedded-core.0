Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A268A782D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:44:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i131so1531442wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xbCP0C8KP2RkS9ZMlNImUQnk2V4aIV5iexhrK/4ld3Q=;
	b=E/INkGFAuLaiJQEO6/Sz//lBa+P9hEFPxCBQ+4brVhl2pkgNARBogdwStu+nxRH6O/
	w+Q4EVjFf7MZ78W6eGB7Rdbmz6AzwhPd/MHsNJQtp6srE+B8gRIHkUEFdJtKSgqQ0kYx
	FafxxAnRt+S7EGJeluE4Zzj+Boyz4qdUnoPZEktttbLCIXT0I520C8Bs/JF3i6Jww+Nd
	8sqv6wvXki6dvlK2Dl2ezKjkLE4ZteyXlxza7E3CXxwNjS6vdyuQxGa449j2aUyHqnAc
	g237HrzQiXcDUvkxyA1fCowplMlz/iu+NfZNeVtSJ6I+89FU9l3rUA2iQu8B2BuYJHyl
	7joQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xbCP0C8KP2RkS9ZMlNImUQnk2V4aIV5iexhrK/4ld3Q=;
	b=ofkgw2F6DVGKqIUtATs+7ZMbXkvRxDcAaG/w88O4rYA+Jg1A2uNRRj/z7tDD8bw7i0
	muzBB70dzz+epXpJG9pO081c3yqUAQwlnb+0fFPI+gm6bG0BIV7o0IvDC+V8mvxto+Vl
	KqRxTWERAE1fNDA+JHJWUgS8aD+afj8v3os4fRwwwmgjilaaKnbmvgM2YbIpY2MvmNmI
	Fqk8qJRdIop2pZ5PczOHPpyxm85rKc7rfofx92XT+fBRR1Y/m0lMUiJBuDBcFUU3CiUR
	NbKXGNY5DSJ7PePAmMDaJuQhLJRfu4rbCmqKMYb0iNqyPt41eQBUSI/k3NOilmZG15S9
	W7cA==
X-Gm-Message-State: AHPjjUh8/Kl05CpluptMmQH6Tgb98VKSgs1h9ndYW/OlH3DX7odJcRPh
	Woy2oZZ9+31F5M7W
X-Google-Smtp-Source: AOwi7QAXCsf07opneZOIjPnXIifQ+bqqkB3hlFFeJePn9wArLHHuWTa7lM1wC06Nn9zFooKOl8bK2Q==
X-Received: by 10.28.203.196 with SMTP id b187mr6970wmg.126.1505335473226;
	Wed, 13 Sep 2017 13:44:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b127sm1549429wmc.34.2017.09.13.13.44.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 13:44:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 22:46:47 +0200
Message-Id: <20170913204647.1660-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [RFC][PATCH] WIP: qemu: enable sdl2 virglrenderer gtk+ spice
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
X-List-Received-Date: Wed, 13 Sep 2017 20:44:33 -0000

* this is only for test
* it should be enabled in some distro layer which prefers extra
  native dependencies for virglrenderer and enables meta-pyton
  for spice
* cannot enable gtk+ for native builds, because there is no gtk+3-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e0b8647e88..ddf4c63edd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -75,10 +75,10 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-	fdt sdl kvm \
+	fdt sdl sdl2 virglrenderer kvm \
 	${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 	"
-PACKAGECONFIG_class-native ??= "fdt alsa kvm"
+PACKAGECONFIG_class-native ??= "fdt alsa kvm sdl sdl2 virglrenderer"
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
-- 
2.14.1


