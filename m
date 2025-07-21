Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9607AC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 19:57:55 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.51143.1753127874526480340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 12:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ORrUFQRU;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b321bd36a41so3823334a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753127874; x=1753732674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5/jcG54kJmtrumvEHkfEyozNEFdWTpNlD1TxtXXI0Y=;
        b=ORrUFQRUAmQq7fs0nbiXowBd0xkHOqelbe/ubNnKcbstLZ5dStP60AXK4JFyUeWUuR
         12Sdl+iIuAXaxS6TQSNCVF9eeiZAtqZJOBUjMXYWymmXjGtdR652Nbbi/16MKO3zn8VW
         ztZ5ojjXNS+8GSgYY/ZgtZmtk+2NWIdRtN7JrKDqLtcQd7StbXjw+E2KuI5Fb9nT0TlT
         P4ltFibtYJQVM9hXiWdIuJGGovMDeTe3fG2X+gFZQS6QJTckeU+EWmNTf9QbcGlWjNxN
         XNWrCIAvz3E/4RhFUiX8hgWerTcvZOBSqJ87sCCYrs+7qODtGc7E+hFKgqJvZL7VH1xn
         wEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753127874; x=1753732674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5/jcG54kJmtrumvEHkfEyozNEFdWTpNlD1TxtXXI0Y=;
        b=JIky0iYFxURBrxcIpAepx7gicsKbCi6fdEgdtQDrZ55i0t8fYBUK5xoNzQIFfB/ZSI
         bysiQvIgOKeRVnrLlxkGDYGnrR/LufSMi9eyaRQwi8TRZw/CMpPHD57qhEbxjsrUkSoa
         ln0a8G1Al3O4uj8l4Wi2Ikl1rXjm7OcQXRx82nmhxYQ3tvJlMdRKrLNjwbbuuk4sKOfl
         3YGdnwK9n2zirEbHly6RAReFtQHxbuMHu2YqjurPNAfu7t+7+aihruk2rX6R8BIXq3xL
         3vE/0dcFNphBArDoCDhmd2YsaIAXQHExYU/nkLo0xJ1rh64fdwUrP5pvuS63Hax8rxoh
         UhWw==
X-Gm-Message-State: AOJu0YzxGrareg0FzutCBl86jXI7qAY/a3u8X+zXWA5Hq9HwBUW/5Wl0
	H9D+B+UrTPtVUHy5tjBA5MKUC4fUBJ5hsKs94FqdraKS8/Qcs0E7SdrT36sbxstobi0=
X-Gm-Gg: ASbGncvL/oDownBx5DRwJn+JAPjBy3w4/QVprZbw4JcRqRbFXQCIRCZ5bK/FQZQXv5I
	C6ovSWAoKFSc+7Jpnb/+IU/r8SNViRPTh0X4pOuMwF8wFA2QU1X0dbznuq49LXZAha0xjQPRhXR
	xPjuK/jzhEqknN4BA2s5pOuAuLjKkj+pW0sYwazK6u23Vgs0vWYIVc9eznQDEn6GjMiCAQkCYc7
	ttdxz4G0STZ3C2pJxmyBB1Kv3QASP66Ks0BdNvEEkbJP7mqgtWYOyhhVYAVmD5DdXho8cJ4LpkD
	fPBkoVK6ueoqxyyf1QqOwyf+GS85HKCbdeBiaq/epS1yzsAzalGSs4aOeU4zGygSEVLJpGLPBbB
	sx66A4EMIM9YEVQ==
X-Google-Smtp-Source: AGHT+IHqFDmi9LKgmhSEiW0BicDcmj3Gew1wjShqR9giPc3nAkoq4JWlBlAYH2+ILek8Wht49TKjqQ==
X-Received: by 2002:a17:90b:4b0a:b0:315:cc22:68d9 with SMTP id 98e67ed59e1d1-31c9f4c4ff4mr27254678a91.31.1753127873479;
        Mon, 21 Jul 2025 12:57:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::abef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e5b56fsm6505830a91.16.2025.07.21.12.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 12:57:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] apt: Fix build with clang and libc++
Date: Mon, 21 Jul 2025 12:57:50 -0700
Message-ID: <20250721195750.1980040-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 19:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220711

Backport a fix to address random access iterator's expectation of
being const-qualified inside libc++ std::__insertion_sort_unguarded
implementation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Backport a patch to fix build with libc++ instead of always enforcing libstdc++

 ...compilation-error-with-clang-libc-18.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch b/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch
new file mode 100644
index 00000000000..e55205ca3ff
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch
@@ -0,0 +1,29 @@
+From b4488583424b33f51cb031562a9e8df820ffda23 Mon Sep 17 00:00:00 2001
+From: Chongyun Lee <licy183@termux.dev>
+Date: Thu, 15 Aug 2024 21:31:24 +0800
+Subject: [PATCH] Fix compilation error with clang/libc++ 18
+
+Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/commit/b4488583424b33f51cb031562a9e8df820ffda23]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/cacheset.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/apt-pkg/cacheset.h b/apt-pkg/cacheset.h
+index 5dbb9bf08..1c67a65d6 100644
+--- a/apt-pkg/cacheset.h
++++ b/apt-pkg/cacheset.h
+@@ -218,11 +218,11 @@ public:
+ 	operator container_iterator(void) const { return _iter; }
+ 	inline iterator_type& operator++() { ++_iter; return static_cast<iterator_type&>(*this); }
+ 	inline iterator_type operator++(int) { iterator_type tmp(*this); operator++(); return tmp; }
+-	inline iterator_type operator+(typename container_iterator::difference_type const &n) { return iterator_type(_iter + n); }
++	inline iterator_type operator+(typename container_iterator::difference_type const &n) const { return iterator_type(_iter + n); }
+ 	inline iterator_type operator+=(typename container_iterator::difference_type const &n) { _iter += n; return static_cast<iterator_type&>(*this); }
+ 	inline iterator_type& operator--() { --_iter;; return static_cast<iterator_type&>(*this); }
+ 	inline iterator_type operator--(int) { iterator_type tmp(*this); operator--(); return tmp; }
+-	inline iterator_type operator-(typename container_iterator::difference_type const &n) { return iterator_type(_iter - n); }
++	inline iterator_type operator-(typename container_iterator::difference_type const &n) const { return iterator_type(_iter - n); }
+ 	inline typename container_iterator::difference_type operator-(iterator_type const &b) { return (_iter - b._iter); }
+ 	inline iterator_type operator-=(typename container_iterator::difference_type const &n) { _iter -= n; return static_cast<iterator_type&>(*this); }
+ 	inline bool operator!=(iterator_type const &i) const { return _iter != i._iter; }
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 50ac2ea812c..b039599395e 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Remove-using-std-binary_function.patch \
            file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
            file://0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch \
+           file://0001-Fix-compilation-error-with-clang-libc-18.patch \
            "
 
 SRC_URI:append:class-native = " \

