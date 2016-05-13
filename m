Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 83AB765CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:14:16 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id zy2so10421378pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=EBYQ4I7mMHl6XEbiaHFc23sLeR65cABjTp7x/TzcU5k=;
	b=sypMBier6deaaHRn2HkPVM/fYGbZeJuJOJNG1vdwlCRIJ1PzFnh0eugXS9/7p8Ek/S
	RPZ4zi3TfyGUTVwYaDGT/YhxNDP8n/KjWgtv9Aeoh9MM8XlgM1Pf9ghDjNZox0MQe3T2
	w89bNwBNMUBNdPOd8TQnXe1vq8LBLyDvlRKV8ns5FEdEU4Huc5p21wDJRXiSNoJ8PZsP
	fy2xerUhCPsqGtZGzpNF2ZuqrzZ+gzJcvAmuFxNtGzmKOaIWJp76TDRwAc3FUEpbVcJZ
	aKI4NPbGAJSumS5xZV4S248oyyXjyXakY3u9bkiVfnnU6i/hPL2R2FliXhmC0cgicMWz
	i16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=EBYQ4I7mMHl6XEbiaHFc23sLeR65cABjTp7x/TzcU5k=;
	b=Zl9m8q+Ow4eP97o3nEdDas4J16CRp1Tfr1ZkP/JHjXjxFJy3XC4bJAmUW+oFvkOAJg
	AANEp7ldvouYcDIMed8yiykkUvFKi/4CZasTIhWXHjeCJG2VO5N6390q77QEH5M4kFik
	eiOo3+8CPqDHqpxWM4RzY/n11JBE/XmUehBDW8fNGCzH60rjaYT3ERpptkG+IVkvp/GU
	Aovjl/RtKOR4km2m5mgDBlxMA4S1wrUcQ67EoFAjVMDZ/9Xmgi9tQj9sXZN7U4qYy3Dh
	BbQ63FFw28LvEz7eQkWwTqaImXAIVdw5QBpb3kPFbzKO0tBnos1bhGwgfOdHX4J1XVqa
	1Ztg==
X-Gm-Message-State: AOPr4FWHVzqNiIC89SWGShMSBq/sZhGfOM7tujdktnwQ1TekNBTd2TpzRGPhrxpCqlGniw==
X-Received: by 10.66.194.230 with SMTP id hz6mr24428542pac.132.1463156056983; 
	Fri, 13 May 2016 09:14:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:c53a:7e08:2482:8461?
	([2601:202:4000:1239:c53a:7e08:2482:8461])
	by smtp.googlemail.com with ESMTPSA id
	to9sm28540699pab.27.2016.05.13.09.14.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 09:14:15 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
	<1462518717-2629-3-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5735FD56.9080301@gmail.com>
Date: Fri, 13 May 2016 09:14:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1462518717-2629-3-git-send-email-akuster808@gmail.com>
Subject: Re: [master][krogoth][PATCH 3/4] gcc: Security fix CVE-2016-2226
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
X-List-Received-Date: Fri, 13 May 2016 16:14:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this fix is in GCC 6.0


