Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 227AC7CFB6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 20:44:51 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 8so3489630pfr.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=90LkBrVJLT/1RLfsM7VMkg1tlqT2OgMt4DCuwV/8pHw=;
	b=WFtftof3xTFH6lnU1z++kadb3NW5gEPFY8dLGeTQZ2wHnkrSPNIdgd/WgarO2dSluO
	+h/MCXz9gcKp28H9kb6Fs/0F05jkBehFlHMoeXC/zCnF1jern12GZh5n02mgCJB4Gtiu
	NnDVirhJks/GEPg1a7vP8EaRLX2OPPje1M6NrIBvWyt8g6HCZfLBNxalmGVZiTdB0Qen
	OnKWv8vzbhCr2oxcBkbvWnz/8D+u2K/Rjmcyj6Tg2qHeileFLaHWXjgChCwn9w3v81O6
	D7EW9eQgAydFGwJMf7gwubxdOYijhrqokdLewvby5FMiFScFTtjJACg1BUNYBelEKZrG
	EaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=90LkBrVJLT/1RLfsM7VMkg1tlqT2OgMt4DCuwV/8pHw=;
	b=Y9euV/q3RzmWcWKl2cyPDXlEPCInR7dIK1AL0l+nLBnclvgsnyRfGYRLrPYf+kwUsZ
	Gg3vh1lEkR2skFnXFsE8Z92ihuMppz2cG1qzc0+gk8bYQOmnEDLlvc1IbLo0kHH25oJN
	hGAbPpe3tTGSyzPvXUBSyDBqeLPm1pNyOxDCfMjjLvGL6td9B5WeWUEbDNJPp9IzbNK5
	ZlJeIk9E6l5jUEMrFs0TmPKZ0jFBHgwaW6qO/cuTuM2y6xzaZ3A2tmNm5RWd1cQk2aop
	gHXWwZI4MP6zmDe4jhmDtRqgfplZmHrS+Nr5T7XCTFBmAL6VYQPxeIfISCgaWcxVEygt
	2dBQ==
X-Gm-Message-State: APjAAAVcylQyPIH44pNluyR4CsIVeN3Z8xXVAMTQusWoHUJPDhG0ZUIQ
	f7zHEPikKH2r2bmKUc0+TAzqqhtT
X-Google-Smtp-Source: APXvYqzjIoQa0lCr6JJiqNgqRwKY0IuwJGTHXifjUkqMHDoO5nzhWylaBnCUPl0Oo/5MgHNnhkPEYQ==
X-Received: by 2002:aa7:8282:: with SMTP id s2mr40993419pfm.7.1554065091892;
	Sun, 31 Mar 2019 13:44:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:6515:3c15:208f:c5eb?
	([2601:202:4180:c33:6515:3c15:208f:c5eb])
	by smtp.gmail.com with ESMTPSA id
	p3sm15387395pfn.167.2019.03.31.13.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 13:44:51 -0700 (PDT)
To: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>,
	openembedded-core@lists.openembedded.org
References: <20190314154330.1427-1-s.mueller-klieser@phytec.de>
	<760b9e00-9649-76ac-a93d-229d394de223@gmail.com>
	<b8f3c96a-6b22-f2c4-5b1c-e34c4dfb8fc7@phytec.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4573ad8b-be35-1e72-f44b-db969cf81f50@gmail.com>
Date: Sun, 31 Mar 2019 13:44:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <b8f3c96a-6b22-f2c4-5b1c-e34c4dfb8fc7@phytec.de>
Subject: Re: [sumo][PATCH] coreutils: 8.29: fix native build
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
X-List-Received-Date: Sun, 31 Mar 2019 20:44:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/29/19 1:44 AM, Stefan Müller-Klieser wrote:
> Hi Armin,
>
> On 19.03.19 16:13, akuster808 wrote:
>> On 3/14/19 8:43 AM, Stefan Müller-Klieser wrote:
>>> This fixes the native build on glibc 2.28 hosts, by backporting two
>>> gnulib patches from master.
patch in sumo proper
https://git.openembedded.org/openembedded-core/commit/?h=sumo&id=fe7c33cd470d7466be48391b11ea703746812014

