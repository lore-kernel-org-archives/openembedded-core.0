Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.15238.1618415293951426084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 08:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WlYsPkeA;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id m18so8132434plc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4NqjaJSg7dNg0ceLyJYKdacHiiujqudXEiTyqX7vTk=;
        b=WlYsPkeAMETOCChn/xIXG6aEPPCATnzuQQ+0YsiE+2U+9RvdCq58f8aey3uaZ555AF
         Hl7p5kD97JScIGz55KJbwhRVsHThl7B0V5tE0Oz00hbSkl6Dc1MVmKh7c+BbYqSxkbOX
         bCSqnomBjcV4pwuDBn4v+Dfe0BDrXnVpKZlqtkmh4JP+ThTAxGKA2VXYbTZ5DSjohhgW
         3WXMcFf+xzWV8QU9+QGB0HlWfQ0y2UVXEYMr0MHn84pf5cUHvPE+oRwLpO2GbA/DV+Qc
         VDgXoSaK/R3tgPzheNu2vBl4yz8ESGmZuNcIQpEoaKaw6fbQor0FwKyYN61cFP34z3ch
         xnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4NqjaJSg7dNg0ceLyJYKdacHiiujqudXEiTyqX7vTk=;
        b=FvnzPWhRjLZ8BLXeAuLPxzWdCiTgzksfvDo209WKobgaAP5HKkGc96v9rZi+1Vy5Ur
         0BSdUpaXl7ERYNIPbfnQuDeJ11VxBQNYrq4wJd9guemIc1lFr4x5ix8NdCBa41db3X1q
         MTjgSrIUli1MgQH8iPBYozwBO4QNDn0e/r9OxyWaEVW5WBY7meUCrVoIsOu0cZPMCGqe
         0CJAqG8w0EYz4V/mwwyNEzrxdwu4FlhKBErFA0nCt3o1r473TlJqqcJU84oK2nY6wFT4
         Ggz/h3WotE6qJCp8/4bh3jSoLkr+KUXRTTnnWuQg4Msf2Gneshj5cT/KWdS7fvT2pLbO
         JR1g==
X-Gm-Message-State: AOAM531ct1tBAsGHiYuj+zw6I5wQGbtkmLehRzABtvPe6bL6Nq3bxXGc
	WViEuk0V6VQYflVfvt/r5DVlB8245kgdEw==
X-Google-Smtp-Source: ABdhPJz03rrX6ZCHwsM3+YIrmNbbB9LtqBrhlWePOhS19a1gFhELuvIxE/msVKp7rJ6GVkWLDxbnlA==
X-Received: by 2002:a17:902:fe8a:b029:e6:5f:62e with SMTP id x10-20020a170902fe8ab02900e6005f062emr22410255plm.48.1618415293233;
        Wed, 14 Apr 2021 08:48:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id o3sm5358176pjm.30.2021.04.14.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 08:48:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] valgrind: Delete trailing whitespaces
Date: Wed, 14 Apr 2021 08:48:09 -0700
Message-Id: <20210414154810.2010487-1-raj.khem@gmail.com>
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

