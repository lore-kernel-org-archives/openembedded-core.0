Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.37083.1598811524700861109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LK2uYPWt;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id q14so4726037ilm.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=y46UmISm3GqjmkaV1ZFYBv+eeiBHq5Yn6JoNX+keeOU=;
        b=LK2uYPWtkbIO2PmS0oSKxO3p8uRwH3Z4tKIymVNDQY8mu8Z47bb11gRfaY1Yyoz5aZ
         C1egpDhYqIZhJjRNmkYURk70bySn2gkPndc1jQqmdCbRWDjeD7cz5uN0hap2qk/gPKM1
         FhDHYQvkWv0XOgGFaF8YVZB1splm4lib5B/I5WpsSlo+es1sHmhxHTZ6LrBjHRO0y/QA
         agY25cDxQo379dab+LyaUu7j6FlZZZTFoNkESjW2/5Hltlg8JXJ7gLnyosAaxbZ35kZw
         r3AuSO6rAMSaFZXplfEzAOYaOan+otL4FuF364E0OEnSY4MXnskNOO5fLJUKCESDSpXw
         MVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=y46UmISm3GqjmkaV1ZFYBv+eeiBHq5Yn6JoNX+keeOU=;
        b=qYKtN03P1AeUAdfolzaQFCE4RMwKNewFknJ4Jm4mcQJS/k620XGQrzlydv1MGZ2T0g
         3eEBK8Ua8762Ynr+WrCkkuX8Y27uHgVbSqhrtecFZoODPQaEX7B7Xrr/Yn2ZY5fbzfpC
         UtULzKnIcY8QwQNLG1Ue8QOgjnsWDXlxkjPqzk76odz8dpfHA5p+yz7IJgdPrcXKZUL9
         lCTjBQWw4ckprogjSxbkBG9iLQ1rh/ppD7KkflPAfJP6jXHimlgsstwQudBlYQkqtxvM
         L8GVq9DpLX3RzGSMycLiJ78eU9C1ncST945t0I88TPTLKanG9CflUHJK1vBf/aCD2S0i
         C3wA==
X-Gm-Message-State: AOAM5323td4Um9t2kToZtiOfX2KpiF8r/sFNh+54C6i9HehMmfUhMEGV
	y1icnRmVpQmHatFHuTayt6cRsN1QoCqO4QgGcRo=
X-Google-Smtp-Source: ABdhPJx5xAiwoL/BiY6DpV0aU6yXBKeKTXBaviRzWaPJfWyFT0ObpW6lkhy5lAOF/pvq0D4OYswNsQ==
X-Received: by 2002:a92:8b51:: with SMTP id i78mr6019652ild.179.1598811523662;
        Sun, 30 Aug 2020 11:18:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/25] conf/machine: set UBOOT_MACHINE for qemumips and qemumips64
Date: Sun, 30 Aug 2020 08:16:09 -1000
Message-Id: <a7d4922b627e18adc848fd43e4e8169dd11b2a9a.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Ming Liu <liu.ming50@gmail.com>

These machines support booting U-Boot, so set the machine appropriately.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b812fad85aed6cb9e433c689f3b14425488dfc68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/qemumips.conf   | 2 ++
 meta/conf/machine/qemumips64.conf | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 4617c3c7b6..1373e4cba0 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -9,6 +9,8 @@ require conf/machine/include/qemuboot-mips.inc
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
+UBOOT_MACHINE ?= "qemu_mips_defconfig"
+
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 6d5174665f..1e77486491 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -11,6 +11,8 @@ QB_CPU = "-cpu MIPS64R2-generic"
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
+UBOOT_MACHINE ?= "qemu_mips64_defconfig"
+
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips64"
-- 
2.17.1

