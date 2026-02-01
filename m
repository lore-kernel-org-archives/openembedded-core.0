Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE888D172AA
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 23:49:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41951.1769989765148369059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 15:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S5frTeBV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769989765; x=1801525765;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e70+VnvjlflB4HXkDOxI56fSY1yhZb6O66Jl1xSKc+s=;
  b=S5frTeBVNcwkGlToRJUvOVn/Fcz+UnC2SGRbQc405SEjLnDg38IwWJtR
   sc6l3jE3LAbSxwJ/2d1jM+T3d0djNR1CLIbFqihplTOqIZroU19/+sxOY
   /l/t7ECDROs9nTjlbSwFbvRHiOo73irDt1k1nOZUkH7+e1pp4QZQH6p0r
   aVsKGbPp1gL8xKB9Yfk6s8BtbTftsoDY0J1By1IeMu7OuyDZtFsJ4E4dH
   2QQd/kF9FYiRZhEev4NyYkqJm7aRv7MPEGTzXovAsZmPqqrMnh5kQegsD
   fmi9JEaoSBvRl8sEkip0cDHhcbWFbXFNyGv/9JHu9H/VOqlLGK8aUUJ8I
   w==;
X-CSE-ConnectionGUID: wcvGJ/s5QmG3EIG4FiPtKA==
X-CSE-MsgGUID: 2WU05KXcSAu3Q/G4wIfg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="228035635"
X-IronPort-AV: E=Sophos;i="6.21,267,1763391600"; 
   d="scan'208";a="228035635"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 08:49:23 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 10EED3DD
	for <openembedded-core@lists.openembedded.org>; Sun,  1 Feb 2026 23:49:23 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BABE01C002BE
	for <openembedded-core@lists.openembedded.org>; Sun,  1 Feb 2026 23:49:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2FEA520000DE;
	Sun,  1 Feb 2026 23:49:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-poetry-core: upgrade 2.2.1 -> 2.3.0
Date: Mon,  2 Feb 2026 07:49:16 +0800
Message-ID: <20260201234916.1208-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 23:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230339

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: file format changed from "ASCII text" to
                "ASCII text, with CRLF line terminators"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-poetry-core_2.2.1.bb       | 41 -------------------
 .../python/python3-poetry-core_2.3.0.bb       | 40 ++++++++++++++++++
 2 files changed, 40 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
deleted file mode 100644
index 45af8768e9..0000000000
--- a/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Poetry PEP 517 Build Backend"
-DESCRIPTION = "Poetry PEP 517 Build Backend"
-HOMEPAGE = "https://github.com/python-poetry/poetry-core"
-BUGTRACKER = "https://github.com/python-poetry/poetry-core"
-CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
-
-LICENSE = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "\
-    file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc \
-    file://src/poetry/core/_vendor/fastjsonschema/LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532 \
-    file://src/poetry/core/_vendor/lark/LICENSE;md5=fcfbf1e2ecc0f37acbb5871aa0267500 \
-    file://src/poetry/core/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
-    file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
-    file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
-    file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
-"
-
-SRC_URI[sha256sum] = "97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5"
-
-inherit python_poetry_core pypi
-
-PYPI_PACKAGE = "poetry_core"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-
-RDEPENDS:${PN}:append:class-target = "\
-    python3-compression \
-    python3-core \
-    python3-crypt \
-    python3-io \
-    python3-json \
-    python3-logging \
-    python3-netclient \
-    python3-pprint \
-    python3-shell \
-"
-
-RDEPENDS:${PN} += "\
-    python3-pip \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb b/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb
new file mode 100644
index 0000000000..ce783d49df
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Poetry PEP 517 Build Backend"
+DESCRIPTION = "Poetry PEP 517 Build Backend"
+HOMEPAGE = "https://github.com/python-poetry/poetry-core"
+BUGTRACKER = "https://github.com/python-poetry/poetry-core"
+CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
+
+LICENSE = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc \
+                    file://src/poetry/core/_vendor/fastjsonschema/LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532 \
+                    file://src/poetry/core/_vendor/lark/LICENSE;md5=ba5edf8d60cf416b5588b1e6f152fcef \
+                    file://src/poetry/core/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
+                    file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
+                    file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
+                    file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
+                    "
+
+SRC_URI[sha256sum] = "f6da8f021fe380d8c9716085f4dcc5d26a5120a2452e077196333892af5de307"
+
+inherit python_poetry_core pypi
+
+PYPI_PACKAGE = "poetry_core"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN}:append:class-target = "\
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-pprint \
+    python3-shell \
+"
+
+RDEPENDS:${PN} += "\
+    python3-pip \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


