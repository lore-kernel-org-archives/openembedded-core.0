Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.39929.1597656788960983074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 02:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gQffouBi;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id v4so16749408ljd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 02:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tb66oOAs9+hgPRscE8b2VNtrkSLBhMORPLfY1T7VYEc=;
        b=gQffouBi6P03NTZsnHl9OFlbLZjWsUSKQlzwoQIRXRBNzruPaheb+MxYdlMvn3AGdM
         9Tkx+T7lG8VzvpP2EPImlRvXfhUGe0IodIq9vPeO+K/zXj/PsXivTxFfmWtwi0ox176v
         v0sAloBDSA8gr7KbhLQ1wNfjSt8xniw8V610sQKrT3urKuKt8SLR09pm+eYCrigcD32j
         mRnkZoI43jJwax+Wl0wKTRTui54G0EZQUF5JQc3BJElpb9uY5YbSsS0NjFSHpV9YGxlx
         7qQPtzUJXSmRCWvs3OeUGLbr6jLjxvmi8gfmKaBlxr9lBgYCzcvTh8nxGDNJnRs38wSP
         98sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tb66oOAs9+hgPRscE8b2VNtrkSLBhMORPLfY1T7VYEc=;
        b=nbof6gChC5EbBhS2S/YxmBAJZBkFEaP3QJFsddlH66Xy0usrHiunvULQTSV/b3TuqR
         QOEA0K/7pmwBdz4hEpqHi9eiyHuN5+3AT3vcY2UxetOncxmd9Hooe21HkKfPfjhOvnEW
         I3y9IB3BA5wa8buHLORoCBT6w2mTWp3TbBJpxvzNJxL2hwAshYUzMnQbZx8T5D7vNPok
         yyeDG8090Dxw9PhiEm5/A1cwUhLcIvpvFUpiQnSF3oSMiKt5Iit8HoYweOi3/9qkrYgr
         ybNC5XkWH07IpR9uSNuufSPORPQsn3d3IdhHTltHagX4A48Sbf11eSIrVYOFI3PrqvmN
         A2nw==
X-Gm-Message-State: AOAM533BLIySSJdHf/EMIhxK1lWHV62ottY0ftvl5qTxX9E+do4jfNP0
	VfBKe/NPbZu2leAdL+3w5wxX617gcIV2Rg==
X-Google-Smtp-Source: ABdhPJz2h6FAShxA3/Gbft6pypMxziVYTj3PVAPWZJKloBH8DlQawxv1BJvuaHKlbhxPCF7AruD4Jw==
X-Received: by 2002:a2e:a555:: with SMTP id e21mr7341989ljn.304.1597656787157;
        Mon, 17 Aug 2020 02:33:07 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u20sm4980097ljd.135.2020.08.17.02.33.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:33:06 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V4 1/3] conf/machine: set UBOOT_MACHINE for qemumips and qemumips64
Date: Mon, 17 Aug 2020 11:32:54 +0200
Message-Id: <20200817093256.21644-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817093256.21644-1-liu.ming50@gmail.com>
References: <20200817093256.21644-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

These machines support booting U-Boot, so set the machine appropriately.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
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

