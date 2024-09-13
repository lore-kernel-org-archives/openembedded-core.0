Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6817FA373F
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 10:17:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.70227.1726222669014812211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 03:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JYWAKaZv;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: pdoshi@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-205722ba00cso17237515ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726222668; x=1726827468; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIPDXELIWqEjGGduZsGoxLDKzARZ3firpP2dTQ3nHVE=;
        b=JYWAKaZvWdWw0zQaD6jGOG9TETGhQyaZGTYr3dogx4JrZLTJkTPmSRGLMxiy93FD5G
         Sdy8NAA+VyF5wJKUNUi2EOUF5L1ina6x7mH+mcAfaGAGHzIcBhCEE0Y39siVos5m5Kq6
         pQ3+KK1IHnYxTpoPQpPiWqTkRhtFIwmgKXhyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222668; x=1726827468;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIPDXELIWqEjGGduZsGoxLDKzARZ3firpP2dTQ3nHVE=;
        b=cj6EoHCBDmYN5D8efPLlof5LTX4yLCgj4zuPDwn3T5KM7a2xI6EHrP+UvAvg8Ardij
         vjmADbSMphQdbgvfq2vD7P0xW8w17lmVH5zjWCy3aiSD2EkZ5M8X24Sb5sSGTUJeiNnX
         Xb7/my/RTUYo+gDU1eQZZlf/zCZANwmuZC+r5lXahcNYS0WcNr92Fm7BK8Ro1uk6O7zv
         LYvXNAZag7bREVQRWK0pMbTvxF86osw/cDDQvRNczqtsnDDGZ8X2+55s+4EY5pUpiBZ9
         NCOZKyvlTcPpVgg65Wbo0b/UxWj1LUiaV3r41AkrRAtEByTBcrCqnU1sv+e79yd9XSRW
         6FuQ==
X-Gm-Message-State: AOJu0YweJjpUhYXaTUVKzIX9bmf8/BMDK6vNYYoOJPHSW8Tx/Eb6QrjG
	j/jSIlGsX+Y8suEdNjZVF3ldakJVFD9ycutpZDPtTcRhewgN0gFU6CSWyKLagrZW3pABwtGBF6X
	q
X-Google-Smtp-Source: AGHT+IHu3OSI+osSvwAERKAjPKSg+DQ3skz/JBcNI0bcfCKWFIotxDLfUH/OPBKuPX+fr/mpJpnE+Q==
X-Received: by 2002:a17:902:ce87:b0:202:4b99:fd3b with SMTP id d9443c01a7336-2076e46301amr81623725ad.42.1726222667930;
        Fri, 13 Sep 2024 03:17:47 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af456e6sm25726595ad.69.2024.09.13.03.17.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2024 03:17:47 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][master][PATCH] tzdata : Upgrade to 2024b
Date: Fri, 13 Sep 2024 15:47:21 +0530
Message-Id: <1726222641-9830-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 10:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204477

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adc..adf0952 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.7.4


