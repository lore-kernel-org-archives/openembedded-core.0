Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3B792601A4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 17:44:47 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id ts6so10165151pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:to:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=fhsTL/rjxgBQSGPO/0ys3/nEhVlv0MZN47r5hJac/eU=;
	b=do0XdIBteKNTvP8w2iL3Md/j0J62N7A3aIgieOSSdkj3onV8pIQp+9JzM92PfxpCJF
	f5Iuw3rAInYu7Uaqhu7ED1GrYULZz4X23YdNkHMu9lTBT5FCdXb75TDgoTckEFAjyzdt
	pyCwo67/J0+qdCbQoQoB8mlVnJunsDjWeJp4/wPE2ZnvskBtjLVktK8Ut94u0Fm2Mw4h
	aKZjYsdajMLgoCE6IoIkXfUJFp7VCnT9eVCqdA0/u99ZM7B1G5QYKtHRvsRUGpZh0dcS
	jf4atC3yGmkywHVo69LR98rVS1BBCJcTQCYz1CAlsjxsgqkznSpYRH07LcYaw+HNYH12
	WtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:cc:to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fhsTL/rjxgBQSGPO/0ys3/nEhVlv0MZN47r5hJac/eU=;
	b=AfkpLOqLGb1BcAzD4rZ01Q1Ope6adM1VPlcp5TXg6ARIHE/6zMvD9ws1NBWmmAvg0G
	lJa6ccEdV/8/2Vj/03nvNo8Gt4l3aeiICuFs1eKBziF5+AOS081KiSFb2H8MfaDOz+P9
	J6l4rJDDgZfhx1/6uzwl4DW7Dz++O7dyGV4wp7O85asnk5Pgg4/w7WU0yKJ4YO9R584l
	2NtBPzjjausGWFuHfHhtdS5whmIhxNupDX97hWZm5oTUdM/4smlu/wGKN2PbVFY4dPl8
	4VcKe8O+eO1u1yqErlCEKowyn4jQIiUnlYy/K5AkXr5CdCaImviJIOStyY7us7TDV22E
	ARRQ==
X-Gm-Message-State: ALyK8tJHI/ejNCWu4sRSzihdx0dC2p00Nly+sSVBmZmXrLrZHnEV1x/aRdWMKtmsAHzMvA==
X-Received: by 10.66.49.134 with SMTP id u6mr20482726pan.118.1468086288462;
	Sat, 09 Jul 2016 10:44:48 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6ce8:588a:7616:ca9?
	([2601:202:4001:9ea0:6ce8:588a:7616:ca9])
	by smtp.googlemail.com with ESMTPSA id
	6sm5623540pfx.68.2016.07.09.10.44.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jul 2016 10:44:47 -0700 (PDT)
References: <1467927188-21545-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spcb=g9uHXOrC+Re7x10occO7U6OSOKFTDv4d2Mji6EDA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5781380A.6090909@gmail.com>
Date: Sat, 9 Jul 2016 10:44:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spcb=g9uHXOrC+Re7x10occO7U6OSOKFTDv4d2Mji6EDA@mail.gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc: CVE-2016-4490
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
X-List-Received-Date: Sat, 09 Jul 2016 17:44:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Richard,

please revert

http://cgit.openembedded.org/openembedded-core/commit/?h=master-next&id=709dd94cd2a6011738b4ab10bd09839b07f44eac

I sent a v2 of th-s fix. Its missing the gcc-6.1.inc changes to actually
apply the patch.

- armin

