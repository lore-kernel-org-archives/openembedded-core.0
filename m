Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13403.1594394929359288729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zt0P/2lM;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id f18so6417091wrs.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WMshAyy/EvIRkQ2kKS/vadRb8MuD4qY1rNc5six2yKE=;
        b=Zt0P/2lMiXr0NZ0Mw5WM7aW31JCNE5JXJ/kb2j2xrmJoltQQaE4tSvZ3lHuhaLeQL3
         w9+OmElxDTCQnC83xEL3UVsAdLSWlsOMY6cwF5wXbaYJE40qUnoO+FgNJjwzEjbfhPel
         2L9UAYo4WH145itycxwn+gVRC4gAk0Bn5IWims9WEiHWMoUIri9PEEusXYsk8hDD/OAf
         r4R5ELz3M/4StrItmP4frTNaUlnFshnou1kO1iYtALJDFGHNeta+o7QPdkgw8ezG2zH2
         N8GiR3kOU7FIWDNuCQJrGE8TL7I4MqJdK+bbASFQ3+DJy6/1eq/xyWr34guC/FGH6qUE
         piUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WMshAyy/EvIRkQ2kKS/vadRb8MuD4qY1rNc5six2yKE=;
        b=NpO6GI4y9BmEvfw8iavm6UZPtMdKsyHnWbAhG0lOT8b9GGwSvR2BYPkpuYp2yN62AW
         lmz77R1MuwuypI6nPRkGayZdXGFEA7/JTG8qqhSeAg6hePWysgU7KLM/nemq3P+EkyPm
         GVd7WXuCd723fqu0COSCE/CXZa1YCrJfm2buzjRxRR/n6uYEm50wB6qQCz1YcBtJMM7T
         QAcn2qOhVeb8WstZ8KpvNkBD8kDfaLKP+WIKu1+DfVGeIt/Gi9XEJeUw8p00YMj1Q15W
         GXIzO9tKxrg0HwaZInH1Qdu+392sCF2iJ3eeOn5yyiGQEZm8U0SH5qoyR/MBm05PwDzz
         QlDg==
X-Gm-Message-State: AOAM532VGE6+YUurFEi+aaQNgVutKfhJ3C9dc0KCMyljr6f7pQ8KS1Pf
	89fr9RAlLwWJO1rWcV/osRhWWrqo
X-Google-Smtp-Source: ABdhPJyKuOez3UyLXH6fvZWaepZZdDQCka0ZJmneBHe3Uu04Yos09GCvmZQAQYh9mti2NOeLXQJzCw==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr62904570wrn.241.1594394927618;
        Fri, 10 Jul 2020 08:28:47 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-52-212-214-192.eu-west-1.compute.amazonaws.com. [52.212.214.192])
        by smtp.gmail.com with ESMTPSA id k126sm10379621wmf.3.2020.07.10.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 08:28:46 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] u-boot: Upgrade 2020.04 -> 2020.07
Date: Fri, 10 Jul 2020 15:28:44 +0000
Message-Id: <20200710152844.12588-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index f4790532b4..abd9786c0a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "1079ec0a77c3fda510f07860b2549c47f3a46c21"
+SRCREV = "aaab5b273781646d417a6775bddd46f90031ee92"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot_2020.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2020.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2020.07.bb
-- 
2.17.1

