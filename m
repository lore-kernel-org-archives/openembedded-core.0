Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.2425.1615512990442187907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 17:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uFO8RYC4;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id w7so7659130pll.8
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 17:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFoQA9aq4H7T3DXD4e40so53NvLLXybwN9bZG9ZaK+8=;
        b=uFO8RYC4btkRoIjkh3TPRpwDQNlUi+dBtLt1BRBAw0uqPulYubM3B6Ax70FDAXXeiU
         lcIi/a2h+aJ13JJa97rfKDeRUNyCmSEg3FpKTkupt88xnttdLFP5FLdvMJCkSITC8/u+
         XVARrzYTfQTRCMxd5+R8733yR6AWrXTg20SoiQgLDNlnpjhWhHtqjsk7jHla8tjo3zOb
         oKHyuyN/05NOtZyBM2labNjTYiStiFWQ3z3sTAA4tHzbWRLyQ45EpgOoVvVjyKOueJQz
         Q1wBrsqwAkn+6BYxWIOaBH+JTxQAB1YpzwI/iNcMTDuTx0XMqb81+elSzMI3myx8sTNK
         7YDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFoQA9aq4H7T3DXD4e40so53NvLLXybwN9bZG9ZaK+8=;
        b=S7yal4xBMnf//yRgx01ry5Pw5W45toI6Uzglo7oo3w0uNIC6wQXQATvc2/4B5xx7Az
         BGa4tRsA8/ic4dal65dxmvSPJxDGHYZrp9ADBSVzq3xoykPfDngLWOk2uDMMdLaxb4qI
         VI74gnxakgfA/Rfyhrx8m6pqc7Y80AwRQ4dVtOyvvu7LMIGrv335vc7yut137uQgDdfh
         Rpwcgpqg7fle4L2LBi6ugKaXt2xmV7a9WT5xX2sMMvZFNu3Metn8qiKZXT6kKFlHRTfd
         pgsTNhfQzCgQqP/q7/hYUBEu+iTRJNk9KMKG+j/rpZe9mVkKGi7Wvx8sV/dCqc9FJ7kh
         Tyxg==
X-Gm-Message-State: AOAM530f/coR3uYvKr8eF842Q5aMEO0t5gAKffNVC1R2HXdFDC0R6ARf
	hbQasHJK/NOx1EKNmHilyU0un6hUw6GXUw==
X-Google-Smtp-Source: ABdhPJxS9sb7w4E6YS8lPR6AYCe2BeZuxIYiMsVUBG3WhrfPH6RMaC86cuMcCgEtJt61Wd4KSCm58A==
X-Received: by 2002:a17:90a:2a41:: with SMTP id d1mr11377687pjg.164.1615512989732;
        Thu, 11 Mar 2021 17:36:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id 197sm3608732pfc.1.2021.03.11.17.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 17:36:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] perf: Remove libunwind for rv32
Date: Thu, 11 Mar 2021 17:36:26 -0800
Message-Id: <20210312013626.44204-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libunwind is not yet ported to RISCV32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c7653e523c..edb1335154 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -32,6 +32,7 @@ PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG_remove_arc = "libunwind"
 PACKAGECONFIG_remove_riscv64 = "libunwind"
+PACKAGECONFIG_remove_riscv32 = "libunwind"
 
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
-- 
2.30.2

