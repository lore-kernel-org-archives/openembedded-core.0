Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.33057.1585212876209296748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/zyiJqL;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m11so783878wrx.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rjc1q54wYDyGPF6ppxy8yzJ9zO6iXV0k9YnoQByiGg0=;
        b=C/zyiJqL9VYZz7N/M5PH7uGAYvB9nEhQMzut2iPP3OC1r/dxi8hp0VhS4sFSCqLRvp
         m8v42WPxu4//EcEzgudCLqdk3gCL0B1WAW4r5LYER95XIZuwM1RiANNbpvvH3lpXJBiI
         kfmdk2sWiGWxo0oW2rnx/rkWFF0oA1HiGJCCmertOzCgGUAixPMTc/n2C/0dvdqQjWuX
         3aXgzXDimBqZuair7FowXAlO7Zwjlo6fKodvjfq17gLrOp/f3qtNPI6qw1hvxbJexPSq
         2kSLmNm+F9ZpkNJ8Uqqh3/3RtLepLLSiAQxWgxR3ArGDIJ7sGuiIAOGt3osS4TTyV/LT
         SbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rjc1q54wYDyGPF6ppxy8yzJ9zO6iXV0k9YnoQByiGg0=;
        b=IquBiaKPRX4k01xJeuJ/0mj9HzgEjKVPbe/O9JheH2EaP2JL22+SoKE2nA2w+mKcQ1
         oFzJYbonvJjkHonvHIj3Gr4Aq7R90dPQpVppCZBnJyfadgKBg9oxlx6ffLzON3pjQhLK
         xjijboLcdmY6kXD+cgY6LD5oXjXLb7AWVzMse7ovjwDSl7E9Kh/SUgc6/ARiOhppHYk7
         r2uzbDiTUJ7aT2qPxxD6rK1/EkO4cocC4P9KQvnQEoRiGxR9VHyVTsiNiWF9jD1l+Jg5
         LFhxaeGbSNuS8ILdnMtc1knflInPHpYJmcOLYcSgs3Na8oH+s3xafkgJ0GvepBkiPf+J
         YCrA==
X-Gm-Message-State: ANhLgQ1zemijrBnQcGxKm0z0qCAaVZIwh+Kw8v2HDzj71JH+30VJTaFE
	+ONHwB+PI2+L2w0H2VOTTrD08OIh
X-Google-Smtp-Source: ADFU+vtr64maLy+0Qnj9dykG2EzdZATQHGENIh8eHGTlleQ1WZf8OE9bXMPXVpaBrKlKqrLVFkR7Cg==
X-Received: by 2002:adf:82a6:: with SMTP id 35mr8114884wrc.307.1585212874559;
        Thu, 26 Mar 2020 01:54:34 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:34 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 05/13] systemd: Add sch-fq-codel to RRECOMMENDS
Date: Thu, 26 Mar 2020 08:54:18 +0000
Message-Id: <20200326085426.117209-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

systemd sets net.core.default_qdisc = fq_codel, include
kernel-module-sch-fq-codel in RRECOMMENDS to satify this

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 4ee20f85c21f..bb75aa0b9b2b 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -567,7 +567,7 @@ RDEPENDS_${PN} += "volatile-binds update-rc.d"
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
                       e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \
                       systemd-conf \
 "
-- 
2.17.1

