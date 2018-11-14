Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 33DEA6C17C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 16:05:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q1so142408pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Cm1SNQcSNSNXiRh3mgz3aM/CZBfcgut7rZI9/9TsQSs=;
	b=HipJcSr4V/UPIvC89SpGmm8cFTpmwldzpN6LyCTIjN+4pN86rM7eQwMl7h1Aav67bL
	rvvCPg1+hNAA3qYtAfQsKzQrce5uj5hF6qeU5kNsb6pSqP1ZqK+jNVfo3OjeH43G9EJN
	sIj2Ao5mwB4NpeNFiXeawvWB6ZpsS0goKHGxgJ4ZYS1ViJyVoYn0WQKAJEz06+zIf0Bn
	iVuKsI6SdhX+ZIzNhHgIpOE8GmBwh3T9rFZArWARaBoVkFQThV0YogtOKg1rUlQT/I4i
	hlWwgv17QhhlFDa+5emZz6hk/FFTuKq1KHDDzNZCIMXvbQ/6uOVJsAMPgpx1WgXXaSIS
	wR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Cm1SNQcSNSNXiRh3mgz3aM/CZBfcgut7rZI9/9TsQSs=;
	b=XkUl/6cgSuEHsgwjisXPFmMS7p/c+VvRIx/EL13XactgaAwCLN1c/T3Va5xJVCFaiC
	7siynBWZwbKWGeGxOB0EPWeDqWHl+yfsMvRBySSjrmTsjY/iLReazhB/n13fzNT3wysA
	ZAtDq4TFBAeb3U9iN4uXNC0Z/MCwwyRoaB5c9XGRj7uI9bbalBwGRZH/9ww3BgdUcdkq
	H7O/5LaCuuRk2v5tRvOoRiec+QhDDF+7BwUrmIkMSpuweRk6wYWR3l38S09jOgU2RNXx
	EkOC5yz623mxGI18P9LCHIoCJNSTlXN1FBlMWXKjxLgUK8T5Uet/QB5EQghaOy+BaU0H
	6jPg==
X-Gm-Message-State: AGRZ1gKh2cUWYqidg87lAfAarjyvo9wFsm9KTUpfKk3DwVAwGxp+LnbV
	l7XAHN24SLu6qXUJIIc0WZljPatu
X-Google-Smtp-Source: AJdET5dsN5MK3J+hxc1f7S3zKXuH5Med+ALWqwSIc73D9Vah4uOhcErztQJNVhF619oiNI7yEkD/gA==
X-Received: by 2002:a65:6645:: with SMTP id z5mr2284687pgv.351.1542211553667; 
	Wed, 14 Nov 2018 08:05:53 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7db3:34a2:3c95:1c57?
	([2601:202:4180:c33:7db3:34a2:3c95:1c57])
	by smtp.gmail.com with ESMTPSA id
	d80sm32131988pfm.146.2018.11.14.08.05.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Nov 2018 08:05:52 -0800 (PST)
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20181114135457.11182-1-raphael.kubo.da.costa@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <69d8a6ab-435f-5dfc-3e66-ea053d82d51b@gmail.com>
Date: Wed, 14 Nov 2018 08:05:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181114135457.11182-1-raphael.kubo.da.costa@intel.com>
Subject: Re: [sumo][PATCH] m4: Workaround gnulib's fseeko.c implementation
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
X-List-Received-Date: Wed, 14 Nov 2018 16:05:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/14/18 5:54 AM, Raphael Kubo da Costa wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> exposed by glibc 2.28 for details see
> https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
>
> (From OE-Core rev: acca7f964bf9c21f3777085563a7928b8246f17f)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>

This is siting in my stable/sumo-next

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stable/sumo-next&id=1be0ec882784fcf704f6c58264111c563c7e425e

