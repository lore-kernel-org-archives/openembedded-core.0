Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.765.1622821048188939608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dhz5j257;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id g18so9649860edq.8
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c09o0PY1QnrI4lrMOanSZ5N/UMloAdzDQuZ+i9mTzjI=;
        b=dhz5j257QXMImifdQ5PZ6jM64ACN25KjS6gCfXC+1pyEgTfit/NQaWB0dbLJ175Jzy
         BmsRZLYVKqbhZgvow4qJu3OftoCL38rsiv1isCfR6GbzOrsxqliGR2KUR8PZVdbpGOMS
         Uv4Jna1eqwGLB139JHF3PrxvFq33uxJfqGZWX3UeP5erIlPp+HAcuRNx5eQiJiPTXsKI
         m98ECPDG/1BOB5XdgAsRD9rcP4rmooeAYMq2GPJRuMD/S2m1pBxa08qnSuDATtZmhIXL
         Dz+VeqBPfbZgbOiX10rHEiBs/C+MohIdFjuUVawIA1Hl1rsTEIPB8I9F60tk4TaCY9hx
         94Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c09o0PY1QnrI4lrMOanSZ5N/UMloAdzDQuZ+i9mTzjI=;
        b=OfLJX20y0kkkV+w1UrZ4QoTN4sv41PhZgdnwHLTNiHJkUFWxVKhGcVxj1+3F2BSCHQ
         +hkq0YDd9v0Zz8l0EcZ0n8UrDv5V2K9IIpgKQYMbm/rJYYYeeKmOI6E8kgcbmYRHlc1R
         7rJD/bxe/cHAQfs+Y7X5ISaLm4vvYZCY1bwEci8UGew1tjjRetctpWoybVpL5SW6Z6PP
         SKSW8RnX9+/RxXa+EHcdY979o25V4XW08WuX1cvTZk4zQXzI7uXGWkIiAREl6vV7bikt
         pjPAEEbC5ay18W220w46UUQWr2ChEFmYGgUGJQKyvacahzlSE0h+h/2b8VWEql6MzCja
         1Y+g==
X-Gm-Message-State: AOAM5313e6uS52hhzkHyfbekdDVh6LFxvF+vEMoCKE/Z+TaiCx3RAVg/
	3IXCPS4L2eBxSZgtiVH4BLHfS8Du9XlyvFVP
X-Google-Smtp-Source: ABdhPJyFDtwh4apCNtZjj1pVFLWAFtq9HYL28PwkWLmYhxC+71JQD0wtHAGtI386n4khIn2HhbTR4g==
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr5257674edw.322.1622821046130;
        Fri, 04 Jun 2021 08:37:26 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id dy19sm3402511edb.68.2021.06.04.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:37:25 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/3] testimage: additional reports for ptests
Date: Fri,  4 Jun 2021 17:37:12 +0200
Message-Id: <20210604153715.1651762-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from v1 to v2 of these patches:

- Remove artificial ptest example
- Update the existing service skeleton
  - add support for systemd
  - make it a ptest example

Adrian Freihofer (3):
  meta-skeleton: update service example
  testimage: support additional reports for ptests
  runtime_test.py: add new testimage ptest test case

 .../service/service/run-ptest                 | 45 +++++++++++++++++++
 .../service/service/skeleton.service          |  9 ++++
 .../recipes-skeleton/service/service_0.1.bb   | 32 ++++++++++---
 meta/classes/testimage.bbclass                |  5 +++
 meta/lib/oeqa/runtime/cases/ptest.py          | 24 ++++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 44 ++++++++++++++++++
 6 files changed, 154 insertions(+), 5 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/run-ptest
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/skeleton.service

-- 
2.31.1

