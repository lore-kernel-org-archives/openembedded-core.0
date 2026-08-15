Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25A2C5DF6A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 12:46:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8154.1786797988264590226
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 05:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LGoprhpl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso13204805e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786797986; x=1787402786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8pfoJObpAtWzJitGG+M9b2s8Msgi5KPd4XageX4D5cA=;
        b=LGoprhpl6ZiGdFxV0YD31DqPZe93yi39KrdjxkY1M1ZfoTTPAoepuMzKqpoYuvuUmw
         MxYNgZXoP9/YkVqJpPDBy00WxZen6qgIf1hGtXKS01C4UJ4dEuo/8pPGAy32aSyrg18G
         JEV22b3D2dlen0jf9QHWCV/xtdJdJgRJNkdjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786797986; x=1787402786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8pfoJObpAtWzJitGG+M9b2s8Msgi5KPd4XageX4D5cA=;
        b=Mx0Cl7I6TvwpMo10iD5UajGIH4Cuby/nl9useKSfRMqnyewzH+bi+Murv6nDSS6Ms3
         p4eaNIQdGX/SBgV3NMRW+PQS1H/9QluTQbtXH7GBH2j8t8AWjcfX1wZKnAG4EmDXXrJk
         JbgXNux+MTyHLOlTI7F6wSmiV5JH/T/yPiSg2MVt3X2NZ2hAg/yzHWvKGN/BUm1JlDEc
         8HLr/zlPnTtW/B7Xgv0aEOb+sCqxTkBz8ahcd7q2Adrr7Z6bPTOnZjJ4W/uGa5gErbzl
         WwKfWhhSn/2gJHHSCODyt7DnWWBo49D+ZE8NsQygCKIuAEpsXnlPQD7pz4Pqga+JsI0j
         lbaA==
X-Gm-Message-State: AOJu0YwOxGObHeCHRUQYkjW5HDLn7RXYXfa8iTEoy4wrgeYTbhNgXMZ3
	PoSokDY+AJhG48m+S5AhpjbxY3PhNgPqdAmG2rnB2zr1TD9rpBuR3Kokk3if0rOTlgtg5v4Td5C
	7H1rDEBA=
X-Gm-Gg: AR+sD12EXc4Lqsi2HTK56HxZyFClAsk6UwYv6BaJlmDbZR8pEhbPPSba7YCDWe8T50c
	hQRwlDp9JGqBLiD+HUYk4Xu2ziLCQ+mi23f5lRFqcxMvXp6ppO3bznPXqL+wIsNefmTHp0WopHF
	i6oNUyXe16L1qz0htL6P/O+jPm5eRMPg8ycKoTZsp1ZejKUyWVghzUGPTBCQR7XceNVit7OSg2V
	e/y9rkz+xNe4vyhhG/7tisxCGHP+KT9GiticmVBgshd4U7Ooqo9tFr9zyKTavfcKvMCVahocufE
	cKybrACdcTLJyMjfwuiaL7gT6A8mrswSGFnfiLhJT+afITs3+PDz1bl+oxsWrs/fwB3NNtQRyp1
	BSL3VaZzNC7aPCzCfKEz8K4utsq/CL8Vu6DlEZgcpfldKO+TcgMJQcPDsnTpO/+7fJ9aepDYUSQ
	O0SQiYyZCiPxwk6tradIkMUUzAODXJW15g+mnzhNC0vqgrWZ2Ee+QAcXMPxWcxN6GUUW1s6j1j/
	XkSA3fV9wuLmd6+
X-Received: by 2002:a05:600c:5299:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4998d7aeb77mr85947185e9.2.1786797986175;
        Sat, 15 Aug 2026 05:46:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:76a9:d146:8f01:f2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm17245267f8f.1.2026.08.15.05.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:46:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-hypothesis: upgrade 6.165.2 -> 6.165.9
Date: Sat, 15 Aug 2026 13:46:21 +0100
Message-ID: <20260815124622.3666801-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260815124622.3666801-1-richard.purdie@linuxfoundation.org>
References: <20260815124622.3666801-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 12:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243484

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...165.2.bb => python3-hypothesis_6.165.9.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.2.bb => python3-hypothesis_6.165.9.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
index efce4548431..080e6ed7f4c 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,11 +12,11 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
+    crate://crates.io/pyo3/0.29.2 \
+    crate://crates.io/pyo3-build-config/0.29.2 \
+    crate://crates.io/pyo3-ffi/0.29.2 \
+    crate://crates.io/pyo3-macros/0.29.2 \
+    crate://crates.io/pyo3-macros-backend/0.29.2 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
@@ -41,11 +41,11 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
+SRC_URI[pyo3-0.29.2.sha256sum] = "4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b"
+SRC_URI[pyo3-build-config-0.29.2.sha256sum] = "f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9"
+SRC_URI[pyo3-ffi-0.29.2.sha256sum] = "e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327"
+SRC_URI[pyo3-macros-0.29.2.sha256sum] = "73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c"
+SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] = "571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
index 0776519a10b..197989521e2 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "680a1adf523ac792b46064f425b112ce6c08a7a8f50e65d08e029de6aa11df95"
+SRC_URI[sha256sum] = "a5d1fa312020b499c517e1217ef4440c56a9b52e20b47b420b48a583a81c412b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

