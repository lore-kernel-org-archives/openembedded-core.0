Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.37350.1628865162247237367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vbQaVGHe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id a5so12217018plh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xv3ju1D7t8rGeHqe4QyVxVfkZS1QUHbGCbEW3wGE5xw=;
        b=vbQaVGHeLYgIyjTwkfwny3fQZfq30A6SbFOrYpJtbU+ynK4t6RbPBpKeKJVogml/gn
         EQEy4w6aBVD1Gjv+F/C145RK0LLtX+gSRW5MlpXZcoPZXgSHDJ1GniPMJCgNSmdn2PBx
         nVsCYDjffkFLIm1uSdV1GC4zbeqK2qJSG7aXj91C1fETYoc7bSdz7CLH+Zbn2CvYy+n2
         9OpBYjOlyZPdwEpu67mFWaOye+8nXbJ2O3uCPquSCq/7FBwCGT4uwUergikhGGPsoHCi
         VznniydeNm2NtnN0eLYeHp+1hFuha1Yq+WIxR7f7P+o66E9yNEwQmTeJhBihvGOoPux5
         bPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv3ju1D7t8rGeHqe4QyVxVfkZS1QUHbGCbEW3wGE5xw=;
        b=MY8g4n1HIzPfIstrPBZnGhEmI0P5gJ3bFTKiOvbl/+A9Ze/Re23WRBjqhLKzFAVWP0
         3Pmao3UsrgImjMMY/SwOnVhnlQGe0gv0xo7pPVPlP8K8no+aEqKzDQh3PoSepXpLVZ2j
         F5Ve8AwM8yQ/nJ2bv6uNEwC4o+jJ/SyXeeLO30QTI662WdXQBIL5EtpTqwIS7a/9+EU6
         r+JTN2t64NI988ytaql8vAWQYUTvUA3SVouPU6P4UIooCzdaPT+f5rMQpjRf9q6VIO5T
         1QLOrZ3w95FqXDqeXbgQH75Ednrf0IxiJWGuOj2fAaMT6Uf4lYNb4lUozCp7pwHajowQ
         0Yaw==
X-Gm-Message-State: AOAM530RXzle8QczBEhyX/4S5X1JcHDpXjRu4y3Q+KpXop2tvUTtmqT4
	BbZfVScTPUCJdWsBME7bt2QkVw+kwu0mg4s9
X-Google-Smtp-Source: ABdhPJzkc6+XNUEe9sFkSmO9HMuwtoJkFhvcjT5StSWGd4kDF1Pwn/6CDEedILDWOVIIuD/lLv6Lxg==
X-Received: by 2002:a05:6a00:23ca:b0:3e1:2d8:33f3 with SMTP id g10-20020a056a0023ca00b003e102d833f3mr2330314pfc.42.1628865161362;
        Fri, 13 Aug 2021 07:32:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/17] cve-check: remove deprecated CVE_CHECK_CVE_WHITELIST
Date: Fri, 13 Aug 2021 04:29:56 -1000
Message-Id: <201140160e2f2468bcf42fcb368a083d772becd5.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This variable has been deprecated since Yocto Project version 3.0.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8ac58568b2dceef54a743369460019b3a3eeccd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f9e5cfa451..b6df2c31da 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -238,9 +238,6 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
 
-    old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
-    if old_cve_whitelist:
-        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
     cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
 
     import sqlite3
-- 
2.25.1

