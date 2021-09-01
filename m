Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.8125.1630503926766177276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ej3X0Sgs;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so831897ood.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J6mEH8j4hFeWfzfzY2BfWY7DMfBJeeRRVE8pIp+QRYw=;
        b=ej3X0SgsEcq7S+egIr/qQs4iSLeSLHuTLXr1cXCSHbyBIS6lhfvkZB0wP1jVHW3I/O
         PNHyOWnna5qEynfDyz3aTEqy6lfKyCQMuLPwG9EPPHrAVemyXgiK96MC0Iw/on3eTKo/
         8GHYi38bnqVnm2wWih7uffXZIE4nJHZEBl4BowMEWPck64ccw7T8nEDtFTd5rGAAvwnr
         buUL4InfXZz5biMUBWsTjOxZckishgDiH+0d8fYQ8zVeCw64An86UkY9t4GxQvOUy2pX
         DG6ZcJxoXuELtrXSahD7iu1WeWitZH+PjJER06GljYbAkGJjDuqCYbhdfEIPk4lHZ5VE
         pQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J6mEH8j4hFeWfzfzY2BfWY7DMfBJeeRRVE8pIp+QRYw=;
        b=hSoxfwgyFLbwRMHsl/e+ZsLwQE5zBvzdZG5P3/3Fn34+g7K9G2SyqFSQ3pO1vtVucR
         1OB/NDPoiVpspDlJ+mXC5wQ50Jdv43stsxPZKcZfVFxoV3qKb8Ek0G03/axJdnZz2cjZ
         vZPdNN8KQUNAzwYZZv9PjR17ztOLoPP6f8qHqd1uWtRDO8wsRiyTEswK1TejD0VNilYv
         7W4xt1SK/kBjzs4Kale0mFk4r9uOCI8H9u/UIkCCIa4yV0KPoJxBcI/FwQqx6d2rnkbg
         Jyp3qNUqGza189OhTeZCzhnj0JrX6Ke/SO1m0o/M9b1g8yzvhnGd8uaViokhvJqcO+ye
         s3aQ==
X-Gm-Message-State: AOAM531oHBAzOvGQI/e3HPNXH8UCDvJ3sZRfTXahjqxg56WQ2iNYEk8u
	V+flqO7vJicAG1bBKMG7o8AbFDucCp8=
X-Google-Smtp-Source: ABdhPJxhCNxGjrc5iCmU5ucIjpCjfqNxTtYPzVsn1LRGTSpT83nDEj11BGYHbI0MYt9Z8fYb6IVuQg==
X-Received: by 2002:a4a:de90:: with SMTP id v16mr19247849oou.42.1630503925913;
        Wed, 01 Sep 2021 06:45:25 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:25 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 08/31] classes/create-spdx: Fix another creator
Date: Wed,  1 Sep 2021 08:44:47 -0500
Message-Id: <20210901134510.29561-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes another creator that was missed earlier

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 3f635045a6..aa3e977b02 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -720,8 +720,8 @@ python image_combine_spdx() {
     doc.documentNamespace = get_doc_namespace(d, doc)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
-    doc.creationInfo.creators.append("Tool: meta-doubleopen")
-    doc.creationInfo.creators.append("Organization: Double Open Project ()")
+    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+    doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
     doc.creationInfo.creators.append("Person: N/A ()")
 
     image = oe.spdx.SPDXPackage()
-- 
2.32.0

