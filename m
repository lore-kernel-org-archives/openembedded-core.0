Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 73FE07F2F2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 14:15:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id t16so47491630pfe.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mis7F6qbGGNobh9wnRf2eh/+OnttPzqn496MFbV/H1A=;
	b=fHgDhnvVinr1NtpP1a5a5EEYzozTB1DgxGzyLKxf5tbSGUxgU7pGA1KcXuENQ814eb
	o309JXiAUyJxXN+FRggkA1WOuaGA8NhZ4/BL2nZJsH+JORr4wQHiKdtga47tQaju2RvJ
	ra56maCaFJ0IJWdtwJJ0q0JBJ+2/ucF6FCbnN4vJ2+VVVK2LgATXXCoLYDF9dZs2Li7T
	58aO4B9v8Xj+xNqRumR9PWvtcrjzh/WfRbHakKxHz/ZIpPItnTTYypzThS1Dq6hFY2fx
	jxpYQrwIqHxZZE55ZjXn7PIOXtGOtvr0LcRHEOHsQtbmaosU5dDxhOT1PNUyWVH8nt4b
	DrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=mis7F6qbGGNobh9wnRf2eh/+OnttPzqn496MFbV/H1A=;
	b=hT+hSqpDLt3qSrgCeTmblZKb1TE+5mZSFoMdhwbh92ydfD5shPcXtuaOAtdmlOYaSu
	cXJrjsHEVcejWaiB3g7chhTxMLWPheEW+VxOE+LI21MUUDJs2+OhKzbjDt8iEuRTDcBl
	2jLsf2zunxqU78ywUjTjvQGGi2mPIRDOtW/1ahIDT176zcfdoAbNv7WCKzxKR0lVAobB
	tJ0mwwdhbsZk73UVH34AGzEgoUgs2z5oeoGUJXe4lwp/DVwe4atgIjVbuccpQiFVBJSq
	RKmNSdVio80LLRX9+XkxrSxRVbKkb8Gr9T6FzdBJuKweJl6VoaSTke/CIluPm2RWfP5x
	2yhQ==
X-Gm-Message-State: APjAAAWrJcKxAByrPIYn798THZlZB5PmZdp96n5xnCUGmu+kQ1l7Uyj7
	C6Q+kVLUFOSuotkntZ1Z+QQcEnhC
X-Google-Smtp-Source: APXvYqywaFnpLtzKG3Sh4H3SNBPgsHR2622NCbSDnnT6LAaGkkviGN0aDiPa164jJ03zy7BV9PrCUg==
X-Received: by 2002:a65:6495:: with SMTP id e21mr22379436pgv.359.1565446535239;
	Sat, 10 Aug 2019 07:15:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:cd6e:8130:b233:452a?
	([2601:202:4180:c33:cd6e:8130:b233:452a])
	by smtp.gmail.com with ESMTPSA id
	y22sm117502368pfo.39.2019.08.10.07.15.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Aug 2019 07:15:34 -0700 (PDT)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
	<eb37a79cd2ab7c50a8bcceff5c47af0ed1834f51.camel@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <87366927-48bf-22e3-4685-aff3c1cdf72b@gmail.com>
