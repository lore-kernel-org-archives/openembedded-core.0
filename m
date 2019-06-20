Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5047CBD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 15:43:18 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w25so33482ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1yDYcTehUMQAAhhBDgaM/5p3tZbYn0MfqlxaF9k7Y2w=;
	b=Y5o3KwwBV9DA+ENDyjw0FX+EHtF6pwhqll81cjbI6L8QkAUXLQ93k96q0k7Ayit7/f
	wAylFc3nKcvFry8QGRGUj+z2KpdQ/Fu+W/9VCk/FI1MbWSbYqUSJsgNmPn5FIjqmqNaz
	ViIljxwElev7KcV5tFr9CY1nEvtdEIWvGd7vskvnT9gPFG+dl252O/bpveqUlJ57fhQG
	7EFaWnSb3QOzctYkhvIqUU2mAypT6q88xWXyWMi78MMNk7cP586hKK/jjX1VaSZLZ40x
	iNcwvQixy2QAUiH//PX0EeCNVBwgRy/BNVq7itVivgSAULdviRUhu1Sb0FmIW+eWrHmu
	NeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1yDYcTehUMQAAhhBDgaM/5p3tZbYn0MfqlxaF9k7Y2w=;
	b=WmPn/xHekeknE2ZbpN79JYJbaSNUDF39G75GsDY3mBOxMljCk6PVzTme8whTT99SGT
	6WA3TRo8lxjHkuIspcV1AFyyhLM82jFPHeGO5blk0s+Cifuw0JXr6V9O4Gia+u4TT1Ma
	dOvQoU3bEGbKrkqA7gD2sIrUiJocG0wT1we7NSUQ40AvbpzNqe210+yPK1Nbj4Gg3qFj
	Q8uFK5T26LKZkpgR/HTQO5CkcMhL9X5jhd78LVqAZQZ+rMBZ9V83VprOQ2+gke3i3USb
	CMbgUVjjDLrgBokzk7DMk8KhWqe/7apKYaM7wl0LltAzZI88AgoqHRSMqmUPQs/gu63L
	6Qsg==
X-Gm-Message-State: APjAAAUOIOLwOjLJ3GNSH7x/2eTuWEQj2nNI10kL1CEt9HiZOIZPIG8z
	z6H+AqGU2sMQZLr7h6Km0G7YBTUG
X-Google-Smtp-Source: APXvYqxPRuEg8iAudS/SvD795ql0Np7TqAYozuwF2YNsAExqSSr+yecRFt3YBKXOGc6ehF3D83HKKw==
X-Received: by 2002:a05:6638:3d3:: with SMTP id
	r19mr3621613jaq.53.1561045399401; 
	Thu, 20 Jun 2019 08:43:19 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id p10sm166267iob.54.2019.06.20.08.43.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 08:43:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 10:43:01 -0500
Message-Id: <20190620154302.9251-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620154302.9251-1-JPEWhacker@gmail.com>
References: <20190620154302.9251-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] python3: Reformat sysconfig
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
X-List-Received-Date: Thu, 20 Jun 2019 15:43:18 -0000
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
 meta/recipes-devtools/python/python3_3.7.3.bb | 10 +++++++++
 2 files changed, 31 insertions(+)
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
index 24442961421..d14c93880fb 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -27,6 +27,10 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://crosspythonpath.patch \
            "
 
+SRC_URI_append_class-target = " \
+           file://reformat_sysconfig.py \
+           "
+
 SRC_URI_append_class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
@@ -157,6 +161,12 @@ py_package_preprocess () {
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


