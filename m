Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BFDC3DA7F
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 03:30:40 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.64358.1723519830058364850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 20:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eyOW9SzN;
 spf=pass (domain: konsulko.com, ip: 209.85.210.48, mailfrom: tim.orling@konsulko.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7093705c708so4917183a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 20:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723519828; x=1724124628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xl5DSmYLe9WH/7uvl5n5L/n3uEHZJrnoL4KNkSk+LmM=;
        b=eyOW9SzNyMaAb4qmBQzne7De6GlNBu1FD3w7oT7AGErwZv/Al15A1jfICmNSA7xuop
         aSMyXzwgKNNtPBUkE8DsF6Yy642GRRF0fIMLE8hGTrfQ/D9Dob0jyryx+UZl8+TiB9DE
         Rbit+ghgkiiMxwB9SZlHBmOiIvLqpeHDsJMlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723519828; x=1724124628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl5DSmYLe9WH/7uvl5n5L/n3uEHZJrnoL4KNkSk+LmM=;
        b=nJPjsPMJP9Is/UbWGtJuUQlHF7sntrGiarQhm/S+29JVld8JC4aHvId0jhH/StyNEr
         +mLnSPf5AXYuwa/XhCXoMrQQ684gb3KBjKnOSSM0rFkUayDzhvSeafxtOUzF3GmPYRcu
         xt6sLV9P6dsdfv/nCIJ53bxvV51y6f2iwY3hD1xtDswQi10XYdVeEyxWa0IxWwpTx3l5
         3+DIQJKWgz4s5oKagb4k8i3YdTjCSM3DtuN/DOp0iGp4X0dTVRkadFAc7cmahytZQwZV
         xwnPIgP8zAmaNhks8B5B4PEf8y0JK17BHcHc85byHY+inYm/r3T0fALSLNVFkEN0W5k1
         Yk/A==
X-Gm-Message-State: AOJu0Yz63tGx75GgniURw6VUjRCLTX/tSaSEmnnSzKm2OVhHaWfR7/V7
	bxpJKfpdObYMdGijBAmpnUHcejQjbd/AHvrdFDwNDgT8pVfVZ/WKoJ9+CY2nvVKMMM5g+GfL8pA
	VKgw=
X-Google-Smtp-Source: AGHT+IHrxMpjVYWpJdP8khZarBkDiVoycZqtka/bsDFarkVhTNAE6HywWgyQQq1jEACTdXdwHnIPaA==
X-Received: by 2002:a05:6358:42a3:b0:1aa:d3b7:765c with SMTP id e5c5f4694b2df-1b19d2d1576mr270519955d.14.1723519828267;
        Mon, 12 Aug 2024 20:30:28 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58bd3bfsm4694385b3a.89.2024.08.12.20.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 20:30:27 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-alabaster: upgrade 0.7.16 -> 1.0.0
Date: Mon, 12 Aug 2024 20:30:07 -0700
Message-ID: <20240813033006.1128742-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 03:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203243

From: Tim Orling <tim.orling@konsulko.com>

https://alabaster.readthedocs.io/en/latest/changelog.html

1.0.0 – 2024-07-26
  * Dropped support for Python 3.9 and earlier.
  * Dropped support for Sphinx 6.1 and earlier.
  * Use a new SVG image for the GitHub banner.
  * #217 Use the new searchfield component for the search box. Patch by Tim Hoffmann.
  * #104 Allow translating strings in relations.html.
  * #125 Do not underline linked images.
    Patch by Joshua Bronson.
  * #169 Do not ignore the Pygments background colour. Patch by Matthias Geier.
  * #174 Fix clipping caused by incorrect CSS breakpoints.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-alabaster_0.7.16.bb => python3-alabaster_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-alabaster_0.7.16.bb => python3-alabaster_1.0.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb b/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
rename to meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
index c61fce454f0..40be6039eb5 100644
--- a/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
+++ b/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=21860fdb805bf4e0bfaf94b566b747fa"
 
-SRC_URI[sha256sum] = "75a8b99c28a5dad50dd7f8ccdd447a121ddb3892da9e53d1ca5cca3106d58d65"
+SRC_URI[sha256sum] = "c00dca57bca26fa62a6d7d0a9fcce65f3e026e9bfe33e9c538fd3fbb2144fd9e"
 
 inherit python_flit_core pypi
 
-- 
2.46.0


