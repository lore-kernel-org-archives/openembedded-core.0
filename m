Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.347.1587835712189180995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RT03u+8q;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id x17so14675836wrt.5
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qa8lnJUxW4IXUaIkICivosiif2JSEW0N3oxAmM6oPus=;
        b=RT03u+8q3maiJRpClFRdvjXPvQHwCLnkY9AxK4+zAWuVL3ZMx3OUuEqL33StYfjwQ/
         7AxJREEq9Yz4FFE5hcb0n0HpsZxFXa4UhMrgvig/0EuhJRYGMOk+RPYZz66GhPIYrBAD
         9jFiagG3LPzUm/bOLkcGFdM3f0JiWg9G3G4lMB41futL+bg7uzuqyvFJi0AC5fGjrcYE
         vV97BvzYl4bwBxMWeoYduCZbmSaz78Myu8JPbn1ZYcdgzDMQQuWjA7UGJ6Hd7VYgCIT9
         shlmviyGWJpflTbpkam7/GJijVGaFbzzLJrYuHxOrK72BWYCG3YXWByaWSnIgZabw81j
         Tygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qa8lnJUxW4IXUaIkICivosiif2JSEW0N3oxAmM6oPus=;
        b=fJs0aylhVwJhyJHLvGId9BhW+DX1HikiBw2IHspIxI4KJK96Tw/5g3Yw81xeuxO5p9
         a41QOkUi5+2Ndvwf2hWE9I2yP/8fQFGq+t4mGe0s0nHGsic/laq+ZZfQ3rljMuC06NrI
         NJa3fjf0xZGLiJ7NgIwKABVUPuHATj7d0zUC7r9mCYwdt9bHuuWpPd8LGjQggGxUfS6/
         Ek70yZypWArlHQ1e+jCfAzlppgk+KfyzyhCQUwJsVSqu9eMOMVQnJKTvrzvYUqLZL2Yu
         5B+7u2VxKK7BfJYpF0xmWI0hpwqaWUMhaU+qpO9HcnnYiBxl1mInJ2vRyHOlJc/OKwik
         vnxg==
X-Gm-Message-State: AGi0PuaEb240Xc/CG0QPN+qf3HXvORwwP9HflgRd9TnAP5FpHHeCVQ+8
	eW9gFenaz2OYWz4OjCheQXGycmw1
X-Google-Smtp-Source: APiQypJ2wdj//+gp0lkjrXsS0ls26NykTdywtJUkPB+pKDUB5RPN60Nvs+1O8UoO62Uj6rsYDDulYA==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr17918640wrt.122.1587835710433;
        Sat, 25 Apr 2020 10:28:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/15] dnf: upgrade 4.2.2 -> 4.2.21
Date: Sat, 25 Apr 2020 19:28:03 +0200
Message-Id: <20200425172814.27370-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../dnf/dnf/Fix-SyntaxWarning.patch           | 34 -------------------
 .../dnf/{dnf_4.2.2.bb => dnf_4.2.21.bb}       |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch
 rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.21.bb} (97%)

diff --git a/meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch b/meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch
deleted file mode 100644
index 1bd8b09594..0000000000
--- a/meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 23c5b15efe42e5e6ee695e54798bac248532d8d6 Mon Sep 17 00:00:00 2001
-
-Date: Tue, 28 May 2019 13:14:51 +0200
-Subject: [oe-core][PATCH 1/1] Fix SyntaxWarning: "is" with a literal. Did you
- mean "=="?
-
----
- dnf/cli/commands/repoquery.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
----
-
-Unchanged.  Appears in version 4.2.7.
-
-Upstream-Status: Backport [git://github.com/rpm-software-management/dnf.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-diff --git a/dnf/cli/commands/repoquery.py b/dnf/cli/commands/repoquery.py
-index 941a470..63fc668 100644
---- a/dnf/cli/commands/repoquery.py
-+++ b/dnf/cli/commands/repoquery.py
-@@ -611,7 +611,7 @@ class RepoQueryCommand(commands.Command):
- 
-     def tree_seed(self, query, aquery, opts, level=-1, usedpkgs=None):
-         for pkg in sorted(set(query.run()), key=lambda p: p.name):
--            usedpkgs = set() if usedpkgs is None or level is -1 else usedpkgs
-+            usedpkgs = set() if usedpkgs is None or level == -1 else usedpkgs
-             if pkg.name.startswith("rpmlib") or pkg.name.startswith("solvable"):
-                 return
-             self.grow_tree(level, pkg, opts)
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.21.bb
similarity index 97%
rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.21.bb
index a046ffc05d..8f7757b72f 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.21.bb
@@ -13,11 +13,10 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
-           file://Fix-SyntaxWarning.patch \
            file://0001-set-python-path-for-completion_helper.patch \
            "
 
-SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
+SRCREV = "864c381baabf024c299dca75abfda96139b8f583"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.26.1

