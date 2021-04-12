Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.34289.1618240650539837652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GrAdYEbG;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: aj.bagwell@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id sd23so12243474ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kk2kELdJqMUvIT5uVBR1vFG+5LVX07s5TAQpJZFe1Dc=;
        b=GrAdYEbGYQxXKYbFQ/RUZ2MmNAlX/I9Fok0+4iV6k1WLpm3t3CKt44DM5TXdxCUbIB
         xj9lnhWtnG9CwaHPkPfqQ0hyRP8hgzNuiYzxMdyAPSFdftJrP0Rugq/ViW+F1u222O+Q
         6CXy0w6HXuRR9NWg4ILRMFmvpo0Kq1IHG7XKq/AuNB9XTvykdDFdsv+68RgcSOHqk3Yp
         Byv8pH7GRyhoMVhGiqjWhipf6XhDA6huNL7zksIK/6Q9A/IXFZW+EBzW3J9CymvSgqJN
         LxEult5hgk7jNfZOplLONRmCnqH7vsCl/hcvgOCRE/Ths/V/H3ByNfYbElUfmWMKr+8M
         Va1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kk2kELdJqMUvIT5uVBR1vFG+5LVX07s5TAQpJZFe1Dc=;
        b=CH1FaThfb760GTaK5rKGRJYrmwZw51cEctC5quKO5eTYrW3gp+Crl7w52FBC8pG3S5
         rST+yRLTj2g1aKd6BHOgn5/xXHwIvwZxfhvWs5C1I/IBc3LuRXmdLtwSkTEuNVZHUG7i
         aBNkJmKvf+7M4Z3jPQUbd7u+ziQRctPL/fbvqS6A2TNpi4b4YhLg7VCh9H944zPKB/ND
         mYF0cR0dmdiJ5cuwwx1+N2Cxr2yoccjcp1MC2lx+7LSTjW7k8FAbtxbGfD9/ZorJNri8
         rbqKYvgtgSVVC/gA9F6x615ZsypstnO6asZogY/S3Yzf6YqR+7R0bX1cWFQNos7iek4j
         FjVg==
X-Gm-Message-State: AOAM532ri5W+zskHW7hvA5hIyl+wL8zZtlDJK8XwcHf7WMp+X5qS/R5F
	8ul8E8DKbu1HFVf6ZhKcy+76yaJZqN4osQ==
X-Google-Smtp-Source: ABdhPJzqfaLP1fv+Vx3DUd3wj/5Cl+vp3qUzSa6uGAa7fTFFjY0D7uUZpoUbiSovhEbMKqXINtqoyg==
X-Received: by 2002:a17:907:c28:: with SMTP id ga40mr27507476ejc.444.1618240648801;
        Mon, 12 Apr 2021 08:17:28 -0700 (PDT)
Return-Path: <aj.bagwell@gmail.com>
Received: from CMM-C02QQ1FRG8WL.localdomain (cpc108959-cmbg20-2-0-cust309.5-4.cable.virginm.net. [80.0.21.54])
        by smtp.gmail.com with ESMTPSA id hc43sm6041103ejc.97.2021.04.12.08.17.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 08:17:28 -0700 (PDT)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-core@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [OE-core][PATCH] systemd: upgrade 247.4 -> 247.6
Date: Mon, 12 Apr 2021 16:17:08 +0100
Message-Id: <20210412151708.52522-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../systemd/{systemd-boot_247.4.bb => systemd-boot_247.6.bb}    | 0
 .../systemd/{systemd-conf_247.3.bb => systemd-conf_247.6.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_247.4.bb => systemd_247.6.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_247.4.bb => systemd-boot_247.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_247.3.bb => systemd-conf_247.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_247.4.bb => systemd_247.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_247.4.bb b/meta/recipes-core/systemd/systemd-boot_247.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_247.4.bb
rename to meta/recipes-core/systemd/systemd-boot_247.6.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_247.3.bb b/meta/recipes-core/systemd/systemd-conf_247.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_247.3.bb
rename to meta/recipes-core/systemd/systemd-conf_247.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 098bca98f1..7d3b3064ba 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "069525e84a67375e27429cb490e8d28af78e673a"
+SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
 SRCBRANCH = "v247-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_247.4.bb b/meta/recipes-core/systemd/systemd_247.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_247.4.bb
rename to meta/recipes-core/systemd/systemd_247.6.bb
-- 
2.24.0

