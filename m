Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.1351.1614736929172854076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 18:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jPP9XS9d;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id o16so4627073wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 18:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nq1lGNVnSYPBc9lpXYmcOnrGaIzdqcBeDMCFof9dQTE=;
        b=jPP9XS9dnkT11dwybu0cFoKj4rPvoisszxWhJyKcxm4oLUARjzWJufrUnCq4JJDGTh
         dLsib/UhbqX9AXXwVaKFCORiTxA8gKYzzsx4CzjdPfdNt7gsFkZzH8Zw5H35pcSVFfUJ
         0LAbUvbJuo2lLQtpbLH0KZZBGiJsG5bAO40RP9vktgsynPaRNnXPbUpuih2fUhyb7Llx
         r1iJCwAM775gTb/xX5h2CuJnL60B70Ynklb157VQKSWq9a3SY7kSd6wv6V2Ytyozvy/G
         Vhn7cXDksOlqZwouYM0A3TTYciS2I4MQ6pH8ndrhZ0Uba6PgaF6y68AjFwV8E3bssB2W
         jINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nq1lGNVnSYPBc9lpXYmcOnrGaIzdqcBeDMCFof9dQTE=;
        b=bW4jbPFdyXXiOpa0m7s7xE4mWiATcol193fw8gTrlowFyBrbTd4lccLNmjYpdcVg8Z
         CV+eIbhBM3eYYymAQB0l0Fk5tUjTKgzRqByGv7w/Oj+bBp0gjjoYmln3QeS9YbAO5jPU
         rwBD+iX4AhZp5jDQDYemuWo2z86UBxRzt6UgsPlBRWzF+WOFIGiEJVmprU5uMrQF5XRz
         4ClHNTmJ9Alhel7pfFF7+pauRg8KRgESFNViprEOFXucQ6D9IixTbA65eUZqfvqrSB7g
         PTfGn7OUP99E2ux5T0v/kQndK+RKmcA0amH6BU0o+v7o37PyJMg7t5C8bcSkHfX+54Tf
         dYxQ==
X-Gm-Message-State: AOAM532dYg9NW89IKxWqoDu/Kvx9PB+gH3QOZfDHMZ+2MVKw8SHre5U5
	3zOoWWn+LK8VH2b8mSd7iUn67N+av/w=
X-Google-Smtp-Source: ABdhPJyzha54Oayv1uF2CASrQcsxZ0FzIF8ZuMaVhCLqvX3Mcmw89OQpUPGLEq+M/xBcnuafj1lrqg==
X-Received: by 2002:a1c:20c7:: with SMTP id g190mr6472189wmg.156.1614736926717;
        Tue, 02 Mar 2021 18:02:06 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.32.149])
        by smtp.gmail.com with ESMTPSA id g9sm31489279wrp.14.2021.03.02.18.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 18:02:06 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 1/3] meta/recipes-rt: Add HOMEPAGE / DESCRIPTION
Date: Wed,  3 Mar 2021 03:01:50 +0100
Message-Id: <20210303020152.25093-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-rt/rt-tests/rt-tests_1.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.10.bb b/meta/recipes-rt/rt-tests/rt-tests_1.10.bb
index 2834cabcd4..89e3323b69 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.10.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.10.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Real-Time preemption testcases"
-HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
+HOMEPAGE = "https://wiki.linuxfoundation.org/realtime/documentation/start"
+DESCRIPTION = "The main aim of the PREEMPT_RT patch is to minimize the amount of kernel code that is non-preemptible Therefore several substitution mechanisms and new mechanisms are implemented."
 SECTION = "tests"
 DEPENDS = "linux-libc-headers virtual/libc numactl"
 LICENSE = "GPLv2 & GPLv2+"
-- 
2.17.1

