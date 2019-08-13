Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0278160053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:13:28 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id x3so77523025lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=H7NHU/72KjZJ2LrpLw9QCzoyhih5fSR5CSZZc93qvQY=;
	b=0ux4GQYG2MUQUgx4mNCgLtwoLj42PUSFopPcyFHEJ/nlMSHyrcpU/GJ7Yg4AbvIwdx
	yUGh7Cq42TtJqc+7IBfaPaTDu1zQc3R28aDSCUaNsefN5t0X+DMW0wzswy1Csn17bgtX
	P/royQbyEXO/1dkWQRYwERoMvPceomtnhUoyoDtacxVAwxvWh5k8NvJ/VJvgdUICYeMC
	dvazaIM95WyT7hwAAQi4beekwQorqGXlVTstTLtq4KxN0bw/A6MZxc0W8OWLsp6d8wDJ
	uvTe0sQm9DE96OWvsurxM75iMmpGsrjvZCkNooi6GLr1XlCix2hZWJk33uEMAe+NIlRc
	valw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H7NHU/72KjZJ2LrpLw9QCzoyhih5fSR5CSZZc93qvQY=;
	b=qUzfWvLLDd4tWZqcGjWNgeeu6o6RlpA8Y37IDt9KT/T/eFNoJC9LXQk4XA94aCwiYw
	P+fh9VI+/rtbf+NdI+irzJrkHotrRSkial6VdRaGRTwV8ZGCIyK6RCZZH0KB7PaWQLtX
	Mk5SBhTBnFwFfF7NGSbrl9CDDtDLlETer5HxpDksZxs1uQ06svM23D3pXFHYuIgdIO5k
	Uac7w6gqzLnx3llz8wJg8xRIbFbYP7jJh5zqvns/JbvxOdNMyMEdduMLIrWJwy/97AP7
	NgS20E60pOLdbOwDT8nvreYUEwixdVygTYLWoXeLkBA6NSAlTfpWTRbhTuxwUyz42AFu
	guRg==
X-Gm-Message-State: APjAAAXTrF2HH59/WYqhv3i8uYTt6nWkLiNtgJ7QZPbuJkoNPBIxAEY8
	jg23LCsbYmHNgUcWfqYxDZl7oDQtylA=
X-Google-Smtp-Source: APXvYqxwRlHd+yqDTuNpdf+ojIThXcplSWr+wdGKeu5C3yU0AG0+nFcaYFEeo2FdkGbQsdEd8+dXkw==
X-Received: by 2002:a19:e006:: with SMTP id x6mr22814106lfg.165.1565720009124; 
	Tue, 13 Aug 2019 11:13:29 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	i17sm19851439lfp.94.2019.08.13.11.13.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:13:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:13:27 +0200
Message-Id: <20190813181327.25882-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] librepo: update to 1.10.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 18:13:29 -0000

Also cleanedup the recipe.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{librepo_1.10.4.bb => librepo_1.10.5.bb}       | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.10.4.bb => librepo_1.10.5.bb} (58%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.10.4.bb b/meta/recipes-devtools/librepo/librepo_1.10.5.bb
similarity index 58%
rename from meta/recipes-devtools/librepo/librepo_1.10.4.bb
rename to meta/recipes-devtools/librepo/librepo_1.10.5.bb
index 50c9a82e74..87d64bf3a0 100644
--- a/meta/recipes-devtools/librepo/librepo_1.10.4.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.10.5.bb
@@ -1,4 +1,5 @@
-SUMMARY = " A library providing C and Python (libcURL like) API for downloading linux repository metadata and packages."
+SUMMARY = "A library providing C and Python (libcURL like) API \
+           for downloading linux repository metadata and packages."
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
@@ -7,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "9b2df22dbcdf9352672334098fff56335aa10423"
+SRCREV = "385e2ced1083cac0bcb19e30500311f6923e6dfc"
 
 S = "${WORKDIR}/git"
 
@@ -15,7 +16,12 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake distutils3-base pkgconfig
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF -DWITH_ZCHUNK=OFF"
+EXTRA_OECMAKE = " \
+    -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
+    -DPYTHON_DESIRED=3 \
+    -DENABLE_TESTS=OFF \
+    -DENABLE_DOCS=OFF \
+    -DWITH_ZCHUNK=OFF \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.17.1


