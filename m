Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6D9C001DB
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 16:05:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.11029.1693670714905276850
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 09:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YSvrRqS5;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so51839b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693670714; x=1694275514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgtOhhIK7NIO2wUBpyFZcfCZSUx3yMmQiTkfTzw0Dm0=;
        b=YSvrRqS5N9A9hWuz1H7Cda9bEosJZ5YmKJMd5Ae6K/NnDI4bsLy2bxHqPKlzEKOkOH
         8ia0j8JfFQpEIOV8DgE6YtfmLmZ3eHW5Mesp5XD9Uu0YQyAv6fhYg0d1WV/uCXFP8bzQ
         iLJGaZ7LWvZc9vyQOTf8sp7zo2bksP3MmaPT9tn43c2E/FMEirKFKtjJcIGQFD1BFlg1
         3JP11aRvSiwf7WDWl8GXJpnaze0qDJ32Lf22QIfOIdtajL//+eQf+SkG/hD1kX6hx1n3
         w5p1ZHM/Wn04I3jYuKE6+1InJusKCFWggr0Ap8CEXiWnfBAC66tXUer3P++bFdIlaDR+
         GOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693670714; x=1694275514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgtOhhIK7NIO2wUBpyFZcfCZSUx3yMmQiTkfTzw0Dm0=;
        b=i85u8d4rj/pOBYkBdPd4/nPXHv/k4HkuK7LJSK73pbwYgcPIbhNB7IKQBZ2+Z4JPOm
         +axbKynjRzn8v8O9rMEoBUtuWT6FVymko7dstf0yr02WfDs38h8Jfv3U0gEmSX1nMMzr
         K8moym6zfL02iq/MP7MVFmHNxswPlYWlQwG5xRUzN+CU7m2v0SUZffinsQx7IMgCatAS
         RrGTw4LVSPC+tWUYf6A0OBIA+j5Y4oStBTLfV9SVimArmt7k+KB+GgKbfbTAlnYw9AUo
         AOTJDqIgg8BfMrzwrkihFskiKXRO9lOm79eN+jvQbaZnZmEbtXRnS7m6hiSHluhiehwL
         SUrg==
X-Gm-Message-State: AOJu0YwV0kEAFRLb5xACcouf3mNN7cL/7YUVZSFiI7MikKJELE7A824g
	MUsxb9KmDG+BGBCFbqCCrBW4HYIH8zidGA==
X-Google-Smtp-Source: AGHT+IGWOJqnqc1jafkRM1zVt94sDPqr2XI22aqzhDzEF1KBfgvAowFrkj3kI3V0HE+31M03Cg39fg==
X-Received: by 2002:a05:6a00:2312:b0:68c:1004:1fde with SMTP id h18-20020a056a00231200b0068c10041fdemr7183089pfh.18.1693670714018;
        Sat, 02 Sep 2023 09:05:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id r9-20020a62e409000000b00682b299b6besm4726336pfh.70.2023.09.02.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 09:05:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] dos2unix: upgrade 7.5.0 -> 7.5.1
Date: Sat,  2 Sep 2023 09:05:11 -0700
Message-ID: <20230902160511.219168-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 16:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187152

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dos2unix/{dos2unix_7.5.0.bb => dos2unix_7.5.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.0.bb => dos2unix_7.5.1.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.0.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.0.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
index 1ff1fc4f971..acf49f04834 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.0.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=37f72246ce2aa2fce9482c10b1f2b502"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "d6613bbb175624f065de907ebcc94437f699c14e"
+SRCREV = "9675e7aea32653e1c10ef027eb55d89f3c48ec1f"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.42.0


