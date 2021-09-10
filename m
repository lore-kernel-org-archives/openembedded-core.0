Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.9484.1631282900694901921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ciElwZ4S;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id bd1so3071773oib.5
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6jM73Z+3LfDB9fPmV7WLQMLHg1sJ5IAmgPFFHIzgWR0=;
        b=ciElwZ4Spz7SwHf5h34f+HJP+a+zoZert2n4FHlKXoRljQag+NwNUMIcXAnH9/pHk7
         y3vtdiODtaZ8Pt9pKYJHvsiEqLuUGWLf28QqIeRszdAzm6tGSWeZP2HmlX/DOP6oYqG8
         ioDqO6YT2LWn0kWWStjOy187Io0lxArlHrXq1i2xaCnFkegQiIUSIhnlyPR7EbH/lCwT
         85PqkjCdS0gI190UubKKenPGiUKct8/SCYnx0zeZUOl/B+OB9JE1BKkB7k32bIbGIMN7
         mV4s+e0uZTnVmaWs8manA+qa2pHtZANtZ3EvI/mGYAWeysygcymkxYgOPZnEqEA6KIpr
         lxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jM73Z+3LfDB9fPmV7WLQMLHg1sJ5IAmgPFFHIzgWR0=;
        b=o8aNktm+LbrG/H9QeKgL4WicxCbzC+7LeFMFP3zbDy/SxrqRiDq9tIAXCWXfhpn3X3
         vqzqkqCUe2gaZu/bC1sYtt4UmjvzJlT+4m6sI96ge7qK0v8wMy805r9kXxkHr0+3W9YI
         3qBMxp1e6F/oG7JSgnZPUCtPTwTqzb8goqQDb6LUUg9zIBUm08oWVlxw6K83QkoCAyAr
         hv2lEFRlKMCbDa6J59sNC5xjvMw19JNPaZE1oD9DTZcNmGERN1FdQaGTuJuZXZB1fSmh
         VVjOtgmhm46R6y4bZXvx2t5Rg0ySfxlPsViFJqVdwjUn6ctKG9qoup6cwKpFK5muQI2J
         S03w==
X-Gm-Message-State: AOAM532smisRQ4ZxUm9c8eoUC3X2p4c9J6ATg5mCdbDIJLap7vfdrH2t
	y1sI79lnqgHEH6QoxtEszMyNdNxqnoyNy+Df
X-Google-Smtp-Source: ABdhPJzXjP71TVBSeemJ5O3Qf1XfXLY81F3AofB9y2KFpZ/cQg3fANArDwLL4GmVZuDMVgNfGlkskQ==
X-Received: by 2002:aca:1703:: with SMTP id j3mr4189340oii.116.1631282899555;
        Fri, 10 Sep 2021 07:08:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.08.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/9] go: Exclude CVE-2021-29923 from report list
Date: Fri, 10 Sep 2021 04:07:18 -1000
Message-Id: <f4d308cb28d1f559ca5d219f3085c68582b0b94a.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream don't believe it is a signifiant real world issue and will only
fix in 1.17 onwards. Therefore exclude it from our reports.

https://github.com/golang/go/issues/30999#issuecomment-910470358

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5bd5faf0c34b47b2443975d66b71482d2380a01a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 3dfd671d11..50136ca841 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -19,3 +19,9 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
+
+# Upstream don't believe it is a signifiant real world issue and will only
+# fix in 1.17 onwards where we can drop this.
+# https://github.com/golang/go/issues/30999#issuecomment-910470358
+CVE_CHECK_WHITELIST += "CVE-2021-29923"
+
-- 
2.25.1

