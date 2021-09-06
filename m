Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.20183.1630921136905952906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 02:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lu0Q1+Yw;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id g138so4111288wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/nTrrT1fY8Cb6DJfEvGsxojS9mhEDXz+d1p/x9U6iU=;
        b=Lu0Q1+Yw9c3/T1y/DZtJCxCM9FB64R8TY54z42KXXEdwHkZ0plfK2ofzMrHnkVNs9J
         38Rq5EDcbfzKA3O7+GC8qaWtI4kfcAkwkgPKY54YJYxxPmo9g4KMxq1+6DRl3mfJit5n
         9x2smzAKeSbagtMJ6Mx3fxHvIMq45MLBLRUco4pm0p9TaR5wpTxSdpe3d0OzUIym+oOm
         V19MCcp1OjRKBjJmhK6LR+SJqsSU000CYBADZ8HAW05hrIkckHqli91XbmDcbbuHIpxu
         effGlU3p0BofnDR4X4/dnSeZkES8PUhqTU89ljUdqaeL+cISRIEHhiGyoxG6ui7PvS0p
         +F8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/nTrrT1fY8Cb6DJfEvGsxojS9mhEDXz+d1p/x9U6iU=;
        b=ChIeip5mnf5gPO/ICtEb4Q2WxAwCWY1KJAp9ZNPIfnwOAmx0xR4qWYNNJEUCaKcj9N
         yhnEUto6rFxmg6Ca3bMCQPXSJ68YN4N/PiRbMyMjYEipTQ75GhVDS73jctmXZWZ5sAZZ
         /EvSIYShg6UtdA0WYiHvx+jWd1kIglZz6LRzLcC3aotgKhVfJJg0NDqgoW3HHZAnL3Oi
         nBVMhIndVWXqPMkIBjq5tuDy8LcHLMQIMD3knptSi7VxZaJnFlwaqoRyAm0CgQhAp5ES
         /OWwcSZ9deo4L4wD0Hh7VINLR4Cky1noltnA2z3MWM0zIvzr15lZIPJZnfHONcaJR5tl
         G61w==
X-Gm-Message-State: AOAM530FAAE/H0wFlh0T3lwkTqdifTzFYmhDG1Xnc5b7U5Uat55SFx8i
	aiqUci0aQrKUgBwW9Jr1zR48XksQN2c=
X-Google-Smtp-Source: ABdhPJytfcIdCx7uFiBVRYsfadsyeKYiGH/pIwIUP3/nc5mpI3/ldlzGiqezgpMqsxumQczc3VNaUA==
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr10405465wmg.8.1630921135571;
        Mon, 06 Sep 2021 02:38:55 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s205sm6780913wme.4.2021.09.06.02.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 02:38:55 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] core-image-ptest-all: bump RAM requirement to 4G
Date: Mon,  6 Sep 2021 11:38:49 +0200
Message-Id: <20210906093849.22779-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906093849.22779-1-alex.kanavin@gmail.com>
References: <20210906093849.22779-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

/tmp is half that, and lttng-ptest writes just under 1G there
(and just over 1G on aarch64), so let's have a safe margin.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/images/core-image-ptest-all.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
index c1d6aa28a9..1472451675 100644
--- a/meta/recipes-core/images/core-image-ptest-all.bb
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -18,8 +18,8 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
 
 # ptests need more memory than standard to avoid the OOM killer
-# also lttng-tools needs /tmp that has at least 1G
-QB_MEM = "-m 2048"
+# also lttng-tools needs /tmp that has at least 2G
+QB_MEM = "-m 4096"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
 PTEST_EXPECT_FAILURE = "1"
-- 
2.31.1

