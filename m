Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.323.1616536208371480480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 14:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hxFeCjUk;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id v186so13104294pgv.7
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 14:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3XY7il6VrJB9M0Hk1ELOU6GQ+k+nhWTP60tvZPlHUwU=;
        b=hxFeCjUkmnMx8FZMGn4AytTn/ZiKJl7D6FhXWttgmxDsQbIUjwljQjVum2nSNwTXC5
         U6NAW52amGbEASPrARs8fgB/zE16QY8qcMaxnBCmwUXYDbr0+fyw/hk0RNbkzUHqHGut
         sxs+sgg3NWC/mTUoeoNcI3+VxpHVUzfjOVp+s0XHk7LsIc4vxqNLgTXAmUTRi1myYd3E
         3UwIsP7pppZrCkleFiznNNI6k4PYrxpux3oqwcaIvuJO+4aXCAQrfBOCRsOWx/Qaojrz
         SNlQ9WYhP1v0CqxD/PnKFno7kLd/wHuatZg5vVENgYwu3eIVkc6T7k3/6R1DUOZIPPvP
         HzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3XY7il6VrJB9M0Hk1ELOU6GQ+k+nhWTP60tvZPlHUwU=;
        b=BwuhXJE27R9sLONf68+AqeYOR3NERG1fzvqOB0TDvzF9M+u4NAem6OhnU7AJTc8ljM
         CoIh0NxN0ZD8fXjs3wJP2k5pBEOdVNW5yFQuwIHj7XmxrI7qDCbWQn39BBLwM0DVKYjq
         vGc7ExLQOnnwkQdgVSZ+xgGCPFHdhXwgpQpKTcb9LY+FJwZfYTjwxFIZKZzpkngzZ6oV
         /jRe+GG1f/+/ya+xpk9zvzfnZkqXhRqcBGDb9q5thWfUPfaK+wORqYKMHAaKGan1g4WK
         t1IJcXZY1KnC2nsoyNhKf680OF2Z9YdwQzvvwC3uNtkjl67WJhctERYkBo4cqURw1/M/
         Fgkg==
X-Gm-Message-State: AOAM531r5p6dpN9OT6lpNc+psLyuMyoGCnprnJghtWEB0SnP4iAauSKY
	wZH+cMc7JSUHFgT5JDcOFh9avVl4c8ydaA==
X-Google-Smtp-Source: ABdhPJzwzYwxx2B+aCf7sWregA6LyuBaKtlJwh9Z2xNEKZEOtMVYPJ+vLdPNz1sFHq2JxdXZMw1xJA==
X-Received: by 2002:a63:6c9:: with SMTP id 192mr301152pgg.302.1616536207472;
        Tue, 23 Mar 2021 14:50:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4578])
        by smtp.gmail.com with ESMTPSA id w79sm165534pfc.87.2021.03.23.14.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:50:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] image-uefi: Set efi_file for rv32/rv64
Date: Tue, 23 Mar 2021 14:50:04 -0700
Message-Id: <20210323215004.1855169-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/image-uefi.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index 882a0e720c..6ef011e23b 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -14,6 +14,8 @@ EFI_ARCH_x86 = "ia32"
 EFI_ARCH_x86-64 = "x64"
 EFI_ARCH_aarch64 = "aa64"
 EFI_ARCH_arm = "arm"
+EFI_ARCH_riscv32 = "riscv32"
+EFI_ARCH_riscv64 = "riscv64"
 
 # Determine name of bootloader image
 EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
-- 
2.31.0