> ---
>  meta/recipes-devtools/m4/m4-1.4.18.inc        |   1 +
>  .../m4-1.4.18-glibc-change-work-around.patch  | 129 ++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
>
> diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
> index ee8bee446b..a6cef6f328 100644
> --- a/meta/recipes-devtools/m4/m4-1.4.18.inc
> +++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
> @@ -9,6 +9,7 @@ inherit autotools texinfo
>  SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
>             file://ac_config_links.patch \
>             file://remove-gets.patch \
> +           file://m4-1.4.18-glibc-change-work-around.patch \
>             "
>  
>  SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
> diff --git a/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch b/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
> new file mode 100644
> index 0000000000..72e7ae2080
> --- /dev/null
> +++ b/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
> @@ -0,0 +1,129 @@
> +update for glibc libio.h removal in 2.28+
> +
> +see
> +https://src.fedoraproject.org/rpms/m4/c/814d592134fad36df757f9a61422d164ea2c6c9b?branch=master
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Index: m4-1.4.18/lib/fflush.c
> +===================================================================
> +--- m4-1.4.18.orig/lib/fflush.c
> ++++ m4-1.4.18/lib/fflush.c
> +@@ -33,7 +33,7 @@
> + #undef fflush
> + 
> + 
> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> + 
> + /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
> + static void
> +@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
> + 
> + #endif
> + 
> +-#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
> ++#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
> + 
> + # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
> + /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
> +@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
> +   if (stream == NULL || ! freading (stream))
> +     return fflush (stream);
> + 
> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> + 
> +   clear_ungetc_buffer_preserving_position (stream);
> + 
> +Index: m4-1.4.18/lib/fpending.c
> +===================================================================
> +--- m4-1.4.18.orig/lib/fpending.c
> ++++ m4-1.4.18/lib/fpending.c
> +@@ -32,7 +32,7 @@ __fpending (FILE *fp)
> +   /* Most systems provide FILE as a struct and the necessary bitmask in
> +      <stdio.h>, because they need it for implementing getc() and putc() as
> +      fast macros.  */
> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> +   return fp->_IO_write_ptr - fp->_IO_write_base;
> + #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
> +Index: m4-1.4.18/lib/fpurge.c
> +===================================================================
> +--- m4-1.4.18.orig/lib/fpurge.c
> ++++ m4-1.4.18/lib/fpurge.c
> +@@ -62,7 +62,7 @@ fpurge (FILE *fp)
> +   /* Most systems provide FILE as a struct and the necessary bitmask in
> +      <stdio.h>, because they need it for implementing getc() and putc() as
> +      fast macros.  */
> +-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> +   fp->_IO_read_end = fp->_IO_read_ptr;
> +   fp->_IO_write_ptr = fp->_IO_write_base;
> +   /* Avoid memory leak when there is an active ungetc buffer.  */
> +Index: m4-1.4.18/lib/freadahead.c
> +===================================================================
> +--- m4-1.4.18.orig/lib/freadahead.c
> ++++ m4-1.4.18/lib/freadahead.c
> +@@ -25,7 +25,7 @@
> + size_t
> + freadahead (FILE *fp)
> + {
> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> +   if (fp->_IO_write_ptr > fp->_IO_write_base)
> +     return 0;
> +   return (fp->_IO_read_end - fp->_IO_read_ptr)
> +Index: m4-1.4.18/lib/freading.c
> +===================================================================
> +--- m4-1.4.18.orig/lib/freading.c
> ++++ m4-1.4.18/lib/freading.c
> +@@ -31,7 +31,7 @@ freading (FILE *fp)
> +   /* Most systems provide FILE as a struct and the necessary bitmask in
> +      <stdio.h>, because they need it for implementing getc() and putc() as
> +      fast macros.  */
> +-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> +   return ((fp->_flags & _IO_NO_WRITES) != 0
> +           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
> +               && fp->_IO_read_base != NULL));
> +Index: m4-1.4.18/lib/fseeko.c
> +===================================================================
> +--- m4-1.4.18.orig/lib/fseeko.c
> ++++ m4-1.4.18/lib/fseeko.c
> +@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int when
> + #endif
> + 
> +   /* These tests are based on fpurge.c.  */
> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> +   if (fp->_IO_read_end == fp->_IO_read_ptr
> +       && fp->_IO_write_ptr == fp->_IO_write_base
> +       && fp->_IO_save_base == NULL)
> +@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int when
> +           return -1;
> +         }
> + 
> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
> +       fp->_flags &= ~_IO_EOF_SEEN;
> +       fp->_offset = pos;
> + #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
> +Index: m4-1.4.18/lib/stdio-impl.h
> +===================================================================
> +--- m4-1.4.18.orig/lib/stdio-impl.h
> ++++ m4-1.4.18/lib/stdio-impl.h
> +@@ -18,6 +18,12 @@
> +    the same implementation of stdio extension API, except that some fields
> +    have different naming conventions, or their access requires some casts.  */
> + 
> ++/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
> ++   problem by defining it ourselves.  FIXME: Do not rely on glibc
> ++   internals.  */
> ++#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
> ++# define _IO_IN_BACKUP 0x100
> ++#endif
> + 
> + /* BSD stdio derived implementations.  */
> + 

