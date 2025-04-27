Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C26C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:18:05 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.20820.1745723822730028405
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xn1PWVT4;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1730905a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723822; x=1746328622; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3t/CJys6/I5/TC/kB7/SG2Uc5VHsPZS4TIdl07QpwWI=;
        b=Xn1PWVT4pJdSIgYstsUIJW8u4pLDE0IIP9ZzEeQ5FrWm7MvN5c0bKymCeZ3V0vKh41
         2EMaPntJKKHErE5LaG/Qpwp7tragKrnurr1zFbiA7rRcjkdSoBGKgtbxfKNa6fUUR8Pb
         4V/GgWty4j24eTr7wgBQ/bK4KyPDMlhi619Ylr5Wq9iEUfBMw809p3WCQnvY93NgKbj6
         xbfzsIs1CM1F0t4YZIIJVnue7c/ldj/slBruDMq0fCIjwq1igobg7OcAFG5wsLNb7vj/
         SlJ/rFUK0g9J4SNvs2nB3IJZcSjgzLmssC1MAqRSeA6mFikrQ5kJvv9uj58NCxTvyJYT
         DKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723822; x=1746328622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t/CJys6/I5/TC/kB7/SG2Uc5VHsPZS4TIdl07QpwWI=;
        b=BCfcnHLjL5p1TFWjpiWluo2KGbV9jROF4y5Zkyq7wVpEtDBz/yYMsRMhwE357ObjUP
         6DknHxRO+HlmXMki7W8K4jmNap8JT6+HbCTIqd4r+aQ8QEGjn1nD2tbH1uoFj0Ya8fCN
         2QHzuZN9afI9Yp289Xb+8m/wYUm5MZVmciKSaUGDjkFZ1b/lmik+uVL7b0zbWqQuKaGp
         vPGWBdiWohsg2EqqX/8xaDG7tJauv+4asgx6jMD4Y2Zd2NXzzlWc+3hM3Y95JBo3k3mt
         +/ytgtDDRp2719FVCwBqBAtFPsGsLI2w9x8QtWgZvNeEHsVPR57qWwXG+JrVnighDmpW
         IHwQ==
X-Gm-Message-State: AOJu0YwWSZQhVFUyCnwNYZDIZq0e3aQCfUQWlvP2UvC+YArHprwPkqet
	KvSVM3uIItVtWHuak/6Nkfy9yxN/9DZ/h5GTyIYN+f9Nu5nPuPwAJgw+tDO/
X-Gm-Gg: ASbGncsxTTFHeX+ITypMTrTBsptKbC7cjd5k63Y+vd586LXeFrwU9KBPmHQ67BDDosr
	ulg7nqIvus6TYMict/d5sK1svS/lI8yPFQ5XYEKCUwFErZuTVdQbFEVD1bwjhRNH/eERXYx3gvO
	QlKX+ADKUF1ZbAM9+ORIrnz2fxZ4B0UbAxavMi1WNjua9k53ihhep4rm68s7K+sP7i6/MDs3QPy
	YsfZffjQs7RC9hYNolgfth9EW6oIKkRuHSxoDzOMq4ZrLHV2yBkA0K/8P97opn113UL1hPtpt1j
	UgAwLy+ByB7BLW3x7JpRF49aL/+bRmCO
X-Google-Smtp-Source: AGHT+IEUGZeVQ82B5S6kS1qkEl83X8gUe/K/Dv15yFuq9rYE7i5ckpH7wTXy99NJAHneXVlOoWJKbA==
X-Received: by 2002:a17:90b:4f45:b0:308:7270:d6e9 with SMTP id 98e67ed59e1d1-309f7ddca22mr11939051a91.9.1745723822031;
        Sat, 26 Apr 2025 20:17:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:17:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:16:46 -0700
Subject: [PATCH v4 07/10] clang: RPROVIDE spirv-llvm-translator and libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-clang-merge-v4-7-42d205904261@gmail.com>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215537

This paves the way to spin out these packages out of clang in future
specifically spirv-llvm-translator which is not yet part of llvm monorepo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 3e9192b5570d440b7e30d936dd1a1981facf723d..081fcdaa8ace778e592c16a14293aa5a348644b9 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -335,6 +335,9 @@ RDEPENDS:${PN}-tools += "\
   perl-module-term-ansicolor \
 "
 
+RPROVIDES:${PN}-spirv = "${MLPREFIX}spirv-llvm-translator"
+RPROVIDES:${PN}-clc = "${MLPREFIX}libclc"
+
 RRECOMMENDS:${PN}-tidy += "${PN}-tools"
 
 FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"

-- 
2.49.0


