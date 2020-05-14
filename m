Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.1056.1589490314112520358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZLbE2+6Z;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id f4so235172iov.11
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NnjxMz/+GKb8f324Dlig/jqC9U6xu3PRVt46cnDzTq0=;
        b=ZLbE2+6Za55fNhyg37uO1680/Ylcn8DFzcQn5jYRaAy5ONChAo0Z1sVkZ94z4acGLL
         7P+32Yf39K8/HFpy5r5hO3SQsgOuFNjr+OmznM9sSrljQZkvTM8mAy+XywjWGlph+gYB
         daLNmiQy4UYasVFrtRFo8fTZ1NoDwoMdvCYQIMwVzoeC3OCutNL6y0kll1J4dEasB2+s
         OwxDK3JSqh2RZjIrCgN3MpGnjpVs7MMxUo0nnMszeItZ0zZNbIhuyI3hIyawxBEj0F8h
         AAERFzGn23dXBY8i4dY1HPXHGp4dNvPcAa/K90Opez3BPdJh8e/SZeP0U6Fu/m46oOQ3
         SGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NnjxMz/+GKb8f324Dlig/jqC9U6xu3PRVt46cnDzTq0=;
        b=a70kc1nCBJMyBnnHGM0EC7uTnQemKI4g0bn65l6nlm68sPOSrZmxz053KI8Ii74YTs
         ZZjmJbAWud5TWkcDAxEPPKexKED8/uXCNPDor+9cYgjUzS3+ylnOGIGuMltArz8u0Y1T
         p36fvzSK0cVEakDARdfdQm9pHL2EJkEBJVmhU8be67ow/q5PKjPM0uREj1TlLdVYYXdG
         Gjs7v8I4GsQNPL7QRIRk5Ku706ZcS/vb14rh2byOWobSt+5U88FkB03d4VK/E1lwTy6O
         MowQGM/eq82rpOoy7TeKvHwmbdLVbcNuLKmuP94yFuXBwq9t4EiNBuvlcEbruWOBcOmU
         eSVw==
X-Gm-Message-State: AOAM533LthVFIeJBgJa+afs0H/fww/s1BqW5WQwJnS+U0KxEKcQk3x3+
	7wFiDghdiWx8a8iq9tIeYgYPKl0e/N8=
X-Google-Smtp-Source: ABdhPJzda7YTn+rO/cHPr12MlIJUMP+0ymmuXKRSbR4PXnov5j4Z/Tg6ojidk623kWwej1Q5L0nHaw==
X-Received: by 2002:a02:85ec:: with SMTP id d99mr166327jai.144.1589490313175;
        Thu, 14 May 2020 14:05:13 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:1041:f567:5747:59e9])
        by smtp.gmail.com with ESMTPSA id t20sm52356iob.27.2020.05.14.14.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:05:12 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jdmason@kudzu.us,
	denis@denix.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/4] pycryptodome: Import from meta-python
Date: Thu, 14 May 2020 16:04:55 -0500
Message-Id: <20200514210458.33543-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514210458.33543-1-JPEWhacker@gmail.com>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>

Imports the pycryptodome recipes from meta-python, as of 7c02c7d41
("gnome-themes-extra: correct the recipe name").

These recipes are commonly used by other layers, so moving them into
OE-core helps to cut down on layer dependencies.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
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
index 256666c0ec..b87790e0e9 100644
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
@@ -579,6 +579,8 @@ RECIPE_MAINTAINER_pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
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

