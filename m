Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.155959.1598109737248653705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 08:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhfzZMiF;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id r2so4555829wrs.8
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2k4NF7VUYT6onDcXb+2Pr2JvAF4/Ml7oRkxN9RB8Ag=;
        b=jhfzZMiFMyS9eo0ul+8KlyzbOz36x4pNgkRk5W1onAzZzv+a5d74Wamab346FKe6JE
         8PcpOq8oQMKDSlB66GtsA2eEJXM++nfcAKDhZX7NcJbq9MgrP9TaKrVG827jXWjBMuDP
         1dPg82BTdQainHlxHRfbSEYmjGU3VaXCxIQ69NRsnzeqE21fTM1N5Toh8At2Tw2qc+ne
         0f8xm/SNJCmXWPmgNW3oL7Wt3VWO93UrXQoR/uKUToDsfwFriWIuqPb79ii1Ru0zurka
         dVOye8V4cwMxMdAKYhUi13T2t6UPwUtJJ/tM80Ss3DHjuv+whdhw152dIc9eX80my4uW
         sm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2k4NF7VUYT6onDcXb+2Pr2JvAF4/Ml7oRkxN9RB8Ag=;
        b=B+7pj81JvHuahcTonO53/uFqlfW3T4Qhs33Z6xFbq71+NdTEo5EmqyBEe+6Bkktu2Y
         f+cOUy//MPeLLhf7ENKcKZQbV3NQr6c9PlMoliemf3ONsbv5b3j2nf3ro/wcJDyvXl6P
         1LqOSZh5dsdTJl4zt7tZbPSLG1HyyYSzqp0A3qenWuB/uwQO/+EW8N1IfklSEyMRGu9N
         h1OKxX0dGWYHh8bE6TXlDbqRjxak3SaZmF9kAiSeablLpNJHRMwp0BiIRopTqfawc2lW
         RGW95FZ92VOFxRuXQUh10RDAnf6AcBKm6UNwYh4HCW3oWFcYyuu+2e5AlG1+ZenX1ODZ
         XR0A==
X-Gm-Message-State: AOAM531/gFTrR0F5Rc/btx+aGHo0MdMM9BHC+f+cRd76lNnKGbPjCy2o
	ICmEG0/waEt0a0OCdFP6FZT9XS54FHBCjQ==
X-Google-Smtp-Source: ABdhPJwxX5n2IefVrtNJ2gajXLZj16/HWPgijnXa8u69SkB1Ox8FXha2LEmGAJkph2pYc2LNvsIEpw==
X-Received: by 2002:adf:c386:: with SMTP id p6mr7355354wrf.344.1598109735576;
        Sat, 22 Aug 2020 08:22:15 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id c145sm12110018wmd.7.2020.08.22.08.22.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2020 08:22:15 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [PATCH] [dunfell 1/3] conf/machine: set UBOOT_MACHINE for qemumips and qemumips64
Date: Sat, 22 Aug 2020 17:22:05 +0200
Message-Id: <20200822152207.32161-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200822152207.32161-1-liu.ming50@gmail.com>
References: <20200822152207.32161-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

These machines support booting U-Boot, so set the machine appropriately.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b812fad85aed6cb9e433c689f3b14425488dfc68)
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
2.28.0

