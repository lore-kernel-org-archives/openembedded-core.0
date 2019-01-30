Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9E97C2D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t27so25516309wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=Verxb1068yPMbdiBOCpK06v0svOK91eyytrUF1FVLzcUslC0bMGpZYIYP9P9fnSZfF
	6Erpplw1a0ERR29ruSLoNWido/6+/SZNACWi/vsjXo3k9WImN9oP5q+ic8ZrKhHVWy26
	88fEZCDutFOqSAfFOxLcxoDCEUMzAXP6ity0HJ7dk3SCoFJY33PB4AvF3mZb0Z+3lNXX
	5Of1zX3zCVLpi4WpAxE2ESOcDK9TvSUyXpGDElFj8VsOXLJ92w/q7+wA50FdKbHJGQWk
	cNMySURNq6pRsV6HnmjYGyYRhxOHNuM6kwsb1GEC56rygikMAyWWSm8gymy65Fv8oCnP
	VHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=geZ0DlLDV4zdFeM5i9FaGLa8bUsWQhVQgVn3APBCzQaZfDuL3KSvWh2MLheiERcg9+
	+DykYs4uVCq0etu0qjeHxJ6auEtq0V3LDfZ3D5HDT46HorIkpfp38Xkifl/mFDuTAXR1
	ZWgn/IkpixQSp4a0xoUWtIvGE8Veh99qQoXVYfmaPL30qyXLvLz8h1WOQ1kzq9mmVtlT
	3D/JyHF2RyCu8HtJTOE/hHCDb2zcNWf1tDmlfKMbR9+l3JM6uNAJ7y/J+kr5AezBPeHf
	4PB5x/6jzGRStRtvv4ruySHI65Od0hs81piLbIyjAwIG6k2QMeZeLGZZtFQPmQ2bP5GY
	BS5A==
X-Gm-Message-State: AJcUukdX7xmK+O62aWWDLTziEFBiUCJ/PghowUFBju5M2ISq6ujBux9H
	MGefaIB7Xj4PwzLsxbkwZq8+cfLs
X-Google-Smtp-Source: ALg8bN6g/m4Ld+2K3A/ulkzSTUEKy+fMpuiVGTv76P03x7UUqB2zLg+hgRSQKXH75yaodq/6zpQCqA==
X-Received: by 2002:adf:9246:: with SMTP id 64mr31443744wrj.130.1548846000247; 
	Wed, 30 Jan 2019 03:00:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:32 +0100
Message-Id: <d95e969fca42ad3416b81c3b2076d1bd0e1930a6.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 09/20] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:00 -0000

As sdl is deprecated in favor of gtk+, it should not be the default.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 95e9e0ede77..07f78058e7b 100644
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


