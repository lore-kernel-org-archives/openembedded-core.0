Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6B306013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 21:33:12 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id dx3so2664677pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 14:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s1j7rQmNsX87q8T2imAJLn2Kb0/F0ykdj7ea6VntOpY=;
	b=e5RkaKluCbLZtBPyWzQ6oi2blxb/G9qAr8fewCDwlQAOgZq3Ico3YikJNP1yRNgWhA
	W4dcc5tOXvoVmZeXe4TRFhlBkgGAjMLTAhWSAszqriFsVXEPwlzyWcfqwYWKaH3S7JpX
	9G5WfRn+tayGFhI6hHxuoR9OSqfAX3Nit5mC3Rb/V6rBYLADhpG86QtZIg9Yp1o1gF/c
	tiF4TI8XxU/XceFtWAhQCfbXfX520GzqlT8IrmkgdQoDUFqlKLEO1TD4HOl8lAg0p3R1
	8l4bPr4u+xREkS94MbGF2WbMq6Opov+r7rSRxb1DSx/5XuufgzuBYGTYlbTLySwd6YcP
	gFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s1j7rQmNsX87q8T2imAJLn2Kb0/F0ykdj7ea6VntOpY=;
	b=PXAvwPFpg2jBTTUyEyqOP15vyvz0md9WR/VE16K/Wb10BNwCYrTzFaOxW4+pXVS1bP
	YAhaxptzMrKO1MNGzZXzOVZWSIgWIyfo7ftubplTkinZ49OE4ZqtIdAAHwb5+x0XZMfK
	6LmvBM2cwyMIVl8iaS0ocLC3A8R3dz0w18kgLhlBoS4ci9j7uCw034GgJvgWBMI5PCfM
	+Pn36GufwZ1wfNPVtjlY1SsNiwU+eSW8Chb2r3JG28dPPJIaWcTJ0P89ZP4hY817wQG+
	GXX2S+O25rkd26Z/GHU1qtYIph8rboWalE43ug5li96OXub1UllxVQruXX5RHaBqC6N2
	WdBA==
X-Gm-Message-State: ALyK8tLqorxK/Nz1VpibsgU7qagoOXyttH84JeTjIfIBsa8va94T5Sn84gWDqSxi2sVdbw==
X-Received: by 10.66.47.133 with SMTP id d5mr3940406pan.48.1467927193048;
	Thu, 07 Jul 2016 14:33:13 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	i89sm6017369pfi.22.2016.07.07.14.33.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jul 2016 14:33:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 14:33:08 -0700
Message-Id: <1467927188-21545-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [master][PATCH] gcc: CVE-2016-4490
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
X-List-Received-Date: Thu, 07 Jul 2016 21:33:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

