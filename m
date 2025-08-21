Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BE0CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 18:12:55 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.3508.1755799971001458683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 11:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gDFHcFVO;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2445824dc27so13012665ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755799970; x=1756404770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/lodHkdmiNHtKqJeTpeO9esqjTTd1zf5W+kFCbF5+g=;
        b=gDFHcFVO9KqS9a4MAs2LM0q3Td0vHxGuO3Tzx3F+H66mAHj3Roe8pbQIWRVr5iMqfb
         SLAaUcpW3vFKhSVRlEZSfXhYIJT+y12W08ljtGhjUafGcXe4VoAP58aXhW//tR9rBrm+
         9iEnJWDEc/Ja6baE09JwhoMZvFs+SamrzhPx+5kYPY7J3hAmnH+lyX3XephroF/dpsTn
         EnwBbHF68fmg5GRyupVLW+7kWCXpeoergPvqv/LD+ZUNGJ/ln/Ijt1gtF9k0f2WoMK6y
         4NG4/3AH7aPjNmGijzeMtBUd5Ti8gQdDuBjDBrIWZ4HDP9pjj+uI5/o+adAYN/B7yfKY
         kstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755799970; x=1756404770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/lodHkdmiNHtKqJeTpeO9esqjTTd1zf5W+kFCbF5+g=;
        b=vmwBhccilY2c8zZo9PQOgBJmeQQphzBgWL8xynN7r/pVpXCfG/wbqeqUkdG5qNwEVS
         1rYw4QtdsA2zJbHCxRcVraOvzeJer8ZzVwWob82SjymHLYTM6RWuS8lH3xRqbqLiODPi
         V9jXJ/TeMfQRLhWcx8NwUsY5n35iCA93WE3YZPD3cuN6UiURw44pkNWxMS8b2DNjPWIP
         3qMrsu9xgVsl22nCVcZFuXwWm1rNIKWmoklfS10jsFEuZ5Nlfg+l0T+4vrxRqNZJW5aB
         T/GBmLEtz3z2oBLw6uMcXGN866e4gAYZDmbeAtxXLucxvKPvjyrUwMKjsXt5IBszrPmR
         C/nw==
X-Gm-Message-State: AOJu0YwY2avHU9HpsdL0aYNuXa6m7fySK/nypU1A4JBA/Gnofeot8jHx
	LAKfu3OikPr+Wfy0WezicuAp16TOfwjQHbIYzIFzmVPj/P2Qd0UfiMYo33LkOSND
X-Gm-Gg: ASbGncvXB0d1kLem0iaF4YVrclBiNvqliFWWuGpKyORNMtMwYkgnt4dEBrGRBeIr6nK
	YNSGQ/tvGEpGjlPIACv/ETluFJGbB/LQ80pjQQa5lQtsIG6dxQ8ZowGO9cCngvCRUI2u2QP1ApS
	N039d0YccYrVt8IxkmeJ5pa2WbwMHCXutxcy9zkqxF7BM+YBO5Bg4wnOeNS/c+Xeej4+WL/1dcc
	KH8CNhUiMgltcgzsDn7Q7h/DQD557aGhQDrcmbcTVpdH0F+XhtVa6aubJrLZskU0u7Wy6tppWcv
	5ydDwyd3eSIeWkC/UC4vyLITWcVt6ri7AVzjJ5+zLc07581m37e+6/ppOz6D4sFi+f9XzJQ/NYb
	9K98RXsxpygJp+phJiAQ3PQ==
X-Google-Smtp-Source: AGHT+IGzZhmZhv7G/pQMZPmZIbOEbb2xoD/IMsrpr8h8jK8f+IVJeAg72nQX6Unpmrxz25iAfx2EzA==
X-Received: by 2002:a17:902:f68e:b0:235:e76c:4362 with SMTP id d9443c01a7336-2462ee89b8bmr3874725ad.18.1755799969731;
        Thu, 21 Aug 2025 11:12:49 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245f2820f48sm52375285ad.149.2025.08.21.11.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:12:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] findutils: Drop setting gl_cv_func_wcwidth_works=yes
Date: Thu, 21 Aug 2025 11:12:45 -0700
Message-ID: <20250821181246.3413165-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 18:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222278

The issue seems to be have been fixed for long time since 4.5.3 onwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/findutils/findutils_4.10.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
index aa216376572..29ad6c73506 100644
--- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
@@ -9,8 +9,6 @@ DEPENDS = "bison-native"
 SRC_URI[sha256sum] = "1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5"
 
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
-# http://savannah.gnu.org/bugs/?27299
-CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 

