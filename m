Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4933.1793587621060528325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 18:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uWvxucQA;
 spf=pass (domain: konsulko.com, ip: 209.85.215.181, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so393368a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793587620; x=1794192420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8x5WY5lyfhwodnnBpqhNLReWCTWDrI6ZiImC19NnUc8=;
        b=uWvxucQAaoA6KPkqLvLX2YqnNHPIjodB01AzzBuoksltF11cDTCKLwNgkakXj+eF0x
         nEEXB7rk9uvOgEOTZy/uDtaY6wcwaDcbLL/xgG8gWXj8mt9UbYg3coB+yt7Xq2Xx8OJ3
         7e/oimt6PREpUV+B9ZfPR5/hAa6aDFyVHEdnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587620; x=1794192420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x5WY5lyfhwodnnBpqhNLReWCTWDrI6ZiImC19NnUc8=;
        b=zL2+acD4LcY0wr3yGZobuExMMQzaHrBrulN2eZTmbxYCh72KoIH5BwLewVqWVLfGis
         DgFKH7t7P+FPgdLnJ3bBTQnSy2mKzrlQXHQdmnfGbLCtq7uHsnf4eFkYPsUOix5gOo35
         3kwTpWz5XZKhhUCw9pI3Bvd0mYn5RzkvTzaXOrADrQUKv8Y1sfKCGMAqEtpmGh+N6JM5
         BRAgONqxfxgI8KoMEmhkKiJXonEK+bT5xNP9uTE4XhIUZeOfbREdNlEAidKFmDZQG/+K
         5kOX2FFxiENdqlsEfO67obis+MQvcmoG2aOS1mcMXyY+9hC/Xok+0OXKHT0IkS1R96D9
         SRNw==
X-Gm-Message-State: APuU4Z+LaIL0WzZ0SJios+8eVEfZR+4fkCTiSwSiVGS/if9Fz7gZyxb5
	PqacJ7IRjcPt8Z4/wvq4GY834xx2/jvXeZniMBt0s+2VU0YV2hILJKQJu66cnWgYjcjwPghmR3s
	NE3RT
X-Gm-Gg: AYBFou2sg6JjFxgn3/u07gHG1EBkUv0qDZgizO4GF01xAM/lyiJKyWrNI5fd2PDM9yx
	/nBVdodjB9onFpcCq1uNXYR0Dfpoo+OavOM3cVD1au5h6nXaowJYRXUb8HTb5vOey6ce7RBKvPo
	pjds/+VDAbo/qoZH9XsESdbAq7CIeBUiBecPZfzWvaY/7LEnXkAqkGsf5hkJgXCnSMYW/Gyz0+t
	V7JC9W9UHzF5IzBeYG0qdS/cIe4olX3o52FSoV/GO2gXq3EoYym7ZI6+kzMJXXfHnXUTL/XYm5R
	Cl7ijks0npTM1Nsdfx+xqEWc0Z2U3kGi1bhkxSU7WA1BEKisHGiWXLQS0OIlWbTv0Qc8NIgREFk
	zvKu05ZGl15ICHSAs60VCk2WukPp2u+2HWDL2ZZkLtsYLJljelod8lh2q1dkm94o0EL3+VxubDI
	EU3HLD/1ZI1k8JFUkKLEd5WO8NZTqTb1t+SfFapett1R4vFLM9S80qj1KMhjiix9/uib/tPEw2o
	VrqguDxzCye5bpoB1gQVJuxpnlrO1+t8yoBWwj1hPEBwZBJxGt6s7z+u+fxwZelz2O4oFZZMFqH
	2PgFjzuPvOv5uKWVFs++0juJ8IddRrI61Pf8fPOyGo9qaQ/zGh1x2No1e7DtoURojRlwwpo0DkC
	33JT7gOqi/mrSacgp2Cf9zfDwTAWd0CLlwYOqZKeppdiVQiM=
X-Received: by 2002:a17:90b:440d:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ae89829890mr7171617a91.60.1793587620318;
        Sun, 01 Nov 2026 18:47:00 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc8942e0sm2863428a91.7.2026.11.01.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:46:59 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-sphinxcontrib-jsmath: upgrade 1.0.1 -> 2.0.0
Date: Sun,  1 Nov 2026 18:46:53 -0800
Message-ID: <20261102024653.1558814-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 02:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249175
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

First release since 2019. Upstream now builds with flit_core, publishes
the sdist as sphinxcontrib_jsmath (the pypi class default, so drop
PYPI_PACKAGE_SDIST) and renamed LICENSE to LICENCE.rst with the same
text. Sphinx is no longer a declared dependency, and the minimum
supported Sphinx is 5.0.

https://github.com/sphinx-doc/sphinxcontrib-jsmath/blob/master/CHANGES.rst

Tested by building for target, native and nativesdk, and with a
python3-sphinx-native sphinx-build of a page using the extension.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-sphinxcontrib-jsmath_1.0.1.bb     | 12 ------------
 .../python/python3-sphinxcontrib-jsmath_2.0.0.bb     | 10 ++++++++++
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_2.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
deleted file mode 100644
index 0e2b9d2b44..0000000000
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "A sphinx extension which renders display math in HTML via JavaScript"
-HOMEPAGE = "https://www.sphinx-doc.org"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f0064c10bd544bcffccbc67a41c108d3"
-
-SRC_URI[sha256sum] = "a9925e4a4587247ed2191a22df5f6970656cb8ca2bd6284309578f2153e0c4b8"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_SDIST = "sphinxcontrib-jsmath"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_2.0.0.bb
new file mode 100644
index 0000000000..141dcfa7d0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_2.0.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A sphinx extension which renders display math in HTML via JavaScript"
+HOMEPAGE = "https://www.sphinx-doc.org"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=f0064c10bd544bcffccbc67a41c108d3"
+
+SRC_URI[sha256sum] = "551f780cf9687f9c3c74f0cf9f18aca06e0d6958853453f3803fe4d357c5b924"
+
+inherit pypi python_flit_core
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

