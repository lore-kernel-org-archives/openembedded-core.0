Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334E4C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:34:57 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.59524.1718638488985248628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 08:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=huuGV1Or;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6819b3c92bbso3628986a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718638488; x=1719243288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aYuGscRn+TJ3SpSraaXI8B+fgwp1JlKkoYlSpQjClks=;
        b=huuGV1OrFmHZdxpqpHP8hnFV3jTsLc8iMK8FOTgt1FkDlSSG2zkzXzyLe8ktg+jtTl
         5n2yykZBQWqkf9ivbqCcmjdbnyIcPm2SYmD/j1znmxHYU10nlPNfRV7mF7LfIa1R4rJD
         dbNXgGKWPU50t+ZvmgUI0cjUGUM3D0npLJYIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638488; x=1719243288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYuGscRn+TJ3SpSraaXI8B+fgwp1JlKkoYlSpQjClks=;
        b=CvvUwkK6/aR83kYFySmrB9dXIbzmB4vlKI6trvpFP3H9freFdDmiVEjGclpN5w6nL8
         GY2cB2bktIvtgbbqwXyIJyaNN6S8+m+a19gm0jwOXFisG2q5f0VRkDv2b/joOoM6rblW
         VBGk43AFhnS8hhQogtO8j5oBerQxImZ74K+Qa/aPhAgs+0DJ7i2zvSZYm4bGS4W6gvZx
         6Gb/XVSjS1LACMq3aQwyyt9CBFtdAvSlPo2kqaZJqGvKYP2avs2+b52wROT0kAvV2LHB
         hA0ZAPlhtdovbcrjkI15w/oQsx566jvQOJzul7Uhgzj6UryTxf3yPIgRa1qSm869DmUI
         2Tig==
X-Gm-Message-State: AOJu0Yxuyj4Aorcj1c1WMul5dpveWMN++Lay6LfsDza8mg7XyZvQAZum
	ZHEDWlgILT/ccV4vLCUO6kZ4nNiXK8G0yNigfzXXbPLhcsUGNynfnGfsCWkuIX7j/O2rm34aidB
	5
X-Google-Smtp-Source: AGHT+IFY21Rt2vhsIsToF90oHscTwwUFmkRo59MMtGSUlfJE5VLgnkyVbtk63CQwPbyKYbI1m61Opg==
X-Received: by 2002:a17:90a:5996:b0:2c3:195d:8cc1 with SMTP id 98e67ed59e1d1-2c4dbb41a95mr10830898a91.37.1718638487991;
        Mon, 17 Jun 2024 08:34:47 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([117.228.116.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4cab602e3sm8796298a91.8.2024.06.17.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:34:47 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] libxml2: Upgrade 2.12.7 -> 2.12.8
Date: Mon, 17 Jun 2024 21:04:37 +0530
Message-Id: <20240617153437.9089-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 15:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200846

From: Siddharth Doshi <sdoshi@mvista.com>

Changes between 2.12.7 -> 2.12.8
================================
Regression Fixed: parser: Fix performance regression when parsing namespaces

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/{libxml2_2.12.7.bb => libxml2_2.12.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.7.bb => libxml2_2.12.8.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.7.bb b/meta/recipes-core/libxml/libxml2_2.12.8.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.7.bb
rename to meta/recipes-core/libxml/libxml2_2.12.8.bb
index 84601c282f..fb103f0273 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.7.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.8.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "24ae78ff1363a973e6d8beba941a7945da2ac056e19b53956aeb6927fd6cfb56"
+SRC_URI[archive.sha256sum] = "43ad877b018bc63deb2468d71f95219c2fac196876ef36d1bee51d226173ec93"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


