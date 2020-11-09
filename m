Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.4628.1604881295512885879
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:21:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GSY0RcWq;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id x13so5360740pgp.7
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sFMkV9GA7rneVQ1fLWYePRyDkO1xgvnk8PnN5PCaAec=;
        b=GSY0RcWq//ASUQcxVd4M2pcImx7PEgpKFOYXvi3XRPGj+JAfDGQJ6Gz/y8cUFZiwps
         AxK9iJeZyX6GcVXKrThzsh2cbPW5FKB2zoWEXYJzhioHgt2Cmfe+P19/TJQKgYjgjJ63
         cQbPfuRz1DOfZ/wS89UaAvgfYQhi2Nbkx7QyoPmls50K5yVOFju4bu+3YOGoBKFYJ+VF
         X6X/qnLmq+qCkvqFB+kMqjN71aPav2/YehSSILdXY7dlRYNcLPPpNRpveV808W7VfsFQ
         GW+FHYGZ8If6Kw6X34+KWip534bLG7AAxV8iaqthEE8eOQySCu/ykCgxVF4hWTDOxvEX
         y+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sFMkV9GA7rneVQ1fLWYePRyDkO1xgvnk8PnN5PCaAec=;
        b=fEswhbHuwAyXNGSpRb1DvoFZvQjJr/wxy9geifSNZinyRQsPlxY2kABb/hqKtVS4pN
         mJJQKaSzCpV+7ZTIPDERXiUfLcvdG3iLs0HF4uCsq1ty8mMG5YZ39CH4YZJQKLCy70/4
         hy2EAds8CCBh3lPDRDt+8viGrSxVj3fWuXRaiNb42MZ8SfKXkR4+qJCkUSdJijykEV1Q
         MSc9WErtFbmO8Ty/a6lBk6iMJUVx85ok4jJoJ3Oq760DH6IvIqPpBMFTsctYEu0GQ+DR
         3D8It6Rsx7uZQzULv3XJB4A2ahx0x8459QCzfzdkZIk6bq1+hPeKkmwdGRXpu1Ix+Os4
         LDhA==
X-Gm-Message-State: AOAM530W3tCAriY6HmM45ymzEhiCb+QWsVl5IqqSltj1i2PCXveq/ld7
	hhgiSXt7HTLLwIMIZDwPAOWXLS5VJaBR1Q==
X-Google-Smtp-Source: ABdhPJxbXERT18AclaBhLcDWsIgMNyV9dwmrrsEY26X2jBWGbBQgHaa8tciYSJ1KGTXU/XkRVRpYtA==
X-Received: by 2002:a63:5a07:: with SMTP id o7mr10459493pgb.77.1604881294657;
        Sun, 08 Nov 2020 16:21:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id p15sm9247107pjv.44.2020.11.08.16.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:21:33 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Sun,  8 Nov 2020 16:21:30 -0800
Message-Id: <20201109002130.3176144-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix erroneous pthread_cond_wait mutex waiter count logic due to typo

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=27b2fc9d6db956359727a66c262f1e69995660aa..d91a6cf6e369a79587c5665fce9635e5634ca201

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index dcd7a389b2..23c2072ea3 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "27b2fc9d6db956359727a66c262f1e69995660aa"
+SRCREV = "d91a6cf6e369a79587c5665fce9635e5634ca201"
 
 BASEVER = "1.2.1"
 
-- 
2.29.2

