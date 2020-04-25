Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.338.1587835718035748940
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D62QWHm3;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id s10so15439803wrr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZV6S9w2NUtt0ATbX84Kv+PVn0lybzP0wwDWJ4vyBcCk=;
        b=D62QWHm3iIB/qNQDjPJdY07xZLMolLG0G6/RagyeBix23+MtKlx31LBLydCZbmjEoK
         K0YsdjXfBSIphRa6IIZ4NAfO+EAiBg6OrbG8VtsXq5Z33lMqrIrQ59m+NB1Q0nW8m3WN
         E7/RH1UMxaT58FiXIbX0/C1UhuDzV2tJlLrqrJzFCNPBzax4Eb1Q/GyzKzdFnyQ708b8
         q6wugUZPHHVH3j+RoWAL9H5sFDha8OB1N6UXf7XLHZ8VuUskIAK2qdicib9nkATBr2Qi
         nNiGpAvBeYfS6iDn6rch1HdSWhE2CKlIvm7Q4CSf5BFRhSRd3aZYqoiJMl1UhSxhWxQV
         ZRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZV6S9w2NUtt0ATbX84Kv+PVn0lybzP0wwDWJ4vyBcCk=;
        b=h+FPDITUyGfe6xiKTPgEp8HOEd1gIzwvx0eGerBlHFnnSRxYI+tiLApzzta6EcTE9d
         /om1BZmlPsZFjnyfVu7L0XoOrOur2xfZ1uK4o6vuwd5CgI50CAGRh1AqJjTHj2iRDTL+
         0prZgdRpqdYZfRZgsADZNCVXI1NADymKM4YXdYe3Ey6MS581tE9e2a7P5r9Xhm2Xedt2
         PGvVmqHdzTe74TLN64AI/CRT7JL/WeZTacsfv2FOPHZsHxIdx5gFz+Lij7oY/gC5kNrr
         BpZM/EKtLDtqPig8tVIbqLQqjWaGA2VCzFW4rFqFQ1lRHADwabQq/1J3oQrMFa9wx7q5
         IXqQ==
X-Gm-Message-State: AGi0PuaX/1q4V+O7lo5WeHM/At5m+LPXGH8JjSRxxfWy2lxm9VhaPLzA
	BpTpQGgAMOQ8Hx/djk91HDUtJxti
X-Google-Smtp-Source: APiQypJib+zhTQKypOYHg9bw0OmmfCi6768XL9htxEHb6JjVPxw20DhKgt86equEm3ZbaXIklctYCw==
X-Received: by 2002:adf:d087:: with SMTP id y7mr17750783wrh.321.1587835716340;
        Sat, 25 Apr 2020 10:28:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/15] python3-cython: add from meta-oe
Date: Sat, 25 Apr 2020 19:28:10 +0200
Message-Id: <20200425172814.27370-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed by new python3-numpy.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/python/python-cython.inc | 41 +++++++++++++++++++
 .../python/python3-cython_0.29.14.bb          | 18 ++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-cython.inc
 create mode 100644 meta/recipes-devtools/python/python3-cython_0.29.14.bb

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
new file mode 100644
index 0000000000..3d1df41308
--- /dev/null
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -0,0 +1,41 @@
+DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
+It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
+and the messy, low-level world of C."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+PYPI_PACKAGE = "Cython"
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[md5sum] = "6e2f139e30bb08d68366f9370d87964c"
+SRC_URI[sha256sum] = "e4d6bb8703d0319eb04b7319b12ea41580df44fd84d83ccda13ea463c6801414"
+UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pyparsing \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-xml \
+"
+
+RDEPENDS_${PN}_class-nativesdk += "\
+    nativesdk-${PYTHON_PN}-misc \
+    nativesdk-${PYTHON_PN}-netserver \
+    nativesdk-${PYTHON_PN}-pkgutil \
+    nativesdk-${PYTHON_PN}-pyparsing \
+    nativesdk-${PYTHON_PN}-setuptools \
+    nativesdk-${PYTHON_PN}-shell \
+    nativesdk-${PYTHON_PN}-xml \
+"
+
+do_install_append() {
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
+	done
+}
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.14.bb b/meta/recipes-devtools/python/python3-cython_0.29.14.bb
new file mode 100644
index 0000000000..2ce6bdbd68
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython_0.29.14.bb
@@ -0,0 +1,18 @@
+inherit setuptools3
+require python-cython.inc
+
+RDEPENDS_${PN} += "\
+    python3-setuptools \
+"
+
+# running build_ext a second time during install fails, because Python
+# would then attempt to import cythonized modules built for the target
+# architecture.
+DISTUTILS_INSTALL_ARGS += "--skip-build"
+
+do_install_append() {
+    # rename scripts that would conflict with the Python 2 build of Cython
+    mv ${D}${bindir}/cython ${D}${bindir}/cython3
+    mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
+    mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
+}
-- 
2.26.1

