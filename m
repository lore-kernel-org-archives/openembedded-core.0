Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.659.1605893402875025505
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W5mvk5RL;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id v21so7871506pgi.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoC5wheU10VUZOo0LS++PN96k4uSkQBTaDUiYKUNiPU=;
        b=W5mvk5RLo04Q6Y4BdluFwJGQTxEWjEabZGX34tq5439dlaSiCaAwN8XnCt/swfwO3w
         ex9mxN+TaF2gQvuwgxBifGGo0URcojrRnA9qgvIGYBRIUpiL3TamrsfRWrrGYiFl/oEu
         64tk6AT3tTj0MrmKCFnQzREKp+NXULwTE2mB1b2z+hNY5zF4E8iRTqo87o+6wbi3gEHY
         6t2b46D9xcF9IdgdBHCvZH73UeZn8BuErtBh2Dr+Uh22wx1HTDupgi0nn5g5Vqtqv0WG
         xj6Ju5S+gDCR8W1jOgvyp5IRVAWDPX7V1BT3n1fmxdqQiNz0AIvTo3oaTg6BzFMVJEFi
         oEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoC5wheU10VUZOo0LS++PN96k4uSkQBTaDUiYKUNiPU=;
        b=qSAJb43udeybDJJd6Czpx6bctRc0oHaxlfqAKLRPOBHmmPct5shXYxGFYCcfFx7JBU
         mKJlkuBnb93vL3VTb6LgtCm8WNyVYGzkADOFA7YxjiasysMOg1xXMboijzVvXY5nqGKI
         rPkmTXTOZHylz2Q0PNbC+V1VzgMl/loasxSGEfcCFJspFfUb61Gpzy6ekyrhzpNCbs/y
         x8V/jG6Gn516Dov+J7rtBK6N2xZQQrHrETvV0CnIBdDcHY8lVXNj5IZ4H+qlYznquOOn
         DkOGL2tIkLNlkiAePPyi0gG0ne35+GPdbTz2KdPqZSk3/qDIO1RnYMPZVXVGOw169aGM
         NDhA==
X-Gm-Message-State: AOAM532fQ8HDKsagllocebEaePRQlpRK2H9ZN8sp8kOCpsMmHHYFl+2g
	XSssIQLkIEIhQCahHXANzj8S+JL3JsHo3Q==
X-Google-Smtp-Source: ABdhPJygz51y1Ls7bD410tZj4Xdxkq9ecmOmkoY6SwghPu4QLyEvriIuSmUJvNKqyeJmMssgfqh0DQ==
X-Received: by 2002:a62:89:0:b029:197:c74b:9f8c with SMTP id 131-20020a6200890000b0290197c74b9f8cmr7228825pfa.43.1605893401989;
        Fri, 20 Nov 2020 09:30:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:30:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 6/8] python3-pytest: Add recipe
Date: Fri, 20 Nov 2020 09:29:48 -0800
Message-Id: <20201120172950.1619754-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172950.1619754-1-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
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

