Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 656F177DC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 18:15:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c4-v6so6427358wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 11:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=J2IIHdujz93UjxEBszJZq0bji7YbBhlLTswGUFjDjRY=;
	b=brTdfIIU7D4XN6O8bzBWxtqk0H/W9V8n3go3yrAZ793aGUZBUY7ESUC7h3XSKGWgFl
	XZcBmDwXMRauOeCflbrEJKesghsGEsSV71ZyITNNTR2ygeAfVAm6xmBn3pEiDuIfGtUT
	bv5d62nYnFtbPe/v6YmVMQYW/nGZwx+7AvWVMpoiqvLVQWlXk8wVhiEN1oSUPywI7bfs
	zWMwYZHwC6RuL1fzc2Ma20ono4kjkLwABAe/HWkppZqgKWbU4ZQ40+3BLLLiSKSGyGOS
	yj3o8BjdWwtXta8nst+NH3rrprQt4pTeVid1fbIDaUuAyYuu18utXjIkaZxTYdLxR6Bd
	Nl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=J2IIHdujz93UjxEBszJZq0bji7YbBhlLTswGUFjDjRY=;
	b=LDCwS9hhxrQk/3SfvHK79giCI3JRiLNeRPgH32VRES6U9hKnuDQodIk1wntsS3wxXQ
	8m4k8p9mUh2S9e2ye5l3aj1UdpXxqDFybL2CXAXCrszi0u9nU+Sgr3RBboSr+MjtlnLs
	LnTFocF9LJMAdLd5AKgzvRFJYlRLVJkW9aZ7yvRe2YGd43zmtgKAHulUUlGRHk8tbxAt
	NpIrCF9yZt2xbZf2QYA7gWQ8CQCvgbsVFvIuVfhFFI/DtCTyiz1SN7Ujk6v712PRNc7/
	SNHGSPIG8+n7/2ynSXiAVyhdfWoPa7AXrjc4HW1JqUtMl3fjjau592+4HibKktVUU5sz
	MgkQ==
X-Gm-Message-State: AOUpUlGqD6ls6ntMRWyNYCBOzIAUo89TyZXABJ0Ssnd5wc6YqhNxsAY3
	ttZoM481lsX+NL3rfRPbYbZRWC3V
X-Google-Smtp-Source: AAOMgpc8ZYIL8rtD+Oz41fKFbGB5Re3IFWCW/aB/SFh38ZRG7mjnUGHkAE1iA9WGuzKv08iZZsjghg==
X-Received: by 2002:adf:e24d:: with SMTP id
	n13-v6mr4772845wri.205.1531332903639; 
	Wed, 11 Jul 2018 11:15:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p184-v6sm1896506wmp.43.2018.07.11.11.15.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jul 2018 11:15:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 19:15:01 +0100
Message-Id: <20180711181501.1389-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: remove hardware float patch
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
X-List-Received-Date: Wed, 11 Jul 2018 18:15:03 -0000

We don't need the texture float patches anymore, as the relevant patents have
expired so this defaults to on now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/files/0004-hardware-gloat.patch           | 52 ----------------------
 meta/recipes-graphics/mesa/mesa_18.1.3.bb          |  1 -
 2 files changed, 53 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch

diff --git a/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch b/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
deleted file mode 100644
index b676b078a32..00000000000
--- a/meta/recipes-graphics/mesa/files/0004-hardware-gloat.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 9bc2dad0257b778faf30edd5bc8f5c19ddf27351 Mon Sep 17 00:00:00 2001
-From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
-Date: Sun, 20 Mar 2016 13:27:04 +0100
-Subject: [PATCH 4/8] hardware gloat
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Inappropriate [not author]
-Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
----
- src/gallium/drivers/llvmpipe/lp_screen.c | 7 +++++++
- src/gallium/drivers/softpipe/sp_screen.c | 7 +++++++
- 2 files changed, 14 insertions(+)
-
-diff --git a/src/gallium/drivers/llvmpipe/lp_screen.c b/src/gallium/drivers/llvmpipe/lp_screen.c
-index 3f5d0327bf..86808e016b 100644
---- a/src/gallium/drivers/llvmpipe/lp_screen.c
-+++ b/src/gallium/drivers/llvmpipe/lp_screen.c
-@@ -449,6 +449,13 @@ llvmpipe_is_format_supported( struct pipe_screen *_screen,
-    if (!format_desc)
-       return FALSE;
- 
-+   if ((bind & PIPE_BIND_RENDER_TARGET) &&
-+       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
-+       format != PIPE_FORMAT_R11G11B10_FLOAT &&
-+       util_format_is_float(format)) {
-+      return FALSE;
-+   }
-+
-    assert(target == PIPE_BUFFER ||
-           target == PIPE_TEXTURE_1D ||
-           target == PIPE_TEXTURE_1D_ARRAY ||
-diff --git a/src/gallium/drivers/softpipe/sp_screen.c b/src/gallium/drivers/softpipe/sp_screen.c
-index 25f6f74f36..61629ef2ff 100644
---- a/src/gallium/drivers/softpipe/sp_screen.c
-+++ b/src/gallium/drivers/softpipe/sp_screen.c
-@@ -397,6 +397,13 @@ softpipe_is_format_supported( struct pipe_screen *screen,
-    if (!format_desc)
-       return FALSE;
- 
-+   if ((bind & PIPE_BIND_RENDER_TARGET) &&
-+       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
-+       format != PIPE_FORMAT_R11G11B10_FLOAT &&
-+       util_format_is_float(format)) {
-+      return FALSE;
-+   }
-+
-    if (sample_count > 1)
-       return FALSE;
- 
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
index 1c76f4b1b12..e4aad1d0471 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
@@ -3,7 +3,6 @@ require ${BPN}.inc
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-Simplify-wayland-scanner-lookup.patch \
            file://0003-winsys-svga-drm-Include-sys-types.h.patch \
-           file://0004-hardware-gloat.patch \
            file://0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
            file://0006-Use-Python-3-to-execute-the-scripts.patch \
            file://0007-dri-i965-Add-missing-time.h-include.patch \
-- 
2.11.0


