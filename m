Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.140034.1598036540921388001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 12:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r6qbVORk;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id 62so2298037qkj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Bdamsl/66f/Psx1NdNqR24/Q3lNcm3YoBMBg1XIChY=;
        b=r6qbVORkgN0GkoIS1Ajr0JiF5TgKdqRwCM4UAT7dOKD8m4pwyCbWgwV++r1Fw3bLwM
         tF5IDluX5DbiTcNAYNvjJq2afDMfsC9JsZIahsc+9O9FGZV2yqGgVu6Fj3wH/kdY9sxx
         HEzXfn1Bq1ydac0HmVMlpv274gL57odVPPzDmn0EH0Fr3bbXt900CdLqzWxsPv1AWAHH
         U32NBRkcVBIsgx98HPcArP2Xz/jl6XAgJzsCoL7q8tTHWuHo+28+ApGseL7+dzmVuMre
         prGUkyPiRlR10kFtWYNiwh874PLlOVYj0m9g/6nH7Ae6mv46u41TflyMyzV+ny1MvEm8
         9Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Bdamsl/66f/Psx1NdNqR24/Q3lNcm3YoBMBg1XIChY=;
        b=HlOlEWXXA3QKrDZBlZ3A9sUH5Dv45+30r1JHEQ14dCGcfop5a+1MH+vPGexyRonhb4
         EpRkMca18k69pyPOh+oCMQYoMs+dfzp4VvpCm0M+EFc/+6qq5vu8kPijYW8EZxuOebKu
         GICUr+0H6nh4md8J7bESPqxk+sDCl+g5snZMcNg9aq/shRnDbAZZbVfEl5M0paA3Ts0S
         2ZhI3w4sTdSM4wpiI00kvBLJaoSaDhFR2yMB2rL+LAMqwVqFr8ctW8nwF8DsLteeySPi
         rbr23ZljbCz+enSy8PUchuonFKmaa+eEL/sJ38XGYtzkMXlnYA2nJpcd8SPHYZWVlVvJ
         wvGA==
X-Gm-Message-State: AOAM532HwxNYeSG7JYSCcYPgAGb3PGB2OLK5ar4f0TYgf5X1ZVnkpGFA
	mRpOSQ5xz4Ugt6aqjQyO0JRnRmnLrjp4gSOd
X-Google-Smtp-Source: ABdhPJwLbvao03Eu9pEzVSN5M3SJTYr3hzKumSp4mFWdgC23bvWcnqPegeYhUEp+vPDoffeoouPusA==
X-Received: by 2002:a05:620a:1436:: with SMTP id k22mr2086503qkj.320.1598036539960;
        Fri, 21 Aug 2020 12:02:19 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id e61sm2852845qtd.20.2020.08.21.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 12:02:19 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] qemu: bump default reference kernel to v5.8
Date: Fri, 21 Aug 2020 15:02:14 -0400
Message-Id: <7f28dd60f16faf52c5623627031986862d898902.1598036283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598036283.git.bruce.ashfield@gmail.com>
References: <cover.1598036283.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Now that the 5.8 recipes are available, we bump the default versions
to use them.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index a72714711d..a3169b7405 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.4%"
+PREFERRED_VERSION_linux-yocto ??= "5.8%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 6940efe46f..48e83f13e1 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -16,7 +16,7 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "5.4%"
+PREFERRED_VERSION_linux-yocto ??= "5.8%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE_qemuarmv5 = "qemuarm"
-- 
2.19.1

