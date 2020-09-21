Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.40555.1600690328974039936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 05:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tks8QsJs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id m6so12513801wrn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uSYElCnx69zZaA34rzuPYFmmH+0GSQXAa40GWmYnbuE=;
        b=Tks8QsJssSfo5E5Of0aHT8S5IsuwHnrAVw5ffyXk8T53UlZADh8+CIcTcHjxkII9XQ
         pJ+SXC139d7dDj5we1ztQU6HXm2bjHOuCnEvwKX/LE0zMedezOPczdE/ekO0l423RP50
         gpKk9TcXNgeU0XJzFk/5p8ul9tYvaqiF7LPs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uSYElCnx69zZaA34rzuPYFmmH+0GSQXAa40GWmYnbuE=;
        b=iilgdj2wP7loKYTejtJkc1/2vufO6o6rkWwCQS//tbBv9vTSQYqSO+YyU3eIfbYy5C
         I0ZOxkXVs4Dr5Y25EPd0LNy9uCqhnoefC0wW8BmGVK3jHO/3YZ1YzIBzpn1nFr2qFsr/
         zoRo7aXFBXdOuJ9obmCjjPj2Whf9FFaEjJdWxPxgMrnCx7s3V/wrAJqyhYA96nS4J+K7
         pgRMS5tx65u7La50M/F1aS9D9z0GGd+eYcTTfKc7CY6fha/8dM75oAKxjZQbnAxWskyy
         8b0FLpUhNTX6/ZIptP9sEpb0v0+aHzgucnRosdn6x+qFHnmpzKJHjxei/G9FLKLMlCI+
         L1ig==
X-Gm-Message-State: AOAM533QxDv6xYPlP2LTN+bM6GRGBNnA52ImkSM0Z0hJCVaQQv2RFS09
	1Hm/86Z10xLtVUalIjuvRXRYKW3Ofc73ag==
X-Google-Smtp-Source: ABdhPJyiSGCvrU7RsYsgyazog7/UjUbJyicej6git+ooBzsUv1uLS96mIW4YNWcY/70LERTEG9CZpw==
X-Received: by 2002:a05:6000:1083:: with SMTP id y3mr51846951wrw.405.1600690327167;
        Mon, 21 Sep 2020 05:12:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:38bf:7d47:ba6a:9c04])
        by smtp.gmail.com with ESMTPSA id y6sm19492609wrs.7.2020.09.21.05.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:12:06 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-jinja2: Import from meta-oe/meta-python
Date: Mon, 21 Sep 2020 13:12:03 +0100
Message-Id: <20200921121204.2443466-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is used by some of the results handling code and needed as part of
buildtools tarball on various autobuilder worker for testing.

ptest is disabled for OE-Core, at least for now since it depends on
python3-pytest which in turn has may other dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-jinja2/run-ptest           |  3 ++
 .../python/python3-jinja2_2.11.2.bb           | 45 +++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 84f473290ab..d349382cb9d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -589,6 +589,7 @@ RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
new file mode 100644
index 00000000000..5cec7116968
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
new file mode 100644
index 00000000000..89538d2f272
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
2.25.1