Date: Sat, 10 Aug 2019 07:15:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eb37a79cd2ab7c50a8bcceff5c47af0ed1834f51.camel@intel.com>
Subject: Re: [warrior][PATCH 01/11] binutils: fix CVE-2019-12972 CVE-2019-9071
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
X-List-Received-Date: Sat, 10 Aug 2019 14:15:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/4/19 4:03 PM, Mittal, Anuj wrote:
> Ping. Can this series be merged please?
Working on them.
>
> On Thu, 2019-07-25 at 12:02 +0800, Anuj Mittal wrote:
>> (From OE-Core rev: 093f0914f261a27d58ecba9c1e9d3b78a35af012)
>>
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/recipes-devtools/binutils/binutils-2.32.inc   |   2 +
>>  .../binutils/binutils/CVE-2019-12972.patch         |  51 +++++++
>>  .../binutils/binutils/CVE-2019-9071.patch          | 164
>> +++++++++++++++++++++
>>  3 files changed, 217 insertions(+)
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-
>> 12972.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-
>> 9071.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc
>> b/meta/recipes-devtools/binutils/binutils-2.32.inc
>> index 49e6827..31c24a3 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.32.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
>> @@ -48,6 +48,8 @@ SRC_URI = "\
>>       file://CVE-2019-9075.patch \
>>       file://CVE-2019-9076.patch \
>>       file://CVE-2019-9077.patch \
>> +     file://CVE-2019-9071.patch \
>> +     file://CVE-2019-12972.patch \
>>  "
>>  S  = "${WORKDIR}/git"
>>  
>> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-
>> 12972.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-
>> 12972.patch
>> new file mode 100644
>> index 0000000..07d1d65
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
>> @@ -0,0 +1,51 @@
>> +From 30bcc01478433a1cb05b36dc5c4beef7d2c89b5b Mon Sep 17 00:00:00
>> 2001
>> +From: Alan Modra <amodra@gmail.com>
>> +Date: Fri, 21 Jun 2019 11:51:38 +0930
>> +Subject: [PATCH] PR24689, string table corruption
>> +
>> +The testcase in the PR had a e_shstrndx section of type SHT_GROUP.
>> +hdr->contents were initialized by setup_group rather than being read
>> +from the file, thus last byte was not zero and string dereference
>> ran
>> +off the end of the buffer.
>> +
>> +	PR 24689
>> +	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2019-12972
>> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> +---
>> + bfd/ChangeLog | 5 +++++
>> + bfd/elfcode.h | 3 ++-
>> + 2 files changed, 7 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/bfd/ChangeLog b/bfd/ChangeLog
>> +index 91f09e6346..e66fb40a2c 100644
>> +--- a/bfd/ChangeLog
>> ++++ b/bfd/ChangeLog
>> +@@ -1,3 +1,8 @@
>> ++2019-06-21  Alan Modra  <amodra@gmail.com>
>> ++
>> ++	PR 24689
>> ++	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
>> ++
>> + 2019-02-20  Alan Modra  <amodra@gmail.com>
>> + 
>> + 	PR 24236
>> +diff --git a/bfd/elfcode.h b/bfd/elfcode.h
>> +index ec5ea766de..a35a629087 100644
>> +--- a/bfd/elfcode.h
>> ++++ b/bfd/elfcode.h
>> +@@ -755,7 +755,8 @@ elf_object_p (bfd *abfd)
>> +   /* A further sanity check.  */
>> +   if (i_ehdrp->e_shnum != 0)
>> +     {
>> +-      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd))
>> ++      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd)
>> ++	  || i_shdrp[i_ehdrp->e_shstrndx].sh_type != SHT_STRTAB)
>> + 	{
>> + 	  /* PR 2257:
>> + 	     We used to just goto got_wrong_format_error here
>> +-- 
>> +2.20.1
>> +
>> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-
>> 9071.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-
>> 9071.patch
>> new file mode 100644
>> index 0000000..26f4809
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
>> @@ -0,0 +1,164 @@
>> +From c1202057eb9161a86af27d867703235fee7b7555 Mon Sep 17 00:00:00
>> 2001
>> +From: Nick Clifton <nickc@redhat.com>
>> +Date: Wed, 10 Apr 2019 15:49:36 +0100
>> +Subject: [PATCH] Pull in patch for libiberty that fixes a stack
>> exhaustion bug
>> + when demangling a pathalogically constructed mangled name.
>> +
>> +	PR 89394
>> +	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
>> +	lengths.
>> +	(d_count_templates_scopes): Replace num_templates and
>> num_scopes
>> +	parameters with a struct d_print_info pointer
>> parameter.  Adjust
>> +	body of the function accordingly.  Add recursion counter and
>> check
>> +	that the recursion limit is not reached.
>> +	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
>> +	Reset recursion counter afterwards, unless the recursion limit
>> was
>> +	reached.
>> +
>> +CVE: CVE-2019-9071
>> +Upstream-Status: Backport
>> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> +---
>> + ChangeLog               | 16 ++++++++++++++
>> + libiberty/cp-demangle.c | 48 ++++++++++++++++++++++--------------
>> -----
>> + 2 files changed, 42 insertions(+), 22 deletions(-)
>> +
>> +diff --git a/ChangeLog b/ChangeLog
>> +index cd631a15b6..4df3aaa62c 100644
>> +--- a/ChangeLog
>> ++++ b/ChangeLog
>> +@@ -1,3 +1,19 @@
>> ++2019-04-10  Nick Clifton  <nickc@redhat.com>
>> ++
>> ++	* libiberty: Sync with gcc.  Bring in:
>> ++	2019-04-10  Nick Clifton  <nickc@redhat.com>
>> ++
>> ++	PR 89394
>> ++	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
>> ++	lengths.
>> ++	(d_count_templates_scopes): Replace num_templates and
>> num_scopes
>> ++	parameters with a struct d_print_info pointer
>> parameter.  Adjust
>> ++	body of the function accordingly.  Add recursion counter and
>> check
>> ++	that the recursion limit is not reached.
>> ++	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
>> ++	Reset recursion counter afterwards, unless the recursion limit
>> was
>> ++	reached.
>> ++
>> + 2018-06-24  Nick Clifton  <nickc@redhat.com>
>> + 
>> + 	2.32 branch created.
>> +diff --git a/libiberty/cp-demangle.c b/libiberty/cp-demangle.c
>> +index b34b485692..779b4e763a 100644
>> +--- a/libiberty/cp-demangle.c
>> ++++ b/libiberty/cp-demangle.c
>> +@@ -861,7 +861,7 @@ CP_STATIC_IF_GLIBCPP_V3
>> + int
>> + cplus_demangle_fill_name (struct demangle_component *p, const char
>> *s, int len)
>> + {
>> +-  if (p == NULL || s == NULL || len == 0)
>> ++  if (p == NULL || s == NULL || len <= 0)
>> +     return 0;
>> +   p->d_printing = 0;
>> +   p->type = DEMANGLE_COMPONENT_NAME;
>> +@@ -4061,7 +4061,7 @@ d_growable_string_callback_adapter (const char
>> *s, size_t l, void *opaque)
>> +    are larger than the actual numbers encountered.  */
>> + 
>> + static void
>> +-d_count_templates_scopes (int *num_templates, int *num_scopes,
>> ++d_count_templates_scopes (struct d_print_info *dpi,
>> + 			  const struct demangle_component *dc)
>> + {
>> +   if (dc == NULL)
>> +@@ -4081,13 +4081,13 @@ d_count_templates_scopes (int
>> *num_templates, int *num_scopes,
>> +       break;
>> + 
>> +     case DEMANGLE_COMPONENT_TEMPLATE:
>> +-      (*num_templates)++;
>> ++      dpi->num_copy_templates++;
>> +       goto recurse_left_right;
>> + 
>> +     case DEMANGLE_COMPONENT_REFERENCE:
>> +     case DEMANGLE_COMPONENT_RVALUE_REFERENCE:
>> +       if (d_left (dc)->type == DEMANGLE_COMPONENT_TEMPLATE_PARAM)
>> +-	(*num_scopes)++;
>> ++	dpi->num_saved_scopes++;
>> +       goto recurse_left_right;
>> + 
>> +     case DEMANGLE_COMPONENT_QUAL_NAME:
>> +@@ -4152,42 +4152,42 @@ d_count_templates_scopes (int
>> *num_templates, int *num_scopes,
>> +     case DEMANGLE_COMPONENT_TAGGED_NAME:
>> +     case DEMANGLE_COMPONENT_CLONE:
>> +     recurse_left_right:
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-				d_left (dc));
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-				d_right (dc));
>> ++      /* PR 89394 - Check for too much recursion.  */
>> ++      if (dpi->recursion > DEMANGLE_RECURSION_LIMIT)
>> ++	/* FIXME: There ought to be a way to report to the
>> ++	   user that the recursion limit has been reached.  */
>> ++	return;
>> ++
>> ++      ++ dpi->recursion;
>> ++      d_count_templates_scopes (dpi, d_left (dc));
>> ++      d_count_templates_scopes (dpi, d_right (dc));
>> ++      -- dpi->recursion;
>> +       break;
>> + 
>> +     case DEMANGLE_COMPONENT_CTOR:
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-				dc->u.s_ctor.name);
>> ++      d_count_templates_scopes (dpi, dc->u.s_ctor.name);
>> +       break;
>> + 
>> +     case DEMANGLE_COMPONENT_DTOR:
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-				dc->u.s_dtor.name);
>> ++      d_count_templates_scopes (dpi, dc->u.s_dtor.name);
>> +       break;
>> + 
>> +     case DEMANGLE_COMPONENT_EXTENDED_OPERATOR:
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-				dc->u.s_extended_operator.name);
>> ++      d_count_templates_scopes (dpi, dc-
>>> u.s_extended_operator.name);
>> +       break;
>> + 
>> +     case DEMANGLE_COMPONENT_FIXED_TYPE:
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-                                dc->u.s_fixed.length);
>> ++      d_count_templates_scopes (dpi, dc->u.s_fixed.length);
>> +       break;
>> + 
>> +     case DEMANGLE_COMPONENT_GLOBAL_CONSTRUCTORS:
>> +     case DEMANGLE_COMPONENT_GLOBAL_DESTRUCTORS:
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-				d_left (dc));
>> ++      d_count_templates_scopes (dpi, d_left (dc));
>> +       break;
>> + 
>> +     case DEMANGLE_COMPONENT_LAMBDA:
>> +     case DEMANGLE_COMPONENT_DEFAULT_ARG:
>> +-      d_count_templates_scopes (num_templates, num_scopes,
>> +-				dc->u.s_unary_num.sub);
>> ++      d_count_templates_scopes (dpi, dc->u.s_unary_num.sub);
>> +       break;
>> +     }
>> + }
>> +@@ -4222,8 +4222,12 @@ d_print_init (struct d_print_info *dpi,
>> demangle_callbackref callback,
>> +   dpi->next_copy_template = 0;
>> +   dpi->num_copy_templates = 0;
>> + 
>> +-  d_count_templates_scopes (&dpi->num_copy_templates,
>> +-			    &dpi->num_saved_scopes, dc);
>> ++  d_count_templates_scopes (dpi, dc);
>> ++  /* If we did not reach the recursion limit, then reset the
>> ++     current recursion value back to 0, so that we can print
>> ++     the templates.  */
>> ++  if (dpi->recursion < DEMANGLE_RECURSION_LIMIT)
>> ++    dpi->recursion = 0;
>> +   dpi->num_copy_templates *= dpi->num_saved_scopes;
>> + 
>> +   dpi->current_template = NULL;
>> +-- 
>> +2.20.1
>> +
>> -- 
>> 2.7.4
>>


