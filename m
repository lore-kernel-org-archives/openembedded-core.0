Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.3910.1603919188874930971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OhoUn0s+;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id v19so926915edx.9
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n/9li04OLrd7XY4rhq4iOe+sM/t9rCWEosMhD2VSjYI=;
        b=OhoUn0s+S07FMPR/RNnMJVSV14/Kpi7jb8wt3EFdkoA+B5CTUZP9WIjJszgSkrFemL
         BAIvhK4Y2M2yn0z9ww313uPDBAlU8VB2TOOG9daixoDj/mWrsqUQZVs9WMoB/FcvtjL4
         qQyIsE5NJf9CVG0s3YIAtqRu8mvxn0IsLXqWU9vk53bebtkwWbc3brjUFIM4Qpmx2iY0
         fc0S1bOBSI1rqT44qJBXGJV+5RWUvPBwK1kNkE6ZwnDaIVGq8xY0fFGSs9wQYKpJ7V0l
         RoG0s1MlqBXnLpWQ1oFzI+1vltNkIuKR0LYVedEQKuhwew3YKbQTOF2LeQz11uDukP5P
         WwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n/9li04OLrd7XY4rhq4iOe+sM/t9rCWEosMhD2VSjYI=;
        b=eksDyWvXWDpJArXDfxqKq3C4Y4BFnBv8UcunVpxHfsPCEc4c+y+lCg6mfLdUydLRzf
         DkS0gj5a5G6tv8/dMy9se5Emki28a2OZc8GK8qsSlGN0ARdWpK6hMGpTPe1K+NTxfqme
         2JBdlDkMU44qCfWl9kGPAie5N9tUlCJdmpQzsuwqVn+ttFRkFAX7dAN3dsQwcX3P1eY2
         QhC009yzS9vQ0Eg1OyEOhAoom6M9q94bFHw5n7C3bLZrCMYZdvs1PRDHDDQNbfq5ki4Q
         /nJPGzRW176dcWFMMWmB7e6kKmqAC/VvARWX9WpF62ZRZq5/1o0/TEMtf2oDM9K5nRA2
         PczQ==
X-Gm-Message-State: AOAM532YBsoLc/qjAQwYQaFxj5skIGyqVh/xbPYIcWr4Z7ZbnoxfuLc0
	TaOjhYHfrEaIM+giQEVhEBl8WtvjiyBRyw==
X-Google-Smtp-Source: ABdhPJyQmyP5egEmyZ5TQdnVeuoVeXHpgPlK1cacSJEpO/dCR6XR5j/ipjF7Fat5sEpFOkoABWsj5w==
X-Received: by 2002:a50:d59c:: with SMTP id v28mr791983edi.241.1603919187244;
        Wed, 28 Oct 2020 14:06:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/33] vte: update 0.60.3 -> 0.62.1
Date: Wed, 28 Oct 2020 22:05:49 +0100
Message-Id: <20201028210558.21070-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...EXITCODE-macro-for-non-glibc-systems.patch | 46 ++++++-------------
 .../vte/{vte_0.60.3.bb => vte_0.62.1.bb}      |  3 +-
 2 files changed, 16 insertions(+), 33 deletions(-)
 rename meta/recipes-support/vte/{vte_0.60.3.bb => vte_0.62.1.bb} (92%)

diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
index 0ffd92b4ba..a1d2e7ff27 100644
--- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
@@ -1,7 +1,10 @@
-From f78988d3bb5929c857e788a86c7919d6a4ffacc9 Mon Sep 17 00:00:00 2001
+From de9639baac792327c701e509258b8a13f6959e82 Mon Sep 17 00:00:00 2001
 From: Danilo Spinella <danyspin97@protonmail.com>
 Date: Thu, 21 Mar 2019 14:19:26 +0100
 Subject: [PATCH] Add W_EXITCODE macro for non-glibc systems
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Submitted [1]
 
@@ -10,40 +13,24 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 [1] https://gitlab.gnome.org/GNOME/vte/issues/72
 
 ---
- src/missing.hh | 21 +++++++++++++++++++++
- src/widget.cc  |  1 +
- 2 files changed, 22 insertions(+)
- create mode 100644 src/missing.hh
+ src/missing.hh | 4 ++++
+ src/widget.cc  | 1 +
+ 2 files changed, 5 insertions(+)
 
 diff --git a/src/missing.hh b/src/missing.hh
-new file mode 100644
-index 00000000..1baa993d
---- /dev/null
+index 0742270..30ede62 100644
+--- a/src/missing.hh
 +++ b/src/missing.hh
-@@ -0,0 +1,21 @@
-+/* Copyright 2019 Danilo Spinella
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 3 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-+ */
+@@ -33,3 +33,7 @@ int fdwalk(int (*cb)(void* data, int fd),
+ char* strchrnul(char const* s,
+                 int c);
+ #endif
 +
 +#ifndef W_EXITCODE
 +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
 +#endif
-+
 diff --git a/src/widget.cc b/src/widget.cc
-index 331ddba9..555a4adf 100644
+index 44a2271..0668735 100644
 --- a/src/widget.cc
 +++ b/src/widget.cc
 @@ -21,6 +21,7 @@
@@ -52,8 +39,5 @@ index 331ddba9..555a4adf 100644
  #include <sys/wait.h> // for W_EXITCODE
 +#include "missing.hh" // for W_EXITCODE on non-glibc systems
  
+ #include <exception>
  #include <new>
- #include <string>
--- 
-2.21.0
-
diff --git a/meta/recipes-support/vte/vte_0.60.3.bb b/meta/recipes-support/vte/vte_0.62.1.bb
similarity index 92%
rename from meta/recipes-support/vte/vte_0.60.3.bb
rename to meta/recipes-support/vte/vte_0.62.1.bb
index 02a886bce0..1a8e21dec4 100644
--- a/meta/recipes-support/vte/vte_0.60.3.bb
+++ b/meta/recipes-support/vte/vte_0.62.1.bb
@@ -18,8 +18,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.md5sum] = "4214712ecab2d50e2a3a07897c3ada49"
-SRC_URI[archive.sha256sum] = "feb76e1181a357d86112d447a08d127e2081438df76ece83243b18609dd9822a"
+SRC_URI[archive.sha256sum] = "c369e87c0c8284e09109d0a9aac821f543558f51c0cb9c7acfff3df64153308d"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.29.0

