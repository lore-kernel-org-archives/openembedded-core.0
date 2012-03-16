Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8a0v-0000ZG-B3
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:28:25 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 567E52FF60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 12:19:33 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 09:19:39 -0700
Message-Id: <dfb0c9ffaeb8765db888956ed0f35f056778194e.1331914572.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331914572.git.scott.a.garman@intel.com>
References: <cover.1331914572.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331914572.git.scott.a.garman@intel.com>
References: <cover.1331914572.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 567E52FF60.597A0
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/2] e2fsprogs: upgrade to 1.42.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 16:28:25 -0000

Includes minor tweaks to the formatting of some patch headers and the
addition of a SOB line where needed.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../acinclude.m4                                   |    0
 .../fallocate.patch                                |    4 ++--
 .../mkdir.patch                                    |    1 +
 .../remove.ldconfig.call.patch                     |   11 ++++++++---
 .../{e2fsprogs_1.42.bb => e2fsprogs_1.42.1.bb}     |    6 +++---
 5 files changed, 14 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/mkdir.patch (99%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/remove.ldconfig.call.patch (76%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.bb => e2fsprogs_1.42.1.bb} (93%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/fallocate.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/fallocate.patch
index 4d952a5..d074c15 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/fallocate.patch
@@ -3,10 +3,10 @@ but we need to check if we have fallocate()
 this problem shows up on uclibc systems since
 uclibc does not have fallocate() implemented
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
 ===================================================================
 --- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 17:24:34.290780625 -0800
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/mkdir.patch
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/mkdir.patch
index e91ffa9..aa7a298 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/mkdir.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/mkdir.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Mei Lei <lei.mei@intel.com>
 
 Index: e2fsprogs-1.41.5/po/Makefile.in.in
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remove.ldconfig.call.patch
similarity index 76%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remove.ldconfig.call.patch
index 0e5fd7d..7be4c3e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remove.ldconfig.call.patch
@@ -1,11 +1,16 @@
-When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache
-(in my case libstdc++.so cannot be found after building zlib(-native) and I have to call
-touch */libstdc++.so && /sbin/ldconfig to fix it.
+When /etc/ld.so.cache is writeable by user running bitbake then it
+creates invalid cache (in my case libstdc++.so cannot be found after
+building zlib(-native) and I have to call touch */libstdc++.so &&
+/sbin/ldconfig to fix it.
 
 So remove ldconfig call from make install-libs
 
+Patch authored by Martin Jansa.
+
 Upstream-Status: Inappropriate [disable feature]
 
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -uNr e2fsprogs-1.42.orig/lib/Makefile.elf-lib e2fsprogs-1.42/lib/Makefile.elf-lib
 --- e2fsprogs-1.42.orig/lib/Makefile.elf-lib	2010-06-14 05:07:36.000000000 +0200
 +++ e2fsprogs-1.42/lib/Makefile.elf-lib	2012-02-23 14:26:07.021272275 +0100
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
similarity index 93%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
index 6e3f7b8..6df7cea 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
@@ -1,14 +1,14 @@
 require e2fsprogs.inc
 
-PR = "r4"
+PR = "r0"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
 "
 
-SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"
-SRC_URI[sha256sum] = "55b46db0cec3e2eb0e5de14494a88b01ff6c0500edf8ca8927cad6da7b5e4a46"
+SRC_URI[md5sum] = "8ed1501ae6746e2e735bdd1407211dc9"
+SRC_URI[sha256sum] = "0f1fdc10c6289b6750714490837df9aab691f352d33f5ecb64507704df6ff991"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-- 
1.7.5.4



