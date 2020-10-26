Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.1850.1603737637842087624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 11:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iaeEt8Mk;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id x13so6547587pgp.7
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 11:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJmlHqrmT5Ywzr/HCrtAKbKp9LH1R4h46qB71spxD/I=;
        b=iaeEt8MkmFicmMwxShU0bYd6GcmR6i0QAox7y7+h/JxxCVYTBc7quM4116jOFzuk9k
         VJLGrvDp4zKXiogJlKFXyeZs4Fe7QzOqp+pDAFZKH2Ru4SvFzCO4rkVZryzckI+x4xta
         O8uzV002PjrRUDB6DlTxaOf10BNHEnGTyOFCbI3ILoG8bJqZQKlXQMM0og63uosgrBon
         jfvT4OJdYxpmg0I1ydvHwm3VRy9+oUnoHnzrVuYxlxQTDAv1jqvqHfDUmnLLRnmgo2fm
         cyi/TakBZhGUGOBObi6dmdeSeixDBNYiVg3eRYP3Y/DboZERANW1dKlV5X7vztKx/wMF
         PrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJmlHqrmT5Ywzr/HCrtAKbKp9LH1R4h46qB71spxD/I=;
        b=LiDaxWVbKRLhKxsszGR8HbQlSi9ksNey3kdwi+3Zu3GmgiyqUBP0BoCAj48L67IG6d
         I3R4TXCmLBcSRicFf/VDD32I7dNyh3hZICqaKNWmoNPwKDaOEVZQ9VQdD1udv/A0AiB/
         V+Be9uW3elgveAC1qRlPejFTUhpQswtNe0zaWAjvFPJVg/JfW3eNu63pOO9Iz4wwGOcj
         eKanr8FzTWpeh1kHH3/eCWqUaS6Xbh7a4k6BhuiumIUW3wVtcGb3aib2tlOrBD0jo49b
         HWAM6TPGUFig0w5FjnvPB9hmc4pCrN6F7xABMj3Lz4sHfNIOUaBtTY9By5uxu+QKROOS
         mCHw==
X-Gm-Message-State: AOAM532U8K9NGpdL7PTigTN0f5CwTUIQ/nL8porOYVGVMRgQM0ThrqdW
	s3GvO7TIGwz6BszLPYiX/otIsGB9qOVcxA==
X-Google-Smtp-Source: ABdhPJxBkQehHxJAKdSgiUUq5o6dowGJZARhlTQot1T9IooLM8EQdr78f5RRKir0dDpY8UvvfocOeQ==
X-Received: by 2002:aa7:970f:0:b029:161:ee2d:bb9b with SMTP id a15-20020aa7970f0000b0290161ee2dbb9bmr8850251pfg.63.1603737636864;
        Mon, 26 Oct 2020 11:40:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id 3sm12759140pfv.92.2020.10.26.11.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:40:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] packagegroup-core-tools-profile: Remove lttng-tools and perf for rv32/glibc
Date: Mon, 26 Oct 2020 11:40:33 -0700
Message-Id: <20201026184033.16820-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They still lack riscv32 ports

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index d437e28311..b8e2c718e6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -29,6 +29,7 @@ PROFILETOOLS = "\
 PERF = "perf"
 PERF_libc-musl = ""
 PERF_libc-musl_arm = "perf"
+PERF_riscv32 = ""
 
 # systemtap needs elfutils which is not fully buildable on some arches/libcs
 SYSTEMTAP = "systemtap"
@@ -38,7 +39,7 @@ SYSTEMTAP_riscv64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_arc = ""
-LTTNGTOOLS_riscv32_libc-musl = ""
+LTTNGTOOLS_riscv32 = ""
 
 BABELTRACE = "babeltrace"
 BABELTRACE2 = "babeltrace2"
-- 
2.29.1

