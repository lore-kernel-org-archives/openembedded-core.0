Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAE2C3DA6D
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.37982.1747603856209840133
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gIRcPt1e;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c73f82dfso424988b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603855; x=1748208655; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcAksl6ffK20o79p233aXIhUKpPRCtQA0+GKUJsZeOE=;
        b=gIRcPt1eEr0mOCmfERSMgkMQUlVUDHjNxnelypzGSRhPMdDZQDzOzHOBf+pYqKJo4q
         qxRGMD4MFJ15UCCrps/XnG90XRj2F0DdASeu3RUdZkBY7ocScFOkPqG/db5cBxApzjmh
         +tDC6K1fQ/W3KKBwiUxNF49gIYVQIwe84ZI8l2FSfRaYtVk9dG6p0PZSeg1AZA7wXiWx
         u2t45tQ6hAJtRNJTEKEeBSBVOLyyKh5Xey5jA5oXbK/+fSNNd6scLJNxnoIlbTrBSxb9
         aBKDo6le0v/13+XwUFRLIBL0pwM+sejtzLgnT4EEbXP5Pz6nGWUpYZooSZK8LYL2Xw/b
         4YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603855; x=1748208655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcAksl6ffK20o79p233aXIhUKpPRCtQA0+GKUJsZeOE=;
        b=bNQAyYc9kbr4cvzlSKPMmOTx33Pb9cTRiBIPk5/tbRDEvyxjAzQKJ1C5JT3mwBvh2k
         dNp6RODp+fLfkLijcMYVs9Z/pqJFlSAY+4ea7AubvG+TdWwmruQV8X/qSBpCln+w1bj9
         oZJmSz3gVlpkiSHs4HG/j8SSGmx/Db3Q3CpMt7s7eRSDs2V5mZHo0CBQHee15iUJaGNP
         w2hlcsFTQI7CyBOVUKrxwCJKRXJEqd2EhztdwoNGBHGpv+IWonUH+32o0m0Qtw5tCY6M
         tTYCEJSzhFxR5jA6m3AQedUBcbHgPLdE/2cnVu8TRZF1MtT/jSksnFv6DJgLMy8V7eBl
         z4ZQ==
X-Gm-Message-State: AOJu0YzKAF/H/jDLM6mvHZDpRbIPlND9lzZoRq4N2TBXVtAlH3a54OT1
	Ypw4KSyPSSLSt+f32BB42YPWXvXkEvN1gnevujPSLqlOYRDiAtSfSJMdNgpgvUxh
X-Gm-Gg: ASbGncvZplpYJfbrge2YFwGNs6Mb1ccimj71itsh8R3kvBq4QQ1LniFTqxq1OjDmkma
	r43CUB2NOijrcewEG87gSWaTklxXsMaqOX03+9zKbMs1JmncOXcnFTtPQnImNtBsP7hIzbR79yy
	qgZV/WbKhGaY3TSLZvJ2viPznZOVGKA2pVGEWK4m+gKSq/jD6dgPle+O2sjyn9qvVlek5AyDPA0
	Ugu8MfF5Ib3BX17Sa+xvDbffcXqqEL3Em78HrNtUZebGh6JWnCMvfwCLSzyLO1KDggtTHSbpCCA
	9xhhsnDMGVFjSUhnw02fY81G+Om8TEZez1pkgJjp0sI=
X-Google-Smtp-Source: AGHT+IGZpxNtaVQfH7D3mbplbaeR92UIx9gMJF0SCFeQSqAaJyfPs7xQCDXFzR6vbGJeUlUOn3M4cw==
X-Received: by 2002:a05:6a20:d04e:b0:218:17c4:248c with SMTP id adf61e73a8af0-21817c4f2b6mr9633601637.22.1747603855423;
        Sun, 18 May 2025 14:30:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:42 -0700
Subject: [PATCH 07/21] clang: Add compiler-rt to default deps when using
 clang compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-7-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216791

This provides needed built-ins which clang uses along with libgcc
its not yet a full replacement for libgcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/clang.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/clang.bbclass b/meta/classes/clang.bbclass
index ddf8f350f951744940893698188a1e6056edf7cc..f9cc74142438f1a85a55517c2846f1a72b9af9bf 100644
--- a/meta/classes/clang.bbclass
+++ b/meta/classes/clang.bbclass
@@ -24,6 +24,8 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
+BASE_DEFAULT_DEPS:append:class-target = " compiler-rt"
+
 TCOVERRIDE = "toolchain-clang"
 
 TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"

-- 
2.49.0


