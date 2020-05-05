Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.6814.1588713103281523257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 14:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fTx1G6nK;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id u127so58446wmg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BSPr7IicKe6f7PgIUWoblWi4qXxLxgfzGQxqZEQqzjE=;
        b=fTx1G6nKZw2gIMmB0ubaDgN221vcc0wKGlyZQAaPvYHD1TZDCsFR54/WH4xUw3GYhN
         LZYILz9Bk492o8iI6Tf4SvIgEtFymYWX2/hsB67bQ5pwCCgCL6WZGqo/LyKWVjG93Ljt
         mt7hgql73eoXyMOudXCN27y5JX+8NWMZbkdfNCXl6a8rJ/8ELYJ0ApJZor/6BuLF2qEB
         OsBT5lbnzt0DLqzu/mHy3HlyXtHMXeKsKs1PWzsyKEsdsdwixfCOsttZkQfOAjOi2Ijx
         rV78orMJhjfEyL0Cs63FgjY2ZdFImsn3FjrLyRVStcvjreo2Ida3WwNphvVjEYJZg2LA
         XhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BSPr7IicKe6f7PgIUWoblWi4qXxLxgfzGQxqZEQqzjE=;
        b=EvMTOB0+lZsWgo8yDKEwN263S8xcGXSaDH8RaMUXbm0mX1Jjc1f9OCUlbnpc8ly3Y/
         6trEGRlCuuZ7c/I9BllUpZOVXCYG/DNZI/9S/l7KneXrw0jGBs+9e5MPEEKVOllZIRnN
         U96c5uqcSLuiWYk/PqVz4UDI01eSPp5GQsXSxDbehnjuDZCdtLj6KvZVJUdec5Y7pYbe
         mnKH5XgeU+D2hDTONI6XZlzquWTAjDCcK98pyJBZLoIuUFEbeR2MGKv1Ho4Dw9+KkyvK
         7fX8SnvglHbq+FjK6aFB9DdWySGcsxjsi8gQCi4OCmCaWiEr+bzm2ED/XuyZxERd9q/S
         tmVw==
X-Gm-Message-State: AGi0PuaU6jAU0pQ4jAtRrnIafGGA2kEq13xpdpM4zrNXlyj+mxco+dXn
	tPZAeJhvvKVqvrQyw0OSOwzxMy0s
X-Google-Smtp-Source: APiQypJU+FOxSMSu13vaOgH1Z2WwD/K3lUMVwKo28lfuco1KwlFXK1EmXtz8xCRLn7XX7xKjC1XiyQ==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr522606wmc.59.1588713101627;
        Tue, 05 May 2020 14:11:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id c17sm4681939wrn.59.2020.05.05.14.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 14:11:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] vte: add icu dependency
Date: Tue,  5 May 2020 23:11:13 +0200
Message-Id: <20200505211114.2519-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is new in 0.60, and needs to be added explicitly
to cause vte to rebuild properly against icu changes
(there will be a QA check to catch such situations).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vte/vte_0.60.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/vte/vte_0.60.2.bb
index 3891ff8165..a722e152a4 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LGPL3;md5=b52f2d57d10c4f7ee67a7eb9615d5d24 \
 "
 
-DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native"
+DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
 
 GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_OPTION = 'gir'
-- 
2.26.1

