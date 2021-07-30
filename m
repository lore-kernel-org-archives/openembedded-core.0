Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.22078.1627640599473881957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 03:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jl8XyBJX;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id p21so12424018edi.9
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 03:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPctkJCHcCP2V7JAOnBW9YiMSqZgXaFRWGhiXNcfNuU=;
        b=jl8XyBJXdb7TprHLordeKjs8JlvcaKkXTgRw9e1DXpAOZm19VexwlDTFYqkLlZKggN
         BH88xTdRcY+3PgZFqLMwtHtusMQZMR2mfLOs7d2v2UpJGcshwpGoxAhgKNK0x2IldJaT
         HTC9sl+WhMM4NtyeM4awpPnj2TYJ4BLaLrEBK2jQX3DbmikzgGtA+WEuUu8TXtlOrvLn
         /t0FONb60wG4VjWiYftnmAObuv7vZS3cVKhr9JCy6NmdhX8gOzHvHXhyTIinAV5RZoTp
         SaDTFx4L+r8XVsUFFu9puoKFWi3mawahEEjltABVpm3k2rJ+An1nxSMuHb1KD/eh8Jh3
         zIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPctkJCHcCP2V7JAOnBW9YiMSqZgXaFRWGhiXNcfNuU=;
        b=UCfwJZX2jfnHu/0Mw/PubzB9zPKXEa2uHMguRoyWoDEfhBOszvgzG3LQWPjpOj0aA5
         NQuzlUQksTslADh03bz6CYfxsNZ3ShL2VG9X3+VKnxXepR42C9aNXC61+GaoGYMs/3l8
         bI3rECjIxwQGzn2+UZtK2IZxp8BJN2oHiUDLjnlGVuXX89WzFd72uO/v9KSYgNLCElcN
         exk94AjuWOEeqf390RlPBS2TcUyJzTD7UwL04wSxrmmCKGf1W9zCH2IDf03j8N4a7ACA
         uqPMPAjPB0nQc4+xG1EZWNKxhGe19okDBFkmV2fHbjSGCt2AjyZ4teamSS8GUkdvJYZV
         sxlQ==
X-Gm-Message-State: AOAM5318NaWzeupuvYVo0slMR15TEX3qlSOgBZ+1Nym/yio/qJg6wG21
	bzwSx5F0NetcSl58yO8hq2A6th5ggCHUxQ==
X-Google-Smtp-Source: ABdhPJzbF9NkAuSXqY4oOfJFsePNC0ZN6PmuSxwKQSO3MwvBQ90QHwh8GPC53yQ8kkaNUwliG0UI1g==
X-Received: by 2002:a05:6402:214a:: with SMTP id bq10mr2081129edb.296.1627640598066;
        Fri, 30 Jul 2021 03:23:18 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q11sm407068ejb.10.2021.07.30.03.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:23:17 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] convert-overrides.py: 0.9.1 include '(' as delimiter for shortvars
Date: Fri, 30 Jul 2021 12:23:07 +0200
Message-Id: <20210730102308.19038-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/contrib/convert-overrides.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 057758f1bb..739fd53bdb 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -74,7 +74,7 @@ for exp in vars:
 
 shortvars_re = {}
 for exp in shortvars:
-    shortvars_re[exp] = (re.compile('((^|[\'"\s])[A-Za-z0-9_\-:${}]+)_' + exp + '([\'"\s:])'), r"\1:" + exp + r"\3")
+    shortvars_re[exp] = (re.compile('((^|[\'"\s])[A-Za-z0-9_\-:${}]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
 
 package_re = {}
 for exp in packagevars:
@@ -123,7 +123,7 @@ def processfile(fn):
         pass
 
 ourname = os.path.basename(sys.argv[0])
-ourversion = "0.9.0"
+ourversion = "0.9.1"
 
 for root, dirs, files in os.walk(targetdir):
    for name in files:
-- 
2.30.2

