Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.24772.1595191766129396715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2020 13:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ckCM/qzx;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id s26so8024876pfm.4
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2020 13:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=f/iVarY0Va86UK0aCiYcsuErb9vXhUuvbLB6WdPXquo=;
        b=ckCM/qzxQCY5RXVqxPFSlJ6egqn77F0KAb9QdFFnbTn1S/4U5Cz06fnv1h5ZJY3KFg
         LT4ICryzxdpJOTMtT2g1RC/pJti4nCJ+xzSI8B2Hay3nrAaLtDV+l5maSfEKAS3FPofP
         +heanvLsPQO42c9ZALu1rvSMGPyvAyAOs0l/D1XwTgKcmU/Osnvb6m2p1VlNsPaRHGY+
         67d+Fav7BuBOkMPT0MaB0b30dA7o7CDFVqFloNbh5F5AwRnHmt7pc0tMWtIk5pP/3Dqn
         FQdYzYR9yIWAnRjWY9jjYgRnerhDoqiUNg5q3I+Lz9RZeL/eAWdHdNKQQGYL768Bk7cc
         S+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=f/iVarY0Va86UK0aCiYcsuErb9vXhUuvbLB6WdPXquo=;
        b=mtjCv1SLslV8ayEOmEZ8uCk9M99WEIt8k+OBVe8i+kb9d06OViGqzFIOyou5TEeVoS
         hAoIsPRDTazgFxLmKNw3hLIIGbR+LcyJCJ1Kk6cwPSuyBMWiAM+TVuPS+w8b7OuOKuqT
         05xB2lv9jlBqyYngdzeHEmTkcT1mBHHGl46/gBhXIMSZiLqf3JRbV76CC0KnO0pZMQ+1
         uTfEI+K9eVinnXuEvx4Nq1zL/j6frMsxTlN5JTGh5K3i/gfA9WWlG5ksqP8ZiMpGXYED
         xTsZkq7Pv2ZsPUGPi2bYwdmS4xoDIdBBDQf8ACYANLeI0pT9bbRujiy+eVWdJy+SFWt+
         chvw==
X-Gm-Message-State: AOAM531RVdO4BYptoScBTcsc8LI2CQfr5wB0ONzFeEpo101UjHk6mR79
	+pdEzyIt8UGySRsRhE7MAp3DrFW0jYs=
X-Google-Smtp-Source: ABdhPJxQvKceF6RiN9T9h0u/Q6nel/YUOwncQ1vlYTvIIpMSvUs470tL7PpJ+OhEiRamFXSMkTzFxg==
X-Received: by 2002:a63:bf04:: with SMTP id v4mr16964897pgf.212.1595191765361;
        Sun, 19 Jul 2020 13:49:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8d90:30de:6ec9:116a])
        by smtp.gmail.com with ESMTPSA id ng12sm9664275pjb.15.2020.07.19.13.49.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 13:49:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master][dunfell][PATCH] glibc: whitelist CVE-2010-10029
Date: Sun, 19 Jul 2020 13:49:23 -0700
Message-Id: <20200719204923.20911-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

The update via Commit https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/glibc?id=2c7e0e0bf32eb1ed0b7d8acddb16c0d1e93f2aa1

should have added the whitelist for this CVE removed

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.31.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 61679e2c1cb..9b2cf1bdeb4 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -1,6 +1,8 @@
 require glibc.inc
 require glibc-version.inc
 
+CVE_CHECK_WHITELIST += "CVE-2020-10029"
+
 DEPENDS += "gperf-native bison-native make-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.17.1

