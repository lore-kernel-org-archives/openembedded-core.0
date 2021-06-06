Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.28759.1623018023385545818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XJsUS4Zz;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id x10so7585416plg.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckuTwdrid8jsCEiZQNWQG2Pr+xfqL2+BL5pDFUxUB24=;
        b=XJsUS4ZzxsX+I0ntn79tvQra62PCsbbud+kKGQ4mVUPOcYdbhS2oL9HtSHVVC+SWqb
         dLCqiK+nxXsTl3hoixsIMTRFF9yBImo2V1R+baNrgTOYGVKjyqQcOSCVqEGRZZbZRDFx
         Dx3XZ4F+6kAqFc9XVxqOKJxvksqsrHodKnwZfwu0eMXsv6Qvd/qckO7Rs1ZSMx2992rI
         g8otm5QB5EzXuwDwyxbYQtVHnwYmegP2IALhuqnKBvgrs90FZqQj3pWX14SPluKxenZl
         s+dh7Rrn/xJVZIKSSJG/wPZJjhtiJD2haQebJ6hUmUIgaZWpQQ+cfdEhBv4j+EqklRQp
         8BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckuTwdrid8jsCEiZQNWQG2Pr+xfqL2+BL5pDFUxUB24=;
        b=A8kJHGmXOvFsyQQyEsgH1m2bwsDKEioSrYSOt2aGSgvlAOfQhKYzM9GcsZCYlKhexe
         zDfgpLn2eD9So99nEUsHfTcYJiYxvg8LjhLJ+OfdQZGt/52ai8BQE8VvrmyTUR8ZFhYt
         0Ri28B/JiFIqs0bZFfirRoirp5rvnP+QH4GHhXrUeKCoSc7tntmJwssmHC8u89DVYUZk
         ZJ3GLwPj4DNpmqmOSN9p6EaTvJLsRvTf88ptbV0wVpeGfhoAORevy9/vHrWgfPvs2EjI
         NYgdMCdDz6+f3WQ18017Ja3/sBj0QJ5rOKcsyY5ztK6kRsipVpC35mbwiP5VbeAyjja2
         ykzQ==
X-Gm-Message-State: AOAM531C1fqv+jRVB06RXIi1wt/2WRgZg+ufXMcaJd/YauKzizR+vYVp
	FQcvQXNFY94i5d0QVPWFE46MC/HPzXJ0Bw==
X-Google-Smtp-Source: ABdhPJwpVy/QzlNkHZd8i6OgnWihAIJn/1cidawSqRsD+ernt7C+l/BOIdlLxWWvPZEZM1EImIvzAw==
X-Received: by 2002:a17:90a:c242:: with SMTP id d2mr29392181pjx.233.1623018022630;
        Sun, 06 Jun 2021 15:20:22 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d783:82a8:8b1b:d4e0])
        by smtp.gmail.com with ESMTPSA id z6sm6818369pfr.99.2021.06.06.15.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:20:22 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/5] python3-scons: upgrade 3.1.2 -> 4.1.0; simplify
Date: Sun,  6 Jun 2021 15:20:13 -0700
Message-Id: <b45c92f349d04f4a34084e1590d00f8a1c00125f.1623016777.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1623016777.git.timothy.t.orling@intel.com>
References: <cover.1623016777.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Drop UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX, the
  default pypi.bbclass values work now.
* Drop scipts/ patch, no longer applies.
* Add patch to fix man page installation.

License-Update: Update compyright years

Changelog for 4.1.0:
https://pyup.io/changelogs/scons/#4.1.0

Changelog for 4.0.1:
https://pyup.io/changelogs/scons/#4.0.1

Changelog for 4.0.0:
https://pyup.io/changelogs/scons/#4.0.0

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...3.1.2.bb => python3-scons-native_4.1.0.bb} |  0
 .../0001-Fix-man-page-installation.patch      | 46 +++++++++++++++++++
 .../python/python3-scons_3.1.2.bb             | 34 --------------
 .../python/python3-scons_4.1.0.bb             | 27 +++++++++++
 4 files changed, 73 insertions(+), 34 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons-native_3.1.2.bb => python3-scons-native_4.1.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
 delete mode 100644 meta/recipes-devtools/python/python3-scons_3.1.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-scons_4.1.0.bb

