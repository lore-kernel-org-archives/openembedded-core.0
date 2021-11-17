Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7690DC4321E
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.8794.1637163335051960162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DKRb2W2t;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id n29so5459817wra.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8bYzxuLm3LZQZ2OtilMOFWGZmrWYpPB1fYzU3rWWUVw=;
        b=DKRb2W2ty4g7p0+zAf0zzh7YNd3MkJdkL9yURpa297EBgv8wq527OtMGDSLvojefPe
         Tq+BPg/pKjhnJhFsqtWZQa+chIRbDxjx7NEFDphjs9zSzW1ecH0sF4s343RHXfhVMDuY
         eQ8C630+GY0R9barsv7zjNPIs6jOct/UP+otv3KYpXaydmHdIuhKn/+11nC0pQkA7qLu
         8DWxFvh/kZA5YSjcdT6OlMwXxpu9/Z8lRot5qb+lrFpjNcvWVWXcTmr5T4JeNN2IN6ip
         o/oDIJNopVM0217qvBv8viAPQZ2q3+76jggOOOkE9Yf+VLXqVooknJah32rFivAMb30n
         MrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8bYzxuLm3LZQZ2OtilMOFWGZmrWYpPB1fYzU3rWWUVw=;
        b=gV9NrX2a10rKu8jhbTn9Jzm/1MVhA1gQf614zY5kR9FGT8dD21yTR6Fyd5VZw1TIZn
         eGFk77Fx96YZRG7Hass+U6cBNUkAoy7aX/noTXQioZJ1WhlO/h1C+SJWVA+gXdLvXAo4
         kZDZdBVi7moE/sJjDzSRi0/JeG8CFPe2PI9teKEiJN5dYAkgMHf8l+L2yhqGw6VWi5ex
         wqQ74ZOMGNDBU5iC2kRn0273xP5j8q1K4mBvVxuVYb+rGK1w6eKWEQwgXu2Gsos01lns
         jvFoC6Gks+MJwUpmAljcJPTUrB7Tyf+MazAtguGTeQZUKCvd1YPvA7YHJD4jGXYvtG7Z
         kcuQ==
X-Gm-Message-State: AOAM5322n3dJpzv5SJ7ZTdErNAxfoqCyWYtYuJomzxqrgUAf4RYWcZcR
	G2u5R1uuV0rSj1Ac3bgqu9cUTJ2m7yI=
X-Google-Smtp-Source: 
 ABdhPJzArMsxfGsz+r74dBbZP3usccm3j47tupIxnHdnvauozq+DKlhf8IGrhSoFFxY8oIFEoEOJ+Q==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr21715287wrr.189.1637163333684;
        Wed, 17 Nov 2021 07:35:33 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/36] python3-hypothesis: upgrade 6.24.2 -> 6.24.3
Date: Wed, 17 Nov 2021 16:35:00 +0100
Message-Id: <20211117153525.257146-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158406

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ython3-hypothesis_6.24.2.bb => python3-hypothesis_6.24.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.24.2.bb => python3-hypothesis_6.24.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.24.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.24.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.24.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.24.3.bb
index ef45ddb6c6..431a5e328a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.24.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.24.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "4030f88ae0a8d3339a41dd7589c78d3ba0a3a270f729c12aceddaea7c60b224b"
+SRC_URI[sha256sum] = "fccfba3803f391eea2c8c6f21667886ca7407b135b6121e0701a7f8addc176f7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.20.1


