Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.28760.1606537511100591222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MgPFa4Fx;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id w16so5767974pga.9
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lPlyDAJip75t4pL7D6wtXUAJ8tYlLnFzmle0qwPXhwo=;
        b=MgPFa4FxCnWpUnFmqpTEaSDvOrBMFtnwk+YLXidZ7hgyVqcVosKVdw3aXWf5kabTIK
         cfxxKI/iNBYpbtPjQURpE6vRyswQRs8vI4TWOqBl0MlGtq7rS8gZvIWftvvUcJdsi4fw
         E5In9SDzroViE79nQMdj0W6s6LaLE2SPOGTYAx3i4bSQg7uhyodixZ0NVMVPFZqAsg+B
         QqzdV02WsKMWw+f8vbNXBW2CyXgIiDNgU48ja/Cuwl6g7xwfIkYlZybxM6dmmJ8VHM49
         fY3n9nT2+70SkCIgP90UI7VJ/NnadK1pKSCioX9Bc+/elFzL/YkuWw0utmDQ4OJiFREX
         k4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lPlyDAJip75t4pL7D6wtXUAJ8tYlLnFzmle0qwPXhwo=;
        b=Ht3FLD7bBE+ce1CSYnpwKL2u/3SlObUSktSGfXb/Bc5yRKEm1joFA3Oaz30pTQzMd1
         Xk4L7zAIV5/k2GjQb1IhnUigFkUN0jXV50x++zfwlUCisHc37dbdMV6QKTSu4yDDcC63
         BVlZa/l8uf+hra4f/JLJf6TzDtk90MyvHrjZKwgcc5EaEzofv9sqdvfNgPPmrLgmj5fH
         NzWrbLU5VL4o7l5shZPe+Fpnyf+E+DhYd0yr8VO+loisrYYp79TX+uDFyG/29u9WjOKX
         fRJWQr/SPUtnM0S1mtBOqshwkmLRw6NkcIcH7CCxQ8/mKQLB3cf5jpNER51pdjollAzy
         dWUA==
X-Gm-Message-State: AOAM530tRU66veIDmgnulDI40xtac8ZulgkWbWplrU0A1e+vdEFdsHle
	rNq5jL6l4mW5L6Hi1KUWpsOmx9Vueaq6Ew==
X-Google-Smtp-Source: ABdhPJyrc0hjhYRDipKxWlrDf5g+y2ATF8xAbQLtawVKOyz17hAdwsx02pFqE4jU3xKXMuq2nJGeGQ==
X-Received: by 2002:a17:90a:db0a:: with SMTP id g10mr14092942pjv.225.1606537510444;
        Fri, 27 Nov 2020 20:25:10 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:09 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/18] python3-pytest: move from meta-python
Date: Fri, 27 Nov 2020 20:24:27 -0800
Message-Id: <7a68b781715c9c84993946f2906f24581fb94613.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Simple powerful testing with python

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...he-setup_requires-for-setuptools-scm.patch | 39 +++++++++++++++++++
 .../python/python3-pytest_6.1.2.bb            | 38 ++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
 create mode 100644 meta/recipes-devtools/python/python3-pytest_6.1.2.bb

diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
new file mode 100644
index 00000000000..8c5c17247e6
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
diff --git a/meta/recipes-devtools/python/python3-pytest_6.1.2.bb b/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
new file mode 100644
index 00000000000..6872da5cfac
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Simple powerful testing with python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
+
+SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
+
+SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e"
+
+inherit update-alternatives pypi setuptools3
+
+RDEPENDS_${PN}_class-target += " \
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
2.25.0

