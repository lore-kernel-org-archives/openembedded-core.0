Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6347F95D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:12:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so2165252wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n7iKah0K27AoIjsZCUsc3HQYw0Wjhsm83e0cDfNUQNk=;
	b=lwtmDW7IdfAwa7Ta8n1j/43gQ+OgpHwdNrjm3ik/55SyLsrn8AVWZmFkx72m3L0B7C
	fzpKq1hv8LtR/wP65RqKhF6xor1emZFN/H3mzwKKTGR9yODJTjzS5lmjTSY0hhB3h4au
	2J86UeolBo98JoEsH3SDelS5eqirE3qSqPgsOmK23oh/co4/4ewnbB3akJ5EUBis/8ip
	yVo0VACBnNeSS7czLoIijUWFeQ/xg0bh3XPx9I96e7/1xsuFDpzmjKoF7oeBWfB9Pejj
	vOeMHasD+qyLImwFobOn9GYpMcgPxNKOKK+AQiJ8T03dUr4r70Kajg1W78azhKMY8QzV
	fudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n7iKah0K27AoIjsZCUsc3HQYw0Wjhsm83e0cDfNUQNk=;
	b=drPuVBvHX2pe89nWRivXRkLHivIVnNW/uj0Af+BpL454PRDCuL6tG6G67Yw7BHPsNy
	OneK1brk3B2svMOsiZvdscs6XF4+J5Ic/oQU7iNWCaq9kzti2jIbJXpvEW7GVaGSyuBr
	rKNu1yVi+e2uHHny3FxnhmLWX5YE4pjDSoo+nBdGUyXSOxkOoa+nyIMtgMnRjZfuzO5j
	JiMYn+WGNDqMYplAkPvpErMkUXptzU1uQorRlyaRE91doaCXvzUG+OYaQSy6E0ycY4kb
	0nFOLi9T5s+VREV3k4dfr1AApKs57EujxNSHw9tbOhsDwX0vTwd3F6bDKyAD0j2RQSG/
	7tLA==
X-Gm-Message-State: APjAAAW/i6w8xQFNhwzzfYag/yjxW5jr8x0CmkmhigmFUQT/gFhSKM2y
	qGIbygBTWwyUFMFAiHUfZFes4bjR
X-Google-Smtp-Source: APXvYqyy5zGlqnEg8am4nfebe+Rn6Vq8K7F1ScHZWj4vPNM8NLLsLfSMcW5wQQZrkJyNtJ9D6NURtA==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr2404045wml.74.1575033122175; 
	Fri, 29 Nov 2019 05:12:02 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v17sm637224wrt.91.2019.11.29.05.11.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 05:11:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 14:11:39 +0100
Message-Id: <20191129131152.128311-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Fri, 29 Nov 2019 13:12:02 -0000

Add a patch that avoids hardcoded sphinx dependency.

