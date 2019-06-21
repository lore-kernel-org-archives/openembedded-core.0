Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9047A7E73D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 13:36:04 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s7so3007073iob.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Sz3rNTZZSP0TEQRXgjM6meFEBVvFSQp1JVAU+9btjWc=;
	b=QYDFetcFwIpWxQVpEBQVsA1c1TBxE6jf9GbdkzcWkCV0ACG/Ga7xvcRq9m3F/XGrkp
	whPOir0J804I1qVNgplUFxJez+D2kxna+wwBmWwX5rePdxTm1L/5ywiSLtiI5HGVDDdH
	14AYrIA91wLYft/7eJLzVxzpeRm3WxiMFGyyCpIoRu0eUBeYxbaOhwfz8lI4z1y8+bdV
	rKGbHvqfOECZ6oAtl+JiDMGKAmjtiDtuCQHZ1aKTQE/ww45dNxq6JEAv9texa0hS/cOi
	IZefIhKJZ02Vw5sobFoatKOgNZ+BZPM6SKTJq6XTfaytbaZf5mIDdrNsEAWUcnNhf5U3
	UgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Sz3rNTZZSP0TEQRXgjM6meFEBVvFSQp1JVAU+9btjWc=;
	b=k+gZ7iV+DTzbaodSoNwPLT4r2s9NviRuGoK57IdsN8tOHZQGwlfrrURtoN5+RY44Hg
	fZuKK7AxJ7W0BwaSYzxl5U4BdpKr5eH6eKyINS4aiCdpPY84T+tUeRaq0opB/286yplQ
	G8/CmBen/PNAUsWTADBATxFc3mo46QJVZ9XC0/Uplxd5SmpbvHK7fYuBe7MsXvcGDVB+
	OnOlFXA4iIm0SoLNg4S4+clmHRJZeeNJhp8dQmIMneKqQTlp4MRN1YdGGNKR/KGW6Aui
	BdF+ZJ1ZertFjYW2AvZsTK5hlYvTDhWb+NhAhwDDl3VSZXGhWnk3FW/gVQzfM5BDsk0m
	rrdQ==
X-Gm-Message-State: APjAAAUpaZ9iUVX0nHqv9ecYd6rEuNfHdyzQHX9/lM8dbsnOQEfvqoIE
	q9jCDa4ndGArx3SXZrpZzbl16ah1
X-Google-Smtp-Source: APXvYqzwdwV49U6h0RhJEoTkpHwkFP/DHEkOwrpK0iZXXRzbUeXwmM7zmEhb8n1LX+G4+Ln+iypTjQ==
X-Received: by 2002:a5d:9ec4:: with SMTP id a4mr7218368ioe.125.1561124165384; 
	Fri, 21 Jun 2019 06:36:05 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id k5sm2950182ioj.47.2019.06.21.06.36.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:36:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 08:35:54 -0500
Message-Id: <20190621133554.11030-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620154302.9251-2-JPEWhacker@gmail.com>
References: <20190620154302.9251-2-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] python3: Reformat sysconfig
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
X-List-Received-Date: Fri, 21 Jun 2019 13:36:04 -0000
Content-Transfer-Encoding: 8bit

Reformats the sysconfig file when packaging. This file is output by
using the python pprint function. This function will wrap long lines at
80 characters by default, and will even split strings at whitespace
boundaries to do so, e.g.:

 'A': 'B is really'
    ' long'

This causes a problem for reproducibility however because there might be
lines of differing lengths depending on the build path. These
non-reproducible paths are removed, but their effect on string wrapping
from pprint remains.

To correct this, reformat the entire sysconfig file by re-printing using
pprint with an (effectively) unlimited line length.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../python/python3/reformat_sysconfig.py      | 21 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb |  7 +++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/reformat_sysconfig.py

diff --git a/meta/recipes-devtools/python/python3/reformat_sysconfig.py b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
new file mode 100644
index 00000000000..c4164313e8b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
@@ -0,0 +1,21 @@
+#! /usr/bin/env python3
+#
+# SPDX-License-Identifier: MIT
+#
+# Copyright 2019 by Garmin Ltd. or its subsidiaries
+#
+# A script to reformat python sysconfig
+
+import sys
+import pprint
+l = {}
+g = {}
+with open(sys.argv[1], 'r') as f:
+    exec(f.read(), g, l)
+
+with open(sys.argv[1], 'w') as f:
+    for k in sorted(l.keys()):
+        f.write('%s = ' % k)
+        pprint.pprint(l[k], stream=f, width=sys.maxsize)
+        f.write('\n')
+
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index 8e77dbe9595..3409d94ba08 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
 	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
 	   file://crosspythonpath.patch \
+           file://reformat_sysconfig.py \
            "
 
 SRC_URI_append_class-native = " \
@@ -165,6 +166,12 @@ py_package_preprocess () {
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
                 ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
 
+        # Reformat _sysconfigdata after modifying it so that it remains
+        # reproducible
+        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+            python3 ${WORKDIR}/reformat_sysconfig.py $c
+        done
+
         # Recompile _sysconfigdata after modifying it
         cd ${PKGD}
         sysconfigfile=`find . -name _sysconfigdata_*.py`
-- 
2.21.0


