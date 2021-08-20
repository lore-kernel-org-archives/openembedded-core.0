Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.82510.1629454214290703076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 03:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nGIciYqL;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id k29so13417158wrd.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 03:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXdygwsNMV1Pm/FrLEQrMhr2hQ76T6e8PWedcT/OUac=;
        b=nGIciYqLnhBN9aJA/LPk07icbdG123ozkXUUxRDLxewf0cPncGh3oiJ+A0XhCN/WaF
         53RBQD8Yj129wWHHeky0BwL5ld6Zf/WD/fC6IYmNKsutzLO9rcYkI3h3t8hR2ZTo9iy/
         MxBhwVDjJjZvTfYGcdw1zqSVVrnYWwndqg/3UdZrGFmKRcwKoocOB4xzdImUSQ2VHAQ6
         iCBa8JNyQAfSQGo6FxD0tbP/BPE37g0WXsMQJgTsugmIm/WYKf7ZKDiVondG3N/DRvX7
         Ae4d+CrAb6mhKZHfnvJKcfCriVvXb7l7DMYYm84/7UxHPJfMOeUgvpzym5Y68y/esHR8
         U+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXdygwsNMV1Pm/FrLEQrMhr2hQ76T6e8PWedcT/OUac=;
        b=ml82UiwEM4DzTWoHrf/s+quf61C4gt4X3A1obMzK1lsNHz7d6vl1y3AYkKS6AZNooI
         QQpv2CXTZ44mwKQC16ypep+Xxi+U2G/1000S2vo5A1NEWwZg4Bq+7fKqtGRz/xRzbGAt
         8BpAd+t3WNZTTLa/bWeZ0pdBiwzbmNjpW55YMaYkRL0mOlJutEfBhdNBYqxdI1dpInIP
         8kLDd8KWkHR4XANMpirMrqW20MFa9puesjiIg+wduSI4wtHWHAETyq7w8PWnhPKQFNaN
         DMddRGRm55KBH6X0X+SUkx+lnF03+LNQO+PbsOcx+7k4+HJhmxn075pECAFjJJYONmuR
         IprA==
X-Gm-Message-State: AOAM531cLN19z3YiOGx10LMj1T+XC4ZRFTUk53/BtXOFXGHgpm0JWhfT
	kOlQ36t4kJfOTNYWT3NNQX6ua48VVdJEKQ==
X-Google-Smtp-Source: ABdhPJxx3jiSjgIosCzwg+IaavBYt1OCJNzJX8TO/DeaP6MOifzhHLxLKxcjFO6mtybJX2wy8hyCtg==
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr9002984wrg.386.1629454212601;
        Fri, 20 Aug 2021 03:10:12 -0700 (PDT)
Return-Path: <rybczynska@gmail.com>
Received: from localhost.localdomain ([80.215.234.191])
        by smtp.gmail.com with ESMTPSA id e4sm5485143wrw.74.2021.08.20.03.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 03:10:12 -0700 (PDT)
From: "Marta Rybczynska" <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	denis@denix.org,
	ross@burtonini.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [meta-oe][PATCH v2] lzo: add CVE_PRODUCT
Date: Fri, 20 Aug 2021 12:09:38 +0200
Message-Id: <20210820100938.296569-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lzo was missing CVE_PRODUCT and related CVEs (at least CVE-2014-4607) were
not reported.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/recipes-support/lzo/lzo_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index 85b14b3c5c..f0c8631aea 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b42
 
 inherit autotools ptest
 
+CVE_PRODUCT = "lzo oberhumer:lzo2"
+
 EXTRA_OECONF = "--enable-shared"
 
 do_install_ptest() {
-- 
2.30.2

