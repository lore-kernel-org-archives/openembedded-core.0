Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4EA78CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:01:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R812LL014200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:01:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:01:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 16:04:33 +0800
Message-ID: <60730bf434a5ebe635f66c111c661220d54a8591.1532669923.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1532669923.git.Qi.Chen@windriver.com>
References: <cover.1532669923.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] coreutils: upgrade 8.29 -> 8.30
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
X-List-Received-Date: Fri, 27 Jul 2018 08:01:01 -0000
Content-Type: text/plain

License-Update: Checksum for src/ls.c is changed but the license remains
the same. The change is only about year change.

Remove 0001-Unset-need_charset_alias-when-building-for-musl.patch as the
target this patches modifies no long exists.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 33 ----------------------
 .../{coreutils_8.29.bb => coreutils_8.30.bb}       |  7 ++---
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
 rename meta/recipes-core/coreutils/{coreutils_8.29.bb => coreutils_8.30.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/coreutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4ba..0000000
--- a/meta/recipes-core/coreutils/coreutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-core/coreutils/coreutils_8.29.bb b/meta/recipes-core/coreutils/coreutils_8.30.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.29.bb
rename to meta/recipes-core/coreutils/coreutils_8.30.bb
index 4704f32..053891f 100644
--- a/meta/recipes-core/coreutils/coreutils_8.29.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;beginline=1;endline=15;md5=1c3f9411e1842a062ce5ce9210beee0e"
+                    file://src/ls.c;beginline=1;endline=15;md5=dbe356a88b09c29232b083d1ff8ac82a"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
@@ -15,14 +15,13 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://fix-selinux-flask.patch \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://disable-ls-output-quoting.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
           "
 
-SRC_URI[md5sum] = "960cfe75a42c9907c71439f8eb436303"
-SRC_URI[sha256sum] = "92d0fa1c311cacefa89853bdb53c62f4110cdfda3820346b59cbd098f40f955e"
+SRC_URI[md5sum] = "ab06d68949758971fe744db66b572816"
+SRC_URI[sha256sum] = "e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
-- 
1.9.1


