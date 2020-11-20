Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.620.1605893276102210229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b2W22NLA;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id b63so8480701pfg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoC5wheU10VUZOo0LS++PN96k4uSkQBTaDUiYKUNiPU=;
        b=b2W22NLASWkToTMekTJh6dvn+3097eccHAPspjMt9esC2tM59laaO0KNaXi8u2QCpU
         cuEM1owZJOvkEa49Quel44uyBICA+KTtvU++9XriRkUjj4htzPrFul9BD0LdECfkI+JA
         shi21xIWWbjoSa8dCI9JVrKteCg1PLnFoAy2JvWoYNBFuhf/svQhj3yMV+nitb7QAvxU
         2NrglmjcVVq0gKtN88FP+CqGdNGDuozcZYJC/V/zBE1JEQKzEpj8T0dlrDWjan3zMG1y
         MgvjFeMnXpMyQN/N0TmywZzV7TEV9/gpFiZqxgvcWl6/qtQ7Ggyyxy3hHYHjq2AoPDH1
         w6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoC5wheU10VUZOo0LS++PN96k4uSkQBTaDUiYKUNiPU=;
        b=VTdXtCJTkDDgPZeXZEFXaO+rYH46WRs/1gLGFA7P0y6cS0+b6fa4+2nK/gaNbIsakb
         4Y9LvM7dkarNeDK8gTs5qqBW1o/NwLAuHnhvuQAVE3Ymqi5bTrPjBL1co7WxzK6VGAAz
         1s4QYnbVbA8qh//wrHFPUkJI/n1jt/sEmt4+KAEdU1n2qYkCD6oZYmOyR065fYg7qheF
         eVPmTwo+BgEvelurBtNZgyNINnCGtHAtTkNk0lMjfO6mQdqE5rpFcoj+6oAN3qEymHiG
         s8j8zcjoZz2mnVQmDl+4xXQX9fm/oloG1swxEqs+3EQdmuR0iZ5yzBqabdYoRaPXfztj
         ZCLQ==
X-Gm-Message-State: AOAM530rgTl0lWPKONpcztk6kfOCQBYYUTj356hHF2T1EeeXkSB+qmCu
	uFRVOQ8/lM9myHlLqcc/FdYHhM8OAvVDwg==
X-Google-Smtp-Source: ABdhPJwzUa7EcHD6SasVVp+BidAdjuHqLoEm6Kt/swwnMCq7vo2A0rr7w2yim6WIF+IFBGX/2kmc9g==
X-Received: by 2002:a63:ca4b:: with SMTP id o11mr18534495pgi.236.1605893272437;
        Fri, 20 Nov 2020 09:27:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a23sm4398696pfl.29.2020.11.20.09.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:27:51 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 6/7] python3-pytest: Add recipe
Date: Fri, 20 Nov 2020 09:27:41 -0800
Message-Id: <20201120172742.1594854-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172742.1594854-1-raj.khem@gmail.com>
References: <20201120172742.1594854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moved to OE-Core from meta-python

There are several recipes in various layers which use pytest framework
some of them being in OE-Core, this will help to keep this in core
recipe metadata

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...he-setup_requires-for-setuptools-scm.patch | 39 +++++++++++++++++++
 .../python/python3-pytest_6.1.0.bb            | 38 ++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
 create mode 100644 meta/recipes-devtools/python/python3-pytest_6.1.0.bb

diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
new file mode 100644
index 0000000000..8c5c17247e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
@@ -0,0 +1,39 @@
+From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00 2001
+From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+Date: Wed, 28 Aug 2019 16:12:27 +0900
+Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
+ setuptools-scm
+
+The setup_requires argument forces the download of the egg file for setuptools-scm
+during the do_compile phase.  This download is incompatible with the typical fetch
+and mirror structure.  The only usage of scm is the generation of the _version.py
+file and in the release tarball it is already correctly created
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+
+Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+
+Rebase for pytest 6.1.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ setup.cfg | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 60f6564..c4d1471 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -55,7 +55,6 @@ package_dir =
+ 	=src
+ setup_requires = 
+ 	setuptools>=40.0
+-	setuptools-scm
+ zip_safe = no
+ 
+ [options.entry_points]
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3-pytest_6.1.0.bb b/meta/recipes-devtools/python/python3-pytest_6.1.0.bb
new file mode 100644
index 0000000000..e3e65986db
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest_6.1.0.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Simple powerful testing with python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
+
+SRC_URI[sha256sum] = "d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7"
+
+SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
+
+inherit update-alternatives pypi setuptools3
+
+RDEPENDS_${PN}_append_class-target = " \
+    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-iniconfig \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pluggy \
+    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-atomicwrites \
+    ${PYTHON_PN}-importlib-metadata \
+    ${PYTHON_PN}-pathlib2 \
+    ${PYTHON_PN}-wcwidth \
+    ${PYTHON_PN}-more-itertools \
+    ${PYTHON_PN}-packaging \
+"
+
+ALTERNATIVE_${PN} += "py.test pytest"
+
+NATIVE_LINK_NAME[pytest] = "${bindir}/pytest"
+ALTERNATIVE_TARGET[pytest] = "${bindir}/pytest"
+
+ALTERNATIVE_LINK_NAME[py.test] = "${bindir}/py.test"
+ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