On 05/06/2016 12:11 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
>  .../gcc/gcc-5.3/CVE-2016-2226.patch                | 103 +++++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
> index 692758d..5fede2a 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -90,6 +90,7 @@ SRC_URI = "\
>             file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
>             file://CVE-2016-4488.patch \
>             file://CVE-2016-4489.patch \
> +           file://CVE-2016-2226.patch \
>  "
>  
>  BACKPORTS = ""
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
> new file mode 100644
> index 0000000..4decb84
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
> @@ -0,0 +1,103 @@
> +From b8106f544a7fd485b6959ebd197bdd99a8884416 Mon Sep 17 00:00:00 2001
> +From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 8 Apr 2016 12:10:21 +0000
> +Subject: [PATCH] =?UTF-8?q?Fix=20memory=20allocation=20size=20overflows=20?=
> + =?UTF-8?q?(PR69687,=20patch=20by=20Marcel=20B=C3=B6hme)?=
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +	PR c++/69687
> +	* cplus-dem.c: Include <limits.h> if available.
> +	(INT_MAX): Define if necessary.
> +	(remember_type, remember_Ktype, register_Btype, string_need):
> +	Abort if we detect cases where we the size of the allocation would
> +	overflow.
> +
> +
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@234829 138bc75d-0d04-0410-961f-82ee72b054a4
> +Upstream-Status: Backport
> +CVE: CVE-2016-2226
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + libiberty/ChangeLog   |  7 +++++++
> + libiberty/cplus-dem.c | 15 +++++++++++++++
> + 2 files changed, 22 insertions(+)
> +
> +diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
> +index 8e82a5f..2a34356 100644
> +--- a/libiberty/ChangeLog
> ++++ b/libiberty/ChangeLog
> +@@ -1,5 +1,12 @@
> + 2016-04-08  Marcel Böhme  <boehme.marcel@gmail.com>
> + 
> ++	PR c++/69687
> ++	* cplus-dem.c: Include <limits.h> if available.
> ++	(INT_MAX): Define if necessary.
> ++	(remember_type, remember_Ktype, register_Btype, string_need):
> ++	Abort if we detect cases where we the size of the allocation would
> ++	overflow.
> ++
> + 	PR c++/70498
> + 	* cplus-dem.c (gnu_special): Handle case where consume_count returns
> + 	-1.
> +diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
> +index abba234..7514e57 100644
> +--- a/libiberty/cplus-dem.c
> ++++ b/libiberty/cplus-dem.c
> +@@ -56,6 +56,13 @@ void * malloc ();
> + void * realloc ();
> + #endif
> + 
> ++#ifdef HAVE_LIMITS_H
> ++#include <limits.h>
> ++#endif
> ++#ifndef INT_MAX
> ++# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */ 
> ++#endif
> ++
> + #include <demangle.h>
> + #undef CURRENT_DEMANGLING_STYLE
> + #define CURRENT_DEMANGLING_STYLE work->options
> +@@ -4261,6 +4268,8 @@ remember_type (struct work_stuff *work, const char *start, int len)
> + 	}
> +       else
> + 	{
> ++          if (work -> typevec_size > INT_MAX / 2)
> ++	    xmalloc_failed (INT_MAX);
> + 	  work -> typevec_size *= 2;
> + 	  work -> typevec
> + 	    = XRESIZEVEC (char *, work->typevec, work->typevec_size);
> +@@ -4288,6 +4297,8 @@ remember_Ktype (struct work_stuff *work, const char *start, int len)
> + 	}
> +       else
> + 	{
> ++          if (work -> ksize > INT_MAX / 2)
> ++	    xmalloc_failed (INT_MAX);
> + 	  work -> ksize *= 2;
> + 	  work -> ktypevec
> + 	    = XRESIZEVEC (char *, work->ktypevec, work->ksize);
> +@@ -4317,6 +4328,8 @@ register_Btype (struct work_stuff *work)
> + 	}
> +       else
> + 	{
> ++          if (work -> bsize > INT_MAX / 2)
> ++	    xmalloc_failed (INT_MAX);
> + 	  work -> bsize *= 2;
> + 	  work -> btypevec
> + 	    = XRESIZEVEC (char *, work->btypevec, work->bsize);
> +@@ -4771,6 +4784,8 @@ string_need (string *s, int n)
> +   else if (s->e - s->p < n)
> +     {
> +       tem = s->p - s->b;
> ++      if (n > INT_MAX / 2 - tem)
> ++        xmalloc_failed (INT_MAX); 
> +       n += tem;
> +       n *= 2;
> +       s->b = XRESIZEVEC (char, s->b, n);
> +-- 
> +2.3.5
> +
> 

