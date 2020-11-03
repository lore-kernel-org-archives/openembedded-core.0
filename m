Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.6231.1604419515646395291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HiX8V17G;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id c5so11954955qtw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K4lhaEdQqTzcqp+GxJJGw08q1jiHdrIF/T9Dy3siDYM=;
        b=HiX8V17GJqRnEDMvzVyEqr7EcIrfE24P4+H9Pjl3bqMKPMkSQQolCRBo9DQqgdSelc
         kz+2RIjz23H/q8/CBoFwvmT5MRrpgE8Hx+kgRY7rQiiVosvi/LawWNuZ/LTht4LvPm+5
         BJ0XGs4KtUbjS32hYxPnOHeIbIyKrFUz+3oH6gp+n0rxi6DpuN5LTwxVqxxx5og6Bvmp
         qitOuQnOPCawamJfi5Pjd323C/oKKvyawNzJjpVU5AEQ/Ws8zLDBSfcLFV+4SG0TB5Cn
         FNkV2oYqisfXgri+Jyu4ojdTm2FxsheyOi5NTDIJLNL/zRxyb75H47vCTP3C22VIop4F
         uXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4lhaEdQqTzcqp+GxJJGw08q1jiHdrIF/T9Dy3siDYM=;
        b=oD7Tzpas071gtyakgIVzxZuAPnQV9ktH/BmPXnSm8aZH/qdWRLHIEqpN9z1r2Ti8Rz
         VO4icrjaUZnoKfXuCyVZaq1jP2u7w4+cfHQnLIUAAKwETrkgc2Md7USuG/WRMhF2W+X0
         oJ4NitM2Qhdb1KXQIEe8JrNc70Tl/3jyk50dRmHGWt/Izq/ZbwWEHRgydH3F8s7V4cPx
         2RKOvb1FooH7ouZLvV66c8S//siQ8NqhrpOEJrFBUKRb2Ar/vDDJtwljvOaOcvtkDj5J
         ErPqcUop3t3tmwp8aQccviFLiiU8M6Hbp1IU+Uom5rGCuoEisrYj4sp1C8pXjmVGiaTm
         2PPA==
X-Gm-Message-State: AOAM531N5SjNxKRo5aqh7mkyWaGwJQTpoHdUhYnZI9hd3sU21kVslBvT
	MpchuF4wkq/cp0QYh86DmVo=
X-Google-Smtp-Source: ABdhPJzV0ljuGeUPununuryBESrlIU7gdatRGxR/GGpUYDUdGaVMJfCa+zQ0gRN0wxijs2smV1V5Yg==
X-Received: by 2002:aed:3b2a:: with SMTP id p39mr18951095qte.211.1604419514790;
        Tue, 03 Nov 2020 08:05:14 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u5sm10454809qtg.57.2020.11.03.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:05:13 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto-dev: move to v5.10-rc
Date: Tue,  3 Nov 2020 11:04:55 -0500
Message-Id: <db31a11868ace53f743c5545afd8ca46940476e8.1604415988.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1604415988.git.bruce.ashfield@gmail.com>
References: <cover.1604415988.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index fbc62f29c8..6272af6253 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.9-rc+"
+LINUX_VERSION ?= "5.10-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

