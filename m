Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5408078077
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:14:33 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id f20so12008968itb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=9oOF+2xYMNhRGekI4RvuzaAB84ORMWvsLUtlsrA5UKg=;
	b=hIrQGQTX05+8DUrDome/wsNNErKoUY9t3qnWv+TPCvQS7sbxvMi8cKiwUx+XRMM7fU
	hOxbeifFJ1I5UoU16xxKond/7kPgadsW4ef0DeqRqd6qQs450LCsaqFfOHR5mvDNUWCx
	I1Od2jj1IOk8ZgQAsgB9eoMgd/IwyA7X7FrbRvuQTAzfDZDC06v6y8pqxBJFFdT0LNF5
	HDW8DMQiNVbPih5Ft9Wwv/Dj/1lMlsZExrUYWrhaRMdrIWOdlwqzlc1yQ+6aH9ATuRXt
	efwEuXU4sB4rsrYmXyeKembwZeRtYkPCUNxC4nRkzGoJ6TZEcY/drqujOjkljsQ8TEzU
	QjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9oOF+2xYMNhRGekI4RvuzaAB84ORMWvsLUtlsrA5UKg=;
	b=BpOo3x/O/RWAdDXRSDr7dOyHllNbBXZIcig5YQe2R9cM8LKY3kik7VgIWMGvrybCjf
	aHcJxPJXzSdCZCybr6dnnxspczCgpN5fZUijsO0A9tciOh8Og2LWZPHl8s+JAMai6psq
	fF+qDB14SzKosTmJKeaBWjDpymTlPfuUbPD24g1k0qWDBSIF1nWwTMHqiGlKc+nIbc7b
	A7nWqrG7oJ3YogNGQVSFt1SvvRDk8CbeNg4iGc9N2N+UQTK6CA2mOiNa8tZujF1CmzIu
	3uJySc79GqlOGvlOCfb3pkXueOpofDaGOBS/WAa/7obOuTNWtPJvXmn/5nLXXAOyQ45I
	V3gQ==
X-Gm-Message-State: AKS2vOxDF3Th7/SEvDv1zxdCtYtVyEZ/+BLug79hZQxj62mwrQ8DFM89
	IzfSMR/GKdA0SHmwDjw=
X-Received: by 10.36.31.70 with SMTP id d67mr23154304itd.80.1497881674591;
	Mon, 19 Jun 2017 07:14:34 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id 65sm6628390itm.1.2017.06.19.07.14.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Jun 2017 07:14:33 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 10:14:19 -0400
Message-Id: <20170619141419.28739-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] mesa.inc: replace deprecated configure options
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
X-List-Received-Date: Mon, 19 Jun 2017 14:14:36 -0000

--with-egl-platforms -> --with-platforms
--enable-gallium-llvm -> --enable-llvm

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 04285f209a..41747cffc8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,7 +49,7 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-
 EGL_PLATFORMS  = "drm"
 EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
 EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
-PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
+PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS}, --disable-egl"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[imx] = ""
@@ -66,7 +66,7 @@ GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-l
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "3.3"
-PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
+PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
-- 
2.13.0


