Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.58649.1622557120603748169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QhVSVFdO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id t21so6956286plo.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kd7MRoWPvpz8Jv+L4yli2l9y31LV6iLISf3Y23AvzMM=;
        b=QhVSVFdO+d7oOjmlE6lSmQ+vBBLNbzoh85qNJ4vll+IhOxOkyRR2fmz7hBRnyNayBR
         uJ/xed+Jlxb9dibzzSsKlsxlMABK2IJPvYPkUlwHJO0TIn0PqhVaRzgsW3zpW2AMsL5b
         IId3UpYOL2eSqEUnjjK8LYYfcddwfXQ3XVIrGVxkg4QVfNfHJmvZmtOD9wNtpyUDRlxc
         kJbvV2UjYikCcHRqhEUyzNuA8x6AkqCNEWZ67mBuOR3vI1e7jAmk79234zY4rgvuEWha
         SbWgxKt5MwJJINVkodM6gg/qX105PCcVOmsQhOXTdFBRCuOzs1O2ByKpocbwAGuWxFex
         LVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kd7MRoWPvpz8Jv+L4yli2l9y31LV6iLISf3Y23AvzMM=;
        b=PlycN2fK3BB6hAte2XiUZiRjpcHmaxA+LKYjJRGujtBHTyUUCr/r4Uv6PhlqiJvBPr
         HmJCl/Wk5osZpjpKpKAwSkncVE2TtBbaCr5fyUSeLkOuHG8JA2oDGwPRVHVsrBhjc6bK
         5Kekv6XUooawV5BQdCuGN2EysCRTp10Onc2KDdL62H9O9Q3Zfh7E1UhULXROHbda/BFH
         bGi3+nDUW52e2bNADUC3otLGv7fANiFA8rCxo+fX0WuFESt232a82rdXnLdLJgtYTb5Q
         ZTuNXnCGE21qP33mn6m34A0DVU4964nAalepIFCl0u5PpPJ2OL9VmV0Odp4SwkJ8JydA
         VVDA==
X-Gm-Message-State: AOAM532S4uCuNtJGy8DkeIQlcdfnjzEb72X3/NJ/nVEgvQ/kgHc38tzX
	vPDeAMkX+X4FKyYvjSt05ycuAqTvCGaQDgMZiVE=
X-Google-Smtp-Source: ABdhPJy/zNZqelChUJ2Z6HRS9qsASdOaDWqrlnZN0YFGu3zmQ0GzXoSr9RLuDbP7ZeGQcH3+IG4jXg==
X-Received: by 2002:a17:902:b58a:b029:fe:735f:ddbf with SMTP id a10-20020a170902b58ab02900fe735fddbfmr25356040pls.68.1622557119705;
        Tue, 01 Jun 2021 07:18:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/26] expat: set CVE_PRODUCT
Date: Tue,  1 Jun 2021 04:17:52 -1000
Message-Id: <f89b497800fb3a3ecd77b7a868a02800b6c86d92.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream database uses both "expat" and "libexpat" to report CVEs

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 706bdcaec5fd7c59d7877bbefa5ed4ce5b4f3da1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/expat_2.2.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 8f3db41352..174bf4be1f 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -20,3 +20,5 @@ do_configure_prepend () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "expat libexpat"
-- 
2.25.1

