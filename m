Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.8666.1599000766247192572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hBZzN3pO;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id nw23so3949102ejb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 15:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LyU9s3a1PVM4KVUe4j5Bjrrj0XC41BZ/9cmrdne+9q0=;
        b=hBZzN3pOpRC6HjIwk6X7T7Cca10MzhCWxTCSqFUQ9Eu0AKf1oS5LfktQDujBY/4ZEY
         8l2qZze9zMHtRbH68yJ/8YLcNL2e4NJGuqzbpTwxVnJnPq67iKZjkT9bSAQCzrGi5jXy
         KWmVqMZ2ffMGfeb7M25jFyxgYI6hPjC+tyi2UZUV6gcIb3N6h6Ajq1S7044xtsB2icgT
         3hJ9IRRHrxLAwUyEqP7mfyIj8AVQnKKguLxBBSclJ0nJ1xceG4LK1jJADUly1oPGIvzY
         NVGNuVaiIPhaVnwJfDgLKKIleBZP5jDL10W88GWmZrjicFuQMMPPWkbRtIv8iVE2u2NT
         20EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LyU9s3a1PVM4KVUe4j5Bjrrj0XC41BZ/9cmrdne+9q0=;
        b=XzmfKBHv6ttjIGyowKyzAXuQBVyqswNyu/RbQtqikiwoeZWyW3QQemh3jPVyejHf2Z
         kuAPCrYvJllL6BH4uTDzEy97Brhh/xZ58ImF+KbVGtLMGarhdpFbGjVDe8xKK3HrKK1A
         zSOc2B3sHXnuhSU7faAwYqCMAOQINR6OdwncEJvYtk/gL5UttqhtjvWNnDH84LbfUjy+
         cogPpcDrZFDmXQXUb+JDgLIbTXwJ2xvwfmiviHkkMc9RaeXZAMOP4d5KTbL/se5zy5rY
         KN0kDx+jLgEGGS0z3IQH99Ff1d+o2py1bIIeptXaGapuIlZKxWjq0BgzYnTj45g06xeo
         M7dQ==
X-Gm-Message-State: AOAM531rR6NZN0B/9BEpE5h0pZr2nLD5v4PZ4W8xsBcfky+P34zS3/UU
	pA1QYRus73RjjsNdy12mvWzMIjGh0Zw=
X-Google-Smtp-Source: ABdhPJzg+SD/G+uC4SviVGizLEuA/5QRccfsVKofHAxkb/2iuiOD4WJsOwv7A1S88+ZSPF0ncWsPRg==
X-Received: by 2002:a17:906:1106:: with SMTP id h6mr3624843eja.200.1599000764369;
        Tue, 01 Sep 2020 15:52:44 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net ([2a02:8109:b5c0:8990:b114:707f:d9f1:179])
        by smtp.gmail.com with ESMTPSA id v5sm2417333ejv.114.2020.09.01.15.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:52:43 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH v2 1/3] iw: upgrade 5.4 -> 5.8
Date: Wed,  2 Sep 2020 00:53:22 +0200
Message-Id: <20200901225324.17870-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/iw/{iw_5.4.bb => iw_5.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.4.bb => iw_5.8.bb} (85%)

diff --git a/meta/recipes-connectivity/iw/iw_5.4.bb b/meta/recipes-connectivity/iw/iw_5.8.bb
similarity index 85%
rename from meta/recipes-connectivity/iw/iw_5.4.bb
rename to meta/recipes-connectivity/iw/iw_5.8.bb
index 9f58e49709..97ca66d66f 100644
--- a/meta/recipes-connectivity/iw/iw_5.4.bb
+++ b/meta/recipes-connectivity/iw/iw_5.8.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "08a4f581a39dc62fa85d3af796d844b6"
-SRC_URI[sha256sum] = "943cd2446a6c7242fded3766d054ab2a214a3514b9a8b7e942fed8fb13c1370c"
+SRC_URI[md5sum] = "98129d64212bdbb408f009c56ed5c62a"
+SRC_URI[sha256sum] = "cd9125c7e560926d66b09977fe0f75e5365ffd05a15df67d86a421dc76f96a96"
 
 inherit pkgconfig
 
-- 
2.23.0

