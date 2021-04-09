Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.8805.1617973187242398095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 05:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q3v5+qdR;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: wallinux@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id b4so9560412lfi.6
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ITG5jehp6C18GGV28GrSSbtLfJ6RhxaZd4p5SKCp9P8=;
        b=Q3v5+qdRS8zzOHI/6sDY1T6SQ8Wo18/wjNvv9cbWwgrN9fA87twm2sQbSloew3l3OO
         bTJBqtN/Lh6ozNtCgMleSDiCq9eIzf05D+RSgtGC8/u8Tlgj2BzcIJvIVOJ9CFdZgFGo
         KvKBEfoRP+gmVoVq8BAtBK0VKk35HiPsM+zrnOthfOE2iKs+++VZhbl92NDddo+BmT0E
         tV8mbdxY1dRbd9pIX9UjN5FC2X3Os8HRMLxN1aa6ESSNraGM4E5wwoyJrCp75+F4V40O
         UMfGiPPwzUAVRq1fqTCpdmhQ6nlkFsaqSXiMpykb7WShLE+JADf+qiQ8eSM2BTco/1/R
         yr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ITG5jehp6C18GGV28GrSSbtLfJ6RhxaZd4p5SKCp9P8=;
        b=W3ptl6Uy808nm/EFZ2igSJjy0z+d9znacRTVjHthZbm2JJF39yJ25nJH0jURH8aMG/
         ZWLKDIFYh7DRAJPpFKddx1JC6DUkozLfBhfFE9xSos4mt2XlKsS2cRGhb5ehaNnpdaef
         FW1GZfwDappwGNlAqd02a/xw8wWFa2S9MmSP3l1M2i5aSJzUtkqMW3bGG/JH+oY6VFuX
         dCWcLZ8ZYMavAY7jUEjoiAzjsTXhaEKNOcXh0EiSMDWkN57Viv2rTS5o4W8k42bbq6xo
         uwZjr6nXTOeKM+HcqzwcrduzLX/bOJzl43atCTVsNRyUpeC45ByZ7yRrOatR90rJUwH1
         yd0Q==
X-Gm-Message-State: AOAM533IX/jP2gGXRdDdqcTleU43GBe8G+9b0EXcfMKkmZNJ1T3uhfpX
	T3cFOWbuZ0yg5rV2bh3iVPYVXsZjkwrNGg==
X-Google-Smtp-Source: ABdhPJxHTQcb6keyAOlW8pRyvr179ghXT1BFu5oZWE28tVxgVoYG2s33DT/bf1YbA6TpXHHHjcTmZg==
X-Received: by 2002:a05:6512:2fa:: with SMTP id m26mr10542325lfq.372.1617973185304;
        Fri, 09 Apr 2021 05:59:45 -0700 (PDT)
Return-Path: <wallinux@gmail.com>
Received: from arn-awallin-linux-l5.corp.ad.wrs.com (h-82-196-111-243.NA.cust.bahnhof.se. [82.196.111.243])
        by smtp.gmail.com with ESMTPSA id m19sm264306ljb.10.2021.04.09.05.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:59:44 -0700 (PDT)
From: "Anders Wallin" <wallinux@gmail.com>
X-Google-Original-From: Anders Wallin <anders.wallin@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anders Wallin <anders.wallin@windriver.com>
Subject: [OE-core][PATCH 2/2] lttng-tools: Fix path for test_python_looging
Date: Fri,  9 Apr 2021 14:59:33 +0200
Message-Id: <20210409125933.588721-2-anders.wallin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210409125933.588721-1-anders.wallin@windriver.com>
References: <20210409125933.588721-1-anders.wallin@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

" was missing

Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
index 281107db2c..6132daf1a1 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
@@ -155,7 +155,7 @@ do_install_ptest () {
         -i ${D}${PTEST_PATH}/tests/unit/Makefile
 
     # Fix hardcoded build path
-    sed -e 's#TESTAPP_PATH=.*/tests/regression/#TESTAPP_PATH=${PTEST_PATH}/tests/regression/#' \
+    sed -e 's#TESTAPP_PATH=.*/tests/regression/#TESTAPP_PATH="${PTEST_PATH}/tests/regression/#' \
         -i ${D}${PTEST_PATH}/tests/regression/ust/python-logging/test_python_logging
 
     # Substitute links to installed binaries.
-- 
2.31.1

