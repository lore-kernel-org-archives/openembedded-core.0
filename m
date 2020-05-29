Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.26557.1590715765383831693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQhZ44WY;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id j32so683759qte.10
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 18:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8spyO3ySH7QsC8XxVEPb2JGqCc1w6Ub+6wbXIAL1i48=;
        b=TQhZ44WYJQRBUCR7RXNu36DHHrwxFPwIZ2cW6bX7qX55e6htpoFRpbfLPcWdWicTIs
         P5dq8B8CRyDFAVde5Epa82U4IklOJOklaj98dJvV4aMiAxCGq68oQ86uSS1hl9fmP4yJ
         B9ci2JyhMrkH5XjJ8Y2uB37eVqayE3znx+YTMwCumQFxCBq3eTBGlK61GJ0R/qHMJTks
         G9c+h6QlAwF6z0TQleJYKs81Bo+gCf22pSrWf3ecfQiLyAWgaDSBobNxYwx8yaU1L9Q2
         eAnNLlUjJsVy65/WaBEDI29YPHRbNryONwTVJkEUnfYzlMiH8/HjtkgDyvhT9B2tGwwS
         kzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8spyO3ySH7QsC8XxVEPb2JGqCc1w6Ub+6wbXIAL1i48=;
        b=a6AaUXKsVq4kdg2FGlm0y481cHMmAvxzc3VW8SL0XYA6p6ruhc8fng0RytbzqLvGQS
         +knoYUGwNr1m6tSHe0dpM5UFfcenGjnfzqJFfz+h515rRoVbiD9LymmzwNJ5SriGmDXr
         +XTOA7qUHbchtO8BqVV3FxYfm9V0eARqBEmhvX/hu7l/UGvnW7Js9uSi6mTJ9O/CoZxB
         WIVhA6nOH1/0Vu1N7AngKY7192ZVKEpA/kJ8DKiyIrgEC7FxmmyukZwaWDZSFdyAohlW
         ZDMot9+zkV48jtz7b2EwCC18n+dYUMhBoG/1tWk9X+areY93hoRgl2pS9p/tF7sKDIRz
         6+mw==
X-Gm-Message-State: AOAM532qc+WGRFGuqCx67wI0vyXLO/JxcdLcJPSctD6maI8Q84sY2oSR
	3UOussMy8oX2Z6+3iz5uSGLWyZfniCc=
X-Google-Smtp-Source: ABdhPJyYEqpjOK8RvkllsfDZ/sgyFXyQ9vwhzcBe5x5L6q0nRniM7xuv+LApyLTq4xQ52p1FzX4Z4Q==
X-Received: by 2002:aed:31c5:: with SMTP id 63mr6133255qth.373.1590715764561;
        Thu, 28 May 2020 18:29:24 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id c16sm4101292qko.100.2020.05.28.18.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:29:23 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto-rt/5.4: update to rt24
Date: Thu, 28 May 2020 21:29:16 -0400
Message-Id: <5ce0ac22ce72271a35dd5932471f31ddae1f11af.1590715483.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1590715483.git.bruce.ashfield@gmail.com>
References: <cover.1590715483.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.4:

    3d70f110c590 Linux 5.4.40-rt24
    6445e48533d9 Linux 5.4.39-rt23
    0a6ba32d4177 Linux 5.4.37-rt22
    35c686fb7671 Linux 5.4.34-rt21
    e54886570abd Linux 5.4.33-rt20
    307ba149ec47 v5.4.28-rt19
    8d488719e24a mm/compaction: Disable compact_unevictable_allowed on RT (Update)
    d1d2315e077c v5.4.28-rt18
    78028bc22d31 v5.4.26-rt17
    815bfc775961 swait: Remove the warning with more than two waiters
    b23b7f974955 powerpc: Fix lazy preemption for powerpc 32bit
    a79a552889de mm/page_alloc: Use migrate_disable() in drain_local_pages_wq()
    5e488daa19cb mm: Revert the DEFINE_PER_CPU_PAGEVEC implementation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index ba72377596..760ded446a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3d6fc5e71f0a3a21dacd90094f04d57a4fd59e60"
+SRCREV_machine ?= "3d70f110c590b38219843a3a0815a232fd542cec"
 SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

