Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id D8F7378846
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 13:28:45 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id h129so16330795qke.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 05:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=VabivO1fhFGNXyDzxfkedHHFQLiaUUcLLi8+lV7bqsQ=;
	b=iJDChpYR6cQ8nQzEeyo8ijE9rXVZCRU9M9GNyZGuxqO5HBr5YQkzb5P5VIagtCy9cz
	9IoeglWC4+6p1iqP1/mIc4mAK9KM/Kfpg5tIRbGF8BvtdpahKYYo99bpYo6F53rd1SVS
	CUt3tro78UYzV+LZbZoU3Vb13tA90GQvLnvxaW+Qs7eiSk/TaUiDEp6vdLzeMa7Ei0Rf
	QWgT1p7Y8X3tZsRNnBw7dyx6vEw7LRvLVNra4lws6K8eAh8N2/FUyhQnCjeftky9/5I0
	ngdwSSS/fEgGFJo8QgkqPVcyHH1BHkgPCRbxjyQF012YWU/TGYr1jl+9aIRQ0VedcnKt
	m0ag==
X-Gm-Message-State: APf1xPCHNoIhWmp/ACaP/Gn+mktzJvXPrCVip6ahoQxe5jflBfcurrih
	Ht/VscgrNM0exHjQoFmi2bMIgA==
X-Google-Smtp-Source: AH8x22657QLIiQB/T46+9cGb8T9ufwKxwk7xUCOX+f8OeDf7lbmrdenOzKCT7zf8S/TBWeqEgsoFVg==
X-Received: by 10.55.58.199 with SMTP id h190mr29375842qka.9.1519133326354;
	Tue, 20 Feb 2018 05:28:46 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	k63sm13272540qte.3.2018.02.20.05.28.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Feb 2018 05:28:45 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 20 Feb 2018 10:28:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Feb 2018 10:28:07 -0300
Message-Id: <20180220132811.16100-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180220132811.16100-1-otavio@ossystems.com.br>
References: <20180220132811.16100-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/6] mesa: Upgrade 17.3.3 -> 17.3.5
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
X-List-Received-Date: Tue, 20 Feb 2018 13:28:46 -0000

The 17.3.5 release, published in February 19th, 2018 to fix a critical
regression from 17.3.4 release. They fix a number of issues since
17.3.3 release.

The release notes can be seen at:

  https://www.mesa3d.org/relnotes/17.3.4.html
  https://www.mesa3d.org/relnotes/17.3.5.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
 - upgrade to 17.3.5 due a critical regression

 ...01-anv_icd.py-improve-reproducible-builds.patch | 27 -----------
 .../files/0001-link-mesautil-with-pthreads.patch   | 54 ----------------------
 .../mesa/{mesa-gl_17.3.4.bb => mesa-gl_17.3.5.bb}  |  0
 .../mesa/{mesa_17.3.4.bb => mesa_17.3.5.bb}        |  6 +--
 4 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-anv_icd.py-improve-reproducible-builds.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.4.bb => mesa-gl_17.3.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.4.bb => mesa_17.3.5.bb} (78%)

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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.4.bb b/meta/recipes-graphics/mesa/mesa_17.3.5.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_17.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.5.bb
index 623046e1161..3ce7135f280 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.5.bb
@@ -9,12 +9,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
-           file://0001-anv_icd.py-improve-reproducible-builds.patch \
-           file://0001-link-mesautil-with-pthreads.patch \
            "
 
-SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
-SRC_URI[sha256sum] = "41bac5de0ef6adc1f41a1ec0f80c19e361298ce02fa81b5f9ba4fdca33a9379b"
+SRC_URI[md5sum] = "bf73288c33cf12abe62045c25e2196b4"
+SRC_URI[sha256sum] = "eb9228fc8aaa71e0205c1481c5b157752ebaec9b646b030d27478e25a6d7936a"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.16.2


