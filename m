Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82487C83030
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 01:30:20 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.8795.1751938217190280600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 18:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2k6GA/g;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: festevam@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a589b7dd5fso64362151cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 18:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938216; x=1752543016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BoV3IXxfwo7q1uvdPuAZZ5g17cgEjUtZ7u2hMRvSPs8=;
        b=g2k6GA/gHXNWmh2xYcY5ip6CibIQbooOL2c0TyizuH6IhOrhlIRilP6ryZTL4ge4Aq
         6Sf0IYlH9yNo0/iTtPYEP3BK7o69L+TTLtPDQULTGu5MeZt7CW8jBnw2j+JR4/gLC1vo
         XznZZJfNHWOPmUZnKRj0tCmEedpuJIv4gx6/pJkWx0raJJRpSIOc4YNNr6hmSEIBTEtf
         +GLCcgaIcSbS7+O61LMehPYmHIt6H4ulNozJxkdQ+dAa/ArvO/DCs4LOOQPaxgFx6f76
         UJvBtRfXmRuaTxWmAd0Mq2xNilt6ByPoYDCkhIFw4HGJGL9z7BkKKwUJi46asxCaXIS6
         uqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938216; x=1752543016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoV3IXxfwo7q1uvdPuAZZ5g17cgEjUtZ7u2hMRvSPs8=;
        b=j5VX3cmPSDb+2mcZ4Deo5EU9xHLoBQwKWHsSzXpgOlXYg2UyrNO9Q0/Nynu0QXkkFc
         F1G/0TcuetJBYLun2iu0FmUxNumnBQZwCO2jTbpiPcq04A2MF5vR5G4I9dIS06xCTCa9
         KqhxERfFca4vB/ST6+IAi7THn0O8Fq3W9Lc5kVLkQnVW71MPI0SeIAt9L7hTAdwUnxRP
         yuGngLALCInKcGuMGQxhy0uxIgO0dfHgw6hDgd5HIQXW9T9rV9+vtMzSd9+KBpVPQ3cW
         cVfWWR3F9RKVjwDLXnnVBaEy5xPZbRW+/8rz2E9X3B3Odls9zZhuxml6eUArXKu8A4Ri
         +gbQ==
X-Gm-Message-State: AOJu0YzCDZMmcTp15mnGpctcB2dO+DUBkfWxg9kLUxtxoKqQZZUHVuEO
	cODU9yrCZAYlEg4Oqof9YUomv3qRRRAm/+YiplqGVpmKdeH/HXGd3dzoSPZWHg==
X-Gm-Gg: ASbGncvxfHEnI7qCG9AOWf++SNoJl2yfBZCM6A2A0VG3JHMTb3wYahnYeeSLcSNdDXN
	Q2iNKpKLJ/7QdjvJTRMziDgKHxceyANQ5LgirlBWLQ4RE5m/4cm6upIXFS+KLAbm5Gz2YEbUWyz
	K1ZT/HQymlIVoEslp4lVm3iLKES+KUoI9Jbvq/Fe6qfO5STUhbxPeYqxZtRD36h9viNz9zTQynJ
	jNmPAmNOm8Ke9iYwBxAurneZeRHyUoGWGkTq7KNmaFKbT7l3xmt0nafXBRAF1WXlFosBW9k0hNs
	tjv8bt3Vf0P8eLdpcxXavcJUvwZAA4fadZ2XxoVBj+cUgHkOdEsgcvV2uphT2OCweHxyqkyu5XI
	/tFKlJoo6xrs=
X-Google-Smtp-Source: AGHT+IEWdfK6c0dWZ+S812CSDM/gleMjyYf7l0bJUgmrHsKMHa1FjqSvKd0chCrnwzhNW+nk2v/kZQ==
X-Received: by 2002:a05:622a:341:b0:4a6:f6e6:7693 with SMTP id d75a77b69052e-4a9cc6647a0mr25555261cf.6.1751938215647;
        Mon, 07 Jul 2025 18:30:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8a01:260c:ba46:4226])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a0bfc5sm72949861cf.34.2025.07.07.18.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 18:30:15 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Date: Mon,  7 Jul 2025 22:29:59 -0300
Message-Id: <20250708012959.77522-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 01:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220004

Upgrade to U-Boot 2025.07.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 617f5a60bb88..d087525edfea 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
+SRCREV = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot_2025.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.07.bb
-- 
2.34.1


