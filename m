Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE3AC61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 08:50:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.55043.1749459039521804457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 01:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jf2jvxFX;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso25199735e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749459037; x=1750063837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SG97LLzBpTRqgsvXHVMl47a/MoG2KXBkNiOFcEl2rDo=;
        b=jf2jvxFXTYdOXC8QsXDhjcuFd4ZVSWBZV6VWoZSeFG6xCezgtLSRNUbpYJcMoc7bU4
         hgj3/+bvZVTleEN/yJKyHT6UMGT2RkSB0Uh4yJZsJie7CqZyBoVSmEMO+GEGmfS08Chr
         ynXyXoSODpiWZ0trcrlNJeVeB74dOTy2QfmYPTAymCvX3wrxMpQrTlTlrsG+RXlNF8C8
         JQFLtnkIDd458IZtKPmJ0tpPOiHB8Auj5VFiikHQNbWfWeCubgipjhAFE82wbtZOF/Aj
         Xj7lFqHHtWXSqP8jgIpIrxCprJWGzm689u8uJFah5VHwDFhvMPfvSoKMl5BAyQp7/Fqs
         kfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749459037; x=1750063837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SG97LLzBpTRqgsvXHVMl47a/MoG2KXBkNiOFcEl2rDo=;
        b=scm+Dxx1tlYhGnajp61xAGhpMwTDtEtOkFuF9dGowH+q/rA8rE27VYE9QitsSo2DCL
         0Q4Vm6a3PcB/6UOJaHuFwStMi+bMp3LdSXjpd+La1HmaJ+Rzld88Cag0bVAkJomuRDr7
         32bYmfT9SZNNxrGeW+MZB4mh7fYUPh1wkcmybduklYk27vgXvThZqKB+wZJD5d9yaWH+
         D/EHS8goZJN8DxCAOWTbpWtFeHsxFqsaJgVTuLM+4kZfYYAxL6WMGM97fdjX1zGqzAB2
         uMThvRUwMA9fu5xPr9PaJPaqRG24KVPLyFUl9XZZg8Rc5i0ykoL93eMz8n9HMz1FH1Zq
         p/tg==
X-Gm-Message-State: AOJu0YwSwtMUd+Q77i8C7/uanI8oIY+JeijEXmtY7oCXnwsmOZAjMzzK
	BB00/4B6Q3uH1o76fDEGqX3l2orW0NTAc8OUhxiDsqSPeHu7Z3H+VVPmzS633w==
X-Gm-Gg: ASbGncsHtiKNAQKlKwcnkiph88Qp2OGIf43jqxh5NMk3Vv2zrAMW0O5yycvfM7ogxAZ
	LkZ1ITODlbs/dAxtgOVcJTecCpjLliSMu01XHIlvIY91MJt2wNPAaHc2fXQoipQrN+P5BzY4V7H
	RuMuK3vyaACRFtnvDW40Oc7rHreCGyPPwuPEe1VeCIfKO0C163JNTtHtLFnihD2bE6zg4dtZnkJ
	tBAyklSud+yr3b6132az+Ilg7keoy280Z9EwrcFzoipDRMyMBPz5M//oYOCqp8DFnLk9o6T/GhS
	jcDOTJ00MHQJFnpdOR9RT4PScdBwKD841v/e4vxKm5P8jwwS2fx4qVjI3qP7Go6yIGEZTI5x6yl
	1
X-Google-Smtp-Source: AGHT+IH/xGC6g9IJGnhrW2SPmpyWH8LOlF7o7016aiNfyoy4HneRf6IhD+xQelJ78U8ZY2nH59h6hQ==
X-Received: by 2002:a05:600c:348a:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-452014b3a8dmr123479005e9.31.1749459037203;
        Mon, 09 Jun 2025 01:50:37 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e163447sm101253115e9.17.2025.06.09.01.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 01:50:36 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] piglit: drop python3-six dependency
Date: Mon,  9 Jun 2025 08:50:26 +0000
Message-ID: <20250609085026.248611-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 08:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218244

six was dropped as a dependency five years ago:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/288e7b3b74a88e5cfa6a7fe26d52bf093e16365f

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e30efdf33b..cdc05da015 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -24,7 +24,7 @@ S = "${WORKDIR}/git"
 X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
 X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
 
-DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl"
+DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native virtual/egl"
 
 inherit cmake pkgconfig python3native features_check bash-completion
 
@@ -65,7 +65,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 RDEPENDS:${PN} = "waffle waffle-bin python3 python3-mako python3-json \
 	python3-misc \
 	python3-unixadmin python3-xml python3-multiprocessing \
-	python3-six python3-shell python3-io \
+        python3-shell python3-io \
 	python3-netserver bash \
 	"
 
-- 
2.43.0