On 07/07/2016 07:26 PM, Khem Raj wrote:
> On Thu, Jul 7, 2016 at 2:33 PM, Armin Kuster <akuster808@gmail.com> wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> [Yocto #9632]
>>
>> not in 6.1.1 so back porting.
> 
> 6.2 should be releasing in couple of months time hopefully but until
> then we can have this
> 
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  .../gcc/gcc-6.1/CVE-2016-4490.patch                | 289 +++++++++++++++++++++
>>  1 file changed, 289 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch
>> new file mode 100644
>> index 0000000..aaef2be
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-6.1/CVE-2016-4490.patch
>> @@ -0,0 +1,289 @@
>> +From 7d235b1b5ea35352c54957ef5530d9a02c46962f Mon Sep 17 00:00:00 2001
>> +From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
>> +Date: Mon, 2 May 2016 17:06:40 +0000
>> +Subject: [PATCH] =?UTF-8?q?Demangler=20integer=20overflow=20fixes=20from?=
>> + =?UTF-8?q?=20Marcel=20B=C3=B6hme.?=
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +       PR c++/70498
>> +       * cp-demangle.c: Parse numbers as integer instead of long to avoid
>> +       overflow after sanity checks. Include <limits.h> if available.
>> +       (INT_MAX): Define if necessary.
>> +       (d_make_template_param): Takes integer argument instead of long.
>> +       (d_make_function_param): Likewise.
>> +       (d_append_num): Likewise.
>> +       (d_identifier): Likewise.
>> +       (d_number): Parse as and return integer.
>> +       (d_compact_number): Handle overflow.
>> +       (d_source_name): Change variable type to integer for parsed number.
>> +       (d_java_resource): Likewise.
>> +       (d_special_name): Likewise.
>> +       (d_discriminator): Likewise.
>> +       (d_unnamed_type): Likewise.
>> +       * testsuite/demangle-expected: Add regression test cases.
>> +
>> +
>> +
>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@235767 138bc75d-0d04-0410-961f-82ee72b054a4
>> +
>> +Upstream-Status: Backport
>> +CVE:  CVE-2016-4490
>> +
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + libiberty/ChangeLog                   | 19 +++++++++++++
>> + libiberty/cp-demangle.c               | 52 ++++++++++++++++++++---------------
>> + libiberty/testsuite/demangle-expected | 14 ++++++++--
>> + 3 files changed, 61 insertions(+), 24 deletions(-)
>> +
>> +Index: git/libiberty/ChangeLog
>> +===================================================================
>> +--- git.orig/libiberty/ChangeLog
>> ++++ git/libiberty/ChangeLog
>> +@@ -1,3 +1,22 @@
>> ++2016-05-02  Marcel Böhme  <boehme.marcel@gmail.com>
>> ++
>> ++   PR c++/70498
>> ++   * cp-demangle.c: Parse numbers as integer instead of long to avoid
>> ++   overflow after sanity checks. Include <limits.h> if available.
>> ++   (INT_MAX): Define if necessary.
>> ++   (d_make_template_param): Takes integer argument instead of long.
>> ++   (d_make_function_param): Likewise.
>> ++   (d_append_num): Likewise.
>> ++   (d_identifier): Likewise.
>> ++   (d_number): Parse as and return integer.
>> ++   (d_compact_number): Handle overflow.
>> ++   (d_source_name): Change variable type to integer for parsed number.
>> ++   (d_java_resource): Likewise.
>> ++   (d_special_name): Likewise.
>> ++   (d_discriminator): Likewise.
>> ++   (d_unnamed_type): Likewise.
>> ++   * testsuite/demangle-expected: Add regression test cases.
>> ++
>> + 2016-04-27  Release Manager
>> +
>> +       * GCC 6.1.0 released.
>> +Index: git/libiberty/cp-demangle.c
>> +===================================================================
>> +--- git.orig/libiberty/cp-demangle.c
>> ++++ git/libiberty/cp-demangle.c
>> +@@ -128,6 +128,13 @@ extern char *alloca ();
>> + # endif /* alloca */
>> + #endif /* HAVE_ALLOCA_H */
>> +
>> ++#ifdef HAVE_LIMITS_H
>> ++#include <limits.h>
>> ++#endif
>> ++#ifndef INT_MAX
>> ++# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */
>> ++#endif
>> ++
>> + #include "ansidecl.h"
>> + #include "libiberty.h"
>> + #include "demangle.h"
>> +@@ -398,7 +405,7 @@ d_make_dtor (struct d_info *, enum gnu_v
>> +              struct demangle_component *);
>> +
>> + static struct demangle_component *
>> +-d_make_template_param (struct d_info *, long);
>> ++d_make_template_param (struct d_info *, int);
>> +
>> + static struct demangle_component *
>> + d_make_sub (struct d_info *, const char *, int);
>> +@@ -421,9 +428,9 @@ static struct demangle_component *d_unqu
>> +
>> + static struct demangle_component *d_source_name (struct d_info *);
>> +
>> +-static long d_number (struct d_info *);
>> ++static int d_number (struct d_info *);
>> +
>> +-static struct demangle_component *d_identifier (struct d_info *, long);
>> ++static struct demangle_component *d_identifier (struct d_info *, int);
>> +
>> + static struct demangle_component *d_operator_name (struct d_info *);
>> +
>> +@@ -1119,7 +1126,7 @@ d_make_dtor (struct d_info *di, enum gnu
>> + /* Add a new template parameter.  */
>> +
>> + static struct demangle_component *
>> +-d_make_template_param (struct d_info *di, long i)
>> ++d_make_template_param (struct d_info *di, int i)
>> + {
>> +   struct demangle_component *p;
>> +
>> +@@ -1135,7 +1142,7 @@ d_make_template_param (struct d_info *di
>> + /* Add a new function parameter.  */
>> +
>> + static struct demangle_component *
>> +-d_make_function_param (struct d_info *di, long i)
>> ++d_make_function_param (struct d_info *di, int i)
>> + {
>> +   struct demangle_component *p;
>> +
>> +@@ -1620,7 +1627,7 @@ d_unqualified_name (struct d_info *di)
>> + static struct demangle_component *
>> + d_source_name (struct d_info *di)
>> + {
>> +-  long len;
>> ++  int len;
>> +   struct demangle_component *ret;
>> +
>> +   len = d_number (di);
>> +@@ -1633,12 +1640,12 @@ d_source_name (struct d_info *di)
>> +
>> + /* number ::= [n] <(non-negative decimal integer)>  */
>> +
>> +-static long
>> ++static int
>> + d_number (struct d_info *di)
>> + {
>> +   int negative;
>> +   char peek;
>> +-  long ret;
>> ++  int ret;
>> +
>> +   negative = 0;
>> +   peek = d_peek_char (di);
>> +@@ -1681,7 +1688,7 @@ d_number_component (struct d_info *di)
>> + /* identifier ::= <(unqualified source code identifier)>  */
>> +
>> + static struct demangle_component *
>> +-d_identifier (struct d_info *di, long len)
>> ++d_identifier (struct d_info *di, int len)
>> + {
>> +   const char *name;
>> +
>> +@@ -1702,7 +1709,7 @@ d_identifier (struct d_info *di, long le
>> +   /* Look for something which looks like a gcc encoding of an
>> +      anonymous namespace, and replace it with a more user friendly
>> +      name.  */
>> +-  if (len >= (long) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
>> ++  if (len >= (int) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
>> +       && memcmp (name, ANONYMOUS_NAMESPACE_PREFIX,
>> +                ANONYMOUS_NAMESPACE_PREFIX_LEN) == 0)
>> +     {
>> +@@ -1870,7 +1877,7 @@ d_java_resource (struct d_info *di)
>> + {
>> +   struct demangle_component *p = NULL;
>> +   struct demangle_component *next = NULL;
>> +-  long len, i;
>> ++  int len, i;
>> +   char c;
>> +   const char *str;
>> +
>> +@@ -2012,7 +2019,7 @@ d_special_name (struct d_info *di)
>> +       case 'C':
>> +         {
>> +           struct demangle_component *derived_type;
>> +-          long offset;
>> ++          int offset;
>> +           struct demangle_component *base_type;
>> +
>> +           derived_type = cplus_demangle_type (di);
>> +@@ -2946,10 +2953,10 @@ d_pointer_to_member_type (struct d_info
>> +
>> + /* <non-negative number> _ */
>> +
>> +-static long
>> ++static int
>> + d_compact_number (struct d_info *di)
>> + {
>> +-  long num;
>> ++  int num;
>> +   if (d_peek_char (di) == '_')
>> +     num = 0;
>> +   else if (d_peek_char (di) == 'n')
>> +@@ -2957,7 +2964,7 @@ d_compact_number (struct d_info *di)
>> +   else
>> +     num = d_number (di) + 1;
>> +
>> +-  if (! d_check_char (di, '_'))
>> ++  if (num < 0 || ! d_check_char (di, '_'))
>> +     return -1;
>> +   return num;
>> + }
>> +@@ -2969,7 +2976,7 @@ d_compact_number (struct d_info *di)
>> + static struct demangle_component *
>> + d_template_param (struct d_info *di)
>> + {
>> +-  long param;
>> ++  int param;
>> +
>> +   if (! d_check_char (di, 'T'))
>> +     return NULL;
>> +@@ -3171,9 +3178,10 @@ d_expression_1 (struct d_info *di)
>> +       }
>> +       else
>> +       {
>> +-        index = d_compact_number (di) + 1;
>> +-        if (index == 0)
>> ++        index = d_compact_number (di);
>> ++        if (index == INT_MAX || index == -1)
>> +           return NULL;
>> ++        index ++;
>> +       }
>> +       return d_make_function_param (di, index);
>> +     }
>> +@@ -3502,7 +3510,7 @@ d_local_name (struct d_info *di)
>> + static int
>> + d_discriminator (struct d_info *di)
>> + {
>> +-  long discrim;
>> ++  int discrim;
>> +
>> +   if (d_peek_char (di) != '_')
>> +     return 1;
>> +@@ -3558,7 +3566,7 @@ static struct demangle_component *
>> + d_unnamed_type (struct d_info *di)
>> + {
>> +   struct demangle_component *ret;
>> +-  long num;
>> ++  int num;
>> +
>> +   if (! d_check_char (di, 'U'))
>> +     return NULL;
>> +@@ -4086,10 +4094,10 @@ d_append_string (struct d_print_info *dp
>> + }
>> +
>> + static inline void
>> +-d_append_num (struct d_print_info *dpi, long l)
>> ++d_append_num (struct d_print_info *dpi, int l)
>> + {
>> +   char buf[25];
>> +-  sprintf (buf,"%ld", l);
>> ++  sprintf (buf,"%d", l);
>> +   d_append_string (dpi, buf);
>> + }
>> +
>> +Index: git/libiberty/testsuite/demangle-expected
>> +===================================================================
>> +--- git.orig/libiberty/testsuite/demangle-expected
>> ++++ git/libiberty/testsuite/demangle-expected
>> +@@ -4422,12 +4422,22 @@ void baz<int>(A<sizeof (foo((int)(), (fl
>> + _Z3fooI1FEN1XIXszdtcl1PclcvT__EEE5arrayEE4TypeEv
>> + X<sizeof ((P(((F)())())).array)>::Type foo<F>()
>> + #
>> +-# Tests a use-after-free problem
>> ++# Tests a use-after-free problem PR70481
>> +
>> + _Q.__0
>> + ::Q.(void)
>> + #
>> +-# Tests a use-after-free problem
>> ++# Tests a use-after-free problem PR70481
>> +
>> + _Q10-__9cafebabe.
>> + cafebabe.::-(void)
>> ++#
>> ++# Tests integer overflow problem PR70492
>> ++
>> ++__vt_90000000000cafebabe
>> ++__vt_90000000000cafebabe
>> ++#
>> ++# Tests write access violation PR70498
>> ++
>> ++_Z80800000000000000000000
>> ++_Z80800000000000000000000
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

