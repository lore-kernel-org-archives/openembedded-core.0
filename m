Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.576.1598464145382811241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 10:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AQHNxJZ3;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id o4so2724087wrn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 10:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2k4NF7VUYT6onDcXb+2Pr2JvAF4/Ml7oRkxN9RB8Ag=;
        b=AQHNxJZ3v/v78uzpivJalb1R991pnHx9SO35+Czde5VF93YTrYKt8J2Fmn0SU/9/Ei
         M0/R07fLRlLJ9+Jb9JEIqK+9TXlDgtSRk6xN0f0FBlXv8Turtlnas6/CxP64Q0Q1wHgp
         m4zRnkpUI+sgzsa2OMEtCT4bSxK+3rBCDbAI6nm6RdwFROiFzTwVix8wUy6i7MAidwPh
         STcUPXydQ8U3gabscKhfrcogXz1E7ab1XUuLVPKNs4XtKAl+YGC6ACR7xJj679MDLK7k
         oCQrouaO21TalsJaQR5zt4VVYFbx2kg3SQgK0LE990+prEoCvfHLJ0ktVL54Q/Cx2l6l
         hkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2k4NF7VUYT6onDcXb+2Pr2JvAF4/Ml7oRkxN9RB8Ag=;
        b=ca0BLQ8prAiJLZb8pFJEN1Ox7GHbCd+Hj0lVtyzFUWpVT7Mv2Vh+PDhGSAgt9RvNRY
         BAiThcht9xWbmlPGVtPYkUN/awncfLaWaasU5OdQiIzUOguFlDQW6PnJr3UikrwcT9+m
         MVqmbiFZ/xtBXVQK6jH3w1tZTa2ulBXBRFTayvTyqsLS6BEjumH9qvrnwkyDhUZnuJe+
         P7RLhjlepRvwKBBOPxXDch8e9R6+ln5IvVIg8BRSWwBai53QJ18zHjmJ81U5zs1ZsFOi
         UtyWR9DHePIchNB0tGrUUuAC5KupdhJebG6sC4VI0qYI1c2GWyPKby++ytIX9RgPK8bO
         KQQw==
X-Gm-Message-State: AOAM530ggse7HwNITN34PUNgXS0v5qoc4OPZdVtQyJVQ4dsnjD4Tv0BY
	2vFiiIOVVo4DTERS7ObHI3Y2wp3U39q7pg==
X-Google-Smtp-Source: ABdhPJygG7wA+8FDXLPzoOWT2weGzxAAxo8O5crW1KrY475u7BTPf7I//JyOglek41nPbLDG3gk3VQ==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr17116826wrt.191.1598464143483;
        Wed, 26 Aug 2020 10:49:03 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u17sm9168529wrp.81.2020.08.26.10.49.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 10:49:03 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	anuj.mittal@intel.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [dunfell] [PATCH V2 1/4] conf/machine: set UBOOT_MACHINE for qemumips and qemumips64
Date: Wed, 26 Aug 2020 19:48:50 +0200
Message-Id: <20200826174853.8838-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826174853.8838-1-liu.ming50@gmail.com>
References: <20200826174853.8838-1-liu.ming50@gmail.com>
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

