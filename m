Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.6491.1601503923590179892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IaMAsbho;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id s14so556968pju.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pKrXf3+g4laZ8tj2SYoWMzL/5CC7SWQCq+6g3/QWU7M=;
        b=IaMAsbhol21XrhQo4usDfLd8EdPHUGyTqZMacHw9GbXlPixTxJR1wQvyldWakKX8xd
         GRTC9vrXS4Yj+slq87fQc/iYh50ep/54GHD1Umdk3te2yCymghyyGi29tINXfOagHIgt
         DBECwlH1tcwaqpgmDUM7SuaP2RqJgjjR4pqoTvHEQ0vO+VeBqvL//YaeboFTNqs37peV
         praBsHL8Ay1mWnwWTNHNTZ5k2Ue5n5d9bB5vZJPWSJmH7LCYOsqcEYcZxxpgc7OgR9No
         CRtfty03+2vWIaKWoSE6ZkT+OvzgAAAwbXAVbiY50YiI2jd8KFVybg30KDqrt7c1zXPN
         Ou7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pKrXf3+g4laZ8tj2SYoWMzL/5CC7SWQCq+6g3/QWU7M=;
        b=Q7mNNfcdGKrPOfcFjzhPgnG8oAMFzcfNfTm02oOteJq9EyeTEx5FSEttvEMH6I2w3V
         beyswCBQ3zR26itPbSu/UPEheyBzK9lteDSOeORa9Z7e7Gx02slkemD9aCcc8A9LaMNo
         N3/BOHF4lvTzoQHqnElQ7ZOaKaQthSCWoPI+IpVR1BIm+61mJQmPjIx2ikTSYKGgvYsq
         tAUehp7VdgLPsNmYFTzjS6VoNBjONiYSgiYU11nEp30bZB8+2a80Kw9ZLMxPuxHtC7Tl
         BKE2If6xi4+ySInRVz7ekFyKpd+vGYvIWvw8ZtghnSnedEIKi+rkl67A7VRBH+jUQmAd
         vZiQ==
X-Gm-Message-State: AOAM531AAfGLwdD2uS3g6G5kEaF352lbUtN4xbjaA6VSC+0mlElOdrDQ
	lo0oJ2ekKKfPEBaF0W049+QiveezL4KtD5quHVI=
X-Google-Smtp-Source: ABdhPJwtpQLYFiLfy5sGGeJjeGjqqXnj1reRH8QMPi/JoUKxOdbwIISdy0UVudCAxR/cegmm2POruA==
X-Received: by 2002:a17:90a:6701:: with SMTP id n1mr4494290pjj.87.1601503922569;
        Wed, 30 Sep 2020 15:12:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/41] python3-markupsafe: Import from meta-oe/meta-python
Date: Wed, 30 Sep 2020 12:11:03 -1000
Message-Id: <ec222f6af5f8629453ac8e71a1dd6c44ec9a88c8.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Needed as a dependency of python3-jinja2. ptest is disabled for OE-Core, at
least for now since it depends on python3-pytest which in turn has may other
dependencies.

Acked-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6f2727fd309b8b46a7ac1b8d99ae1d77a6ee74c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-markupsafe/run-ptest       |  3 ++
 .../python/python3-markupsafe_1.1.1.bb        | 28 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4570fac454..8da0bd32d0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -585,6 +585,7 @@ RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksan
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-markupsafe/run-ptest b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
new file mode 100644
index 0000000000..5cec711696
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
new file mode 100644
index 0000000000..403a98a43f
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
2.17.1

