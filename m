Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BE1C54ED0
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.4712.1747808409602797300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L7aL/yQm;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73712952e1cso6043010b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808409; x=1748413209; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbZV2lCDrLb4KxWJun8O2Fn1PusgK4ScvR81eZgLSww=;
        b=L7aL/yQms7F9LBJx0fA5kXOdO251tSK/M5V89P1p5m4A8CWq+v2ChLeKlBUas+UQ/Y
         HnWmNIKOVq0V7mwqWTNgx0g1LuBmy+otzQHZtGq0RStPjEdc01Lk0AQgCpvW8LycA0KT
         nPtC7YZE53BLjL3Po0QyHgV9Iptl8ZpvDRKWkgIHOTZxm7sQl4SMaUYvapMOwwV4WZid
         kSnr79Q57axovATak01stYn8B47E+o5ybzX1L4iJo4u6ppyHpZgdEVrn7BEBWLxFDE4T
         muoQJMq0PDGKtOiuwag5Z40S2S7GTYot7tGdDXiCg6/Elqj62fTKcfHrYci5HcZH7jlt
         Abyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808409; x=1748413209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbZV2lCDrLb4KxWJun8O2Fn1PusgK4ScvR81eZgLSww=;
        b=gE07XsekJLeE0rE3RGRxwoBYbTNwTqkdQWg/HeZMAP624fa4OyjIO/PQ+zq7pU2r/j
         Rd0fYXNNXX4Apj8YTvjM8vAz94F9Zb8oynImYmrMQCXSs9LY7Efqm98BMlCl7EmLseKn
         BWcYjonfxy/sf3FWQbo+OoQjk18scpVDN4MIRnKnG0cyvocADBU/SchfTjMwztmmAFgC
         sjjRz63Ol2TqQuQI7qrHE3xi+thkhCvQLxyISZacDwM4ClcY1E17He/J3VQtus/ao5Pu
         dFQR2c3HUQiwWQHMA8FJb8Rs9vEY8wXLyA6ArnWMNdc/pF694buQaF0jXGcSs6ip47Gb
         bk1g==
X-Gm-Message-State: AOJu0Yy9OYcttQE/kRZBLMLQasa/fEJ4yhKW2Vkhd/BFwNb27B6+cMEQ
	io3vWCku07cKdqfN/2/N4+Tnesf+sxZDj0GXx1Ee7X8Oh5LIw5gaUDjcUHXwAKNL
X-Gm-Gg: ASbGnctYneAssWlxtYebDhsRiaiuOdYVy/YeZ+rbWDdh9rAM6Xkm1Fuv698NLC29DDq
	eN2PG2cqbaVnRHcUiZ+9jLpJRDctsvCzzmpEMnwCZJHzEUMoVQLP5M9YdhCIJ4PHLpHnqhjk0Iv
	o1O/Cxa5QbJmWZLSI0bA0MUyqIitHztrAv216t4rPFhpOmCG/xC2xhr9QYMYogX2hUhTH7gA/XA
	BtEPepS9K0j+xjW6Db2HPPNZpGDIPgpkTAPwLq0ZFpNuSoXCRJ4f9+mp+rfQ4gvf5q4CCUYbXI9
	q6w+obAsJnXc67JDtdn/7bkNwTIV9rFFHWZKG3O6lH4=
X-Google-Smtp-Source: AGHT+IElrxsDW0Cvf8fbobuRNTiLsBfD5KrwlDC5OAMt6/JUrM2Rq3GXh7ha4v34+LfCYFSXuQ2EeA==
X-Received: by 2002:a05:6a00:3e0b:b0:740:3830:4119 with SMTP id d2e1a72fcca58-742acd507b5mr25731754b3a.18.1747808408738;
        Tue, 20 May 2025 23:20:08 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:57 -0700
Subject: [PATCH v2 21/28] webkitgtk: Use gcc to compile for arm target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-21-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216989

Builds with clang run into compiler errors

<inline asm>:320:1: error: Relocation Not In Range
  320 | movw r4, #:lower16:.Lllint_op_tail_call_varargs - .Lllint_relativePCBase
      | ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 5b9846a6d631cb85d5dbe103155670dde9e6b777..a58b44440ee15fdbc5e9d6dbb9565fe4dcad4802 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -176,3 +176,5 @@ src_package_preprocess () {
             ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 }
 
+# Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
+TOOLCHAIN:arm = "gcc"

-- 
2.49.0


