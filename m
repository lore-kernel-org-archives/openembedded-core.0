Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.51641.1591056803019303943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 17:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1hCUulxd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id x11so584823plv.9
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 17:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=x52k/HwXDWhHGbf7LqWn16Rv6nQZWY1Kp2YjWGsmCFM=;
        b=1hCUulxd0Pt/+w7m2bgvRCiqTeLl6a2oQ7d83dr57ERZGVh/64Po6fcVomRyyIY5Wa
         JjNx0FIpZnU5MNLz0flAD3l9+84WNPQpMsM0RJFBnHIS2ariFk6uRPlxEKlmdZAT1FaW
         tq9KRtdpqGw4n2NmpsyBnCSu7SqJ3FrVaWxPtDmDcKsJ8uGIhAAKQxvnyZWvtlF5dZnv
         fGfeXKhd4bYdFNavYFOlkkcFZZroicO92M1yrMvb6yhuNqGCyBLf4ovRpqnN3zxBT2ux
         +FI1J92A9hbiuK6rhp2IzmTlRpY2QwA11e3evtUuCfrBSHIhXRRxxm4bNU0Vpnm/hYWm
         0oYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=x52k/HwXDWhHGbf7LqWn16Rv6nQZWY1Kp2YjWGsmCFM=;
        b=pA/COsHuNX1c9jXJ/9CNqLXQLpFnlzbMxHPJQK7wirOgj3+XBLYqu/aMSrWkf9pzZd
         +JZtmceRk7MUTZDx+NLlpLpZlkPKBZEz4siq+676TVsopHPXsR2J/fBbd5lTHQWTzPnD
         5a6eTLCCmltZTSSThgqH0vXLCUj85Xwyss4dO23dKreAhroxl7/DppKguWoB7NVzi85/
         E5xERT7gDPZGztlpGLBfzBUuQLjAgN51mDeduiv1OoUt2c7uj+hEZVHsdSfFQJulXqry
         LFJIG3U0C12eQMnOjgcA1YRHUw4TrRyO8DLfywuUH+8derftm12Jg9CZL+Va63WkRY3h
         N6hg==
X-Gm-Message-State: AOAM5307MzIL3vyHlSPO2Jt8jctbBZXzlo3+ZUnKsKvzo8jUwLPTy06G
	ctsPvSEFXAIsuUlttcjJBhv5ffPB4zc=
X-Google-Smtp-Source: ABdhPJy52+c/rbfDGo+dLLX6cDzUqRY9b/bCgfT2N1vdUWI0REB8/vlt2Kg7nLKxq3rRueFyvsMPvw==
X-Received: by 2002:a17:90a:1919:: with SMTP id 25mr2026088pjg.7.1591056802019;
        Mon, 01 Jun 2020 17:13:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c195sm442699pfc.203.2020.06.01.17.13.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:13:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] linux-yocto-rt/5.4: update to rt24
Date: Mon,  1 Jun 2020 14:12:43 -1000
Message-Id: <9e088d38fbae9a646ed5e608acbb3d3ce172303d.1591056239.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591056239.git.steve@sakoman.com>
References: <cover.1591056239.git.steve@sakoman.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0123efae31dab8bce15e11fcee0b139a61b67cd6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

