Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.40554.1600690328161806873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 05:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bzgdxIrg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z4so12492880wrr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A1u2v9GSny2ECFIuQNb9oHM20quEzJ1xAanuHEEDocY=;
        b=bzgdxIrgkg5l2xnkVlYEtU9zj7ZwrG8AaN3r/QL5Mbwn342iMo849pnlCEQZpbA27f
         ECv9jsl1i/L86zDRGyJXDVlPygB/4L5V94op5KtuOZ0dGjMkwmfwKELsG9zyUzGGkeui
         TdraTDJNgKzXIMRGUZE/Hv2Ag3mwJgIChn5f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A1u2v9GSny2ECFIuQNb9oHM20quEzJ1xAanuHEEDocY=;
        b=LQrdqszztx37nbgi6kk6VJ5X6Jan9jY8R22oaRuMZEQ2icIDMk+BH+D9mvn9GxHUsX
         0p9sa9/fgpDA2EXdcRLsf/jE/6I8Woj5+E9yoYRc5S/zH72jcHJQ2BU5gDKjrfVPXYKe
         Cnv18dAM3Vyvx322e6Xf0qg9BNPLDll5GUkZvhoQj9Tqna8WmWnPpqHoU3HV2u446rDo
         1BaXInXg8JAnaeSQCRxD9+bxnhcLmhnFvIFevtjDtgq7arn4pR/DoBxuwLfHQBms2fdP
         Iar/6MQMX0XYdQnEDIG87tGZsA+0nB6bHJyfr1WFsZTNGa359DNaS3LApuLhjtJKSbsA
         XUOQ==
X-Gm-Message-State: AOAM530SvYkZxzPVO2bligCaTcix53EF6JsHQFLw/K8Z8jMI0H02awPF
	tKbaqm3rPnmbylkOOiyP60j5PCbiVHyfbA==
X-Google-Smtp-Source: ABdhPJxFiEr0v4r2fRVIO7oqiGaWDyU6PI5HEkMyWpiPu1bqCAccm0pcH/d+Lw2Arp/8vVWcF39Xxw==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr51519436wrr.406.1600690326263;
        Mon, 21 Sep 2020 05:12:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:38bf:7d47:ba6a:9c04])
        by smtp.gmail.com with ESMTPSA id y6sm19492609wrs.7.2020.09.21.05.12.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:12:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3-markupsafe: Import from meta-oe/meta-python
Date: Mon, 21 Sep 2020 13:12:02 +0100
Message-Id: <20200921121204.2443466-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed as a dependency of python3-jinja2. ptest is disabled for OE-Core, at
least for now since it depends on python3-pytest which in turn has may other
dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-markupsafe/run-ptest       |  3 ++
 .../python/python3-markupsafe_1.1.1.bb        | 28 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a094b39b2af..84f473290ab 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -592,6 +592,7 @@ RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksan
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-markupsafe/run-ptest b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
new file mode 100644
index 00000000000..5cec7116968
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
new file mode 100644
index 00000000000..403a98a43f8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
+HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
+
+SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
+SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
+
+PYPI_PACKAGE = "MarkupSafe"
+inherit pypi setuptools3
+# ptest disabled in OE-Core for now due to missing dependencies
+
+RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1

