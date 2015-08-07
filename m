Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8530B75A60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 07:46:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t777ke5a014620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Aug 2015 00:46:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 7 Aug 2015 00:46:40 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 15:43:42 +0800
Message-ID: <1438933422-24634-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gcc: reformat 0063-nativesdk-gcc-support.patch
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
X-List-Received-Date: Fri, 07 Aug 2015 07:46:41 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

0063-nativesdk-gcc-support.patch can be applied due to the buggy
patch command on sled11, so reformat it, nothing is changed.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../gcc/gcc-4.9/0063-nativesdk-gcc-support.patch   | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch b/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch
index ba7360c..f9efa45 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch
@@ -15,15 +15,13 @@ a) Add %r into spec file markup which can be used for injected paths
 b) Add other paths which need relocation into a .gccrelocprefix section
    which the relocation code will notice and adjust automatically.
 
-
 Upstream-Status: Inappropriate
 RP 2015/7/28
-
-Index: gcc-4.9.2/gcc/gcc.c
-===================================================================
---- gcc-4.9.2.orig/gcc/gcc.c
-+++ gcc-4.9.2/gcc/gcc.c
-@@ -120,6 +120,8 @@ static const char *target_system_root =
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 5fd3d0a..2de29aa 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -120,6 +120,8 @@ static const char *target_system_root = TARGET_SYSTEM_ROOT;
  #else
  static const char *target_system_root = 0;
  #endif
@@ -32,7 +30,7 @@ Index: gcc-4.9.2/gcc/gcc.c
  
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
-@@ -384,6 +386,7 @@ or with constant text in a single argume
+@@ -384,6 +386,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -55,7 +53,7 @@ Index: gcc-4.9.2/gcc/gcc.c
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1229,9 +1232,9 @@ static const char *const standard_startf
+@@ -1229,9 +1232,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -67,7 +65,7 @@ Index: gcc-4.9.2/gcc/gcc.c
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5305,6 +5310,11 @@ do_spec_1 (const char *spec, int inswitc
+@@ -5305,6 +5308,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -79,10 +77,11 @@ Index: gcc-4.9.2/gcc/gcc.c
  	  case 'S':
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
-Index: gcc-4.9.2/gcc/cppdefault.c
-===================================================================
---- gcc-4.9.2.orig/gcc/cppdefault.c
-+++ gcc-4.9.2/gcc/cppdefault.c
+
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index dad69e6..cf43f28 100644
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
 @@ -35,6 +35,30 @@
  # undef CROSS_INCLUDE_DIR
  #endif
@@ -114,7 +113,7 @@ Index: gcc-4.9.2/gcc/cppdefault.c
  const struct default_include cpp_include_defaults[]
  #ifdef INCLUDE_DEFAULTS
  = INCLUDE_DEFAULTS;
-@@ -42,38 +66,38 @@ const struct default_include cpp_include
+@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
@@ -162,7 +161,7 @@ Index: gcc-4.9.2/gcc/cppdefault.c
        /* A multilib suffix needs adding if different multilibs use
  	 different headers.  */
  #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -85,21 +109,21 @@ const struct default_include cpp_include
+@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaults[]
  #endif
  #ifdef CROSS_INCLUDE_DIR
      /* One place the target system's headers might be.  */
@@ -183,15 +182,10 @@ Index: gcc-4.9.2/gcc/cppdefault.c
  #endif
      { 0, 0, 0, 0, 0, 0 }
    };
- #endif /* no INCLUDE_DEFAULTS */
- 
- #ifdef GCC_INCLUDE_DIR
- const char cpp_GCC_INCLUDE_DIR[] = GCC_INCLUDE_DIR;
- const size_t cpp_GCC_INCLUDE_DIR_len = sizeof GCC_INCLUDE_DIR - 8;
-Index: gcc-4.9.2/gcc/cppdefault.h
-===================================================================
---- gcc-4.9.2.orig/gcc/cppdefault.h
-+++ gcc-4.9.2/gcc/cppdefault.h
+diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
+index 30b6fed..2ef96b7 100644
+--- a/gcc/cppdefault.h
++++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
  
  struct default_include
-- 
1.9.1


