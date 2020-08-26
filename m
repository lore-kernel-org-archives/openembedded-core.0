Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.15839.1598458461495099401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 09:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rHJ9GjTE;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id a65so2313424wme.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xeVeNp/aJmraAzkBDIg2I7fSS+XL1xqe/cx28cpB8Xs=;
        b=rHJ9GjTEKkWThGVfaIUKwdcS05Gv7cq/JJKH2GGsKiYTrXQBUp4VDfiD6pLwfiemnl
         xSbbV3TLgjOwKRuOfxHR64bNPB8kys9GNCSNkRbtWh9FyGNq52zFLGV+nF6Cqk54Qrqq
         m0t2/YqlZYWpWo7E3pUMCkcsR47Ve2yRNUfXcRJ2MYjdK3qqN1ZR1OilBZPGqZ8RFgG8
         lPj8LFQKeyKo4YpD4MUBGx2qsEMI6dZzZM4yY31PGLjGvtFSY8D2zlEn5f+OOO+z2hox
         AIMLBkFSJpNUhPgE7Ui/YSlPw9M64Z4EraHgoSkYlkfOpyK5HMnqQBmB1+rMJqMi/Iv7
         +Jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xeVeNp/aJmraAzkBDIg2I7fSS+XL1xqe/cx28cpB8Xs=;
        b=O8kI5bvFODHjQeKf5VFfGcXTBh4dYYXZeALPBUwwrOus3YX+eiEAP5/9XtUBeGxpXr
         ry29XAdrh6P/SJuSKOiy3xqKhNnAWaGquqzopkns73bGgT/Rbba6RYykKbchBY84Jrue
         zQDyXOgVPC1UdBaXTBm1v2PvTHK2y3TEufgyJE7DWfzonFHrHTGSb4JhlWaH6/9QMGPY
         pqCWed4YrIDU0bCg8FmxM/bXwR/C85YRuAuTXtpAuXupd3DeeQIhZrtXwIATit/wLnzq
         Z0sVVtFy/HjnxnHODjjyo2FUTEXkwBftLF9LOQBad5L9XY3/t1+pu6okj6jYwk5VJZMK
         oI/Q==
X-Gm-Message-State: AOAM531t1kkOmTXXcXtnEL/RSJ+QA0oMFg+Zyqs5srzsu1TRrgu4VBYV
	QckCZJKgrKPmC0nDfxht3eS+r/llF0Y=
X-Google-Smtp-Source: ABdhPJysmYHq5cm3+k9Jb4G0vH0+It3bYhOkuuruh7H76j21GQCeqWY1PSZW0geUZBnkvCX2DSQqhw==
X-Received: by 2002:a05:600c:21cd:: with SMTP id x13mr8237145wmj.155.1598458459452;
        Wed, 26 Aug 2020 09:14:19 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id q8sm2372868wrx.79.2020.08.26.09.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:14:18 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH] util-linux: Set license for pylibmount sub package
Date: Wed, 26 Aug 2020 18:13:45 +0200
Message-Id: <20200826161345.1792249-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/util-linux/util-linux_2.36.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
index 2fac9793a2..7476e60784 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -6,12 +6,13 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause & LGPLv3+"
 LICENSE_${PN}-libblkid = "LGPLv2.1+"
 LICENSE_${PN}-libfdisk = "LGPLv2.1+"
 LICENSE_${PN}-libmount = "LGPLv2.1+"
 LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
 LICENSE_${PN}-libuuid = "BSD-3-Clause"
+LICENSE_${PN}-pylibmount = "LGPLv3+"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.25.4

