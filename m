Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.16103.1618418421724849374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 09:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p/KxbNtJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so6295897pja.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4NqjaJSg7dNg0ceLyJYKdacHiiujqudXEiTyqX7vTk=;
        b=p/KxbNtJcQpi/h/nDinpuTiZl9EdMyyre4MQd8irz86kE4Hu7fd9wdGqo55IfG83Bn
         hfAz+qza/rxJprjXLUJ1JtAjC5hEg+NNl1OWQWmGUiwrHmrusJmXkC9JSnDdPeOQFDpk
         kTRBe1u48xXPUVG+WXCghjS4HGekc88Zv4OPSe0Qcb1ahfaUO8dkNajzrCsTqzH8EQ3Z
         RDd7TH4XsGzlHsNWeYL/l9vf3qzjhGQ/+mw+rxsQuwBzIB70ClZ78X/Ky7RsSR/tZVg+
         85ofD9aYUyi40Y4kAFdKyTPH/ODKKFg6aRTQWKYDCXs0dNYRrO2i1moz02zSN2FVA0uE
         desQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4NqjaJSg7dNg0ceLyJYKdacHiiujqudXEiTyqX7vTk=;
        b=uLw6CwK/0z+hXwT48G/pgco3R8Ry9X6Sl2JW+tIhoNLUiB6qnunnRAFHp8nPuWRINI
         dlTrPv6pes9dVo+ROs7KcNU4mzUGYU4r1++DtuBUbyAdgxarTVXipDQ7PQ8zvbbLJTOp
         3xOfuLrfoIn3/Osm4t5A9UPRRBz8mIBXznypt5L9OE1hynvlFsDG6muEvmBVMTiSsUoc
         Ycw+09yJDcIJlso+ulG6RYTR1H7i8HgJUgX5l5DwI5ZdV01GgRWIPGpPwE0aE3pjSXOv
         WUNhtx4w/BjTh4ggs0o6hAiU7bwTNBAqtcoMb0ZJlU5saIAf2tWQddJCZ+qPwHaTZ84a
         UFoQ==
X-Gm-Message-State: AOAM5320FMBxP4VvzV4hvH0IDnTquSt02BvaqhF2X1cmM+QjMO7h7JZi
	SSOibn6xWtI9o0+Wp5pJhdj8u5lzHoRUgA==
X-Google-Smtp-Source: ABdhPJykzYaPZHOQUFnl7tqJ67zewmE8O0eoF6hmMV2Hw9l1jvvA3l0/iHPh038vgkfzdIewiE+xCw==
X-Received: by 2002:a17:903:2490:b029:e6:faf5:86df with SMTP id p16-20020a1709032490b02900e6faf586dfmr38048728plw.69.1618418420917;
        Wed, 14 Apr 2021 09:40:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id s1sm93832pgc.28.2021.04.14.09.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 09:40:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [v2 1/3] valgrind: Delete trailing whitespaces
Date: Wed, 14 Apr 2021 09:40:16 -0700
Message-Id: <20210414164018.2027379-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 2eea84c229..eb7b9d2383 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -55,7 +55,6 @@ COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 # argument. Change expected stderr files accordingly.
 do_patch_append() {
     bb.build.exec_func('do_sed_paths', d)
-    
 }
 
 do_sed_paths() {
@@ -157,7 +156,7 @@ do_install_ptest() {
     #
     # The regression tests require scripts and data files that are not
     # copied to the build directory.  They must be copied from the
-    # source directory. 
+    # source directory.
     saved_dir=$PWD
     for parent_dir in ${S} ${B} ; do
         cd $parent_dir
-- 
2.31.1

