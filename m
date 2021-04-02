Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.11930.1617337761356836938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 21:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CzAO4dXS;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so4087418pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 21:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fC4QDJfu7cTIT7VqvvANpAyfvhI6HgunDxOJ25Bkfpo=;
        b=CzAO4dXSjALcm6aKEyX7ts/wZcTJ6RtiO+EgiwboNxJyT56uoLrjSFE+V1UNOiRo3b
         se2eMLu49B+7XSMn4AIKTVrTaKtdXp726N4Ie9lYaSLZaGBUKBFdBYO2I80oeQowiX6Y
         GeUKTet16TIQ3kVm0VDgSyykJGAO8ks5Dpyymq/C1UzxkXm2hGG+c4jTEGMAFL/9wZI4
         j14qHXlD8oTejtzfJwBAD0wQ9smB13yC31ygmB++KEA+LScOf29cCrJmmJjIYXrTDbuV
         2GCOIdQ/bpjhbzizgVKrSdyHwoRTybnF1l/e5iJ8hOZeeu3ZN6fkEl3M4HRbmpPCAEbn
         BFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fC4QDJfu7cTIT7VqvvANpAyfvhI6HgunDxOJ25Bkfpo=;
        b=TInoPPTQCoxlSLzPm5bHm4n1kdgDFqo/yhE5kyAriuUw63FLPa4aU/MzjGYyR4dozE
         n/KLx2zT3eW1k55McgddhB+UIR9RysLfPGF/KkI0N5DmbYclfj5MAVagoLhFze/Sqb+M
         STMel7P/YQ2/sCRBj2onWSxpNkouk7W/DVZrFQLnTDoWHZP9G7ApeJM3ls/SJRLhdxql
         85lkd06smuJB4NK2eGVBqubnuSz0cWRMWtPzZ4N69YrLsxQmXBTcexbZ35zWLwMdoMfw
         apC4OA9BdpT0OMef0opzR/UbvRmwYs1vMp2sMiD4Et9Fw4CwgcJY4Da2DU/xJ1BCQ5Wd
         YziQ==
X-Gm-Message-State: AOAM5317r7JuJJRVUPSAoqNNhoTO4nYROcX8N0nwFPbZ9x1Yoc8hhY35
	sxY1ZeErJlVtWpNnB001qWc7YsivVAgSQQ==
X-Google-Smtp-Source: ABdhPJxFxG/Hp9Inm7e2BUPsnL61pZDn4Vu53O96rgETpW27lYxPcLVgLcDr0xrfvcLcjb2I+duOhg==
X-Received: by 2002:a17:90a:9d82:: with SMTP id k2mr11836776pjp.48.1617337760518;
        Thu, 01 Apr 2021 21:29:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id o13sm6846261pfp.26.2021.04.01.21.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 21:29:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] conf/machine: Enable keyboard and mouse on RISC-V machines
Date: Thu,  1 Apr 2021 21:29:18 -0700
Message-Id: <20210402042918.1736747-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 493124d946..428d28bde1 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -35,3 +35,4 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
 QB_GRAPHICS = "-device bochs-display"
+QB_OPT_APPEND = "-device virtio-mouse-pci -device virtio-keyboard-pci"
-- 
2.31.1

