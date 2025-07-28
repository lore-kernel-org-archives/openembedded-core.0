Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF8FC87FCF
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 03:21:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.73675.1753672856973651107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 20:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CwewqbIn;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74af4af04fdso3586764b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753672856; x=1754277656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MouKrVXm3MvP/QurNZuB7K2cZvvaTsO2Hvo8NRwVP/s=;
        b=CwewqbInN0yg7Sd63yUkIR56kqHSVbuWF+m31pN0Pu6JJ0WFJrVI/hpeSYSnyufo00
         YG8C7pk44ICZFbJZvk2wePoEq4G4WEg7CKopsorAjDwf+BfjsQTnGKpXSEJyk5+LfYWD
         /DX97WgbYs4ThU0BPIcpypOAAUXRXm/YZdRQolaqd0HsoazX3LwYEKjRTaWJ1LUYDmgi
         ktqOyoXZWmaRnVHxtstDvPnn8K7JPTcJmX0+rBEDhRY0iHM3SiQ/FT0RwFBOIs0nobTV
         sfAujfU5pnu+LDiw8jdb6IW9zwgPu6zjeaIvcaxELtnJHMGPLHDmSgVDI9KMYlJxbZHG
         xqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753672856; x=1754277656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MouKrVXm3MvP/QurNZuB7K2cZvvaTsO2Hvo8NRwVP/s=;
        b=p0hP4eBpKYiuJEErRi/Gy87RLTMs6To3rOzQIf2BpTLEPQD9txJ3zv2Tv63m/O+vEY
         vzeQxewABfwImYXw8iOXS0X4DajrMX+B8SvC3r2stq/1GUx7wGrvyCyaSt+XHSOc2mZ5
         ulxNQp4WFNkOASYhFkligzuzHMqV2qQHOOrmMO4RK7+vHj563YvPMmowJxza9wUD2kyB
         6xHLiGlDIWq20W8OWv4Ep2bXfd8m7uEQmKwniWJ6Z2z+56LIcsfCCZKqB6EcE+chgUYt
         yZl3ieUfvi1fBmcn4HcWUVBkUtCQG98ZBxzKKtuZMf4kQXw8KqbU8Rs66C4qlNPF5UI7
         0gnw==
X-Gm-Message-State: AOJu0YwoF613NgjdwfuOQB8WvywSjmk8oVtYaeSJbPoNr5IBxgZozfxe
	Z26P+W8VBPVfINEZ0lioJEkR6S/rAUTIAYU1h/BO9iKWlJWzcU3iKYnhSnMFlwKFk+8=
X-Gm-Gg: ASbGnctqRjlBGbfuEmq5scAJVx8S/JGLW8HX4J9RtyapC+kN3evGBydfumkgZupqfML
	6mNd12Eoda4Oje0qiOlQUomVV9sJOLRPVmfnXdOQpHzlQEYdDvaTswa0Qlmb8hKGRzCvIFAIH1o
	FZg2GKJb26ztuleDkbLJxnusSrkENTXTk1B0GUsArpQw+eOkvoWlYXHrznrNBGklRH3qTygU8H4
	U+UKdDhKSytFubEPvd6+teWsaP5WptfMxM8pSYPFo5iJfWeWF6i4qrTyW5FIBAb2HMhXgXtl54M
	LZ0WV9y9oSwEn2RAFLZLDZ1TTvjeoTa6PdQ2Oqx9nstzUfuGEwX5M41TOXtTtrKiB3mgh5WXAPe
	EYaqVCAAPVuOolw==
X-Google-Smtp-Source: AGHT+IGPWSjUiUPge5UsgvZC1sjZlMoiWTjd6mDjXFBojwj0PHLFP+67YBwWvQKzL6Xf3+ms9jQuQQ==
X-Received: by 2002:a05:6a20:258f:b0:23d:5bc0:2436 with SMTP id adf61e73a8af0-23d6e3348edmr16477302637.20.1753672855687;
        Sun, 27 Jul 2025 20:20:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c024c1sm4359785b3a.33.2025.07.27.20.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 20:20:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] mesa: Fix a build issue with clang-21
Date: Sun, 27 Jul 2025 20:20:43 -0700
Message-ID: <20250728032045.2783514-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728032045.2783514-1-raj.khem@gmail.com>
References: <20250728032045.2783514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 03:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220988

This is a backport, helps compiling with upcoming clang-21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...itch-to-new-non-owned-TargetOptions-.patch | 39 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-fix-FTBFS-clc-switch-to-new-non-owned-TargetOptions-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-fix-FTBFS-clc-switch-to-new-non-owned-TargetOptions-.patch b/meta/recipes-graphics/mesa/files/0001-fix-FTBFS-clc-switch-to-new-non-owned-TargetOptions-.patch
new file mode 100644
index 00000000000..2633869625b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-fix-FTBFS-clc-switch-to-new-non-owned-TargetOptions-.patch
@@ -0,0 +1,39 @@
+From 531c6696d42953cd642dea7bf70153285c7949ae Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kai=20Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>
+Date: Tue, 6 May 2025 14:36:57 +0200
+Subject: [PATCH] fix(FTBFS): clc: switch to new non-owned `TargetOptions` for
+ LLVM 21
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream hid the `TargetOptions` in commit 985410f87f2d19910a8d327527fd30062b042b63
+
+Use the new `getTargetOpts()` to obtain the `TargetOptions` for
+`setTarget()`.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34835]
+
+Signed-off-by: Kai Wasserbäch <kai@dev.carbon-project.org>
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13079
+Reference: https://github.com/llvm/llvm-project/commit/985410f87f2d19910a8d327527fd30062b042b63
+Reviewed-by: Karol Herbst <kherbst@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34835>
+---
+ src/compiler/clc/clc_helpers.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+--- a/src/compiler/clc/clc_helpers.cpp
++++ b/src/compiler/clc/clc_helpers.cpp
+@@ -874,7 +874,11 @@ clc_compile_to_llvm_module(LLVMContext &
+                            diag_opts));
+ 
+    c->setTarget(clang::TargetInfo::CreateTargetInfo(
++#if LLVM_VERSION_MAJOR >= 21
++                   c->getDiagnostics(), c->getInvocation().getTargetOpts()));
++#else
+                    c->getDiagnostics(), c->getInvocation().TargetOpts));
++#endif
+ 
+    c->getFrontendOpts().ProgramAction = clang::frontend::EmitLLVMOnly;
+ 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 58e3d9f7453..0d6f013ae10 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-dont-build-clover-frontend.patch \
+           file://0001-fix-FTBFS-clc-switch-to-new-non-owned-TargetOptions-.patch \
 "
 
 SRC_URI[sha256sum] = "9f2b69eb39d2d8717d30a9868fdda3e0c0d3708ba32778bbac8ddb044538ce84"

