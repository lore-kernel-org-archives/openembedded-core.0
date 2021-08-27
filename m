Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.2753.1630030178873618608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 19:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JD2mdhUX;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id s11so4684591pgr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 19:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l0KvZHGyCGB/h2lls6Z0O9RfFWSnA2+TcGndN6B/LLA=;
        b=JD2mdhUXoPssS5bcxzASnBCOiTnpbBPip/VOMJEhAPJzwpWfVqSXfQvrRXjKbAZPYM
         nfVKQbt3kSc4QIkovz+5W+n+LrqhgVwK/wXXq2wK8O8qrvRUTJ4T8syNGFP8PRDmd02S
         EhJKgCmKJHtxDs565CnYdP7f4Yjts+5WWrt9eJ2HlpPCoVoWfjNwR+sBPTkuAv/it0mo
         5bnRp9Nctf9AaHg5uix2xQCsRi82a+9pHQh+1r96RDP0j2l3RNYorKUAk5w4BBT4MCuZ
         /2RZRgCzTYGqQut8r7A3+xle3nqnz+se8TOQc29cSoNsNNjha99QbjA+kwTgadpNRLyO
         6N0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l0KvZHGyCGB/h2lls6Z0O9RfFWSnA2+TcGndN6B/LLA=;
        b=lHkrIWFyvQpXYQelmWYJzMhsrmEiLoWcBJRt850pKzVrGFu/6vkSPKjUsjj14bNZ8R
         Cq3pXrKpH6ReLuPm9mQBY+BlgmE9+doXwsA7tywG2dYRkYxtH8lSWPJz54OakG5EW+nM
         TvYp19moJWuYloNT9ESlm7kFsJlvPkH2h21vZe1G2K+BK5rqRZTTEppqIYMsUjykEHFB
         8rm91GXrx3uuuhOjKUhy/kUEvxfqxIgJUPCa3xmh9HP6uKbVSfuR3eKzPc1gRT4at+HP
         zG9ZPswEi3bYjgAspJC048pwyMIVn9S1BWNk94pe4Yu9JC3/zEXnuucCdgSAwl7SdwFr
         r9pQ==
X-Gm-Message-State: AOAM532CFfSP2xrach4YEFk+x/HVaGFPFO3Uw/4/WAHvzcV1Ro3slkur
	13JlY+gktMJ4Rd7aGPHt57OownYqPfc=
X-Google-Smtp-Source: ABdhPJzr6JY9jel99gBj50NZNPvG/n0B4qFXiO2Sq0T9fg5a2Kz+CE2uIavA5VLassTTLj/ySunWbg==
X-Received: by 2002:a62:5e02:0:b0:3ef:81bc:be25 with SMTP id s2-20020a625e02000000b003ef81bcbe25mr6598240pfb.11.1630030178098;
        Thu, 26 Aug 2021 19:09:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:fe04:ee7:4da9:eb01])
        by smtp.gmail.com with ESMTPSA id u25sm4065850pfn.209.2021.08.26.19.09.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 19:09:37 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH] lz4: remove rest of ptest artifacts
Date: Thu, 26 Aug 2021 19:09:36 -0700
Message-Id: <20210827020936.3700558-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit: 953f6d9a71 lz4: remove ptest changes

missed removing the run-ptest file

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/lz4/files/run-ptest | 43 ------------------------
 meta/recipes-support/lz4/lz4_1.9.3.bb    |  2 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-support/lz4/files/run-ptest

diff --git a/meta/recipes-support/lz4/files/run-ptest b/meta/recipes-support/lz4/files/run-ptest
deleted file mode 100644
index d3bfc49f1c..0000000000
--- a/meta/recipes-support/lz4/files/run-ptest
+++ /dev/null
@@ -1,43 +0,0 @@
-#!/bin/sh
-cd testsuite
-
-echo -n "---- test-lz4 ----"
-make -C tests test-lz4  > /dev/null 2>&1
-
-if [ $? -eq 0 ]; then
-  echo "PASS"
-else
-  echo "FAIL"
-fi
-
-echo -n "---- test-fasttest ----"
-make -C tests test-fasttest  > /dev/null 2>&1
-if [ $? -eq 0 ]; then
-  echo "PASS"
-else
-  echo "FAIL"
-fi
-
-echo -n "---- test-frametest ----"
-make -C tests test-frametest > /dev/null 2>&1
-if [ $? -eq 0 ]; then
-  echo "PASS"
-else
-  echo "FAIL"
-fi
-
-echo -n "---- test-fullbench ----"
-make -C tests test-fullbench >  /dev/null 2>&1
-if [ $? -eq 0 ]; then
-  echo "PASS"
-else
-  echo "FAIL"
-fi
-
-echo -n "---- test-fuzzer ----"
-make -C tests test-fuzzer >  /dev/null 2>&1
-if [ $? -eq 0 ]; then
-  echo "PASS"
-else
-  echo "FAIL"
-fi
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index 3905ef7dbc..74f6743b91 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -13,7 +13,7 @@ PE = "1"
 SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
-           file://run-ptest \
+           file://CVE-2021-3520.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-- 
2.25.1

