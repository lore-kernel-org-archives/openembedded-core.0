Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QevJR-00034K-Tr
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 22:36:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 13:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,495,1304319600"; d="scan'208";a="22782124"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 13:25:44 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 13:25:41 -0700
Message-Id: <378b01d8a6144addcea196724efd2d8d5ccbc6a1.1310070283.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310070283.git.nitin.a.kamble@intel.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
Subject: [PATCH 7/7] elfutils: fix compilations issue with the gcc 4.7
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
X-List-Received-Date: Thu, 07 Jul 2011 20:36:42 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../{elfutils-0.148 => elfutils}/arm_backend.diff  |    0
 .../do-autoreconf.diff                             |    0
 .../elf_additions.diff                             |    0
 .../elfutils-fsize.patch                           |    0
 .../elfutils/elfutils/fix_for_gcc-4.7.patch        |   73 ++++++++++++++++++++
 .../{elfutils-0.148 => elfutils}/hppa_backend.diff |    0
 .../{elfutils-0.148 => elfutils}/i386_dis.h        |    0
 .../{elfutils-0.148 => elfutils}/m68k_backend.diff |    0
 .../{elfutils-0.148 => elfutils}/mempcpy.patch     |    0
 .../{elfutils-0.148 => elfutils}/mips_backend.diff |    0
 .../redhat-portability.diff                        |    0
 .../redhat-robustify.diff                          |    0
 .../remove-unused.patch                            |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../uclibc-support.patch                           |    0
 .../{elfutils-0.148 => elfutils}/x86_64_dis.h      |    0
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 +-
 17 files changed, 75 insertions(+), 1 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/do-autoreconf.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/elf_additions.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/elfutils-fsize.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/i386_dis.h (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/mempcpy.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/redhat-portability.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/redhat-robustify.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/remove-unused.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/uclibc-support.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/x86_64_dis.h (100%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/do-autoreconf.diff b/meta/recipes-devtools/elfutils/elfutils/do-autoreconf.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/do-autoreconf.diff
rename to meta/recipes-devtools/elfutils/elfutils/do-autoreconf.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff b/meta/recipes-devtools/elfutils/elfutils/elf_additions.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff
rename to meta/recipes-devtools/elfutils/elfutils/elf_additions.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch b/meta/recipes-devtools/elfutils/elfutils/elfutils-fsize.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch
rename to meta/recipes-devtools/elfutils/elfutils/elfutils-fsize.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch b/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
new file mode 100644
index 0000000..bd22eef
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
@@ -0,0 +1,73 @@
+UpstreamStatus: pending
+gcc 4.7 does not like pointer conversion, so have a void * tmp var to work 
+around following compilation issue.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/07/07
+
+| md5.c: In function 'md5_finish_ctx':
+| md5.c:108:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| md5.c:109:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| cc1: all warnings being treated as errors
+| 
+| make[2]: *** [md5.o] Error 1
+| make[2]: *** Waiting for unfinished jobs....
+| sha1.c: In function 'sha1_finish_ctx':
+| sha1.c:109:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| sha1.c:111:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| cc1: all warnings being treated as errors
+| 
+| make[2]: *** [sha1.o] Error 1
+
+Index: elfutils-0.148/lib/md5.c
+===================================================================
+--- elfutils-0.148.orig/lib/md5.c
++++ elfutils-0.148/lib/md5.c
+@@ -95,6 +95,7 @@ md5_finish_ctx (ctx, resbuf)
+   /* Take yet unprocessed bytes into account.  */
+   md5_uint32 bytes = ctx->buflen;
+   size_t pad;
++  void * tmp;
+ 
+   /* Now count remaining bytes.  */
+   ctx->total[0] += bytes;
+@@ -105,9 +106,10 @@ md5_finish_ctx (ctx, resbuf)
+   memcpy (&ctx->buffer[bytes], fillbuf, pad);
+ 
+   /* Put the 64-bit file length in *bits* at the end of the buffer.  */
+-  *(md5_uint32 *) &ctx->buffer[bytes + pad] = SWAP (ctx->total[0] << 3);
+-  *(md5_uint32 *) &ctx->buffer[bytes + pad + 4] = SWAP ((ctx->total[1] << 3) |
+-							(ctx->total[0] >> 29));
++  tmp = &ctx->buffer[bytes + pad];
++  *(md5_uint32 *) tmp = SWAP (ctx->total[0] << 3);
++  tmp = &ctx->buffer[bytes + pad + 4];
++  *(md5_uint32 *) tmp = SWAP ((ctx->total[1] << 3) | (ctx->total[0] >> 29));
+ 
+   /* Process last bytes.  */
+   md5_process_block (ctx->buffer, bytes + pad + 8, ctx);
+Index: elfutils-0.148/lib/sha1.c
+===================================================================
+--- elfutils-0.148.orig/lib/sha1.c
++++ elfutils-0.148/lib/sha1.c
+@@ -96,6 +96,7 @@ sha1_finish_ctx (ctx, resbuf)
+   /* Take yet unprocessed bytes into account.  */
+   sha1_uint32 bytes = ctx->buflen;
+   size_t pad;
++  void * tmp;
+ 
+   /* Now count remaining bytes.  */
+   ctx->total[0] += bytes;
+@@ -106,9 +107,10 @@ sha1_finish_ctx (ctx, resbuf)
+   memcpy (&ctx->buffer[bytes], fillbuf, pad);
+ 
+   /* Put the 64-bit file length in *bits* at the end of the buffer.  */
+-  *(sha1_uint32 *) &ctx->buffer[bytes + pad] = SWAP ((ctx->total[1] << 3) |
+-						     (ctx->total[0] >> 29));
+-  *(sha1_uint32 *) &ctx->buffer[bytes + pad + 4] = SWAP (ctx->total[0] << 3);
++  tmp = &ctx->buffer[bytes + pad];
++  *(sha1_uint32 *) tmp = SWAP ((ctx->total[1] << 3) | (ctx->total[0] >> 29));
++  tmp = &ctx->buffer[bytes + pad + 4];
++  *(sha1_uint32 *) tmp = SWAP (ctx->total[0] << 3);
+ 
+   /* Process last bytes.  */
+   sha1_process_block (ctx->buffer, bytes + pad + 8, ctx);
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/i386_dis.h b/meta/recipes-devtools/elfutils/elfutils/i386_dis.h
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/i386_dis.h
rename to meta/recipes-devtools/elfutils/elfutils/i386_dis.h
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils/m68k_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils/m68k_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
rename to meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils/mips_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils/mips_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff
rename to meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff b/meta/recipes-devtools/elfutils/elfutils/redhat-robustify.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff
rename to meta/recipes-devtools/elfutils/elfutils/redhat-robustify.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch b/meta/recipes-devtools/elfutils/elfutils/remove-unused.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
rename to meta/recipes-devtools/elfutils/elfutils/remove-unused.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch b/meta/recipes-devtools/elfutils/elfutils/uclibc-support.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch
rename to meta/recipes-devtools/elfutils/elfutils/uclibc-support.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/x86_64_dis.h b/meta/recipes-devtools/elfutils/elfutils/x86_64_dis.h
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.148/x86_64_dis.h
rename to meta/recipes-devtools/elfutils/elfutils/x86_64_dis.h
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index e88a478..1399eb7 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -29,6 +29,7 @@ SRC_URI += "\
 	file://elfutils-fsize.patch \
 	file://remove-unused.patch \
 	file://mempcpy.patch \
+	file://fix_for_gcc-4.7.patch\
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " ${@['', 'file://uclibc-support.patch']['${PN}' == '${BPN}']}"
-- 
1.7.4.4



