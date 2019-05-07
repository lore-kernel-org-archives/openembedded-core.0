Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF637D697
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:47:25 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m20so5575210lji.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Krz2wwcbpXAfXvBsYrGInCw77k704DdbFcsPmjep1Tc=;
	b=z0oGPGjHNXVHA/Bt0JLroDMUQVZCXa96ar8s5w8Yg+mP8xSWzg25ChHbt2CPFxaaJK
	hBLfT+g4z5h0WOGu6+2MFUPst3N2Spc7As26aIcKE7+cXmZL8UBBy19w0Tet0qLwLEEM
	o/6Wez98d77GO8k9LRy1MjzCyQLiW1bti5ZloRhCPcIDKkeZZsXIxqPPL68yc0JSWWs9
	8CVoNxMhkTVNNEe78ivwalCyyJqjDBh5ohGxZRv9LkR32a3b+jD/61ad5yLcEo2OLqlV
	hAFfdmivqOsSvHeQGYw5knrtLF4dykgNaTyOkIhkwkd7VPpV9z7qbnhbOxm7B7GmGC6B
	u0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Krz2wwcbpXAfXvBsYrGInCw77k704DdbFcsPmjep1Tc=;
	b=rSvTyMspefIGPtbWvTCzQ5Dk+GCEPqZGzZKcsvJEamxr/CvkooAIoe/Uzg7fmjr3Fv
	dTDH/CqYd7vwTwNiCEfZcmvV8kr3rl4sgnTJB3p1h9iT4MYkxgyfqx95gm/FGJV4iNDn
	INftoarHsoF/mg30NRKY9eY7FqSuVOB8QTsJkFu6n9Hj1liW3ZofHckqEaPdMybxXsgS
	LXu050P8pNlRECWxOTN21vVh5V5I5lN5kNWxpyEfy0TcJo1xveU7bo99/OAHkbnMgzHA
	7dNsaFb16uwxrZRyG4GILjpQIJI3YeNJWTiAHgtfwE5vHXE/TRcKbyJ5nBojlGXIf6oB
	Dziw==
X-Gm-Message-State: APjAAAVDy+YbfCq6sbUbHuxAuwkXilKyMx4Z9Z2vTXS1njK0C2nI2wzd
	nUZJMwLzFZLhfA00Vqrr2N8r4g1ZW6c=
X-Google-Smtp-Source: APXvYqxVLf5E+tSclmx6rZtpzab5L/BXVel8/y5ctYdA7nf+iJg6NTRudzSRa/h6xKRg8KWvj/chhA==
X-Received: by 2002:a2e:8957:: with SMTP id b23mr5930444ljk.30.1557244046307; 
	Tue, 07 May 2019 08:47:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id o7sm1655416lfl.13.2019.05.07.08.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 08:47:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 17:47:24 +0200
Message-Id: <20190507154724.13992-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] cogl-1.0: update to 1.22.4
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
X-List-Received-Date: Tue, 07 May 2019 15:47:26 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n-incorrect-preprocessor-conditional.patch | 32 -------------------
 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb |  8 -----
 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb |  7 ++++
 3 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
deleted file mode 100644
index 2a9d8f829b..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport
-
-
-Original upstream commit follows:
-
-From b583e21d8698dbd58013320cfb47739102efdea7 Mon Sep 17 00:00:00 2001
-From: Kalev Lember <klember@redhat.com>
-Date: Wed, 19 Oct 2016 23:38:28 +0200
-Subject: [PATCH] Fix an incorrect preprocessor conditional
-
-This fixes the build with wayland wayland egl server support disabled.
----
- cogl/winsys/cogl-winsys-egl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cogl/winsys/cogl-winsys-egl.c b/cogl/winsys/cogl-winsys-egl.c
-index 39bfd884..4a9f3aa6 100644
---- a/cogl/winsys/cogl-winsys-egl.c
-+++ b/cogl/winsys/cogl-winsys-egl.c
-@@ -1029,7 +1029,7 @@ _cogl_egl_create_image (CoglContext *ctx,
-     egl_ctx = EGL_NO_CONTEXT;
-   else
- #endif
--#if COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
-+#ifdef COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
-   /* The WL_bind_wayland_display spec states that EGL_NO_CONTEXT is to be used
-    * in conjunction with the EGL_WAYLAND_BUFFER_WL target */
-   if (target == EGL_WAYLAND_BUFFER_WL)
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
deleted file mode 100644
index 5901062a4c..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
-            file://0001-Fix-an-incorrect-preprocessor-conditional.patch"
-SRC_URI[archive.md5sum] = "d53b708ca7c4af03d7254e46945d6b33"
-SRC_URI[archive.sha256sum] = "39a718cdb64ea45225a7e94f88dddec1869ab37a21b339ad058a9d898782c00d"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
new file mode 100644
index 0000000000..f1753d5409
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
@@ -0,0 +1,7 @@
+require cogl-1.0.inc
+
+SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch"
+SRC_URI[archive.md5sum] = "31755015a865c4af51ac84f6e53af8ab"
+SRC_URI[archive.sha256sum] = "5217bf94cbca3df63268a3b79d017725382b9e592b891d1e7dc6212590ce0de0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-- 
2.17.1