diff --git a/meta/recipes-devtools/python/python3-scons-native_3.1.2.bb b/meta/recipes-devtools/python/python3-scons-native_4.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-scons-native_3.1.2.bb
rename to meta/recipes-devtools/python/python3-scons-native_4.1.0.bb
diff --git a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
new file mode 100644
index 00000000000..ff212b85eee
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
@@ -0,0 +1,46 @@
+From 82be2b7b9758a2f62ee11931da674cd541076041 Mon Sep 17 00:00:00 2001
+From: Tim Orling <ticotimo@gmail.com>
+Date: Sat, 22 May 2021 11:20:46 -0700
+Subject: [PATCH] Fix man page installation
+
+Fixes:
+  error: can't copy 'build/doc/man/scons.1': doesn't exist or not a regular file
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Tim Orling <ticotimo@gmail.com>
+---
+ MANIFEST.in | 2 +-
+ setup.cfg   | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/MANIFEST.in b/MANIFEST.in
+index 04ec000..937f6f3 100644
+--- a/MANIFEST.in
++++ b/MANIFEST.in
+@@ -4,7 +4,7 @@ recursive-include SCons/Tool/docbook *
+ include LICENSE
+ 
+ include scons.1 sconsign.1 scons-time.1
+-recursive-include build/doc/man *.1
++#recursive-include build/doc/man *.1
+ 
+ 
+ 
+diff --git a/setup.cfg b/setup.cfg
+index 37e5204..677c00a 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -56,9 +56,9 @@ console_scripts =
+ scons.tool.docbook = *.*
+ 
+ [options.data_files]
+-. = build/doc/man/scons.1
+-	build/doc/man/scons-time.1
+-	build/doc/man/sconsign.1
++. = scons.1
++	scons-time.1
++	sconsign.1
+ 
+ [sdist]
+ dist-dir = build/dist
diff --git a/meta/recipes-devtools/python/python3-scons_3.1.2.bb b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
deleted file mode 100644
index 12122131a5d..00000000000
--- a/meta/recipes-devtools/python/python3-scons_3.1.2.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Software Construction tool (make/autotools replacement)"
-HOMEPAGE = "https://github.com/SCons/scons"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-python3-scons-${PV};md5=e14e1b33428df24a40a782ae142785d0"
-
-# pypi package does not have a valid license file
-SRC_URI += "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;downloadfilename=LICENSE-python3-scons-${PV};name=license"
-
-SRC_URI[md5sum] = "f9c4ad06dcf1427be95472eaf380c81a"
-SRC_URI[sha256sum] = "8aaa483c303efeb678e6f7c776c8444a482f8ddc3ad891f8b6cdd35264da9a1f"
-SRC_URI[license.md5sum] = "e14e1b33428df24a40a782ae142785d0"
-SRC_URI[license.sha256sum] = "72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6"
-
-S = "${WORKDIR}/scons-${PV}"
-
-UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit pypi setuptools3
-
-do_install_prepend() {
-    sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/script/*
-}
-
-RDEPENDS_${PN}_class-target = "\
-  python3-core \
-  python3-fcntl \
-  python3-io \
-  python3-json \
-  python3-shell \
-  python3-pickle \
-  python3-pprint \
-  "
diff --git a/meta/recipes-devtools/python/python3-scons_4.1.0.bb b/meta/recipes-devtools/python/python3-scons_4.1.0.bb
new file mode 100644
index 00000000000..5894a5ef3f1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-scons_4.1.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Software Construction tool (make/autotools replacement)"
+HOMEPAGE = "https://github.com/SCons/scons"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b94c6e2be9670c62b38f7118c12866d2"
+
+SRC_URI += " file://0001-Fix-man-page-installation.patch"
+SRC_URI[sha256sum] = "accb8035be2c9cfbab06471286eaeff86a10037a8064cf4ef4c3df04ea5a7387"
+
+PYPI_PACKAGE = "SCons"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target = "\
+  python3-core \
+  python3-compression \
+  python3-fcntl \
+  python3-importlib-metadata \
+  python3-io \
+  python3-json \
+  python3-shell \
+  python3-pickle \
+  python3-pkg-resources \
+  python3-pprint \
+  "
+
+FILES_${PN}-doc += "${datadir}/scons*.1"
-- 
2.29.2

