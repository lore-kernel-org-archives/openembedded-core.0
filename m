Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973A2C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 20:34:39 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.24731.1745267678880876969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 13:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HQAFnDQz;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff64550991so3180014a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745267678; x=1745872478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOLMTC0A998SQvOTDobRBCuXxM88G/czDpjPDp/mD2A=;
        b=HQAFnDQz8MaziOH7qJP47iCoVB6FonZfvm6ibdzafSb/ZKSvYZPzkZ4XccrWCaXJOd
         1Y0Ju7sIr0mDUYVMrLm9/6j+qTHCEnZuEdBSNB9eINgBS0+pZqNuUL44P12ZoNyFFZly
         /vn0plDKr6QW6KpfcddxtN86kXkKcc2BRRoaHdSj+JOCVqyZP3XOilvw4/wKpCahTjM7
         mIG9WlniJnN4UwLVNzSGY6aeAJhOytCf1tjx2Lbgdc0ma8fW594M0wL4UULKInu9IDon
         dW6TLV6Qw8x07qTATR/IF/Ik4swNO1Jev7h0sGYnvAUuI0OHXOQk34qRi+hWr7nYyovh
         lfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745267678; x=1745872478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOLMTC0A998SQvOTDobRBCuXxM88G/czDpjPDp/mD2A=;
        b=krmXrvrRnsVUvALpON/Ruy1CeOzD1MYy111+KUMQdGI9as4wbHt8RuxTdcUIHpYqD6
         auU5gxev5FdpQNO/Y3yVh+40CSr3soVQNm6AUcBRdbiL7I4sfKuUO0n1YxBbdCFMfA19
         MsXFp5HJNTeSmx5uRcHedP0FG/hUmtGG23E7iduyUQclQ78GVAnlP/KO4B7a5eI97FRR
         mvCJzRC4u+mQjz1kD/3CTCQMmPZBacySqtV+hqJKnnmiS5cHzjM+/f8ca/r30Fc9R9IY
         5+7WHxv+IeCvy0Ub8WqAI12xf/ObuUTGkSvkiJc4209bG6VpLGrW3WfwIHLzoVmTOA5g
         13VQ==
X-Gm-Message-State: AOJu0YzHM/KxigCK5vwuxEoGRzyhpHT+cAxcepsZKzZycxro7Izkz9jw
	uJM5nh+/PcyetM7a+SR9xuzClEUiiuyKosnBzbkQCwlcYzNMygHLYgnUWg5C
X-Gm-Gg: ASbGnctRu13UkdAxzK6QPkULbuwRwFJObQCHXNnTB2IyBlp5jES0AjmjPVN+KLWASGM
	m5ItbaCrvFMhZ2jjlNldotnkwPdfkl7uwnItKNIzEJMCcLlYX2XlTHi98NUc97SmFVsNoWGiGex
	a1EyAFV6UpuC1/gXqwjUAkClkNTsJBMEDqpNjBubHJ1B3keAG1LhFrXeNHR/C9yqOCkkisOmB4j
	ryJlpnM3kwdxyjLPKT8FUHbGWCsin98FMM4LhPf+ijVjCm5LNP331sSBNNeUorUtapOs3WqBV6H
	7pbpDL7vGJy/I/C2c0x0LmAf+olA+B/gHDokoC8Oya8=
X-Google-Smtp-Source: AGHT+IFEM66VtdT+pT9ogMgp/ZZQONcrRtugGFAh6S8SEitfRs0IbAi17XjrZiO7fsT3joYtBWovOg==
X-Received: by 2002:a17:90b:2e42:b0:2ee:e317:69ab with SMTP id 98e67ed59e1d1-3087ba59f60mr23572566a91.0.1745267677877;
        Mon, 21 Apr 2025 13:34:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a1f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e04a94bsm8020289a91.40.2025.04.21.13.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 13:34:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Fix build break on non-arm/non-x86 systems
Date: Mon, 21 Apr 2025 13:34:35 -0700
Message-ID: <20250421203435.694576-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 20:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215185

Fixes
/webkitgtk-2.48.1/Source/WebCore/platform/audio/DenormalDisabler.cpp:94:47:
   ↪ error: expected ';' after default
   |    94 | DenormalDisabler::DenormalDisabler() = default
   |       |                                               ^
   |       |                                               ;

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/fix-ftbfs-non-arm-non-x86.patch | 31 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
new file mode 100644
index 00000000000..2381acb1b08
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
@@ -0,0 +1,31 @@
+From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 2 Apr 2025 15:01:55 -0500
+Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
+ non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=287662
+
+Unreviewed stable branch build fix.
+
+* Source/WebCore/platform/audio/DenormalDisabler.cpp:
+
+Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9eb95ae24c6a410f9cd614976f4653d020d9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+index 35715e663ce7e..44ba08a33d5d9 100644
+--- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
++++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
+     }
+ }
+ #else
+-DenormalDisabler::DenormalDisabler() = default
++DenormalDisabler::DenormalDisabler() = default;
+ DenormalDisabler::~DenormalDisabler() = default;
+ #endif
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 58d0a112020..5b9846a6d63 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
+           file://fix-ftbfs-non-arm-non-x86.patch \
            "
 SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 

