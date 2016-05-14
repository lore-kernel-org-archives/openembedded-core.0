Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id BDC2060767
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2016 03:26:04 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gh9so9793613pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 20:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XG0Q7MgqnKt4MwKvK4+kZx2EPjzSGuahiveLcw/kFBM=;
	b=ePPkIiRMy9bEhAkt3/wLcds6swSAsSp0opwJY3InQaiqqoJ3Y79Gfnz/9RjNWvyFWq
	Wc/4s9QwfnWBxFdouKh2g+nLoKPcEAZI+heoT8y9Aqmny+I9CeEhbIi9XJOImceQg3eX
	W5K6FCfPzDQDsvNZWt7gMchKaQmxjShNjNcAV92Ikp8O2E7e1c1g7jYVwTVLegu5B2de
	a4mfOwDIGIvbfVqlVbp3XqRieypQGzu41JHuhOXFQmKFEMlODC6msrWeR0u+V80xgBnS
	lA+/30dlyzN0wVr5Y4dAlrqyaQrpHqr+tIkwSGZLA4GeN8kuxWaaOiN/QbAKqCoSZFsN
	Wegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XG0Q7MgqnKt4MwKvK4+kZx2EPjzSGuahiveLcw/kFBM=;
	b=P+pGsL5eoHflJt2xVOVktZ2YSdChzCR0pqMwU/D3qndPa3Ryi1j/+bp+KSJjTY5s80
	CV6z14PHhSiTmAeFs22L+b7j740O718YuTcHpvM5dTIuwtrYsF26Z72pTyiIDD/QZvcv
	uKRBevLfvid7r0ASdQuXPp1vY8w8lQ/st0VDJkxzx9XTS41QexiGQNl6O8pRcg3NurM+
	JxpRe5XOhQu3A8bT1DdgcAOWKfI9xMZDcY/ewZEz1JkRNwEvctu46ogP2udq8BFR8DoT
	JFh7u+5LrNvjIsdlxyQ3mkRX+5HC8alT7+ZVzAUFMwmDnkQmbEi56Iy5SyxDk6STbOCY
	AOiA==
X-Gm-Message-State: AOPr4FUlDZVBYNIVrW5bG2FZLw3YvpoWdWlp5hfoi9R7623wtuL9fDV/4T++p7uKx2h3vg==
X-Received: by 10.66.118.106 with SMTP id kl10mr27967514pab.78.1463196365181; 
	Fri, 13 May 2016 20:26:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:c53a:7e08:2482:8461?
	([2601:202:4000:1239:c53a:7e08:2482:8461])
	by smtp.googlemail.com with ESMTPSA id
	g27sm30596571pfd.25.2016.05.13.20.26.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 20:26:04 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
	<1462518717-2629-4-git-send-email-akuster808@gmail.com>
	<5735FDE6.7040905@gmail.com>
	<6A115323-D3B1-4B36-AE2F-C9B38AC329D6@gmail.com>
	<57363E81.5000208@gmail.com>
	<CAMKF1soj3+QQkKwV2vvH7RdpHO=0oN5472vf081yUQAqu1s7qg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57369ACA.30102@gmail.com>
Date: Fri, 13 May 2016 20:26:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soj3+QQkKwV2vvH7RdpHO=0oN5472vf081yUQAqu1s7qg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][krogoth][PATCH 4/4] gcc: Security fix CVE-2016-4490
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
X-List-Received-Date: Sat, 14 May 2016 03:26:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 05/13/2016 02:04 PM, Khem Raj wrote:
> On Fri, May 13, 2016 at 1:52 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 05/13/2016 11:07 AM, Khem Raj wrote:
>>> Thanks for noting. We will update gcc-6 to latest on gcc-6 branch sometime later and hopefully it will come in
>>> please keep an eye on it
>>
>> sure, np
>>
>> So here is the problem. Per process, this fix can not be propagated to
>> the any stable branch until Master has the solution.
>>
>> Now I believe there are times for exceptions and this is one of them. We
>> are in the middle for a major package update and odds are this issue
>> will resolved itself before 2.2 code freeze. It will become an issue if
>> it is still open at that point. A new patch will be required then.
>>
>> So I hope folks wont have too much of an issue if this fix is in the
>> stable branches while we manage what happens in master in this case.
> 
> I guess its ok as long as we keep track of it.

Yocto bug 9632 opened to track that action.

- armin

