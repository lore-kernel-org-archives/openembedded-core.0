Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF24CC3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 16:55:29 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.24230.1746204922006447567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 09:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0mxdmUc;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7369ce5d323so2264434b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204921; x=1746809721; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwRWkBQu6KGYAI4vfGEXkJdHZaaivZJFmGfuugqrIkw=;
        b=L0mxdmUcZ4QwTrLLQWni7Tsn4uRDXx473MH5s94bt5jQiHXVY/sSRRDEgZm9djFPd8
         LbRESVFywgctxQG0d6VKGHbseZ5/Hm9aH+Qc6w7Na5zhp4cT4Lmn/v01TXvLH2YveH8V
         +ha6qHLi6mqg6dLVp8zm8qTNB01bt3tFFzoHihvV3gFtz1hLiQ+OBc199+AkegHb8+R8
         cukldr8dfkI1HVwGHIIUcV8XGwRKDqjrEOXyH2UrW6HMousDiHCRHrstR961wPTiqBrV
         a1SVR/2SIcXKRX0rZD7MCGf2LltACdkiYOFlgBl9KoHgll3Rf17NRdJGCbwowufBvQSX
         nEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204921; x=1746809721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwRWkBQu6KGYAI4vfGEXkJdHZaaivZJFmGfuugqrIkw=;
        b=YbRbz97b52kCAGF9c3f0CuzFaKVwTj2NBshYpra1854yBwxS4WSC+YtJTzgTeXoSpQ
         YqnXrZ0O7u+WZ/91gjVKqFsSzc+VNJEqA8OTOlbFDX+75Wx+BfHnLKuzvQUALVjAfy2j
         95rrMy6XIMBB7A7g4n7kQJBEbUGM2qI2ENwRRvIsqQP6CSeqKVi1rAL1WlyurkB9RGSJ
         ICTfLiq4Ccc1I8mWEZk7lWo894DLH1X3ZQBMn1N2otI5TV09BAgQr0py3JuISti6b/aV
         ZEl9IMKwHu5gZH+jZSgruHjc/qciVEWJHJz94WyKhJfeDLMoNyQhunfwWMMyqFpNY75k
         ta+w==
X-Gm-Message-State: AOJu0YwsFvIGvUXJ2YMgmzGZ/Xv4HXkywEIXjnx5isnhPH6R03Lv7pGA
	1uMdgRPoICzSpoNJUjwUQrH9BhuO4DyiasNGZOmr60fTw6GivB8riVUfxSnL
X-Gm-Gg: ASbGncsjItHpmeaSpbT0bdRzjtE2J0uT8fSXllMuL/Wpyr+NYH2Sid1jTUPSbzimxBV
	H7vgSTVURDL5HnsTsBdAzizoVA26TABVuaN1iFBy72d6lm3pUlQccVxb6VHwAeFTz8jXqGa+MCH
	cSVIE17PAcd99zdORjundzYEqS9hmNq0jovwoLgFkuRSu6U6OiIJ36BxpBm2X5CHeaBf5Yr4xJJ
	lUl66fn/pIklMJNsQg4OxtE1wIn9PnG8e44kmJpsquAfM0DK8nIB6D5YyHx72dclzoZ2aCr7qeg
	F+I2JNikRx8SyCN4dFIjJCtjHqlNtpj9
X-Google-Smtp-Source: AGHT+IELOQhb7pBMjZnvYDpZAW1wJ2/e2RtP5amubdW0Q+7zl9SJ5oSJDYlVM3pZhe9CWe4BS8tcww==
X-Received: by 2002:a17:90b:548d:b0:30a:4c29:4c9c with SMTP id 98e67ed59e1d1-30a4e55e265mr5467061a91.6.1746204921142;
        Fri, 02 May 2025 09:55:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625af9sm3253794a91.31.2025.05.02.09.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:55:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 May 2025 09:55:16 -0700
Subject: [PATCH v6 2/6] clang: RPROVIDE spirv-llvm-translator and libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-clang-merge-v6-2-00f2c2e9ff68@gmail.com>
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
In-Reply-To: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 16:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215912

This paves the way to spin out these packages out of clang in future
specifically spirv-llvm-translator which is not yet part of llvm monorepo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 8ae67c8c66fe1834a526be9d274020f1e1fdb6a5..67cd5151df6f551a5316b0d853591b11a1cae878 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -334,6 +334,9 @@ RDEPENDS:${PN}-tools += "\
   perl-module-term-ansicolor \
 "
 
+RPROVIDES:${PN}-spirv = "${MLPREFIX}spirv-llvm-translator"
+RPROVIDES:${PN}-clc = "${MLPREFIX}libclc"
+
 RRECOMMENDS:${PN}-tidy += "${PN}-tools"
 
 FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"

-- 
2.49.0


