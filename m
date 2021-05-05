Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.9847.1620227961694515552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dON3eAOv;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id l7so2523924edb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8SHl7j7mHhJSWJxTj1A2CG+ltQLFE75kbGw4vhQiAxA=;
        b=dON3eAOvS4GGDPmvGArtg1btF7IGh4H4Hb3dZc+o3AfBjBaWUw7popg/pXh4EZd6Ed
         NBwA2C/8NW0cBKEtrdTdTLZ4FAFw/Q32vimAJXA9rfruW1XhiwUZqN4cGOAbDyMGrKpZ
         1h0hCbalxhOVJDjcwvmIattfbGD4bgfWycJEGRbDmiLMGSnGPiU8HzydVFwWIV4qHn+m
         eWJ7HcoepvliPUjYNtdX+IZHmsQHffT73V9jM3LgTmfJ3cavcYj0sk6iTo4sHDnFxXQT
         mAu3P/3/m0QovM/pbQLfxFQcoU+Sr4hQx8wBsyBpEggdPQxHaiwNOG7oO3VsSzKm0cY/
         lJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8SHl7j7mHhJSWJxTj1A2CG+ltQLFE75kbGw4vhQiAxA=;
        b=HQnlvYAmADcUS1HoM4jPC/wa63qC9ad8KbJaz/LmKMSKNbf2YcrqYt0blahIB6dNkX
         eH4ABl36lYgDbJ2c+9SSg69QIoydgXTnPEYqDlY/oZ94nIqMcdlX5HpJ2muzV/4LPGGZ
         wq4oN0rZmlF106YpUSDpWiHAuTJmyBOB5sfeyZI+S02dLNF6ogZTmYlU7qrZUDy55zKl
         c7C1B9HFU/Mg6NVRtSGCqVBfPhV2d98BdXFlJj0tl9wSbmJq1IaMCKwQzxLsJcxCUEMj
         yU0423FrJqSGoRbL032lcbz92Zsfq50qguZ4FWZZwtI7oj1zFEDMRIQLhnRUBf3mVdTt
         3owg==
X-Gm-Message-State: AOAM533nW31264cc1AXr9InkfyHDfWRqxqas9zgB23M7rhnkklfiryeP
	HUDT1XUe13hwmUJMv5MPugWtYAQAsjLvsg==
X-Google-Smtp-Source: ABdhPJz02uzMPM406+ltyOP91Tolew1BVpTAWlLLPwSHigLhjAiGFWYkRxSXWZJpqXLJOqGCh+CNYQ==
X-Received: by 2002:a50:fe05:: with SMTP id f5mr16753171edt.288.1620227960301;
        Wed, 05 May 2021 08:19:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/61] dnf: upgrade 4.6.0 -> 4.7.0
Date: Wed,  5 May 2021 17:18:19 +0200
Message-Id: <20210505151850.660512-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-dnf-rpm-miscutils.py-fix-usage-of-_.patch | 39 +++++++++++++++++++
 ...s.py-do-not-hardcode-usr-bin-rpmkeys.patch | 37 ++++++++++++++++++
 .../dnf/{dnf_4.6.0.bb => dnf_4.7.0.bb}        |  4 +-
 3 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch
 rename meta/recipes-devtools/dnf/{dnf_4.6.0.bb => dnf_4.7.0.bb} (94%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch
new file mode 100644
index 0000000000..99afe09840
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch
@@ -0,0 +1,39 @@
+From 2729c00f0060beab8537a9bebc796b170949093d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 4 May 2021 22:03:30 +0200
+Subject: [PATCH 1/2] dnf/rpm/miscutils.py: fix usage of _()
+
+Specifically:
+- an import of _ was missing
+- _ was reused for a different purpose
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/1762]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dnf/rpm/miscutils.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/dnf/rpm/miscutils.py b/dnf/rpm/miscutils.py
+index 235aaf28f..7e33d4c42 100644
+--- a/dnf/rpm/miscutils.py
++++ b/dnf/rpm/miscutils.py
+@@ -22,6 +22,7 @@ import subprocess
+ import logging
+ 
+ from dnf.i18n import ucd
++from dnf.i18n import _
+ from shutil import which
+ 
+ 
+@@ -46,7 +47,7 @@ def _verifyPkgUsingRpmkeys(package, installroot):
+             env={'LC_ALL': 'C'},
+             stdout=subprocess.PIPE,
+             cwd='/') as p:
+-        data, _ = p.communicate()
++        data, err = p.communicate()
+     if p.returncode != 0 or data != (package.encode('ascii', 'strict') + b': digests signatures OK\n'):
+         return 0
+     else:
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch b/meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch
new file mode 100644
index 0000000000..b4c9e074d6
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch
@@ -0,0 +1,37 @@
+From dc14022a99dc017c52c484efb32729729baf854c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 4 May 2021 22:07:32 +0200
+Subject: [PATCH 2/2] dnf/rpm/miscutils.py: do not hardcode /usr/bin/rpmkeys
+
+Some build systems (e.g. Yocto) place a specially configured
+rpmkeys executable elsewhere and set up PATH accordingly;
+it's better to always take it from there.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/1763]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dnf/rpm/miscutils.py | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/dnf/rpm/miscutils.py b/dnf/rpm/miscutils.py
+index 7e33d4c42..fcd956db9 100644
+--- a/dnf/rpm/miscutils.py
++++ b/dnf/rpm/miscutils.py
+@@ -30,11 +30,9 @@ logger = logging.getLogger('dnf')
+ 
+ 
+ def _verifyPkgUsingRpmkeys(package, installroot):
+-    rpmkeys_binary = '/usr/bin/rpmkeys'
+-    if not os.path.isfile(rpmkeys_binary):
+-        rpmkeys_binary = which("rpmkeys")
+-        logger.info(_('Using rpmkeys executable from {path} to verify signature for package: {package}.').format(
+-            path=rpmkeys_binary, package=package))
++    rpmkeys_binary = which("rpmkeys")
++    logger.info(_('Using rpmkeys executable from {path} to verify signature for package: {package}.').format(
++        path=rpmkeys_binary, package=package))
+ 
+     if not os.path.isfile(rpmkeys_binary):
+         logger.critical(_('Cannot find rpmkeys executable to verify signatures.'))
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.6.0.bb b/meta/recipes-devtools/dnf/dnf_4.7.0.bb
similarity index 94%
rename from meta/recipes-devtools/dnf/dnf_4.6.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.7.0.bb
index 6651e64352..7314eaf7b8 100644
--- a/meta/recipes-devtools/dnf/dnf_4.6.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.7.0.bb
@@ -16,9 +16,11 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-set-python-path-for-completion_helper.patch \
            file://0001-dnf-write-the-log-lock-to-root.patch \
+           file://0001-dnf-rpm-miscutils.py-fix-usage-of-_.patch \
+           file://0002-dnf-rpm-miscutils.py-do-not-hardcode-usr-bin-rpmkeys.patch \
            "
 
-SRCREV = "c826d7db401ebf9b59b2fa74570a919e4af2673e"
+SRCREV = "395541fbf8f87f81cdca7567f22be1182e55bea7"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