>
> 
> 
>>
>> - Armin
>>
>>
>>>
>>>> On May 13, 2016, at 9:16 AM, akuster808 <akuster808@gmail.com> wrote:
>>>>
>>>> this fix is not in gcc 6.0
>>>>
>>>> On 05/06/2016 12:11 AM, Armin Kuster wrote:
>>>>> From: Armin Kuster <akuster@mvista.com>
>>>>>
>>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>>> ---
>>>>> meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
>>>>> .../gcc/gcc-5.3/CVE-2016-4490.patch                | 270 +++++++++++++++++++++
>>>>> 2 files changed, 271 insertions(+)
>>>>> create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
>>>>>
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
>>>>> index 5fede2a..445d003 100644
>>>>> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
>>>>> @@ -91,6 +91,7 @@ SRC_URI = "\
>>>>>            file://CVE-2016-4488.patch \
>>>>>            file://CVE-2016-4489.patch \
>>>>>            file://CVE-2016-2226.patch \
>>>>> +           file://CVE-2016-4490.patch \
>>>>> "
>>>>>
>>>>> BACKPORTS = ""
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
>>>>> new file mode 100644
>>>>> index 0000000..4a9ed69
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
>>>>> @@ -0,0 +1,270 @@
>>>>> +From 7d235b1b5ea35352c54957ef5530d9a02c46962f Mon Sep 17 00:00:00 2001
>>>>> +From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
>>>>> +Date: Mon, 2 May 2016 17:06:40 +0000
>>>>> +Subject: [PATCH] =?UTF-8?q?Demangler=20integer=20overflow=20fixes=20from?=
>>>>> + =?UTF-8?q?=20Marcel=20B=C3=B6hme.?=
>>>>> +MIME-Version: 1.0
>>>>> +Content-Type: text/plain; charset=UTF-8
>>>>> +Content-Transfer-Encoding: 8bit
>>>>> +
>>>>> +   PR c++/70498
>>>>> +   * cp-demangle.c: Parse numbers as integer instead of long to avoid
>>>>> +   overflow after sanity checks. Include <limits.h> if available.
>>>>> +   (INT_MAX): Define if necessary.
>>>>> +   (d_make_template_param): Takes integer argument instead of long.
>>>>> +   (d_make_function_param): Likewise.
>>>>> +   (d_append_num): Likewise.
>>>>> +   (d_identifier): Likewise.
>>>>> +   (d_number): Parse as and return integer.
>>>>> +   (d_compact_number): Handle overflow.
>>>>> +   (d_source_name): Change variable type to integer for parsed number.
>>>>> +   (d_java_resource): Likewise.
>>>>> +   (d_special_name): Likewise.
>>>>> +   (d_discriminator): Likewise.
>>>>> +   (d_unnamed_type): Likewise.
>>>>> +   * testsuite/demangle-expected: Add regression test cases.
>>>>> +
>>>>> +
>>>>> +
>>>>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@235767 138bc75d-0d04-0410-961f-82ee72b054a4
>>>>> +
>>>>> +Upstream-Status: Backport
>>>>> +
>>>>> +CVE: CVE-2016-4490
>>>>> +hand applied ChangeLog
>>>>> +
>>>>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>>> +
>>>>> +---
>>>>> + libiberty/ChangeLog                   | 19 +++++++++++++
>>>>> + libiberty/cp-demangle.c               | 52 ++++++++++++++++++++---------------
>>>>> + libiberty/testsuite/demangle-expected | 14 ++++++++--
>>>>> + 3 files changed, 61 insertions(+), 24 deletions(-)
>>>>> +
>>>>> +Index: gcc-5.3.0/libiberty/cp-demangle.c
>>>>> +===================================================================
>>>>> +--- gcc-5.3.0.orig/libiberty/cp-demangle.c
>>>>> ++++ gcc-5.3.0/libiberty/cp-demangle.c
>>>>> +@@ -124,6 +124,13 @@ extern char *alloca ();
>>>>> + # endif /* alloca */
>>>>> + #endif /* HAVE_ALLOCA_H */
>>>>> +
>>>>> ++#ifdef HAVE_LIMITS_H
>>>>> ++#include <limits.h>
>>>>> ++#endif
>>>>> ++#ifndef INT_MAX
>>>>> ++# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */
>>>>> ++#endif
>>>>> ++
>>>>> + #include "ansidecl.h"
>>>>> + #include "libiberty.h"
>>>>> + #include "demangle.h"
>>>>> +@@ -394,7 +401,7 @@ d_make_dtor (struct d_info *, enum gnu_v
>>>>> +              struct demangle_component *);
>>>>> +
>>>>> + static struct demangle_component *
>>>>> +-d_make_template_param (struct d_info *, long);
>>>>> ++d_make_template_param (struct d_info *, int);
>>>>> +
>>>>> + static struct demangle_component *
>>>>> + d_make_sub (struct d_info *, const char *, int);
>>>>> +@@ -417,7 +424,7 @@ static struct demangle_component *d_unqu
>>>>> +
>>>>> + static struct demangle_component *d_source_name (struct d_info *);
>>>>> +
>>>>> +-static long d_number (struct d_info *);
>>>>> ++static int d_number (struct d_info *);
>>>>> +
>>>>> + static struct demangle_component *d_identifier (struct d_info *, int);
>>>>> +
>>>>> +@@ -1105,7 +1112,7 @@ d_make_dtor (struct d_info *di, enum gnu
>>>>> + /* Add a new template parameter.  */
>>>>> +
>>>>> + static struct demangle_component *
>>>>> +-d_make_template_param (struct d_info *di, long i)
>>>>> ++d_make_template_param (struct d_info *di, int i)
>>>>> + {
>>>>> +   struct demangle_component *p;
>>>>> +
>>>>> +@@ -1121,7 +1128,7 @@ d_make_template_param (struct d_info *di
>>>>> + /* Add a new function parameter.  */
>>>>> +
>>>>> + static struct demangle_component *
>>>>> +-d_make_function_param (struct d_info *di, long i)
>>>>> ++d_make_function_param (struct d_info *di, int i)
>>>>> + {
>>>>> +   struct demangle_component *p;
>>>>> +
>>>>> +@@ -1595,7 +1602,7 @@ d_unqualified_name (struct d_info *di)
>>>>> + static struct demangle_component *
>>>>> + d_source_name (struct d_info *di)
>>>>> + {
>>>>> +-  long len;
>>>>> ++  int len;
>>>>> +   struct demangle_component *ret;
>>>>> +
>>>>> +   len = d_number (di);
>>>>> +@@ -1608,12 +1615,12 @@ d_source_name (struct d_info *di)
>>>>> +
>>>>> + /* number ::= [n] <(non-negative decimal integer)>  */
>>>>> +
>>>>> +-static long
>>>>> ++static int
>>>>> + d_number (struct d_info *di)
>>>>> + {
>>>>> +   int negative;
>>>>> +   char peek;
>>>>> +-  long ret;
>>>>> ++  int ret;
>>>>> +
>>>>> +   negative = 0;
>>>>> +   peek = d_peek_char (di);
>>>>> +@@ -1840,7 +1847,7 @@ d_java_resource (struct d_info *di)
>>>>> + {
>>>>> +   struct demangle_component *p = NULL;
>>>>> +   struct demangle_component *next = NULL;
>>>>> +-  long len, i;
>>>>> ++  int len, i;
>>>>> +   char c;
>>>>> +   const char *str;
>>>>> +
>>>>> +@@ -1982,7 +1989,7 @@ d_special_name (struct d_info *di)
>>>>> +   case 'C':
>>>>> +     {
>>>>> +       struct demangle_component *derived_type;
>>>>> +-      long offset;
>>>>> ++      int offset;
>>>>> +       struct demangle_component *base_type;
>>>>> +
>>>>> +       derived_type = cplus_demangle_type (di);
>>>>> +@@ -2905,10 +2912,10 @@ d_pointer_to_member_type (struct d_info
>>>>> +
>>>>> + /* <non-negative number> _ */
>>>>> +
>>>>> +-static long
>>>>> ++static int
>>>>> + d_compact_number (struct d_info *di)
>>>>> + {
>>>>> +-  long num;
>>>>> ++  int num;
>>>>> +   if (d_peek_char (di) == '_')
>>>>> +     num = 0;
>>>>> +   else if (d_peek_char (di) == 'n')
>>>>> +@@ -2916,7 +2923,7 @@ d_compact_number (struct d_info *di)
>>>>> +   else
>>>>> +     num = d_number (di) + 1;
>>>>> +
>>>>> +-  if (! d_check_char (di, '_'))
>>>>> ++  if (num < 0 || ! d_check_char (di, '_'))
>>>>> +     return -1;
>>>>> +   return num;
>>>>> + }
>>>>> +@@ -2928,7 +2935,7 @@ d_compact_number (struct d_info *di)
>>>>> + static struct demangle_component *
>>>>> + d_template_param (struct d_info *di)
>>>>> + {
>>>>> +-  long param;
>>>>> ++  int param;
>>>>> +
>>>>> +   if (! d_check_char (di, 'T'))
>>>>> +     return NULL;
>>>>> +@@ -3130,9 +3137,10 @@ d_expression_1 (struct d_info *di)
>>>>> +   }
>>>>> +       else
>>>>> +   {
>>>>> +-    index = d_compact_number (di) + 1;
>>>>> +-    if (index == 0)
>>>>> ++    index = d_compact_number (di);
>>>>> ++    if (index == INT_MAX || index == -1)
>>>>> +       return NULL;
>>>>> ++    index ++;
>>>>> +   }
>>>>> +       return d_make_function_param (di, index);
>>>>> +     }
>>>>> +@@ -3455,7 +3463,7 @@ d_local_name (struct d_info *di)
>>>>> + static int
>>>>> + d_discriminator (struct d_info *di)
>>>>> + {
>>>>> +-  long discrim;
>>>>> ++  int discrim;
>>>>> +
>>>>> +   if (d_peek_char (di) != '_')
>>>>> +     return 1;
>>>>> +@@ -3511,7 +3519,7 @@ static struct demangle_component *
>>>>> + d_unnamed_type (struct d_info *di)
>>>>> + {
>>>>> +   struct demangle_component *ret;
>>>>> +-  long num;
>>>>> ++  int num;
>>>>> +
>>>>> +   if (! d_check_char (di, 'U'))
>>>>> +     return NULL;
>>>>> +@@ -4037,10 +4045,10 @@ d_append_string (struct d_print_info *dp
>>>>> + }
>>>>> +
>>>>> + static inline void
>>>>> +-d_append_num (struct d_print_info *dpi, long l)
>>>>> ++d_append_num (struct d_print_info *dpi, int l)
>>>>> + {
>>>>> +   char buf[25];
>>>>> +-  sprintf (buf,"%ld", l);
>>>>> ++  sprintf (buf,"%d", l);
>>>>> +   d_append_string (dpi, buf);
>>>>> + }
>>>>> +
>>>>> +Index: gcc-5.3.0/libiberty/testsuite/demangle-expected
>>>>> +===================================================================
>>>>> +--- gcc-5.3.0.orig/libiberty/testsuite/demangle-expected
>>>>> ++++ gcc-5.3.0/libiberty/testsuite/demangle-expected
>>>>> +@@ -4357,12 +4357,22 @@ _QueueNotification_QueueController__$4PP
>>>>> + _Z1fSsB3fooS_
>>>>> + f(std::string[abi:foo], std::string[abi:foo])
>>>>> + #
>>>>> +-# Tests a use-after-free problem
>>>>> ++# Tests a use-after-free problem PR70481
>>>>> +
>>>>> + _Q.__0
>>>>> + ::Q.(void)
>>>>> + #
>>>>> +-# Tests a use-after-free problem
>>>>> ++# Tests a use-after-free problem PR70481
>>>>> +
>>>>> + _Q10-__9cafebabe.
>>>>> + cafebabe.::-(void)
>>>>> ++#
>>>>> ++# Tests integer overflow problem PR70492
>>>>> ++
>>>>> ++__vt_90000000000cafebabe
>>>>> ++__vt_90000000000cafebabe
>>>>> ++#
>>>>> ++# Tests write access violation PR70498
>>>>> ++
>>>>> ++_Z80800000000000000000000
>>>>> ++_Z80800000000000000000000
>>>>> +Index: gcc-5.3.0/libiberty/ChangeLog
>>>>> +===================================================================
>>>>> +--- gcc-5.3.0.orig/libiberty/ChangeLog
>>>>> ++++ gcc-5.3.0/libiberty/ChangeLog
>>>>> +@@ -1,3 +1,22 @@
>>>>> ++2016-05-02  Marcel Böhme  <boehme.marcel@gmail.com>
>>>>> ++
>>>>> ++   PR c++/70498
>>>>> ++   * cp-demangle.c: Parse numbers as integer instead of long to avoid
>>>>> ++   overflow after sanity checks. Include <limits.h> if available.
>>>>> ++   (INT_MAX): Define if necessary.
>>>>> ++   (d_make_template_param): Takes integer argument instead of long.
>>>>> ++   (d_make_function_param): Likewise.
>>>>> ++   (d_append_num): Likewise.
>>>>> ++   (d_identifier): Likewise.
>>>>> ++   (d_number): Parse as and return integer.
>>>>> ++   (d_compact_number): Handle overflow.
>>>>> ++   (d_source_name): Change variable type to integer for parsed number.
>>>>> ++   (d_java_resource): Likewise.
>>>>> ++   (d_special_name): Likewise.
>>>>> ++   (d_discriminator): Likewise.
>>>>> ++   (d_unnamed_type): Likewise.
>>>>> ++   * testsuite/demangle-expected: Add regression test cases.
>>>>> ++
>>>>> + 2016-04-08  Marcel Böhme  <boehme.marcel@gmail.com>
>>>>> +
>>>>> +   PR c++/69687
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>

