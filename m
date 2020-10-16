Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.11795.1602842136599169877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sm/R7jWN;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id l16so1676621eds.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmFnUSWWT4fo7YuAjiWfBIpnqOLprkEteBKDCGh6izA=;
        b=sm/R7jWNHCODwWE65C4e1QO8gQbJPDOKkYTCRuP43Mfe29ru/96DKc+fcCYcx14xgu
         nYqrwvYvUkCupMLzZ5Kqvo9gvCDIXUl8mhOGGTlbUhuUC07F5ATdKUH8Qfav3QeI+nds
         /tH+zgq5dda25KFthroIEOqGS96ZPDGiQEoMp69oQUr8z5QoWz2uS9ari06JsycXPsW7
         ajeASRXEVncxVG/zq3RlvRWQ4i1eDYui1mS5mBR9FlARX+r+M86t1eKn98dUQWT8G/mS
         fHEMDPif4Aqq9nV9Et6rkXrDWpWNlAoBFloo4dAjaqcUjW67X3+npwMDzTQx5XOVNGfU
         E0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmFnUSWWT4fo7YuAjiWfBIpnqOLprkEteBKDCGh6izA=;
        b=HCngzWShADOSZylLYH88k1YdD4Bmtes8EJPm41ljUt+KxCb4KBs/0U++yyMcUeC2TL
         sA8OSYWrmadxEzyDbLmyiqnCZ5O6euddDW16a7Fakr6Rd3jE0yM6u5NKvPAgefVCZI/F
         c9h24GtJs57yYJlGIoHGItl3QXI5fw0hpfMh5f+NDCNT6agokrx9qQs2Ru1a6eGGIAgb
         WDr3gVHR09UjPUhkMXfKB3nfWPUtKYsjh2FKcnigEebU+PMbXXCJQ7VDqWci1ZUdrcQK
         Ieq1yAuR4XmMKEw7aSAbRefTCubX/M9PYd2UNiCy8Aces6fGsT9UlUhS+mvruM7yx80G
         cm8g==
X-Gm-Message-State: AOAM530rUlwQ47HE1OSRWWH3BRN89q+MikEeMX3o2eOdACIPDutozs8v
	R18+tY7hN5zXnjiT8iPNd8BaVxOxTqk=
X-Google-Smtp-Source: ABdhPJzT8TqSPAd8bHomUIZa/JWVsB1yIZ4VvbHnmjZ7Bp7MfApvbUPpmlqWqQ1B+Ye6ih6R/ruwoQ==
X-Received: by 2002:a05:6402:143:: with SMTP id s3mr2749798edu.267.1602842134814;
        Fri, 16 Oct 2020 02:55:34 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y6sm1012499eds.93.2020.10.16.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:55:34 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] tune-mips64r6.inc: fix typo in mipsisa64r6-nf
Date: Fri, 16 Oct 2020 11:55:30 +0200
Message-Id: <20201016095531.140098-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-mips64r6.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-mips64r6.inc b/meta/conf/machine/include/tune-mips64r6.inc
index 4fe3eedf1b..e53239a38b 100644
--- a/meta/conf/machine/include/tune-mips64r6.inc
+++ b/meta/conf/machine/include/tune-mips64r6.inc
@@ -24,7 +24,7 @@ AVAILTUNES += "mipsisa64r6-nf mipsisa64r6el-nf"
 TUNE_FEATURES_tune-mipsisa64r6-nf = "bigendian r6 n64 mipsisa64r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa64r6-nf = "${TUNE_ARCH}"
 BASE_LIB_tune-mipsisa64r6-nf = "lib64"
-PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-nf = "mipsisa64r6"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-nf = "mipsisa64r6-nf"
 
 TUNE_FEATURES_tune-mipsisa64r6el-nf = "r6 n64 mipsisa64r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa64r6el-nf = "${TUNE_ARCH}"
-- 
2.25.1

