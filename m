Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.62778.1600096456876645513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=o+yf8IGQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id e7so98544qtj.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T9bwVd+QlhkUkiDHlUEJ3IVtH4D8u8zmVl7bUZqbXtI=;
        b=o+yf8IGQwE8Ia3ibGZWUKguqsHC19iY2l55Kf92vth8VRpkQf6ebmmqJvVglqJ5S6H
         utu1oUZIawAPdnHozN2u8zOYBPIdTjxCH3VgBRq9Ex8jElXOaK4n/FYCfbFZmwns0Vck
         SC6MUXaHH711T7nOBu2RuZbIwtpoXUQQ7baGSx6ATsKspev2yudF5OcniMXbifgCFSxt
         k/YGFtPtv5PYiydz+PNzZVCDJVlU75DJTQ4w1kQ+E9uQaD0AxlPwzStiK6GzkqW37b4p
         CGssykEHjrJtrgVPKz68PCWvIp9/Bcv0QjJqrFR4+t9IdNW8dIR0xsf7kJ1Mkl7FJGgv
         cpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T9bwVd+QlhkUkiDHlUEJ3IVtH4D8u8zmVl7bUZqbXtI=;
        b=CtmN7iCZ+JIQ0rDazhgA0AN5GAQK7mujYmM/gXbvEFo6kPj46y4w39I/kUXu1gCy5w
         fXlsn6BN7kkSVOB25r3tbyoBZy/FrRPZERdQFbq2TA50oZrWNBqNJCs3Xn+dY5p9i+UU
         6UoWs61pGl+jyaoHwCJ80+rymPWdSsu0Kfg6LCdPA37PddhYWp0+hHjuBjMRE14xhsks
         tMF2CGXn2Cnwy4yM8/slaZEnI3bj5f6VZyl9n10Elw3P92m5MPBK0ebfGJgs46HcpWuo
         73VCDVdgKLNdQglBi7bDwJqILkF+AbPUdN6oroogIbfNi8UCI4tLtRGEqTAFS4RH8S3z
         ShZw==
X-Gm-Message-State: AOAM531pRXpFN0afIKWPo8w3URN0HZOW7S5wI+iF/Hslkgu14Wt/qEnB
	bFoHr0mQZ3JVTojO6l7hZhRuUeaVsMV5Nem0
X-Google-Smtp-Source: ABdhPJw5IzhFp+NKzxdtjI2w/zp1RJ8lS/fQgya1ZrDYepVqqevkvxzVVd67QUHRsBBOO/2mtXe0Cw==
X-Received: by 2002:ac8:709:: with SMTP id g9mr1196518qth.310.1600096455792;
        Mon, 14 Sep 2020 08:14:15 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id x126sm14175980qkb.101.2020.09.14.08.14.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:14:15 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] qemuarm64: change tuning
Date: Mon, 14 Sep 2020 11:13:57 -0400
Message-Id: <20200914151359.11240-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch caused the tuning file referenced here to be removed.
Use the new one with the new DEFAULTTUNE.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/qemuarm64.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index fdd464d708be..9367f6ccb8d0 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,8 @@
 #@NAME: QEMU ARMv8 machine
 #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
-require conf/machine/include/tune-cortexa57.inc
+DEFAULTTUNE ?= "cortexa57"
+require conf/machine/include/arm/arch-armv8a.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
2.20.1

