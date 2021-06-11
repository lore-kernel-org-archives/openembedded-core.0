Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.3289.1623379482439346931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 19:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P3r0Jx+o;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id y11so1264168pgp.11
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 19:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fzBN9kYTq8MblP9QnejWZDpWfDB8jbBpToQ1vrS5ctU=;
        b=P3r0Jx+oBbET4BVqMHdQ6PqpOQKP0rIOaB+C/zdChfIluuab1acQA6Y+IQzD2Csava
         38arC0OP8s7m+ddPtjjDKrdVb8v/8M+6/YN1r5bdOu3vVBLR7eBsPgCnORj4CgY0snGd
         QdVWkythwcFhVP8WFMO7k0IHrj+Rkda8LENI8BNYUb7EKjMsOC/rEJw5xhAgWd9/Rj8O
         ZcRNv3RZRmV1/Akptnh0LBDBf/i4fivgeDZXr+5rOnr6eFKHN4H/ZiQU8GW+j04YfRsQ
         +J5qWWFE5ib9EtopMIJ+3wcnJ+rpguCTN77KUqvZjIv/S3wcc5FWjG6mE9082yBvnEAl
         f9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzBN9kYTq8MblP9QnejWZDpWfDB8jbBpToQ1vrS5ctU=;
        b=BMMF+CiBo/CQJRC8QpESgQTyG2eO6wvNSk0/IRV8VnANlBmuqUPDr2/JrQ3k6SrjNE
         h/7XUfjYusn/Ja1yIhAI9MiTr5Ff9E9YkWIrzEmNo6GcFdXzPKqGNexBSPKt9ZgscgD/
         Wy1OheZHwaa3nwVtwcNCSbYk8Tplj4fyl8a23eeBjDC2H9E/m8agn0xZgvk4Ep7BX+RS
         p/SnSwQ7fcx4QipYulDQINq5jrbtd5BARBfQ6XUjGSZykDUytbVelhZcHcW6I+oaaqka
         u4XMEP7hy0kajHAAqKrAKSuUMm30A6Q7a+6qSV3rrsPBgw6cB8dIbKHqQ2rPpQQ/Q3UD
         l0Hg==
X-Gm-Message-State: AOAM530JJXboA93Sy/Xcn1uKJRP7EZrYSuQUzmg2HIsUdnZaXhUOeLzO
	QBLdLZxGpH8Aj66G47yGP54V0+AHARyB9w==
X-Google-Smtp-Source: ABdhPJxi32PKT/lfdltr2iQxuy1/9GKEHf67eBwCNxIrJsEc5QmY/Z59j/BzNYyFKGRFASmYBMGFIA==
X-Received: by 2002:a63:dd48:: with SMTP id g8mr1372631pgj.102.1623379481450;
        Thu, 10 Jun 2021 19:44:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id s13sm3943839pgi.36.2021.06.10.19.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:44:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] qemuriscv: Enable 4 core emulation
Date: Thu, 10 Jun 2021 19:44:36 -0700
Message-Id: <20210611024436.2109932-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611024436.2109932-1-raj.khem@gmail.com>
References: <20210611024436.2109932-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helps in running tests a bit faster

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 428d28bde1..20e2d465a1 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -26,6 +26,7 @@ UBOOT_ENTRYPOINT_riscv32 = "0x80400000"
 UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
 
 # qemuboot options
+QB_SMP = "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_BIOS = "fw_jump.elf"
-- 
2.32.0

