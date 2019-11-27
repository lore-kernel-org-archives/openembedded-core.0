Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 442EF7FC50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:10 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so27451965wrw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n7iKah0K27AoIjsZCUsc3HQYw0Wjhsm83e0cDfNUQNk=;
	b=OjlKlQMNYErGyR5ZPNtgDUNcFmsdjeF0S7J/HkinJU2W4I6+ueNHFrCpfdtVtbyzAx
	g+5LdA+Kq2i2nQTt+v5qu23QMklEYsKvvU+fT3iPYsTU+r8Jd/GPZ9Bh6ZrmR7FQqLir
	orrEFzgxKc7BISSweDlxNbNQMhfaIpDdgJPD1AL7ucFGx4YcvuKJswpMxma5cCA1h4ZS
	AVRhdljrlw5RCOxSiO0399XmwOE25bQlqn1UVKzFpSLWfFdfBRlS4X5OlyOjt1GYFnvn
	hqNzXHP6eh8Pfb5UnchRlKpi2RnS3VNa8mXvdavc+VtBtrZNbqiBiyRIecJVtq2lfqqC
	EoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n7iKah0K27AoIjsZCUsc3HQYw0Wjhsm83e0cDfNUQNk=;
	b=T5crSFxD6/a7oeJRDd0fCAzNJ7iRjWigK084WpXPmnGB5VmRylqtNkPLhvs29TE0TS
	7aRhhKmqrSKEokLJL1Pu20SAajtOCOB6abGvFu7MjBS8W1dmVa/BeMAgSeRhCCfDdQaJ
	ctAQe2PNgtqn+cM9ReRhOSLEIp8kAZhssdrqSI4b+08z1ucGK8sGY0OoBdnItAYheWO7
	DpD0Vg+syLc+pbPgDkrfNV7A1LvGjIYAJPUYExbuyRR34nNiZYpQv3dp+onAY7PukDNh
	azuKhCQY4Wpi5w+Q1MkI2n+GV5v0L3rQQNgs+fu3Z0pUAOSN8AvWd4xyEWnYlttZQpmA
	Qtsg==
X-Gm-Message-State: APjAAAU9LWZGI4WpR5ANML+oWiCMQipkPqRxklm/HcJkdYVdZg7KKitk
	q/cNvstgHJPsWE0eVkzKIjPmOjGy
X-Google-Smtp-Source: APXvYqxDY+2ekgehRS7rc+2ZBI+30VjQGYYpCf8J1FIe2+RnQcKEgAi2uwt4nQPBlexjrPpPNOWAnA==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr45891076wrr.276.1574872810877; 
	Wed, 27 Nov 2019 08:40:10 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:39:52 +0100
Message-Id: <20191127164003.115980-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/14] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:11 -0000

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


