Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6268.1795819754198601234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 14:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XPZBcTnM;
 spf=pass (domain: konsulko.com, ip: 209.85.216.44, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso7318749a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795819753; x=1796424553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7msWlKxY/XEXxPRe1U7+Lo9ne2jRBf52kbdS5VuvAaw=;
        b=XPZBcTnMtKsFJ8xcgQkVGETZFvtJhhDndT3+W1CSnYYte1H4X1MYSZ31v3W7xTBOWz
         nOjd0ZabdvT8B1FHNtQVWcRDDwol/wjeTd3cQat4930OnNIZAfqZ636640hYleodOJsy
         6M3RdQbIz9E25VXzWNP893TLFs/ssHuOFhcHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819753; x=1796424553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7msWlKxY/XEXxPRe1U7+Lo9ne2jRBf52kbdS5VuvAaw=;
        b=QMUvTt2LlvAUFQgQEXA9DI1uxGXIMJ/gUxB5RGfcgq2ef445vhMjnciAJ2aVKJmuHN
         LeRfxOT+DotKuBLAqctIyvodQvGPA1s+YwV2k55eBoDxMv84IUMxjERi5KBle74OJ+Di
         7+8OrHMh2inbe4FTJ5wDsXekB8K5yZdzgJbn+DABgVJHDXZ5qQ0pD469S0oH14XU9L1n
         rLcrpCS4a1EqHwtnv/b2zcmLm+63npMh0tmKhtI376RAAnqLGDWBs2Nnup0Es4HXfQ6f
         IYCBSzmMKm6Z6zu3OI4Ca9Uz82RGPeTZLEmsUsyE3qgNtkFseEUZdSYcCHqx/3Tl25qS
         +EtA==
X-Gm-Message-State: APuU4Z+60f93yoS9cAfTUpvXMdZ5qGVrNOmAUZqoBCK9CtaYsg8IJpxE
	g4z2cd7ilv+XC6d/6k8R5MbHyQlcq7Nm+qA0cg6Fb2g9JbPASB9YIxscjxqIcENVoa1zmHtQfHX
	5ZwaV
X-Gm-Gg: AZFdTZcPydldtkylehclttgz/+5VwT6tb6E1d5hPrHAD75k/nKM8NCScVtwhsNdaXiY
	GEvNg/y2K+huAKYUV+DvYlFIZHnrLdS87gHVTw8xPb7QIKz1HYOB4KgMcrs8ZK+GddTfR9TUCfw
	I0mja9MoafwZihn0WrHlE8eplJySXLOcCKFxI2TzNBRc1mR1yQA27iLpwOClesywVBRhSwqSsb9
	s5pD4iCXVvbQgXCNK6K3xD+O6M4vVoLo9N9Dr8lwD4upPMbPwRNp1fa7CBgJzGg9EMcOlJdwVWe
	hl1bKjHwi1Fsu510/pkY8qjlrBd2gHnFE380+TWvHgrpgnRCzD7nCOO73pVRSDQRD+aZBwNuznq
	eWTwsRVOu9OQrr6jXjqmKjo0Ss6GH/TsyTHdXPLZU3veC/l8oO5FC67bqy+bB7AovgPYrmd15iG
	nN9rfGTEOXcj0NMVnwzGz4xUvQovA/BftsPv1ilPYiEuVV/ZbdrE7aN8X9qWPJO6zHloni0PXbj
	PLP3uFaGgBIApxdrf8YZgbl38L1mGdhNyfxghZFdjUrMwRqHpXTMDlhAE7Qfi5QgDarGAbfSeQ+
	RF0suDzqazOTWOSQP3xvhKM1E5UTnzyKuTfNOdQMJoLavMtYJjYShXPVP41N913ntE+IZmlxYO+
	zinmvbDNzwoBF02r+341buiE5HxJ69oNzR1Harg1k87isZp2fknWCDFTnyAUvfxXPFtzv
X-Received: by 2002:a17:90a:9118:b0:3b4:1d3e:3d5b with SMTP id 98e67ed59e1d1-3b41d3e3e1emr14860999a91.28.1795819753514;
        Fri, 27 Nov 2026 14:49:13 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm13054344a12.21.2026.11.27.14.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:49:12 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-babel: upgrade 2.18.0 -> 2.19.0
Date: Fri, 27 Nov 2026 14:49:10 -0800
Message-ID: <20261127224910.51638-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 22:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251465
Content-Type: text/plain; charset="utf-8"

2.19.0 builds with hatchling instead of setup.py, so inherit
python_hatchling; this is why the AUH upgrade failed. Backport the
upstream fix that relaxes the hatchling~=1.27.0 pin, which hatchling
1.32.4 does not satisfy.

Add DESCRIPTION from the upstream README, update HOMEPAGE since the
project moved from babel.edgewall.org to babel.pocoo.org, and drop a
leading space in RDEPENDS.

Changelog: https://github.com/python-babel/babel/blob/v2.19.0/CHANGES.rst
- Use CLDR 49.
- Add pybabel concat and merge commands, read command configuration
  from pyproject.toml.
- Many fixes for dates, message extraction and locale data.
- Drop support for Python 3.8.

Built for target, native and nativesdk.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-Fix-required-hatchling-version-1490.patch | 25 +++++++++++++++
 .../python/python3-babel_2.18.0.bb            | 25 ---------------
 .../python/python3-babel_2.19.0.bb            | 32 +++++++++++++++++++
 3 files changed, 57 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-babel/0001-Fix-required-hatchling-version-1490.patch
 delete mode 100644 meta/recipes-devtools/python/python3-babel_2.18.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-babel_2.19.0.bb

diff --git a/meta/recipes-devtools/python/python3-babel/0001-Fix-required-hatchling-version-1490.patch b/meta/recipes-devtools/python/python3-babel/0001-Fix-required-hatchling-version-1490.patch
new file mode 100644
index 0000000000..93ef147a48
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-babel/0001-Fix-required-hatchling-version-1490.patch
@@ -0,0 +1,25 @@
+From b778b94e19ddda2d63717855e368ccf3127c6b5d Mon Sep 17 00:00:00 2001
+From: Nils Philippsen <nils@redhat.com>
+Date: Wed, 25 Nov 2026 16:04:23 +0100
+Subject: [PATCH] Fix required hatchling version (#1490)
+
+Previously, the hatchling build system would effectively be pinned to version 1.27.0 (technically, any 1.27.x would be allowed, but there was only ever .0).
+
+Upstream-Status: Backport [https://github.com/python-babel/babel/commit/b778b94e19ddda2d63717855e368ccf3127c6b5d]
+Signed-off-by: Nils Philippsen <nils@tiptoe.de>
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index d873f86c0..a5453c6d1 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["hatchling~=1.27.0"]  # Bump when no longer Python 3.9
++requires = ["hatchling~=1.27"]  # Bump when no longer Python 3.9
+ build-backend = "hatchling.build"
+ 
+ [project]
diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
deleted file mode 100644
index 9beb002db1..0000000000
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A collection of tools for internationalizing Python applications"
-HOMEPAGE = "http://babel.edgewall.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a2b86daab39fdb8ce59d97e9fecc90ee"
-
-SRC_URI[sha256sum] = "b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c5750937c992d"
-
-inherit pypi setuptools3
-
-CVE_PRODUCT = "pocoo:babel"
-
-S = "${UNPACKDIR}/babel-${PV}"
-
-RDEPENDS:${PN} += " \
-    python3-codecs \
-    python3-difflib \
-    python3-netserver \
-    python3-numbers \
-    python3-pickle \
-    python3-shell \
-    python3-threading \
-    python3-zoneinfo \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-babel_2.19.0.bb b/meta/recipes-devtools/python/python3-babel_2.19.0.bb
new file mode 100644
index 0000000000..008c1e1729
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-babel_2.19.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "A collection of tools for internationalizing Python applications"
+DESCRIPTION = "\
+Babel is a Python library that provides an integrated collection of \
+utilities that assist with internationalizing and localizing Python \
+applications, in particular web-based applications. It includes the \
+Unicode CLDR locale data."
+HOMEPAGE = "https://babel.pocoo.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a2b86daab39fdb8ce59d97e9fecc90ee"
+
+SRC_URI[sha256sum] = "fddd2cbbbac7c299af3c2880be23609c331bd94f0912baca6cb0abfe054dfc27"
+
+SRC_URI += "file://0001-Fix-required-hatchling-version-1490.patch"
+
+inherit pypi python_hatchling
+
+CVE_PRODUCT = "pocoo:babel"
+
+S = "${UNPACKDIR}/babel-${PV}"
+
+RDEPENDS:${PN} += "\
+    python3-codecs \
+    python3-difflib \
+    python3-netserver \
+    python3-numbers \
+    python3-pickle \
+    python3-shell \
+    python3-threading \
+    python3-zoneinfo \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.56.1

