Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31670.1793141383404227495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 15:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h8X11U7A;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49ddddefadbso186185fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141382; x=1793746182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCDQnNDI3a2nbYfBkQMM38pAkt4zcIW62FFBDBOz91U=;
        b=h8X11U7A+2sz8es4z/pI4GCMp3dXAboJak/4RprTJ5VQd8fw/pNasl3AOByprgjkrA
         1aX8veCUq4xOKoBlLlW4EQ4+EqDFf1060CKsZvjNSZkfGERKP6GcKnSOgxG0QpQ40iQE
         NvBj0p2wW15hqOz01URzGvCg4geiuJuYfGrqyVpUC+lckM2Pcbz21Rgdei9mMIzTphq5
         jl67GCrWuX43lCVZ54MlCq71qwOZVl8MFKbkRyyiquWKNgosLoCy/EJh9C2uWa26mwDs
         cLBFXBWnrFWhqOIoC05pjazuWs31cPUQXkCyKOJVRakar9G9BSMMTcs0Igx8DxOKEl7y
         8aHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141382; x=1793746182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCDQnNDI3a2nbYfBkQMM38pAkt4zcIW62FFBDBOz91U=;
        b=gxIURbs0Vq9LB4ogRzLA+S8SAIP6E1fRZYPLH3TveqWwhLQXVGQSX8OmWhGr4hTCFN
         rolbvhfDRTnmqhhLpPIPJPVUK9kxsVIVmLbf/CR5/Q17xZyLSPuf4xn0MczfKRoq1kKk
         Oyj4HxyjEH2DNIXJAXGKHHa/izkmwdOa1Eve7fC98iNwfboxRkKgvmIxtaUFT8Tvvg8s
         HjfiCupRmIhOInPoFCabdQ7V2Sopkki23cTFV/z2I4VHnHIFqw71uD6sScWmRcP5gDHb
         nN35R8t4ztbZ6+2bxnGf24++S5mGdShSeYP/n5Lx0wZn0UEGSVtj/nGWyfKKfW9/r/6C
         /r6A==
X-Gm-Message-State: AFq9FYI237lIep03MhLjMP7jhWbYI3CrjsNeQwPwwhlV/BOwDY8b5HMH
	P0zeYXifFPhoUuXlB7ucs89UKFICz40xzbJeyOBMst2tunYc/Q2qTV6ZPv44jg==
X-Gm-Gg: AYBFou1cHvapIZfYKv4IWg+8beivBWwHbRw8QY8RzOORMZkA4n0SmYxZzSWHiFoxbHK
	MmgNr1rIMqWGpENwGQaJYdvU+vcdv+93eGLRcbxjVjC78AD5PSStWzta6z41HrBRb3DQd9n+QeI
	0fvoYCU3l5vctoygnHmGhDD+5FzO4LXQxw/6+inZ9+tXy8oGEvFGINMl9tgMYtdp5QDqw3AdFg4
	XRXqSFBKa7KSrdPrvdunqJ7UhqjSTJoYVrI4YQ/qoDC8HJIkWT1JgRLGUj5yXURcKioNQ/QJHnK
	AQk6UXVGSVvXF73fUjjVoF51Xks744OgS8OQBCGvbbOv1kZYUDdEPX9wJruOHHUspRuUrkIqIZG
	wQoXN15kJAiX7uk+5YNUvpkwmcd5bDHyfy2RuGVYUPpzPrTOAwg02/ptA1QcLRzLYoT/Kw+z50c
	3aou9EUwpR7ePixdw/L7AtX6ny+yL11fRK7Z6jl8q1VHSnjqRkohDD2VMNXPM/KZ7LWd4cj95O+
	ptQopDTgFUCK4/ofrPmxVDMZwt1kddvX1aMzLP7escOJQiSIBmouQ==
X-Received: by 2002:a05:6870:1698:b0:48f:e107:3188 with SMTP id 586e51a60fabf-4a8bb581206mr762763fac.40.1793141382527;
        Tue, 27 Oct 2026 15:49:42 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b7979514sm1111037fac.17.2026.10.27.15.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:49:42 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 7/7] layer.conf: Fix initramfs-framework not knowing which udev it has
Date: Tue, 27 Oct 2026 16:47:21 -0600
Message-ID: <20261027224931.385138-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261027224931.385138-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248771
Content-Type: text/plain; charset="utf-8"

The SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS from initramfs-framework to eudev
and systemd meant that it would not correctly update when switching udev
providers (for example, when switching from the "poky" distro to
"poky-altcfg" distro). Fix this by removing both entries.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 13c920be6c..b55d50c60c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -59,8 +59,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   docbook-xsl-stylesheets->perl \
   ca-certificates->openssl \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
-  initramfs-framework->eudev \
-  initramfs-framework->systemd \
   initramfs-module-install-efi->dosfstools \
   initramfs-module-install-efi->e2fsprogs \
   initramfs-module-install-efi->parted \
-- 
2.56.0

