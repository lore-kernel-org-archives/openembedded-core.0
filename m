Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.5103.1613644786910821431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 02:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=u3nG7Xz6;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id v30so5761911lfq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 02:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DIEkcq7StOPNtfSO3kkuibxWitPp1sx0BMdvkKMldg=;
        b=u3nG7Xz6sPvEwxq2CqtCKMcLXuUcB6rf+tVdRUEFdU0MIc4eoN5lttOkYnCo30oy8E
         SX3eTNU8K3DqXdibzpUrk/VmKO+EHfSdX8c1SrsimCcmoArw/reel+the3yEucTXdCr/
         fq7ZCGIFa9gDrNgyyy3COUNVQ4mhxqucPiqnKxfbSKHuT/1aBPXaseJfMS1wJrawaqm3
         FYK6OqzxOMM2TFQwYZ59cVZUDHOcUsvy/MWF30Mdgu294auHt0U8jyhSXoydCWQXJFFs
         0GOm/V0J5cQ+Nc8ecp0tFNFraNZ0pxKFu0SFyHsm2S45sC57mkMEtRYz8dWEjWzqTFmN
         fJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DIEkcq7StOPNtfSO3kkuibxWitPp1sx0BMdvkKMldg=;
        b=eLSKIdwQXWgZHQcgRaWO7sLIUD5D2FSM9rjd1ovsBSajLtVF1Gj+Kklc4iJInmRf7J
         1lN5zvAb5tASNyiAzdsJFt5J/y/8KaYZUvWR/shYHq+frnvzsLInlPefA/BBh95u0xbm
         QMmjrrkxK/ZwP9KT5Zfxio6wW4OC4HuOotq/4M1jzuql3zkl7ZUQ3/jSAAe2XxRRCbCQ
         BgBEVBy9FqxUkqeUM2Jmbi6SqL7ir7RJRuydojH4XNX+BwG9hB3p0kI1WDn7W4dt6vrt
         8qi0r9o2sdOMlnDAKO5Crlgey8rulChA80tZ/UuUrkYaMXay1BUXBHVZsatpAT2OT0aD
         SuTQ==
X-Gm-Message-State: AOAM532WVkMPeijXAM6vAfV9pwnFdABxUxPNykNMg/ra+WDHZ9fJ+sam
	6HWRTvs+KIHAOLSi+QbgJbIyJgXUQdvf8KMS
X-Google-Smtp-Source: ABdhPJyYKn51iJCJh4l4ZaDv/mlPS4Ubfe/NKPgMWJNL+5kgdqo/fzBtV8hd11hLCwiAygYnHXJMIg==
X-Received: by 2002:a05:6512:971:: with SMTP id v17mr2223633lft.580.1613644784323;
        Thu, 18 Feb 2021 02:39:44 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id w25sm559343lfe.295.2021.02.18.02.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 02:39:43 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pygments: update to 2.8.0
Date: Thu, 18 Feb 2021 11:39:35 +0100
Message-Id: <20210218103935.1761071-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-pygments_2.7.4.bb => python3-pygments_2.8.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.7.4.bb => python3-pygments_2.8.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.7.4.bb b/meta/recipes-devtools/python/python3-pygments_2.8.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pygments_2.7.4.bb
rename to meta/recipes-devtools/python/python3-pygments_2.8.0.bb
index 24bbaaf38c..4acc2ed7f4 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.7.4.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.8.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
-inherit setuptools3
-SRC_URI[sha256sum] = "df49d09b498e83c1a73128295860250b0b7edd4c723a32e9bc0d295c7c2ec337"
+SRC_URI[sha256sum] = "37a13ba168a02ac54cc5891a42b1caec333e59b66addb7fa633ea8a6d73445c0"
 
 DEPENDS += "\
             ${PYTHON_PN} \
@@ -13,7 +12,6 @@ DEPENDS += "\
 
 PYPI_PACKAGE = "Pygments"
 
-inherit pypi
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.25.1

