Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.4179.1632003289624251923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 15:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com header.s=20210112 header.b=T2VgV443;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id z24so22726341lfu.13
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 15:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcpgPSpuj7KVN0PR24rBneo+KTnrQXtM3MdH9w12y8E=;
        b=T2VgV443/VEWq4KZEg70ECM7G2utxTPwgKOoIWVHhJ9fE3W0I5SXcuRlHbiCIhSuu2
         ASQnt43nTk1YijFNzf+f9Mo+KV7kB0dII2r1xrtCfUj+rH0IQ834FlIudsAKl2gymgez
         YYKQ/xtTS3WKkB2EqCYipJsWrtYBzikuq8cIwZLEVPBTTAExzqWxB2++sCI2Hmfper8h
         L4Q8y//2Mptjyu/Rl0PZ8oJ8UvBOxUW+aOrovf2bRHUZ39Inx/eXFVHdrq8Vmw3F6Yfb
         I434d4yS4qeTUwxiL2MjvdH11mn05RmhTPEUoEy37pTC/QfU4uU8zIH9Bvr5hHuI9EWr
         pZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcpgPSpuj7KVN0PR24rBneo+KTnrQXtM3MdH9w12y8E=;
        b=c6b2M0vwcR/laZtVGcoy9xKhiEwBowKzQNOA6U02dyLAEZPXu+u1O+WIx8VAE9PxB7
         utugOl0NYl6/IqeA+aJja6hE0zXOy8AL/9Uz3yOM9E5bCGbMrVVINuFAqc8ounbYjNDP
         P7jpVSPAUcqO9+G/4PXvoQLFtW7E0pvL/SnV7b4fLkMWxGUWxup5xmeQ0YUQxkcHik5R
         ic1TRXrphdtX5loogeyeUcsgDsDM+NxBM6e1W7ge1NohS/cvyErJX/WyEp0tUlrngyIv
         MdK2GvyhtOtPQbAyTZ1HchFKOFENFggjF2MFcmkiKxzr4FkOshoxDsue1n9HNMdFrNCC
         t0Lg==
X-Gm-Message-State: AOAM532c3ZN9NK9OKh0g+DEc3MKK3i+EgQYQt7eDGzhd+sJgZtLVDCnV
	8F62WpYxOk6Ll9gSp0WWU4z0M1OEwqrDDuRW
X-Google-Smtp-Source: ABdhPJwaTHrIAtHUVmvaoj5bl4hFA5MDqROcwDZVp+UH7pA7M5u7D+VdJXgiz8vOd3XOhViqpQpmVQ==
X-Received: by 2002:a2e:9944:: with SMTP id r4mr1642592ljj.220.1632003287691;
        Sat, 18 Sep 2021 15:14:47 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id a4sm769498ljn.122.2021.09.18.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 15:14:47 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-dbusmock: update to 0.24.0
Date: Sun, 19 Sep 2021 00:14:43 +0200
Message-Id: <20210918221443.2253382-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-dbusmock_0.23.1.bb => python3-dbusmock_0.24.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.23.1.bb => python3-dbusmock_0.24.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.23.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.23.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb
index 28e99299b2..271a2b105f 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.23.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "b5c36a9c9935d1867cf79d8666b08ad906660e6d4d967e9fded4361ad7eef54f"
+SRC_URI[sha256sum] = "0be0d51dba4aee050bb2cd9074a377bf9308306df1eb7918038c6ffe7153c272"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1

