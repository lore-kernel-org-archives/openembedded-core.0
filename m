Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.17615.1590940412638917394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XjYrNt9Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id g9so5414220edr.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vKQZbJWTVN4UUT3I/GaPSxwK7Pwyk1OtogEoN20tV6M=;
        b=XjYrNt9QUm3briFYUJWNIXA1hDcD/n3lyefOLc1nArO8eyEqYLMhaGn0kY4SA86ktl
         irOc9nc4RwSR+I1M2oo/+7lwGAMobYTPxdxHoy8NSW/HL18TrJ+TN8mSo9B4cmc1lOa9
         3+L+kLntBKb8GFLOq1Af867f9QlStClsrkQ25IMosbohh+aAAPubifGXvOQibC29mKkt
         Nnn5XJBOe9+TtO1BiCuMSaDYUi3x40Qynt2Kf3k6vUDyFjze4ij2bHKHfnJFQPaiLpVR
         A8ZZWdpgiV/i0KBwqy5H1O0TD2LMw1CZP/54IaUeK8IxpQAp8/Ny/FKY9Gfk3ARLKhTV
         rB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vKQZbJWTVN4UUT3I/GaPSxwK7Pwyk1OtogEoN20tV6M=;
        b=XhpkiCQo0a48dVIt3rAxUZnhXPQ9IP4syjVNYSNJdJ234dNUT220Dbj53iVmU/QWhe
         bqqoCZAJZ1tnfZvitwvfxXoLWvqdfHKO3Xg14owO3P0EKzzr3DFUDmK9POTPO/ZHB0/n
         kJ/Gud8v4PwwfU3QJphLv8LIkVrx4F+ESO1poFqV1R1y1nxXPA74UEf2gsYsq32rOSAQ
         V1/SovYG+GS7bOIr5oSt688AuemeGguWxZR8iziNtywOFvKJvw0w+P4X+wkyjZcbIl6J
         fKi/ZZwPgstP8B/Tfm+yI2FdVl3fHlNHUz5phSc6KONk/Zmp7M3IgQE1GA9gJBEa2K4N
         Ex7A==
X-Gm-Message-State: AOAM532GuuMDygQr2YzIO14gEJ17HuQgswSiblOTcdeGcOQ2te2qKx9W
	U7YH78l+t3jzZTxk0hH6vBFquXm8
X-Google-Smtp-Source: ABdhPJy0ENdxL0K378Aq/PFU7XGEwa7CVwurQjjGRFwoKE6oTK55WuA58OfnZcuPAdLWBcwUF3C+Gw==
X-Received: by 2002:a05:6402:362:: with SMTP id s2mr1067453edw.337.1590940411048;
        Sun, 31 May 2020 08:53:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/70] createrepo-c: upgrade 0.15.7 -> 0.15.10
Date: Sun, 31 May 2020 17:51:48 +0200
Message-Id: <20200531155254.10283-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.15.7.bb => createrepo-c_0.15.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.15.7.bb => createrepo-c_0.15.10.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.10.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.15.10.bb
index c6a53ffece..13bfa21091 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.10.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "4ab6b56b8b718396386982afba4ade297c14d91a"
+SRCREV = "9f3f3be6359d8f9b6b269e28d9ae1f279cc5f3aa"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