thanks
Armin
>> This will need to be done for Thud too.
>> - armin
>
> coreutils 8.30 in thud already carries those patches.
> Stefan
>
>>>
>>> Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
>>> ---
>>>   ...adjust-to-glibc-2.28-libio.h-removal.patch | 193
>>> ++++++++++++++++++
>>>   ...e-more-paranoid-about-libio.h-change.patch | 187 +++++++++++++++++
>>>   meta/recipes-core/coreutils/coreutils_8.29.bb |   2 +
>>>   3 files changed, 382 insertions(+)
>>>   create mode 100644
>>> meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
>>>   create mode 100644
>>> meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-paranoid-about-libio.h-change.patch
>>>
>>> diff --git
>>> a/meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
>>> b/meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
>>>
>>> new file mode 100644
>>> index 000000000000..110b34372db1
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-core/coreutils/coreutils/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
>>> @@ -0,0 +1,193 @@
>>> +From 269a8987224ec62b7a9aa6202772b07d5be424d2 Mon Sep 17 00:00:00 2001
>>> +From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?=
>>> <s.mueller-klieser@phytec.de>
>>> +Date: Mon, 11 Mar 2019 16:00:33 +0100
>>> +Subject: [PATCH 1/2] fflush: adjust to glibc 2.28 libio.h removal
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Backport of patch:
>>> +4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
>>> +Paul Eggert <eggert@cs.ucla.edu>
>>> +fflush: adjust to glibc 2.28 libio.h removal
>>> +
>>> +Upstream-Status: Backport [master]
>>> +
>>> +Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
>>> +---
>>> + lib/fflush.c     | 6 +++---
>>> + lib/fpending.c   | 2 +-
>>> + lib/fpurge.c     | 2 +-
>>> + lib/freadahead.c | 2 +-
>>> + lib/freading.c   | 2 +-
>>> + lib/freadptr.c   | 2 +-
>>> + lib/freadseek.c  | 2 +-
>>> + lib/fseeko.c     | 4 ++--
>>> + lib/fseterr.c    | 2 +-
>>> + lib/stdio-impl.h | 6 ++++++
>>> + 10 files changed, 18 insertions(+), 12 deletions(-)
>>> +
>>> +diff --git a/lib/fflush.c b/lib/fflush.c
>>> +index 4e65692644b1..c16da5fdcf23 100644
>>> +--- a/lib/fflush.c
>>> ++++ b/lib/fflush.c
>>> +@@ -33,7 +33,7 @@
>>> + #undef fflush
>>> +
>>> +
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +
>>> + /* Clear the stream's ungetc buffer, preserving the value of
>>> ftello (fp).  */
>>> + static void
>>> +@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
>>> +
>>> + #endif
>>> +
>>> +-#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU
>>> libc, BeOS, Haiku, Linux libc5 */)
>>> ++#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */)
>>> +
>>> + # if (defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__) && defined __SNPT
>>> + /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3,
>>> Android */
>>> +@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
>>> +   if (stream == NULL || ! freading (stream))
>>> +     return fflush (stream);
>>> +
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +
>>> +   clear_ungetc_buffer_preserving_position (stream);
>>> +
>>> +diff --git a/lib/fpending.c b/lib/fpending.c
>>> +index 5811a4a74750..9e21a165e220 100644
>>> +--- a/lib/fpending.c
>>> ++++ b/lib/fpending.c
>>> +@@ -32,7 +32,7 @@ __fpending (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   return fp->_IO_write_ptr - fp->_IO_write_base;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix
>>> 3, Android */
>>> +diff --git a/lib/fpurge.c b/lib/fpurge.c
>>> +index 408b8fcbb3b8..3a160004d49d 100644
>>> +--- a/lib/fpurge.c
>>> ++++ b/lib/fpurge.c
>>> +@@ -62,7 +62,7 @@ fpurge (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   fp->_IO_read_end = fp->_IO_read_ptr;
>>> +   fp->_IO_write_ptr = fp->_IO_write_base;
>>> +   /* Avoid memory leak when there is an active ungetc buffer.  */
>>> +diff --git a/lib/freadahead.c b/lib/freadahead.c
>>> +index f335f041ee5e..e7cb77b6722b 100644
>>> +--- a/lib/freadahead.c
>>> ++++ b/lib/freadahead.c
>>> +@@ -30,7 +30,7 @@ extern size_t __sreadahead (FILE *);
>>> + size_t
>>> + freadahead (FILE *fp)
>>> + {
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   if (fp->_IO_write_ptr > fp->_IO_write_base)
>>> +     return 0;
>>> +   return (fp->_IO_read_end - fp->_IO_read_ptr)
>>> +diff --git a/lib/freading.c b/lib/freading.c
>>> +index 78140d27bfef..c9d33449e948 100644
>>> +--- a/lib/freading.c
>>> ++++ b/lib/freading.c
>>> +@@ -31,7 +31,7 @@ freading (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   return ((fp->_flags & _IO_NO_WRITES) != 0
>>> +           || ((fp->_flags & (_IO_NO_READS |
>>> _IO_CURRENTLY_PUTTING)) == 0
>>> +               && fp->_IO_read_base != NULL));
>>> +diff --git a/lib/freadptr.c b/lib/freadptr.c
>>> +index e4cc0b02fba2..aba8dd5964fc 100644
>>> +--- a/lib/freadptr.c
>>> ++++ b/lib/freadptr.c
>>> +@@ -29,7 +29,7 @@ freadptr (FILE *fp, size_t *sizep)
>>> +   size_t size;
>>> +
>>> +   /* Keep this code in sync with freadahead!  */
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   if (fp->_IO_write_ptr > fp->_IO_write_base)
>>> +     return NULL;
>>> +   size = fp->_IO_read_end - fp->_IO_read_ptr;
>>> +diff --git a/lib/freadseek.c b/lib/freadseek.c
>>> +index fcecba6829c5..98726f845f88 100644
>>> +--- a/lib/freadseek.c
>>> ++++ b/lib/freadseek.c
>>> +@@ -36,7 +36,7 @@ freadptrinc (FILE *fp, size_t increment)
>>> +   /* Keep this code in sync with freadptr!  */
>>> + #if HAVE___FREADPTRINC              /* musl libc */
>>> +   __freadptrinc (fp, increment);
>>> +-#elif defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU
>>> libc, BeOS, Haiku, Linux libc5 */
>>> ++#elif defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   fp->_IO_read_ptr += increment;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix
>>> 3, Android */
>>> +diff --git a/lib/fseeko.c b/lib/fseeko.c
>>> +index d0f24d8a838f..0ae2b153cff5 100644
>>> +--- a/lib/fseeko.c
>>> ++++ b/lib/fseeko.c
>>> +@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int whence)
>>> + #endif
>>> +
>>> +   /* These tests are based on fpurge.c.  */
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   if (fp->_IO_read_end == fp->_IO_read_ptr
>>> +       && fp->_IO_write_ptr == fp->_IO_write_base
>>> +       && fp->_IO_save_base == NULL)
>>> +@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int whence)
>>> +           return -1;
>>> +         }
>>> +
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +       fp->_flags &= ~_IO_EOF_SEEN;
>>> +       fp->_offset = pos;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +diff --git a/lib/fseterr.c b/lib/fseterr.c
>>> +index 739e5453d04e..d998619771f3 100644
>>> +--- a/lib/fseterr.c
>>> ++++ b/lib/fseterr.c
>>> +@@ -29,7 +29,7 @@ fseterr (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> +   fp->_flags |= _IO_ERR_SEEN;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix
>>> 3, Android */
>>> +diff --git a/lib/stdio-impl.h b/lib/stdio-impl.h
>>> +index 329801ad23b0..eeaabab66b2f 100644
>>> +--- a/lib/stdio-impl.h
>>> ++++ b/lib/stdio-impl.h
>>> +@@ -18,6 +18,12 @@
>>> +    the same implementation of stdio extension API, except that
>>> some fields
>>> +    have different naming conventions, or their access requires
>>> some casts.  */
>>> +
>>> ++/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
>>> ++   problem by defining it ourselves.  FIXME: Do not rely on glibc
>>> ++   internals.  */
>>> ++#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
>>> ++# define _IO_IN_BACKUP 0x100
>>> ++#endif
>>> +
>>> + /* BSD stdio derived implementations.  */
>>> +
>>> +--
>>> +2.20.1
>>> +
>>> diff --git
>>> a/meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-paranoid-about-libio.h-change.patch
>>> b/meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-paranoid-about-libio.h-change.patch
>>>
>>> new file mode 100644
>>> index 000000000000..8cc7d6377947
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-core/coreutils/coreutils/0002-fflush-be-more-paranoid-about-libio.h-change.patch
>>> @@ -0,0 +1,187 @@
>>> +From 72a2dae68c9101d80abdce8c4e41f7e562bd2399 Mon Sep 17 00:00:00 2001
>>> +From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?=
>>> <s.mueller-klieser@phytec.de>
>>> +Date: Wed, 13 Mar 2019 14:09:39 +0100
>>> +Subject: [PATCH 2/2] fflush: be more paranoid about libio.h change
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Backport of patch:
>>> +74d9d6a293d7462dea8f83e7fc5ac792e956a0ad
>>> +Paul Eggert <eggert@cs.ucla.edu>
>>> +fflush: be more paranoid about libio.h change
>>> +
>>> +Upstream-Status: Backport [master]
>>> +
>>> +Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
>>> +---
>>> + lib/fflush.c     | 9 ++++++---
>>> + lib/fpending.c   | 3 ++-
>>> + lib/fpurge.c     | 3 ++-
>>> + lib/freadahead.c | 3 ++-
>>> + lib/freading.c   | 3 ++-
>>> + lib/freadptr.c   | 3 ++-
>>> + lib/freadseek.c  | 3 ++-
>>> + lib/fseeko.c     | 6 ++++--
>>> + lib/fseterr.c    | 3 ++-
>>> + 9 files changed, 24 insertions(+), 12 deletions(-)
>>> +
>>> +diff --git a/lib/fflush.c b/lib/fflush.c
>>> +index c16da5fdcf23..b69206296e9a 100644
>>> +--- a/lib/fflush.c
>>> ++++ b/lib/fflush.c
>>> +@@ -33,7 +33,8 @@
>>> + #undef fflush
>>> +
>>> +
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++/* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +
>>> + /* Clear the stream's ungetc buffer, preserving the value of
>>> ftello (fp).  */
>>> + static void
>>> +@@ -72,7 +73,8 @@ clear_ungetc_buffer (FILE *fp)
>>> +
>>> + #endif
>>> +
>>> +-#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */)
>>> ++#if ! (defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1)
>>> ++/* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +
>>> + # if (defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__) && defined __SNPT
>>> + /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3,
>>> Android */
>>> +@@ -148,7 +150,8 @@ rpl_fflush (FILE *stream)
>>> +   if (stream == NULL || ! freading (stream))
>>> +     return fflush (stream);
>>> +
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +
>>> +   clear_ungetc_buffer_preserving_position (stream);
>>> +
>>> +diff --git a/lib/fpending.c b/lib/fpending.c
>>> +index 9e21a165e220..0c3b931dba9a 100644
>>> +--- a/lib/fpending.c
>>> ++++ b/lib/fpending.c
>>> +@@ -32,7 +32,8 @@ __fpending (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   return fp->_IO_write_ptr - fp->_IO_write_base;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix
>>> 3, Android */
>>> +diff --git a/lib/fpurge.c b/lib/fpurge.c
>>> +index 3a160004d49d..4558ab9a0783 100644
>>> +--- a/lib/fpurge.c
>>> ++++ b/lib/fpurge.c
>>> +@@ -62,7 +62,8 @@ fpurge (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++# if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   fp->_IO_read_end = fp->_IO_read_ptr;
>>> +   fp->_IO_write_ptr = fp->_IO_write_base;
>>> +   /* Avoid memory leak when there is an active ungetc buffer.  */
>>> +diff --git a/lib/freadahead.c b/lib/freadahead.c
>>> +index e7cb77b6722b..496686042d1e 100644
>>> +--- a/lib/freadahead.c
>>> ++++ b/lib/freadahead.c
>>> +@@ -30,7 +30,8 @@ extern size_t __sreadahead (FILE *);
>>> + size_t
>>> + freadahead (FILE *fp)
>>> + {
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   if (fp->_IO_write_ptr > fp->_IO_write_base)
>>> +     return 0;
>>> +   return (fp->_IO_read_end - fp->_IO_read_ptr)
>>> +diff --git a/lib/freading.c b/lib/freading.c
>>> +index c9d33449e948..5e66df1dc7dd 100644
>>> +--- a/lib/freading.c
>>> ++++ b/lib/freading.c
>>> +@@ -31,7 +31,8 @@ freading (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++# if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   return ((fp->_flags & _IO_NO_WRITES) != 0
>>> +           || ((fp->_flags & (_IO_NO_READS |
>>> _IO_CURRENTLY_PUTTING)) == 0
>>> +               && fp->_IO_read_base != NULL));
>>> +diff --git a/lib/freadptr.c b/lib/freadptr.c
>>> +index aba8dd5964fc..e82b41e3f4d9 100644
>>> +--- a/lib/freadptr.c
>>> ++++ b/lib/freadptr.c
>>> +@@ -29,7 +29,8 @@ freadptr (FILE *fp, size_t *sizep)
>>> +   size_t size;
>>> +
>>> +   /* Keep this code in sync with freadahead!  */
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   if (fp->_IO_write_ptr > fp->_IO_write_base)
>>> +     return NULL;
>>> +   size = fp->_IO_read_end - fp->_IO_read_ptr;
>>> +diff --git a/lib/freadseek.c b/lib/freadseek.c
>>> +index 98726f845f88..f547bfd4257b 100644
>>> +--- a/lib/freadseek.c
>>> ++++ b/lib/freadseek.c
>>> +@@ -36,7 +36,8 @@ freadptrinc (FILE *fp, size_t increment)
>>> +   /* Keep this code in sync with freadptr!  */
>>> + #if HAVE___FREADPTRINC              /* musl libc */
>>> +   __freadptrinc (fp, increment);
>>> +-#elif defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#elif defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   fp->_IO_read_ptr += increment;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix
>>> 3, Android */
>>> +diff --git a/lib/fseeko.c b/lib/fseeko.c
>>> +index 0ae2b153cff5..ee8efa49ac34 100644
>>> +--- a/lib/fseeko.c
>>> ++++ b/lib/fseeko.c
>>> +@@ -47,7 +47,8 @@ fseeko (FILE *fp, off_t offset, int whence)
>>> + #endif
>>> +
>>> +   /* These tests are based on fpurge.c.  */
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   if (fp->_IO_read_end == fp->_IO_read_ptr
>>> +       && fp->_IO_write_ptr == fp->_IO_write_base
>>> +       && fp->_IO_save_base == NULL)
>>> +@@ -123,7 +124,8 @@ fseeko (FILE *fp, off_t offset, int whence)
>>> +           return -1;
>>> +         }
>>> +
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++      /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +       fp->_flags &= ~_IO_EOF_SEEN;
>>> +       fp->_offset = pos;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +diff --git a/lib/fseterr.c b/lib/fseterr.c
>>> +index d998619771f3..23f4e3593800 100644
>>> +--- a/lib/fseterr.c
>>> ++++ b/lib/fseterr.c
>>> +@@ -29,7 +29,8 @@ fseterr (FILE *fp)
>>> +   /* Most systems provide FILE as a struct and the necessary
>>> bitmask in
>>> +      <stdio.h>, because they need it for implementing getc() and
>>> putc() as
>>> +      fast macros.  */
>>> +-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc,
>>> BeOS, Haiku, Linux libc5 */
>>> ++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile ||
>>> __GNU_LIBRARY__ == 1
>>> ++  /* GNU libc, BeOS, Haiku, Linux libc5 */
>>> +   fp->_flags |= _IO_ERR_SEEN;
>>> + #elif defined __sferror || defined __DragonFly__ || defined
>>> __ANDROID__
>>> +   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix
>>> 3, Android */
>>> +--
>>> +2.20.1
>>> +
>>> diff --git a/meta/recipes-core/coreutils/coreutils_8.29.bb
>>> b/meta/recipes-core/coreutils/coreutils_8.29.bb
>>> index b0572afdc001..3c72bdd75023 100644
>>> --- a/meta/recipes-core/coreutils/coreutils_8.29.bb
>>> +++ b/meta/recipes-core/coreutils/coreutils_8.29.bb
>>> @@ -21,6 +21,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>>>              file://0001-local.mk-fix-cross-compiling-problem.patch \
>>>              file://CVE-2017-18018-1.patch \
>>>              file://CVE-2017-18018-2.patch \
>>> +          
>>> file://0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch \
>>> +          
>>> file://0002-fflush-be-more-paranoid-about-libio.h-change.patch \
>>>             "
>>>     SRC_URI[md5sum] = "960cfe75a42c9907c71439f8eb436303"
>>
>


