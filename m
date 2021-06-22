Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7540.1624360895561480849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VZo155Yg;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id h2so9603270edt.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mCpSI2H38nK2p2mqnJr4lwejwQyxtieZ1e42CVE+rX4=;
        b=VZo155Ygk2Cyd63WPIXoLkeRXufDdP17YdXn6EUyMU0a2WIUHDqLqzTWCJh6V0KFWD
         GnoWvzv1uM6d/A/fCS0bEAkJGnJGgdjGD1zZvu5ACGAUafXRRndEeEnjxuOyDLtt79D5
         /CfKAIcEtA25v7xOK1qrQSU51ELeF86xKY82HUcjl8BmiOYkRvK9TDOnfq9wGe3IKJw6
         p7LcYMA21EXdDe3u4eFGONjRh0z4U781fAYFoo2epMWM/RUhiepkaFNL/BiiXN6nTNY9
         m88GVd3Yu1/nwju0HKZ5eDWQu9mCmfCfB0MdVFMCaqCyX5/Vk/nhAI2w4/l0RwJJ/Wqs
         CseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mCpSI2H38nK2p2mqnJr4lwejwQyxtieZ1e42CVE+rX4=;
        b=S1Pl22V7YM7J4f2YYrLL9FTpJHewJ9C7NSOjbB1PhbMk+4eFBROzjpky8nxQ1T6FyM
         qxv24E0hMTe501LjYwIQ3+EB4iQd+CA5LQb1PNrFssic1AH2EhrIEJ09nhTJtnoVBkTa
         dSx3ZQedKdqmjMtMR4NJbQ08+bZOwtdpFuC1z47lhIqql4sgroCA1mOu/boFCtCekYUW
         396vHlmIvIZD5exhcjQodH7NhJroDVXUZsuN3Kol3kltbjNK801/PhNE1WPZ1cY932V8
         NTKXOXRJNbXFn+bf3K12vYbvtVI8F0i48nVqdBu4FNINPoffy/+VC5DxSHSswB6YMpob
         JpDg==
X-Gm-Message-State: AOAM530FuMNHTDmrpooWD9HwJz13fzogMwYFiM1+VS+wyLreQFyLt6Op
	dTPeP9KSkl+IR5c4S9ElTc7U4USyk6QQUg==
X-Google-Smtp-Source: ABdhPJxo/lOzERsOnccR11zPm5ea96lnKTwiYliTNghq1yJVzWy7w6drIAFEXsIcXeyqq7JPW78dYw==
X-Received: by 2002:a05:6402:b17:: with SMTP id bm23mr4265231edb.173.1624360893850;
        Tue, 22 Jun 2021 04:21:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/19] dnf: updatee 4.7.0 -> 4.8.0
Date: Tue, 22 Jun 2021 13:21:12 +0200
Message-Id: <20210622112126.2026646-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove patches merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-dnf-rpm-miscutils.py-fix-usage-of-_.patch | 39 -------------------
 ...s.py-do-not-hardcode-usr-bin-rpmkeys.patch | 37 ------------------
 ...PYTHON_INSTALL_DIR-by-running-python.patch |  8 ++--
 .../dnf/{dnf_4.7.0.bb => dnf_4.8.0.bb}        |  4 +-
 4 files changed, 5 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch
 rename meta/recipes-devtools/dnf/{dnf_4.7.0.bb => dnf_4.8.0.bb} (94%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch
deleted file mode 100644
index 99afe09840..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2729c00f0060beab8537a9bebc796b170949093d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 4 May 2021 22:03:30 +0200
-Subject: [PATCH 1/2] dnf/rpm/miscutils.py: fix usage of _()
-
-Specifically:
-- an import of _ was missing
-- _ was reused for a different purpose
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/1762]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/rpm/miscutils.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/dnf/rpm/miscutils.py b/dnf/rpm/miscutils.py
-index 235aaf28f..7e33d4c42 100644
---- a/dnf/rpm/miscutils.py
-+++ b/dnf/rpm/miscutils.py
-@@ -22,6 +22,7 @@ import subprocess
- import logging
- 
- from dnf.i18n import ucd
-+from dnf.i18n import _
- from shutil import which
- 
- 
-@@ -46,7 +47,7 @@ def _verifyPkgUsingRpmkeys(package, installroot):
-             env={'LC_ALL': 'C'},
-             stdout=subprocess.PIPE,
-             cwd='/') as p:
--        data, _ = p.communicate()
-+        data, err = p.communicate()
-     if p.returncode != 0 or data != (package.encode('ascii', 'strict') + b': digests signatures OK\n'):
-         return 0
-     else:
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch b/meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch
deleted file mode 100644
index b4c9e074d6..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From dc14022a99dc017c52c484efb32729729baf854c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 4 May 2021 22:07:32 +0200
-Subject: [PATCH 2/2] dnf/rpm/miscutils.py: do not hardcode /usr/bin/rpmkeys
-
-Some build systems (e.g. Yocto) place a specially configured
-rpmkeys executable elsewhere and set up PATH accordingly;
-it's better to always take it from there.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/1763]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/rpm/miscutils.py | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/dnf/rpm/miscutils.py b/dnf/rpm/miscutils.py
-index 7e33d4c42..fcd956db9 100644
---- a/dnf/rpm/miscutils.py
-+++ b/dnf/rpm/miscutils.py
-@@ -30,11 +30,9 @@ logger = logging.getLogger('dnf')
- 
- 
- def _verifyPkgUsingRpmkeys(package, installroot):
--    rpmkeys_binary = '/usr/bin/rpmkeys'
--    if not os.path.isfile(rpmkeys_binary):
--        rpmkeys_binary = which("rpmkeys")
--        logger.info(_('Using rpmkeys executable from {path} to verify signature for package: {package}.').format(
--            path=rpmkeys_binary, package=package))
-+    rpmkeys_binary = which("rpmkeys")
-+    logger.info(_('Using rpmkeys executable from {path} to verify signature for package: {package}.').format(
-+        path=rpmkeys_binary, package=package))
- 
-     if not os.path.isfile(rpmkeys_binary):
-         logger.critical(_('Cannot find rpmkeys executable to verify signatures.'))
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 0ed9afc58d..5cffc9dce1 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 6be13143a54c79085d400d5bd4c7a6e1cb6ffaf5 Mon Sep 17 00:00:00 2001
+From ceb1043c4f3de095e36908232320b74a4128a94e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -11,15 +11,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 38cf4fbf..6c5debd8 100644
+index 9e2e9e9e..2056089d 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -19,7 +19,7 @@ ELSE ()
      MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
  ENDIF()
  
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('purelib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('purelib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
  
  ADD_SUBDIRECTORY (dnf)
diff --git a/meta/recipes-devtools/dnf/dnf_4.7.0.bb b/meta/recipes-devtools/dnf/dnf_4.8.0.bb
similarity index 94%
rename from meta/recipes-devtools/dnf/dnf_4.7.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.8.0.bb
index 7314eaf7b8..44c4405939 100644
--- a/meta/recipes-devtools/dnf/dnf_4.7.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.8.0.bb
@@ -16,11 +16,9 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-set-python-path-for-completion_helper.patch \
            file://0001-dnf-write-the-log-lock-to-root.patch \
-           file://0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch \
-           file://0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch \
            "
 
-SRCREV = "395541fbf8f87f81cdca7567f22be1182e55bea7"
+SRCREV = "e7b29753dce94769d30f92e671f55863985d24f0"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

