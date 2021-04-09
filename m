Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.8804.1617973185294750099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YqGTRH/m;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: wallinux@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id w8so1032303lfr.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3cwykghH33hxzgvPbhjrMLcSD7L+N9PbYyxRB3DDNww=;
        b=YqGTRH/mLAXaCqO2dI49RtMGTM/Ka/fCH077HsMZziee6o6PRPNluVBjCjujb7FG8F
         j+7+4SG00b5/b5gcpYBUmh4m44NsgwtDNEcq7C7JCEjrVT3yufzQMT/XwDJijoJQUMGz
         o9QtMtqVf8DmJ7lMR/weFTCTjXod87+jTLIHjXIdIdBq5CGqB7cT1MxolQDlZ6LIn4H0
         l5cAyAI5SrGn3Ej9+Eoi9Bah+I9TQVb+ZA0C/N79sowrSz850ZSE3cEZN8hLvceM1wFr
         60cfyLYbyG7SkFSZEyy2EMHlZzOLO9h+l95SOGgii75B9Fpp5pGbvuOjBCfSKo2mGT0p
         pOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3cwykghH33hxzgvPbhjrMLcSD7L+N9PbYyxRB3DDNww=;
        b=D606U82bgTfxkHB28akoPlHona7h4wVDtqeFLMUBSTvBfqFY4UIHv0cjSfzxVsvp7v
         sQOGrV/w1vqgXnrpt0HsSvugHF3TAe1HSfrjpnaUQPYyXqOhaztGfsA1TsUs+v0micRQ
         T96zkE3j5T1MO1m7vDCY0YkWfElsYpJeuq6dlSkg4ixq9ywnQ53NMikYM9Tn8roiT02o
         1d9nmh3PnkmJm+OcKaz7nGJCPaks2ErycaXaRXmlryrTBYrJm7tVEEYrC0kkzzSKChkm
         ez/5BT8vqjY1WZYG/hUY58w4eKUSwAjuzDMXDmWA17F6q0UjS36FzEKN0EI2lt3KgEbL
         z7fQ==
X-Gm-Message-State: AOAM531lkUMJdQbw5RuNuNC00awONddvilWfzhAEQT6Az6HaIp79WXsn
	ETDPHs6PF8ZqQy5gRgK4fA5+jaydcG5aCA==
X-Google-Smtp-Source: ABdhPJwkbFvK8jpQgvlUUw1ev+6MEiM9lgzTDAS3TXQYdArWli34j2QlXYG0NwJSj69NsOa22Yi4Yw==
X-Received: by 2002:a05:6512:131c:: with SMTP id x28mr10223016lfu.638.1617973183172;
        Fri, 09 Apr 2021 05:59:43 -0700 (PDT)
Return-Path: <wallinux@gmail.com>
Received: from arn-awallin-linux-l5.corp.ad.wrs.com (h-82-196-111-243.NA.cust.bahnhof.se. [82.196.111.243])
        by smtp.gmail.com with ESMTPSA id m19sm264306ljb.10.2021.04.09.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:59:42 -0700 (PDT)
From: "Anders Wallin" <wallinux@gmail.com>
X-Google-Original-From: Anders Wallin <anders.wallin@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anders Wallin <anders.wallin@windriver.com>
Subject: [OE-core][PATCH 1/2] lttng-tools: Fix missing legacy test files
Date: Fri,  9 Apr 2021 14:59:32 +0200
Message-Id: <20210409125933.588721-1-anders.wallin@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tests/regression/tools/save-load

Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
index 7074096ee7..281107db2c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
@@ -69,7 +69,7 @@ do_install_append () {
 }
 
 do_install_ptest () {
-    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/load-42*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh; do
+    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-- 
2.31.1

