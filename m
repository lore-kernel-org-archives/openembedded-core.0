Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 52039784F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 17:11:29 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id f25so452595qkm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 09:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=KgOQXW0LHkR4mSyxThNs9gczry1pkrJ6/BKZhgPalog=;
	b=P/g7W9AwazqLLjb1W5V7I1w2c1NxZc8xOCMsQEql034mJJ30pOhiEkhipdgs5g2ncd
	e1gqOkKp/1dWYqDOn/XKWuA5k7nzAOBM89ZjN3Xv6/6F/44yeOA/KmG5C1y6tKINBgJD
	rTxOrOyNV3FAcnw8Fn7lOc4zvr/ksrGQaOsJMkLuq8U5AzEuPAPUSEtxHRAqrdpT+cAw
	hoG538nnNl8iB50xU5YavDGe0GziGbfFxlz7mY2AFCgRAo+HpMFjqKXieZ5TMTMy6d4p
	N8AvmoH2UUKfeDayUhy81M+cXFHaxk2w2mDLbQxiONMlZGMc0mCLb+rOm7hkfMf0FJ8e
	wUYg==
X-Gm-Message-State: APf1xPBnAVgpWsI/adbtkROCc6DstuNYqwst1r/iFB/xPQUms5MzuDXU
	3WeLiwxXF9z+SL3viVNAsISamA==
X-Google-Smtp-Source: AH8x2268ICfc2Q3sC0N1s9jsrljT+miABj43Bj7Y8diqyHNHReEVIg1YTt1CCJMpojKQ8R8nYnS/KA==
X-Received: by 10.55.76.133 with SMTP id z127mr5124730qka.318.1518714690688;
	Thu, 15 Feb 2018 09:11:30 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	20sm12368149qtr.19.2018.02.15.09.11.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Feb 2018 09:11:29 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 15 Feb 2018 15:11:25 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Feb 2018 15:11:15 -0200
Message-Id: <20180215171116.27911-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180215171116.27911-1-otavio@ossystems.com.br>
References: <20180215171116.27911-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] mesa: Upgrade 17.3.3 -> 17.3.4
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
X-List-Received-Date: Thu, 15 Feb 2018 17:11:30 -0000

The 17.3.4 release, published in February 15th, 2018. It fixes a
number of issues since 17.3.3 release.

The release notes can be seen at:

  https://www.mesa3d.org/relnotes/17.3.4.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...01-anv_icd.py-improve-reproducible-builds.patch | 27 -----------
 .../files/0001-link-mesautil-with-pthreads.patch   | 54 ----------------------
 meta/recipes-graphics/mesa/mesa_17.3.4.bb          |  6 +--
 3 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch b/meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch
deleted file mode 100644
index da7a81f2539..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b474abdd91158a52821c34865277d7de38880529 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 17 Jan 2018 15:53:29 +0200
-Subject: [PATCH] anv_icd.py: improve reproducible builds
-
-Sort the output to ensure reproducibility
-
-Upstream-Status: Pending
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- src/intel/vulkan/anv_icd.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/intel/vulkan/anv_icd.py b/src/intel/vulkan/anv_icd.py
-index 4ed01fa..31bb068 100644
---- a/src/intel/vulkan/anv_icd.py
-+++ b/src/intel/vulkan/anv_icd.py
-@@ -44,4 +44,4 @@ if __name__ == '__main__':
-     }
- 
-     with open(args.out, 'w') as f:
--        json.dump(json_data, f, indent = 4)
-+        json.dump(json_data, f, indent = 4, sort_keys=True)
--- 
-2.4.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
deleted file mode 100644
index 38ddf49af63..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
-
-From 23ce168048698eeea3df6bb8c9de5be3ca4784cd Mon Sep 17 00:00:00 2001
-From: Igor Gnatenko <ignatenko@redhat.com>
-Date: Mon, 1 Jan 2018 22:49:00 +0100
-Subject: [PATCH] link mesautil with pthreads
-
-../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_setname':
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66: undefined reference to `pthread_setname_np'
-../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_join':
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336: undefined reference to `pthread_join'
-../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48: undefined reference to `pthread_sigmask'
-../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_create':
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296: undefined reference to `pthread_create'
-../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
-../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `call_once':
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96: undefined reference to `pthread_once'
-../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_get_time_nano':
-/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84: undefined reference to `pthread_getcpuclockid'
-collect2: error: ld returned 1 exit status
-
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-Signed-off-by: Igor Gnatenko <ignatenko@redhat.com>
----
- src/util/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/util/Makefile.am b/src/util/Makefile.am
-index a5241ad27b..633907b9fd 100644
---- a/src/util/Makefile.am
-+++ b/src/util/Makefile.am
-@@ -31,6 +31,7 @@ noinst_LTLIBRARIES = \
- 	libxmlconfig.la
- 
- AM_CPPFLAGS = \
-+	$(PTHREAD_CFLAGS) \
- 	-I$(top_srcdir)/include
- 
- libmesautil_la_CPPFLAGS = \
-@@ -50,6 +51,7 @@ libmesautil_la_SOURCES = \
- 	$(MESA_UTIL_GENERATED_FILES)
- 
- libmesautil_la_LIBADD = \
-+	$(PTHREAD_LIBS) \
- 	$(CLOCK_LIB) \
- 	$(ZLIB_LIBS) \
- 	$(LIBATOMIC_LIBS)
--- 
-2.14.3
-
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.4.bb b/meta/recipes-graphics/mesa/mesa_17.3.4.bb
index 623046e1161..cd2cbe35418 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.4.bb
@@ -9,12 +9,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
-           file://0001-anv_icd.py-improve-reproducible-builds.patch \
-           file://0001-link-mesautil-with-pthreads.patch \
            "
 
-SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
-SRC_URI[sha256sum] = "41bac5de0ef6adc1f41a1ec0f80c19e361298ce02fa81b5f9ba4fdca33a9379b"
+SRC_URI[md5sum] = "f08eccad27f34366db1bb3997d288c2f"
+SRC_URI[sha256sum] = "71f995e233bc5df1a0dd46c980d1720106e7f82f02d61c1ca50854b5e02590d0"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.16.1


