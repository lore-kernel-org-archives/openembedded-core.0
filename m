Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.6481.1601503926207400753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RD/t3+j9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id z19so2325753pfn.8
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TzF3fF8A2sLyXYJ4g/C4qNSZdwVMGQHAiKSZpq5TU4E=;
        b=RD/t3+j9OC3nZxy5ye6/l3cSmDW84YzlPRf95F4kBMoNCnFjW8W/LicLndPghfqhCB
         JtHdN+qyiO8oDumehpC+wG+H+geYw1bvnDoZI49H2aZxnxS+mviycr8HlH1Y7Do+KWRW
         1TSIfrqhA21j/0DspAGOLhECNxMy8Ws8I6QBFfufMUuCB1uP40QFsLdjoPzEcLSKMDc0
         UnEg/xI7tPODeipgHXqeGZ/osknezkS7kMicBUyxt3GR2BVCD3Wqx6qCPDHiqZlsWFvi
         LlBs681ZrEUspoCKh4dY54aLecN59olr3+bBDT/60puBObM/HwHDJtOwDU1d3fjNtrLP
         kS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TzF3fF8A2sLyXYJ4g/C4qNSZdwVMGQHAiKSZpq5TU4E=;
        b=DChwkb4oMM9B7D8eGwpU6ri8JVISzZV4LliO6muDXhcW+tTMtdGVNO3uYEC5V/Zfwb
         JxAY7kwkN3fDF4KaIxirq3MVeBCRa2/3yjLpro0l7dxgJvZMaTRtixOBvx1Txdv+Ny/f
         KkfN51iRbx/B/q+FgcuaKAI+vdvjOda9sZocS2Fwj7P/s0iaaXoHdEzhR4wpNl79NawT
         uXszPWMNAfQu3CHFo/ApCssQUX2d5bBCtw56yc+JYQujGQSMF76+8zUeTnoeqP0W/OCV
         mhujEAHzRSIc1EfEORatsG0l7boyunm03p5ZjgEG8nqXMjdhJdlLHS8LUh0ugdVqM/Of
         Uq2Q==
X-Gm-Message-State: AOAM530XBD6i6YpkL9sdekEFI70FQrgydpBGinUqB6a4HoGP2qJbpccI
	5iSRJ8NTIeTJRGu6r2oVPmMhcyiFwuyEi+pQAXQ=
X-Google-Smtp-Source: ABdhPJzkVAkDJIsY+8XrUzMurAvjuhaskOMXV6rXy0JWj1O3R/C+lYZMt9odFaI5YaICALgWLgcsWQ==
X-Received: by 2002:aa7:8084:0:b029:13f:b82a:1725 with SMTP id v4-20020aa780840000b029013fb82a1725mr4274524pff.9.1601503925343;
        Wed, 30 Sep 2020 15:12:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/41] python3-jinja2: Import from meta-oe/meta-python
Date: Wed, 30 Sep 2020 12:11:04 -1000
Message-Id: <cc0f56a788c33ad3fd2bb5402dee497234fb06bb.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is used by some of the results handling code and needed as part of
buildtools tarball on various autobuilder worker for testing.

ptest is disabled for OE-Core, at least for now since it depends on
python3-pytest which in turn has may other dependencies.

Acked-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5156e95e9e80e3e0f7eea181cd12f85e03a111d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-jinja2/run-ptest           |  3 ++
 .../python/python3-jinja2_2.11.2.bb           | 45 +++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8da0bd32d0..9b0a3997c4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -582,6 +582,7 @@ RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
new file mode 100644
index 0000000000..5cec711696
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
new file mode 100644
index 0000000000..89538d2f27
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+
+SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+
+PYPI_PACKAGE = "Jinja2"
+
+CLEANBROKEN = "1"
+
+inherit pypi setuptools3
+# ptest disabled in OE-Core for now due to missing dependencies
+
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unixadmin \
+"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-markupsafe \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers\
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