Switch off a couple of new features (zchunk, html docs for
hawkey library via sphinx) that both require new dependencies.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/0001-Add-WITH_TESTS-option.patch   | 12 +++---
 ...nly-if-documentation-is-actually-ena.patch | 42 +++++++++++++++++++
 .../{libdnf_0.28.1.bb => libdnf_0.38.1.bb}    |  5 ++-
 3 files changed, 52 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb => libdnf_0.38.1.bb} (84%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
index 3c87d4d8b33..ac9400c48dc 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
@@ -1,4 +1,4 @@
-From e5a50db749b2b02e9e0cff9f7b639020e8ac76da Mon Sep 17 00:00:00 2001
+From 56fa2bbdbd29377a6ef0d0b7aadbac8b5ea8c95b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 6 Nov 2018 13:54:43 +0100
 Subject: [PATCH] Add WITH_TESTS option
@@ -14,18 +14,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ce88b9e3..7a99320a 100644
+index 881152a..965c992 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -32,6 +32,7 @@ option(WITH_HTML "Enables hawkey HTML generation" ON)
- option(WITH_MAN "Enables hawkey man page generation" ON)
+@@ -33,6 +33,7 @@ option(WITH_MAN "Enables hawkey man page generation" ON)
+ option(WITH_ZCHUNK "Build with zchunk support" ON)
  option(ENABLE_RHSM_SUPPORT "Build with Red Hat Subscription Manager support?" OFF)
  option(ENABLE_SOLV_URPMREORDER "Build with support for URPM-like solution reordering?" OFF)
 +option(WITH_TESTS "Enables unit tests" ON)
  
  
  # load pkg-config first; it's required by other modules
-@@ -158,8 +159,10 @@ endif()
+@@ -165,8 +166,10 @@ endif()
  
  
  # build tests
@@ -37,7 +37,7 @@ index ce88b9e3..7a99320a 100644
      add_subdirectory(python/hawkey)
  endif()
 diff --git a/python/hawkey/CMakeLists.txt b/python/hawkey/CMakeLists.txt
-index d9645346..84d17204 100644
+index d964534..84d1720 100644
 --- a/python/hawkey/CMakeLists.txt
 +++ b/python/hawkey/CMakeLists.txt
 @@ -50,4 +50,6 @@ target_link_libraries(_hawkeymodule ${PYTHON_LIBRARY})
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
new file mode 100644
index 00000000000..6dd7c71aae8
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
@@ -0,0 +1,42 @@
+From b570c7f8bd089deec7da2b108aa789a27025a473 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 19 Nov 2019 13:46:09 +0100
+Subject: [PATCH] Look fo sphinx only if documentation is actually enabled
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ docs/hawkey/CMakeLists.txt | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/docs/hawkey/CMakeLists.txt b/docs/hawkey/CMakeLists.txt
+index 52cc35c6..63c7672f 100644
+--- a/docs/hawkey/CMakeLists.txt
++++ b/docs/hawkey/CMakeLists.txt
+@@ -2,15 +2,17 @@
+ # tell sphinx-build to do them both in one go:
+ 
+ 
+-find_program(SPHINX_PROGRAM NAMES "sphinx-build-${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}")
+-if(NOT EXISTS ${SPHINX_PROGRAM})
+-    find_program(SPHINX_PROGRAM NAMES sphinx-build-${PYTHON_VERSION_MAJOR})
+-endif()
+-if(NOT EXISTS ${SPHINX_PROGRAM})
+-    find_program(SPHINX_PROGRAM NAMES sphinx-build)
+-endif()
+-if(NOT EXISTS ${SPHINX_PROGRAM})
+-    message(FATAL_ERROR "Sphinx program not found." )
++if (WITH_HTML OR WITH_MAN)
++    find_program(SPHINX_PROGRAM NAMES "sphinx-build-${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}")
++    if(NOT EXISTS ${SPHINX_PROGRAM})
++        find_program(SPHINX_PROGRAM NAMES sphinx-build-${PYTHON_VERSION_MAJOR})
++    endif()
++    if(NOT EXISTS ${SPHINX_PROGRAM})
++        find_program(SPHINX_PROGRAM NAMES sphinx-build)
++    endif()
++    if(NOT EXISTS ${SPHINX_PROGRAM})
++        message(FATAL_ERROR "Sphinx program not found." )
++    endif()
+ endif()
+ 
+ if(WITH_HTML)
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.38.1.bb
similarity index 84%
rename from meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.38.1.bb
index 3f11e0231fa..50a747cb18a 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.38.1.bb
@@ -7,9 +7,10 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
+           file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
            "
 
-SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
+SRCREV = "db4b61afdf65a2b791a58ad8e5c5be70a7fc123c"
 
 S = "${WORKDIR}/git"
 
@@ -20,6 +21,8 @@ inherit gtk-doc gobject-introspection cmake pkgconfig distutils3-base
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF -DPYTHON_DESIRED=3 \
                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DWITH_GIR=ON', '-DWITH_GIR=OFF', d)} \
                   -DWITH_TESTS=OFF \
+                  -DWITH_ZCHUNK=OFF \
+                  -DWITH_HTML=OFF \
                 "
 EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
-- 
2.17.1


