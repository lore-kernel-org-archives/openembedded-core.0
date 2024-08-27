Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F9BC52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.71672.1724736247977443781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hEDgca20;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a86883231b4so659073466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736246; x=1725341046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHoWOJHrL2etsHGa/3cMSy6RC3eKrGKqw75KJboDwqA=;
        b=hEDgca20tYr0VD2QKhsTYXCy6Vn+CTp9xmmdv/DGcqWVYtqulfefmJHM5e06KZ8EBS
         IIFeE2wyKOp99WLnUjcIT+eKjpST1NwX1p23/DMkHRhjNM8AHW5c9BsbRFYIYyIOD59f
         eJWvZp02E3G5LR35M6/z8JVDNPwA5RQIRqFfco6vXwf+8vfphk1IM9BZMw5suTgAe4ID
         DPmoDQ1DYgndHZsKYQ23yWy7pMUQVcozZZAyOzebrE4AmfRWxs7IfnDuBQpL9pwgxwRs
         QyIthidrEswdnE7xoCUlYhd9HwltQ2+ol/K5z5jiNwyvH1qMVeXfeQ2kZwyXObfMwi0C
         vA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736246; x=1725341046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHoWOJHrL2etsHGa/3cMSy6RC3eKrGKqw75KJboDwqA=;
        b=OtjUPJc7tfGYoOSQCotqp4d8MQO/toZyF2l1XVbCbo4Ua99hyboVcHO448ccktoNH6
         oJ9t0ZImcAHhsRRN/wkk6zXwvqkLgXsl5tXwBXCX0RDsmXzK5ONRULtaF+h7XNSZ89bJ
         Xlt//i20v7y3I/29NpOGq9g1xhLsy8V1P7SCB5xuSIvNBZ5rsDvLwutCf5UhIjBCy8rd
         Q8kW0O/ADBYN++eQPLy4fXsejn+6XN9V84wSL6UnPdQODGChencZ458frQ3e2V0H6Jgo
         59EMFot8t72rKcMBsx9OEGVlixFs1pHOZmSgcaj2xY3Petxe7TcZc8rLKrgJcY7vJ5es
         oP5Q==
X-Gm-Message-State: AOJu0YxIisQFBW8743p/uzKqJpIKXxlZNJDS4bp1gqael2+BBjfPF1ju
	jfVGnuOrS6L1KBUY2xRbsR3SXWTqvHEOyIpQr6Te3f04IBxkYZ/AOoRRwQ==
X-Google-Smtp-Source: AGHT+IFhcXxYHChKZy8ZB0A2QaBl9vtLFq07p4uoIYJi+hHHYyycX+9ySIybeKPXib5KaP4tJaH0zQ==
X-Received: by 2002:a17:907:9496:b0:a80:f840:9004 with SMTP id a640c23a62f3a-a86a5178cbamr874440466b.12.1724736246072;
        Mon, 26 Aug 2024 22:24:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/34] python3-pyyaml: update 6.0.1 -> 6.0.2
Date: Tue, 27 Aug 2024 07:23:35 +0200
Message-Id: <20240827052354.1319810-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203791

From: Alexander Kanavin <alex@linutronix.de>

With this release, cython 3.x is finally officially supported.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-builds-with-Cython-3.patch       | 54 -------------------
 ...yyaml_6.0.1.bb => python3-pyyaml_6.0.2.bb} |  6 +--
 2 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
 rename meta/recipes-devtools/python/{python3-pyyaml_6.0.1.bb => python3-pyyaml_6.0.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch b/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
deleted file mode 100644
index a87d588b6a1..00000000000
--- a/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 9cc23db56add79357b8f8257fe6fc0d6879d4579 Mon Sep 17 00:00:00 2001
-From: "Andrew J. Hesford" <ajh@sideband.org>
-Date: Fri, 21 Jul 2023 09:50:00 -0400
-Subject: [PATCH] Fix builds with Cython 3
-
-This is a *de minimis* fix for building with Cython 3. Recent Cython<3
-releases provided `Cython.Distutils.build_ext` as an alias to
-`Cython.Distutils.old_build_ext.old_build_ext`; Cython 3 drops this
-alias and instead uses a wholly new `Cython.Distutils.build_ext` that
-does not provide the `cython_sources` function used in `setup.py`.
-
-Explicitly importing `old_build_ext` preserves the existing behavior for
-recent Cython<3 and uses the correct behavior for Cython 3. Should the
-import fail (*e.g.*, because the version of Cython available predates
-the availability of `old_build_ext`), the import falls back to just
-`Cython.Distutils.build_ext`.
-
-Signed-off-by: Andrew J. Hesford <ajh@sideband.org>
-Upstream-Status: Denied [https://github.com/yaml/pyyaml/pull/731]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- pyproject.toml | 2 +-
- setup.py       | 6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 4bc04c0..2bf5ec8 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,3 +1,3 @@
- [build-system]
--requires = ["setuptools", "wheel", "Cython<3.0"]
-+requires = ["setuptools", "wheel", "Cython"]
- build-backend = "setuptools.build_meta"
-diff --git a/setup.py b/setup.py
-index 65b0ea0..4461580 100644
---- a/setup.py
-+++ b/setup.py
-@@ -82,7 +82,11 @@ if 'sdist' in sys.argv or os.environ.get('PYYAML_FORCE_CYTHON') == '1':
-     with_cython = True
- try:
-     from Cython.Distutils.extension import Extension as _Extension
--    from Cython.Distutils import build_ext as _build_ext
-+    try:
-+        from Cython.Distutils.old_build_ext import old_build_ext as _build_ext
-+    except ImportError:
-+        from Cython.Distutils import build_ext as _build_ext
-+
-     with_cython = True
- except ImportError:
-     if with_cython:
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
rename to meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
index 6e2022719c1..a41d073af95 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
@@ -5,12 +5,10 @@ HOMEPAGE = "https://pyyaml.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
-PYPI_PACKAGE = "PyYAML"
-
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://0001-Fix-builds-with-Cython-3.patch"
-SRC_URI[sha256sum] = "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
+SRC_URI[sha256sum] = "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
+UPSTREAM_CHECK_PYPI_PACKAGE = "PyYAML"
 
 PACKAGECONFIG ?= "libyaml"
 PACKAGECONFIG[libyaml] = "--with-libyaml,--without-libyaml,libyaml"
-- 
2.39.2


