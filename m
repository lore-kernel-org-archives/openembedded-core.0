Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.12766.1626103974445568328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2OWhF3Yz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id h1-20020a17090a3d01b0290172d33bb8bcso13018054pjc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ak4J0QR9BaCembKS5SsDW/2uOyLjYcPQ2mPFsVz46IU=;
        b=2OWhF3YzArF5xq4zAtl/c8fTpHJIzdkzTxkG80VwZs+7hoBFwoEHk+FRE2M3lPJA3z
         s3thA4Pm/Dk0aoaa2baH0CUBWEjxCyIjw5s/7KHIBfWeSVCfU0yFfgxJ0mDRh79cwJE6
         Po+AMDEw9DPg6dV1Sga4hOMz4A1bkqgdQNYJHz9yKIf+6j89SDxR6UByPDGsnUmq5sAS
         A0jNkQdKS7lNxhhxMRywZ56xbQcxtayfEX7yya/941vGfE3pGLoOF6Hpzmh+4aRjFxnb
         IL1mOQeZmQPr2lbqYR4Osm5cEs47I3vBTOnEHmA4DuwBjHBeFfGTiTFCsGWPr3V0iVtB
         251g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ak4J0QR9BaCembKS5SsDW/2uOyLjYcPQ2mPFsVz46IU=;
        b=ogExWnsRsyxqbjqgbEUrEpjvl+m630Do4bZorFDnnJkVGxCICMLUdt04UUpls6XPc/
         qeD0P27bMrRHjo2M4w/j1vCCCl/y5NX0ijFVQTeTdtGmaoyYM6g9eVCp0N7E2RK9WDrr
         e0t9zd9AoZejJuMJ5mwK7pUcQIUTcoT79AWyAhuJ9ET8rESpVV07M2E9Tq6d8xg8jBTe
         6xyJ+uAstxx7FApye0DvIZNL9jlq8nWZBJUVyWWI7HXxt7fzzVU09pKiXHGn+O/l35Xx
         WPBBEkGjqTQomaYIt7Lr7OtZ9cQXV6BxWKJPzK+Rbggxhl8hj7JOhbYNFI5fq4OU7lXV
         TRRA==
X-Gm-Message-State: AOAM533ONBu2BUiwutZnL23rFcQI1lEHKh2geiblrT9n+ZtsANlxQmxT
	W6qcDViuf1QLxk+pq5yOCCeNIhNaaBBH15yL
X-Google-Smtp-Source: ABdhPJwOnSb9Ku7AkXNq+AHkDXfb2p0QC5SUJ33HIEEXYpAn91J3qHxjgJty/FItqi5uYQEINevb6Q==
X-Received: by 2002:a17:902:7108:b029:129:5858:b388 with SMTP id a8-20020a1709027108b02901295858b388mr43820351pll.37.1626103973599;
        Mon, 12 Jul 2021 08:32:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] tzdata: Allow controlling zoneinfo binary format
Date: Mon, 12 Jul 2021 05:32:03 -1000
Message-Id: <1e9393cae53b4de260ec951e7855d74f206730d0.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

tzcode 2020b changed the default format from "-b fat" to "-b slim".
Allow external control for the binary format.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9e8b716eb71d4526517825eacefb91ab2c1781c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index e6a0655afe..cc6206ac70 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -19,13 +19,17 @@ TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
         "
 # pacificnew 
 
+# "slim" is the default since 2020b
+# "fat" is needed by e.g. MariaDB's mysql_tzinfo_to_sql
+ZIC_FMT ?= "slim"
+
 do_compile () {
         for zone in ${TZONES}; do \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
+            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
                 ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
+            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
                 ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
+            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
                 ${S}/${zone} ; \
         done
 }
-- 
2.25.1

