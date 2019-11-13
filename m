Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 51A327F69C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:01 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id x28so1870538pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nqL1CDl7Bo8RJM1golPqbCKAhv5wP55+JOua9dX2aKs=;
	b=rVder3LuOo5DpDniGDEreJgHhaheKYpkRrJq+MF+LYEr3nGutwRT3/jMmbBJBxDnaY
	kamFevEzArQhyv3J0Uwdqz7iwodKo2edBLtHdjZ7goM3Wpv0UNUx31NyIjWSDXd7keod
	q7qfw0Yzjp0umFBwVSu/O4Zx06HtbpomdwsxzoeK66VeOErqMMXYlbW77S89SyAczgF9
	GKD5f1BvDfKX751ahOFbhkC1fpSjZctdZb5YD+c+vwLWQB0qcL+MaOK8FTqqH9+bF70M
	3Orby2m67kJqIRBjFhKl+UuF75q1hcc6M/5c3c1hjVrG2sGUfLZWuh50yiypZRE0kaIM
	BCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nqL1CDl7Bo8RJM1golPqbCKAhv5wP55+JOua9dX2aKs=;
	b=HSnCTa4xK6ZsioiyXYktLby4RNS5jCw54SG0X/luUjCVZIh6OKn0Rh/NUd2EgzVkRd
	KlIMqfVRrnZp9H69F97ZYAlIDUsgWra4QF/VClr9cyWV9urlDR7nXARH4RYMJefBl4Sv
	8kD1BoYAhXt5R0UjIX/0/rduPzwhhfp9k5Xlu5e7k1biUQ78O3LuKKJtsKsseAhr+RtL
	73dpOo8vmFtOntn5mJTHPAT+58oloTpSHKU2UijkM0QJkYT5bImLB6OuFg2QG9Emmyfg
	dj7DcyfujF7z2enFjU6yvTMyrZtmqbyLuAK48TfHEIGAyPLu1eHBfbOtnTQAe6f9IP9E
	GT6Q==
X-Gm-Message-State: APjAAAUFnAmh1/k/jdYKAbFNxHcICr9bm9yxP1ncdh3rexN+gKtM+jBv
	18pW2KqzMRzyUPiOSGobpnM2pScn
X-Google-Smtp-Source: APXvYqwMmgCJx4J3VabphmphPa2q9lHjmomFIhnG81w6Y4iQL8Dwot/+4JvmgDSlcuHhatmUc5EifQ==
X-Received: by 2002:a17:90a:c68f:: with SMTP id
	n15mr5754295pjt.20.1573658402205; 
	Wed, 13 Nov 2019 07:20:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:19 -0800
Message-Id: <01e4409e81c3d037fcba82fbcb3273dd1118490b.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 16/25] python3: Reformat sysconfig
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:01 -0000

From: Joshua Watt <jpewhacker@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3/reformat_sysconfig.py            | 21 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb       |  7 +++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/reformat_sysconfig.py

diff --git a/meta/recipes-devtools/python/python3/reformat_sysconfig.py b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
new file mode 100644
index 0000000..c416431
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
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index c5a5db1..e9ec604 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
 	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
 	   file://crosspythonpath.patch \
+           file://reformat_sysconfig.py \
            "
 
 SRC_URI_append_class-native = " \
@@ -157,6 +158,12 @@ py_package_preprocess () {
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
2.7.4