[Yocto #9632]

not in 6.1.1 so back porting.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../gcc/gcc-6.1/CVE-2016-4490.patch                | 289 +++++++++++++++++++++
 1 file changed, 289 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch
new file mode 100644
index 0000000..aaef2be
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch
@@ -0,0 +1,289 @@
+From 7d235b1b5ea35352c54957ef5530d9a02c46962f Mon Sep 17 00:00:00 2001
+From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 2 May 2016 17:06:40 +0000
+Subject: [PATCH] =?UTF-8?q?Demangler=20integer=20overflow=20fixes=20from?=
+ =?UTF-8?q?=20Marcel=20B=C3=B6hme.?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+	PR c++/70498
+	* cp-demangle.c: Parse numbers as integer instead of long to avoid
+	overflow after sanity checks. Include <limits.h> if available.
+	(INT_MAX): Define if necessary.
+	(d_make_template_param): Takes integer argument instead of long.
+	(d_make_function_param): Likewise.
+	(d_append_num): Likewise.
+	(d_identifier): Likewise.
+	(d_number): Parse as and return integer.
+	(d_compact_number): Handle overflow.
+	(d_source_name): Change variable type to integer for parsed number.
+	(d_java_resource): Likewise.
+	(d_special_name): Likewise.
+	(d_discriminator): Likewise.
+	(d_unnamed_type): Likewise.
+	* testsuite/demangle-expected: Add regression test cases.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@235767 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE:  CVE-2016-4490
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libiberty/ChangeLog                   | 19 +++++++++++++
+ libiberty/cp-demangle.c               | 52 ++++++++++++++++++++---------------
+ libiberty/testsuite/demangle-expected | 14 ++++++++--
+ 3 files changed, 61 insertions(+), 24 deletions(-)
+
+Index: git/libiberty/ChangeLog
+===================================================================
+--- git.orig/libiberty/ChangeLog
++++ git/libiberty/ChangeLog
+@@ -1,3 +1,22 @@
++2016-05-02  Marcel Böhme  <boehme.marcel@gmail.com>
++
++   PR c++/70498
++   * cp-demangle.c: Parse numbers as integer instead of long to avoid
++   overflow after sanity checks. Include <limits.h> if available.
++   (INT_MAX): Define if necessary.
++   (d_make_template_param): Takes integer argument instead of long.
++   (d_make_function_param): Likewise.
++   (d_append_num): Likewise.
++   (d_identifier): Likewise.
++   (d_number): Parse as and return integer.
++   (d_compact_number): Handle overflow.
++   (d_source_name): Change variable type to integer for parsed number.
++   (d_java_resource): Likewise.
++   (d_special_name): Likewise.
++   (d_discriminator): Likewise.
++   (d_unnamed_type): Likewise.
++   * testsuite/demangle-expected: Add regression test cases.
++
+ 2016-04-27  Release Manager
+ 
+ 	* GCC 6.1.0 released.
+Index: git/libiberty/cp-demangle.c
+===================================================================
+--- git.orig/libiberty/cp-demangle.c
++++ git/libiberty/cp-demangle.c
+@@ -128,6 +128,13 @@ extern char *alloca ();
+ # endif /* alloca */
+ #endif /* HAVE_ALLOCA_H */
+ 
++#ifdef HAVE_LIMITS_H
++#include <limits.h>
++#endif
++#ifndef INT_MAX
++# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */
++#endif
++
+ #include "ansidecl.h"
+ #include "libiberty.h"
+ #include "demangle.h"
+@@ -398,7 +405,7 @@ d_make_dtor (struct d_info *, enum gnu_v
+              struct demangle_component *);
+ 
+ static struct demangle_component *
+-d_make_template_param (struct d_info *, long);
++d_make_template_param (struct d_info *, int);
+ 
+ static struct demangle_component *
+ d_make_sub (struct d_info *, const char *, int);
+@@ -421,9 +428,9 @@ static struct demangle_component *d_unqu
+ 
+ static struct demangle_component *d_source_name (struct d_info *);
+ 
+-static long d_number (struct d_info *);
++static int d_number (struct d_info *);
+ 
+-static struct demangle_component *d_identifier (struct d_info *, long);
++static struct demangle_component *d_identifier (struct d_info *, int);
+ 
+ static struct demangle_component *d_operator_name (struct d_info *);
+ 
+@@ -1119,7 +1126,7 @@ d_make_dtor (struct d_info *di, enum gnu
+ /* Add a new template parameter.  */
+ 
+ static struct demangle_component *
+-d_make_template_param (struct d_info *di, long i)
++d_make_template_param (struct d_info *di, int i)
+ {
+   struct demangle_component *p;
+ 
+@@ -1135,7 +1142,7 @@ d_make_template_param (struct d_info *di
+ /* Add a new function parameter.  */
+ 
+ static struct demangle_component *
+-d_make_function_param (struct d_info *di, long i)
++d_make_function_param (struct d_info *di, int i)
+ {
+   struct demangle_component *p;
+ 
+@@ -1620,7 +1627,7 @@ d_unqualified_name (struct d_info *di)
+ static struct demangle_component *
+ d_source_name (struct d_info *di)
+ {
+-  long len;
++  int len;
+   struct demangle_component *ret;
+ 
+   len = d_number (di);
+@@ -1633,12 +1640,12 @@ d_source_name (struct d_info *di)
+ 
+ /* number ::= [n] <(non-negative decimal integer)>  */
+ 
+-static long
++static int
+ d_number (struct d_info *di)
+ {
+   int negative;
+   char peek;
+-  long ret;
++  int ret;
+ 
+   negative = 0;
+   peek = d_peek_char (di);
+@@ -1681,7 +1688,7 @@ d_number_component (struct d_info *di)
+ /* identifier ::= <(unqualified source code identifier)>  */
+ 
+ static struct demangle_component *
+-d_identifier (struct d_info *di, long len)
++d_identifier (struct d_info *di, int len)
+ {
+   const char *name;
+ 
+@@ -1702,7 +1709,7 @@ d_identifier (struct d_info *di, long le
+   /* Look for something which looks like a gcc encoding of an
+      anonymous namespace, and replace it with a more user friendly
+      name.  */
+-  if (len >= (long) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
++  if (len >= (int) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
+       && memcmp (name, ANONYMOUS_NAMESPACE_PREFIX,
+ 		 ANONYMOUS_NAMESPACE_PREFIX_LEN) == 0)
+     {
+@@ -1870,7 +1877,7 @@ d_java_resource (struct d_info *di)
+ {
+   struct demangle_component *p = NULL;
+   struct demangle_component *next = NULL;
+-  long len, i;
++  int len, i;
+   char c;
+   const char *str;
+ 
+@@ -2012,7 +2019,7 @@ d_special_name (struct d_info *di)
+ 	case 'C':
+ 	  {
+ 	    struct demangle_component *derived_type;
+-	    long offset;
++	    int offset;
+ 	    struct demangle_component *base_type;
+ 
+ 	    derived_type = cplus_demangle_type (di);
+@@ -2946,10 +2953,10 @@ d_pointer_to_member_type (struct d_info
+ 
+ /* <non-negative number> _ */
+ 
+-static long
++static int
+ d_compact_number (struct d_info *di)
+ {
+-  long num;
++  int num;
+   if (d_peek_char (di) == '_')
+     num = 0;
+   else if (d_peek_char (di) == 'n')
+@@ -2957,7 +2964,7 @@ d_compact_number (struct d_info *di)
+   else
+     num = d_number (di) + 1;
+ 
+-  if (! d_check_char (di, '_'))
++  if (num < 0 || ! d_check_char (di, '_'))
+     return -1;
+   return num;
+ }
+@@ -2969,7 +2976,7 @@ d_compact_number (struct d_info *di)
+ static struct demangle_component *
+ d_template_param (struct d_info *di)
+ {
+-  long param;
++  int param;
+ 
+   if (! d_check_char (di, 'T'))
+     return NULL;
+@@ -3171,9 +3178,10 @@ d_expression_1 (struct d_info *di)
+ 	}
+       else
+ 	{
+-	  index = d_compact_number (di) + 1;
+-	  if (index == 0)
++	  index = d_compact_number (di);
++	  if (index == INT_MAX || index == -1)
+ 	    return NULL;
++	  index ++;
+ 	}
+       return d_make_function_param (di, index);
+     }
+@@ -3502,7 +3510,7 @@ d_local_name (struct d_info *di)
+ static int
+ d_discriminator (struct d_info *di)
+ {
+-  long discrim;
++  int discrim;
+ 
+   if (d_peek_char (di) != '_')
+     return 1;
+@@ -3558,7 +3566,7 @@ static struct demangle_component *
+ d_unnamed_type (struct d_info *di)
+ {
+   struct demangle_component *ret;
+-  long num;
++  int num;
+ 
+   if (! d_check_char (di, 'U'))
+     return NULL;
+@@ -4086,10 +4094,10 @@ d_append_string (struct d_print_info *dp
+ }
+ 
+ static inline void
+-d_append_num (struct d_print_info *dpi, long l)
++d_append_num (struct d_print_info *dpi, int l)
+ {
+   char buf[25];
+-  sprintf (buf,"%ld", l);
++  sprintf (buf,"%d", l);
+   d_append_string (dpi, buf);
+ }
+ 
+Index: git/libiberty/testsuite/demangle-expected
+===================================================================
+--- git.orig/libiberty/testsuite/demangle-expected
++++ git/libiberty/testsuite/demangle-expected
+@@ -4422,12 +4422,22 @@ void baz<int>(A<sizeof (foo((int)(), (fl
+ _Z3fooI1FEN1XIXszdtcl1PclcvT__EEE5arrayEE4TypeEv
+ X<sizeof ((P(((F)())())).array)>::Type foo<F>()
+ #
+-# Tests a use-after-free problem
++# Tests a use-after-free problem PR70481
+ 
+ _Q.__0
+ ::Q.(void)
+ #
+-# Tests a use-after-free problem
++# Tests a use-after-free problem PR70481
+ 
+ _Q10-__9cafebabe.
+ cafebabe.::-(void)
++#
++# Tests integer overflow problem PR70492
++
++__vt_90000000000cafebabe
++__vt_90000000000cafebabe
++#
++# Tests write access violation PR70498
++
++_Z80800000000000000000000
++_Z80800000000000000000000
-- 
2.3.5


