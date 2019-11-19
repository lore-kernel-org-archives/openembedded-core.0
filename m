Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC427F891
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:26:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t26so3598918wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n7iKah0K27AoIjsZCUsc3HQYw0Wjhsm83e0cDfNUQNk=;
	b=iVPu3EBgcbsMPO2aRzzALQhGzuLMGOWy1zMViMO5xXk0dljD+DlrxJ0VLLhoSItLcx
	jDHqIiUmDGAVPME49VMBTW5fhAVZmtJsoMQWRyUqG6Woxyakwi+urd7zh/TWEkgvOg/Z
	TEJdyDB+9g4RNf2eWwcZ3Ll13V8UrHizjK9rkssQeEcTOmj+gBhkU1HgJ4kwM9FFs8FG
	V9XjaHRA5O+P+cHT2kUNu2NObLLmZ62DYXO8K+7ZmzpYnHyKCqUFpPEM6lhA6qOZKV7v
	mfO5TLX0pSo7VKHk+NpnaQkK5ZQKg7Lax0uyKA/x1diqLQ1Sw3Oy8cBnPpi5yiEBW2af
	kEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n7iKah0K27AoIjsZCUsc3HQYw0Wjhsm83e0cDfNUQNk=;
	b=uVoSnYYoUG4QKSF8zCvtb7NDB0MiKJZj0S2Mde2pqxL+eiB/L8/QB9j8cju5z8hHvD
	uLghOwS17vo++oPDWnfGLhv1RiwsE6Pyi4h+rf4HNBi10pxgvtY4IVPrZXMPMPcXHmiB
	HfrYMbKWcvKks1chUB1BDYutMoYU0XA4yFN0GoEm8T6o7Sc2mnwLnA6XTphzhLCKr7oE
	ytfinQ9o7Tq3kWp6KjeIVAGpgvEBhvzdO3h19+gAkZr6z/1jj4fMdvwmm6pOz9xEdpP2
	xQdAwo/+Kw+Zo+sNK0Mx0lU0uqMrqAMYDEnXjFu4xLFi8YIAZhzXw7whuLkvN73oSarc
	IKVA==
X-Gm-Message-State: APjAAAX8XcI2WSuWze+zIVeqkHJdRyMS5j6FksR8BxI3rCCBamiF5JzH
	2SmmDogWhpO2f6hDaKVzRF+Zznit
X-Google-Smtp-Source: APXvYqxeqnduyj3BdLBZr8gClRHJiO8XmZK8UM+HOXxab0Y3l4MsdcJhLp6JCGF8H4a2iAfKUY2/pA==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr5209858wmb.87.1574169979786; 
	Tue, 19 Nov 2019 05:26:19 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	200sm3447380wme.32.2019.11.19.05.26.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 05:26:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 14:25:54 +0100
Message-Id: <20191119132556.107508-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119132556.107508-1-alex.kanavin@gmail.com>
References: <20191119132556.107508-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Tue, 19 Nov 2019 13:26:19 -0000

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


