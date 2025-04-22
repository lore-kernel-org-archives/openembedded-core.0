Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6CCC369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:28:26 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web10.41326.1745332101775195643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zhl2r1TNqzqBM;
	Tue, 22 Apr 2025 16:28:20 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Zhl2q4XvKzy6P;
	Tue, 22 Apr 2025 16:28:19 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 22 Apr 2025 16:26:59 +0200
Subject: [PATCH 2/2] mesa-demos: use glut feature instead of deprecated
 with-glut string option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-mesa-demos-git-v1-2-87eac5e3af26@cherry.de>
References: <20250422-mesa-demos-git-v1-0-87eac5e3af26@cherry.de>
In-Reply-To: <20250422-mesa-demos-git-v1-0-87eac5e3af26@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215213

From: Quentin Schulz <quentin.schulz@cherry.de>

with-glut meson option has been marked as deprecated since commit
b19fd22db283 ("meson: deprecate with-glut option"), part of the 9.0.0
release. Use pkgconfig instead via the typical glut meson feature
option.

The sysroot-destdir, package, image and build/src directories are
identical before and after applying this patch.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-demos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_git.bb b/meta/recipes-graphics/mesa/mesa-demos_git.bb
index 9dbb19d4696aa3b4812c60850d72a44a48d65d99..d3456cf9143e9861baa0108886db33f04d45f052 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
 PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
 PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
 PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
-PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},,freeglut"
+PACKAGECONFIG[glut] = "-Dglut=enabled,-Dglut=disabled,freeglut"
 PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
 PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
 PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"

-- 
2.49.0


