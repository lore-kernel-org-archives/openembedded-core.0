Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.16517.1591198490000810160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 08:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yJGVyS/2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id bh7so928113plb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P5+LkxXPy8uUeKrJy4Jn/tzGVsZ7K/wgijwmzLR9Who=;
        b=yJGVyS/2LbgJAPThmkR5i/gSkVC643kPKGF0h4T8YS2WIg7520uBzrHMouTt1q9c9K
         FuWrm0WYjgBmW66ZkFkbmoLF0jseY+UHXA0gDZaHo5l9nrevWoBLIOGrxAJ7wEYe0eR4
         oEYqOu45/wgTQJ6VksIp3rvJlLV8Pruz/FhO9+E4ukVlNAQg7beSL8b53rNF2aSGlkWx
         JYgx7nOBUQx4R/EIYEtBjyz4FHdowC3V2qr8LagxAyxv6561kDOXGsoMT46O7FWExh11
         0e9RYjLY0yyAVVJDAJPs39sjAFAE56tw5VVoPr+2DOoyLLM1OP4eXU54pNF+lroByyQk
         cJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P5+LkxXPy8uUeKrJy4Jn/tzGVsZ7K/wgijwmzLR9Who=;
        b=HavJdObIOraxVf835VY1mpXrVPZa2Hnu9aDtVs7JMLZGt6v17BQFdVWFr31Q7zWz8z
         uRyGjlanIrqQwXgxwLhqDc6xX2xJCHmrc+UzfJItenL4omHSpQAlQFUW9++rw6XziAtE
         DSA3K/mGKGGAkyug/5U7Wo2zlEFyK3vtUEImsD7b5E1fDWw0tcZJwPjoqcZZbaEtjOm+
         s+dBYxC4v2qEeJM5QxQWbQZk/zfmsJ14NLUahWy8rc/gwN44zLDRbY1JRU0OTSzpyU3x
         L280V0BSZKfLfh1mur5YQ31Q3iCfeP9xHHPtoSirhns+av6czLe46YE1ZHRV1pZC3T2J
         FD9A==
X-Gm-Message-State: AOAM531kBmNIUHs02tQLySL8yfqttxkIfIPOLhg+Q+9iPN7YzHWEgfnU
	/nBK1PQtKoCEejwA+o4dfxQzI2H6c3k=
X-Google-Smtp-Source: ABdhPJxucZVN/TpdmZir2tDo1v/qe/K7jXxPU6up29NmprJ0hIs8Ut/k86SwRkkPFeXWbopBfNQFYA==
X-Received: by 2002:a17:902:a401:: with SMTP id p1mr423147plq.291.1591198488293;
        Wed, 03 Jun 2020 08:34:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id np5sm3187660pjb.43.2020.06.03.08.34.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 08:34:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] pycryptodome: Import from meta-python
Date: Wed,  3 Jun 2020 05:33:58 -1000
Message-Id: <27798f3da506fcae19b74deb17ef199131cff405.1591197295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591197295.git.steve@sakoman.com>
References: <cover.1591197295.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Imports the pycryptodome recipes from meta-python, as of 7c02c7d41
("gnome-themes-extra: correct the recipe name").

These recipes are commonly used by other layers, so moving them into
OE-core helps to cut down on layer dependencies.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a96f815c53364b119b5743b8b7100eb5588d5cf5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |  4 ++-
 .../python/python-pycryptodome.inc            | 29 +++++++++++++++++++
 .../python/python3-pycryptodome_3.9.4.bb      |  2 ++
 .../python/python3-pycryptodomex_3.9.4.bb     | 10 +++++++
 4 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 40e90f782b..a20a1d810a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -2,7 +2,7 @@
 #
 # This file contains a list of recipe maintainers.
 #
-# Please submit any patches against recipes in meta to the 
+# Please submit any patches against recipes in meta to the
 # OE-Core mail list (openembedded-core@lists.openembedded.org)
 # For recipes in meta-yocto please use the Poky list (poky@yoctoproject.org)
 #
@@ -576,6 +576,8 @@ RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravch
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER_pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
new file mode 100644
index 0000000000..63b4a4abb4
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -0,0 +1,29 @@
+SUMMARY = "Cryptographic library for Python"
+DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
+ cryptographic primitives."
+HOMEPAGE = "http://www.pycryptodome.org"
+LICENSE = "PD & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
+
+SRC_URI[md5sum] = "f990716b49add7b14ea8b8a961fb3746"
+SRC_URI[sha256sum] = "a168e73879619b467072509a223282a02c8047d932a48b74fbd498f27224aa04"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-math \
+"
+
+RDEPENDS_${PN}-tests += " \
+    ${PYTHON_PN}-unittest \
+"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests = " \
+    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/ \
+    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/__pycache__/ \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
new file mode 100644
index 0000000000..0c062dddf8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
@@ -0,0 +1,2 @@
+require python-pycryptodome.inc
+inherit setuptools3
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
new file mode 100644
index 0000000000..e41c14b142
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
@@ -0,0 +1,10 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
+SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
+
+FILES_${PN}-tests = " \
+    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
+    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
+"
-- 
2.17.1

