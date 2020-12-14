Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.35182.1607956701919975630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1V6abZLo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id j1so8725637pld.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=g6MEmp7KpF0r/63XVqku2x/J9ZwJYj8wQnIe9tme2f4=;
        b=1V6abZLo6MzYp7LMscydQNiBMgn17UVoNWdPrBUGxb0V83K+mzC3juZgj2OhbBsk1j
         bu5xeRbM5Y1sAfmOkWSJbPPLepBOLNuYuZ/ovuXzsmowfYkHUXjugsTVuQzrfYs+Ubcd
         T5MX8lBVy5EEauUAabH36R3dsLCBNx38Pr+T+8wnJwnltLoOZIyysvkmSlDyh2LC8Rfo
         jmsETVMr9rNiGKvARaEwLEuIL5TXmX5Lafc12a7PaZ6tVm23m5xo6GjIgz38FvQzqn++
         jerP4+dmWeqPI89/5WUPnRGdXcY2U3r3udk9YiXUeN2pA52vBTVa1pf1DzikMH0iWUM0
         ZdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=g6MEmp7KpF0r/63XVqku2x/J9ZwJYj8wQnIe9tme2f4=;
        b=CpUPwl9hLWlupvrxdC57TnIJ4nghyeswsMur3k/yrwcIYu/905gTUwSdprVAlgom8O
         ld+HMprUrG9HTv2BJ6fKuXFhlK8Yj18USjXH59GInawENJxvMk/dveSTLw/87EZH+hgK
         EfwKYo4uCLV0pbwu5EWpguIjys1lpie8sfHyrjWfOcsVhe0Xl2n3jrsCbD6XIbduPQ7v
         4c7Dt0SDj9UmF9Pm1jJTGpuHaA6ccmUVEc8SbADF/BkOC8aG5hH7aNMRry0jyzoCCHyD
         xUat37NSYqJSR1kdWGQqO6qHFm+IRm/ZcjgFgj4eXWyw/s9YcTqIw0O58eXKlsTHEtTc
         xLYA==
X-Gm-Message-State: AOAM532AzFZBIhq4BP98XUWXSPVzemeTXEa1AGp4BlrJYktznRDOnZNd
	1+Jab1iRauSHWDRhgYOccrrPPOhW7TFDxgRG
X-Google-Smtp-Source: ABdhPJxGLvXDBE1sF7tVhuiRTcSi3B6FnDXR6TEJx2yiUbkjewE0hx/JHDAKeyFzahy4dXSxw9MAiw==
X-Received: by 2002:a17:90a:ab8e:: with SMTP id n14mr24883610pjq.96.1607956701033;
        Mon, 14 Dec 2020 06:38:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:38:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/25] python3: fix CVE-2019-20907
Date: Mon, 14 Dec 2020 04:36:54 -1000
Message-Id: <f7e7378ea7099af8555de809787cf8e2cb5208fd.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Andrej Valek <andrej.valek@siemens.com>

 - move fixing patch for CVE-2020-8492 to the right location

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...20-8492-Fix-AbstractBasicAuthHandler.patch |  0
 .../python/python3/CVE-2019-20907.patch       | 44 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |  1 +
 3 files changed, 45 insertions(+)
 rename meta/recipes-devtools/python/{files => python3}/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch (100%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch

diff --git a/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch b/meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
similarity index 100%
rename from meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
rename to meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
diff --git a/meta/recipes-devtools/python/python3/CVE-2019-20907.patch b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
new file mode 100644
index 0000000000..a2e72372dd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
@@ -0,0 +1,44 @@
+From a06a6bf4e67a50561f6d6fb33534df1d3035ea34 Mon Sep 17 00:00:00 2001
+From: Rishi <rishi_devan@mail.com>
+Date: Wed, 15 Jul 2020 13:51:00 +0200
+Subject: [PATCH] bpo-39017: Avoid infinite loop in the tarfile module
+ (GH-21454)
+
+Avoid infinite loop when reading specially crafted TAR files using the tarfile module
+(CVE-2019-20907).
+(cherry picked from commit 5a8d121a1f3ef5ad7c105ee378cc79a3eac0c7d4)
+
+Co-authored-by: Rishi <rishi_devan@mail.com>
+
+Removed testing 'recursion.tar' tar file due to binary data
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/c55479556db015f48fc8bbca17f64d3e65598559]
+CVE: CVE-2019-20907
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+---
+ Lib/tarfile.py                                    |   2 ++
+ .../2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst      |   1 +
+ 4 files changed, 10 insertions(+)
+ create mode 100644 Lib/test/recursion.tar
+ create mode 100644 Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index d31b9cbb51d65..7a69e1b1aa544 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1241,6 +1241,8 @@ def _proc_pax(self, tarfile):
+ 
+             length, keyword = match.groups()
+             length = int(length)
++            if length == 0:
++                raise InvalidHeaderError("invalid header")
+             value = buf[match.end(2) + 1:match.start(1) + length - 1]
+ 
+             # Normally, we could just use "utf-8" as the encoding and "strict"
+diff --git a/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
+new file mode 100644
+index 0000000000000..ad26676f8b856
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
+@@ -0,0 +1 @@
++Avoid infinite loop when reading specially crafted TAR files using the tarfile module (CVE-2019-20907).
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index b4cce88e87..9eddad4ad4 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
+           file://CVE-2019-20907.patch \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
-- 
2.17.1

