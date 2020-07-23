Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.2025.1595462719301799846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 17:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Xi2uVjgt;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.216.41, mailfrom: akuster@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id md7so2202214pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 17:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=QxGJ06PqNi/NSZ95YT43iqC3FiWi0EEbGT4lObujhdk=;
        b=Xi2uVjgtQPGsluc7rfJ1ATj92fJ0Ku7A/mPJKUWfr6ApFmqHUdizkoZn3o0DYn9K6E
         9k+8lp6QD/hgG/l400ey85Q7v/CbjgbG+h2tZjIbLJK45egzOFyPgDtU0eB/Xe5jWuRL
         4Qsf6zyFD/FCsEjjI5hwcQ/AQacLlSoYForS0cieBZE1OMdMomXN922Dz/txOOruDc3r
         HnbcB51OeTofUXIaAfOx+9odTkBZ42d9xuf0sdz8bLi9EPsjK+NFfiRfeozUgxDg8uCS
         O9T4E4Kaou2udWilAt30R4pgvRnZuSvhEcLnZN6hk9dNWDMoI1U2cmQBjSYkY2NCH2Xs
         MKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=QxGJ06PqNi/NSZ95YT43iqC3FiWi0EEbGT4lObujhdk=;
        b=OS0n4YLO3N+gWN+Dxg78YtCE0GNOlvMN/towteQ+YMGHB2p2NriM5qTy5oCp2Qnzou
         c6kjT3KBclgrrR2P67GLTJR/DpWCHXsZju1ytPs66PkUJS8eJmm62NZSWUilgtDUkNUx
         uY7GPBwqJKuP3jOgkMqLrZbfs0ZIjuxyO6mS7/gu5/NjPm49hvYc+5XzI/ishFZdmyV6
         C7HBWOJHq96LSPf5RPI7ZGjAiT9VS8gvS73OFEnSoZwbOu4cVcBjf+mrgxNA6+H/S5nZ
         nQMlQ4ZbUbjUqh7pvCwcxA5XPqGh7yMt4UL5F6QNDuz23huLSM5Lr0L59ola8VUNRued
         CSMA==
X-Gm-Message-State: AOAM531AwkfYdzoq4ydqQh00LBaqdOWR+6ymj/RtqiPwc+JVg0b/lEn7
	001JPfIeBy7rPVVdieun/rifgA==
X-Google-Smtp-Source: ABdhPJw1xZu4kctCKw9oJ27oYxqBhHcG+Ei73afFa5d5CGbbzi6UPJHt4cul4sbKO8jWgT2eu6aUgg==
X-Received: by 2002:a17:90a:7e3:: with SMTP id m90mr1534787pjm.133.1595462718774;
        Wed, 22 Jul 2020 17:05:18 -0700 (PDT)
Return-Path: <akuster@mvista.com>
Received: from ?IPv6:2601:202:4180:a5c0:8cb2:3623:b62d:3cc1? ([2601:202:4180:a5c0:8cb2:3623:b62d:3cc1])
        by smtp.gmail.com with ESMTPSA id n63sm751575pfd.209.2020.07.22.17.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 17:05:17 -0700 (PDT)
Subject: Re: [OE-core] [master][dunfell][PATCH] glibc: Secruity fix for CVE-2020-6096
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
References: <1623945384257296.5706@lists.openembedded.org>
From: "Armin Kuster" <akuster@mvista.com>
Autocrypt: addr=akuster@mvista.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <881bd5bf-82dd-4651-f5fe-e869bdfc1a85@mvista.com>
Date: Wed, 22 Jul 2020 17:05:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1623945384257296.5706@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------3A15D44544E2DF7E0BA9C04B"
Content-Language: en-US

--------------3A15D44544E2DF7E0BA9C04B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 7/20/20 2:49 PM, akuster via lists.openembedded.org wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Source: glibc.org
> MR: 104799
> Type: Security Fix
> Disposition: Backport from  beea361050728138b82c57dda0c4810402d342b9
> ChangeID: 29df826fb697fdd2742c3bace33388bda962c5f1
> Description:

Any issues with this?

-armin
>
> Signed-off-by: Armin Kuster <akuster@gmvista.com>
> ---
>  .../glibc/glibc/CVE-2020-6096.patch           | 112 ++++++++++
>  .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.31.bb         |   2 +
>  3 files changed, 308 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
> new file mode 100644
> index 00000000000..9c26f76432d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
> @@ -0,0 +1,112 @@
> +From beea361050728138b82c57dda0c4810402d342b9 Mon Sep 17 00:00:00 2001
> +From: Alexander Anisimov <a.anisimov@omprussia.ru>
> +Date: Wed, 8 Jul 2020 14:18:31 +0200
> +Subject: [PATCH] arm: CVE-2020-6096: Fix multiarch memcpy for negative length
> + [BZ #25620]
> +
> +Unsigned branch instructions could be used for r2 to fix the wrong
> +behavior when a negative length is passed to memcpy.
> +This commit fixes the armv7 version.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-6096 patch #1
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + sysdeps/arm/armv7/multiarch/memcpy_impl.S | 22 +++++++++++-----------
> + 1 file changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/sysdeps/arm/armv7/multiarch/memcpy_impl.S b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
> +index bf4ac7077f..379bb56fc9 100644
> +--- a/sysdeps/arm/armv7/multiarch/memcpy_impl.S
> ++++ b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
> +@@ -268,7 +268,7 @@ ENTRY(memcpy)
> + 
> + 	mov	dst, dstin	/* Preserve dstin, we need to return it.  */
> + 	cmp	count, #64
> +-	bge	.Lcpy_not_short
> ++	bhs	.Lcpy_not_short
> + 	/* Deal with small copies quickly by dropping straight into the
> + 	   exit block.  */
> + 
> +@@ -351,10 +351,10 @@ ENTRY(memcpy)
> + 
> + 1:
> + 	subs	tmp2, count, #64	/* Use tmp2 for count.  */
> +-	blt	.Ltail63aligned
> ++	blo	.Ltail63aligned
> + 
> + 	cmp	tmp2, #512
> +-	bge	.Lcpy_body_long
> ++	bhs	.Lcpy_body_long
> + 
> + .Lcpy_body_medium:			/* Count in tmp2.  */
> + #ifdef USE_VFP
> +@@ -378,7 +378,7 @@ ENTRY(memcpy)
> + 	add	src, src, #64
> + 	vstr	d1, [dst, #56]
> + 	add	dst, dst, #64
> +-	bge	1b
> ++	bhs	1b
> + 	tst	tmp2, #0x3f
> + 	beq	.Ldone
> + 
> +@@ -412,7 +412,7 @@ ENTRY(memcpy)
> + 	ldrd	A_l, A_h, [src, #64]!
> + 	strd	A_l, A_h, [dst, #64]!
> + 	subs	tmp2, tmp2, #64
> +-	bge	1b
> ++	bhs	1b
> + 	tst	tmp2, #0x3f
> + 	bne	1f
> + 	ldr	tmp2,[sp], #FRAME_SIZE
> +@@ -482,7 +482,7 @@ ENTRY(memcpy)
> + 	add	src, src, #32
> + 
> + 	subs	tmp2, tmp2, #prefetch_lines * 64 * 2
> +-	blt	2f
> ++	blo	2f
> + 1:
> + 	cpy_line_vfp	d3, 0
> + 	cpy_line_vfp	d4, 64
> +@@ -494,7 +494,7 @@ ENTRY(memcpy)
> + 	add	dst, dst, #2 * 64
> + 	add	src, src, #2 * 64
> + 	subs	tmp2, tmp2, #prefetch_lines * 64
> +-	bge	1b
> ++	bhs	1b
> + 
> + 2:
> + 	cpy_tail_vfp	d3, 0
> +@@ -615,8 +615,8 @@ ENTRY(memcpy)
> + 1:
> + 	pld	[src, #(3 * 64)]
> + 	subs	count, count, #64
> +-	ldrmi	tmp2, [sp], #FRAME_SIZE
> +-	bmi	.Ltail63unaligned
> ++	ldrlo	tmp2, [sp], #FRAME_SIZE
> ++	blo	.Ltail63unaligned
> + 	pld	[src, #(4 * 64)]
> + 
> + #ifdef USE_NEON
> +@@ -633,7 +633,7 @@ ENTRY(memcpy)
> + 	neon_load_multi d0-d3, src
> + 	neon_load_multi d4-d7, src
> + 	subs	count, count, #64
> +-	bmi	2f
> ++	blo	2f
> + 1:
> + 	pld	[src, #(4 * 64)]
> + 	neon_store_multi d0-d3, dst
> +@@ -641,7 +641,7 @@ ENTRY(memcpy)
> + 	neon_store_multi d4-d7, dst
> + 	neon_load_multi d4-d7, src
> + 	subs	count, count, #64
> +-	bpl	1b
> ++	bhs	1b
> + 2:
> + 	neon_store_multi d0-d3, dst
> + 	neon_store_multi d4-d7, dst
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
> new file mode 100644
> index 00000000000..905e44c8e33
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
> @@ -0,0 +1,194 @@
> +From 79a4fa341b8a89cb03f84564fd72abaa1a2db394 Mon Sep 17 00:00:00 2001
> +From: Evgeny Eremin <e.eremin@omprussia.ru>
> +Date: Wed, 8 Jul 2020 14:18:19 +0200
> +Subject: [PATCH] arm: CVE-2020-6096: fix memcpy and memmove for negative
> + length [BZ #25620]
> +
> +Unsigned branch instructions could be used for r2 to fix the wrong
> +behavior when a negative length is passed to memcpy and memmove.
> +This commit fixes the generic arm implementation of memcpy amd memmove.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-6096 patch #2
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + sysdeps/arm/memcpy.S  | 24 ++++++++++--------------
> + sysdeps/arm/memmove.S | 24 ++++++++++--------------
> + 2 files changed, 20 insertions(+), 28 deletions(-)
> +
> +diff --git a/sysdeps/arm/memcpy.S b/sysdeps/arm/memcpy.S
> +index 510e8adaf2..bcfbc51d99 100644
> +--- a/sysdeps/arm/memcpy.S
> ++++ b/sysdeps/arm/memcpy.S
> +@@ -68,7 +68,7 @@ ENTRY(memcpy)
> + 		cfi_remember_state
> + 
> + 		subs	r2, r2, #4
> +-		blt	8f
> ++		blo	8f
> + 		ands	ip, r0, #3
> + 	PLD(	pld	[r1, #0]		)
> + 		bne	9f
> +@@ -82,7 +82,7 @@ ENTRY(memcpy)
> + 		cfi_rel_offset (r6, 4)
> + 		cfi_rel_offset (r7, 8)
> + 		cfi_rel_offset (r8, 12)
> +-		blt	5f
> ++		blo	5f
> + 
> + 	CALGN(	ands	ip, r1, #31		)
> + 	CALGN(	rsb	r3, ip, #32		)
> +@@ -98,9 +98,9 @@ ENTRY(memcpy)
> + #endif
> + 
> + 	PLD(	pld	[r1, #0]		)
> +-2:	PLD(	subs	r2, r2, #96		)
> ++2:	PLD(	cmp	r2, #96			)
> + 	PLD(	pld	[r1, #28]		)
> +-	PLD(	blt	4f			)
> ++	PLD(	blo	4f			)
> + 	PLD(	pld	[r1, #60]		)
> + 	PLD(	pld	[r1, #92]		)
> + 
> +@@ -108,9 +108,7 @@ ENTRY(memcpy)
> + 4:		ldmia	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
> + 		subs	r2, r2, #32
> + 		stmia	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
> +-		bge	3b
> +-	PLD(	cmn	r2, #96			)
> +-	PLD(	bge	4b			)
> ++		bhs	3b
> + 
> + 5:		ands	ip, r2, #28
> + 		rsb	ip, ip, #32
> +@@ -222,7 +220,7 @@ ENTRY(memcpy)
> + 		strbge	r4, [r0], #1
> + 		subs	r2, r2, ip
> + 		strb	lr, [r0], #1
> +-		blt	8b
> ++		blo	8b
> + 		ands	ip, r1, #3
> + 		beq	1b
> + 
> +@@ -236,7 +234,7 @@ ENTRY(memcpy)
> + 		.macro	forward_copy_shift pull push
> + 
> + 		subs	r2, r2, #28
> +-		blt	14f
> ++		blo	14f
> + 
> + 	CALGN(	ands	ip, r1, #31		)
> + 	CALGN(	rsb	ip, ip, #32		)
> +@@ -253,9 +251,9 @@ ENTRY(memcpy)
> + 		cfi_rel_offset (r10, 16)
> + 
> + 	PLD(	pld	[r1, #0]		)
> +-	PLD(	subs	r2, r2, #96		)
> ++	PLD(	cmp	r2, #96			)
> + 	PLD(	pld	[r1, #28]		)
> +-	PLD(	blt	13f			)
> ++	PLD(	blo	13f			)
> + 	PLD(	pld	[r1, #60]		)
> + 	PLD(	pld	[r1, #92]		)
> + 
> +@@ -280,9 +278,7 @@ ENTRY(memcpy)
> + 		mov	ip, ip, PULL #\pull
> + 		orr	ip, ip, lr, PUSH #\push
> + 		stmia	r0!, {r3, r4, r5, r6, r7, r8, r10, ip}
> +-		bge	12b
> +-	PLD(	cmn	r2, #96			)
> +-	PLD(	bge	13b			)
> ++		bhs	12b
> + 
> + 		pop	{r5 - r8, r10}
> + 		cfi_adjust_cfa_offset (-20)
> +diff --git a/sysdeps/arm/memmove.S b/sysdeps/arm/memmove.S
> +index 954037ef3a..0d07b76ee6 100644
> +--- a/sysdeps/arm/memmove.S
> ++++ b/sysdeps/arm/memmove.S
> +@@ -85,7 +85,7 @@ ENTRY(memmove)
> + 		add	r1, r1, r2
> + 		add	r0, r0, r2
> + 		subs	r2, r2, #4
> +-		blt	8f
> ++		blo	8f
> + 		ands	ip, r0, #3
> + 	PLD(	pld	[r1, #-4]		)
> + 		bne	9f
> +@@ -99,7 +99,7 @@ ENTRY(memmove)
> + 		cfi_rel_offset (r6, 4)
> + 		cfi_rel_offset (r7, 8)
> + 		cfi_rel_offset (r8, 12)
> +-		blt	5f
> ++		blo     5f
> + 
> + 	CALGN(	ands	ip, r1, #31		)
> + 	CALGN(	sbcsne	r4, ip, r2		)  @ C is always set here
> +@@ -114,9 +114,9 @@ ENTRY(memmove)
> + #endif
> + 
> + 	PLD(	pld	[r1, #-4]		)
> +-2:	PLD(	subs	r2, r2, #96		)
> ++2:	PLD(	cmp	r2, #96			)
> + 	PLD(	pld	[r1, #-32]		)
> +-	PLD(	blt	4f			)
> ++	PLD(    blo     4f                      )
> + 	PLD(	pld	[r1, #-64]		)
> + 	PLD(	pld	[r1, #-96]		)
> + 
> +@@ -124,9 +124,7 @@ ENTRY(memmove)
> + 4:		ldmdb	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
> + 		subs	r2, r2, #32
> + 		stmdb	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
> +-		bge	3b
> +-	PLD(	cmn	r2, #96			)
> +-	PLD(	bge	4b			)
> ++		bhs     3b
> + 
> + 5:		ands	ip, r2, #28
> + 		rsb	ip, ip, #32
> +@@ -237,7 +235,7 @@ ENTRY(memmove)
> + 		strbge	r4, [r0, #-1]!
> + 		subs	r2, r2, ip
> + 		strb	lr, [r0, #-1]!
> +-		blt	8b
> ++		blo	8b
> + 		ands	ip, r1, #3
> + 		beq	1b
> + 
> +@@ -251,7 +249,7 @@ ENTRY(memmove)
> + 		.macro	backward_copy_shift push pull
> + 
> + 		subs	r2, r2, #28
> +-		blt	14f
> ++		blo	14f
> + 
> + 	CALGN(	ands	ip, r1, #31		)
> + 	CALGN(	rsb	ip, ip, #32		)
> +@@ -268,9 +266,9 @@ ENTRY(memmove)
> + 		cfi_rel_offset (r10, 16)
> + 
> + 	PLD(	pld	[r1, #-4]		)
> +-	PLD(	subs	r2, r2, #96		)
> ++	PLD(	cmp	r2, #96			)
> + 	PLD(	pld	[r1, #-32]		)
> +-	PLD(	blt	13f			)
> ++	PLD(	blo	13f			)
> + 	PLD(	pld	[r1, #-64]		)
> + 	PLD(	pld	[r1, #-96]		)
> + 
> +@@ -295,9 +293,7 @@ ENTRY(memmove)
> + 		mov     r4, r4, PUSH #\push
> + 		orr     r4, r4, r3, PULL #\pull
> + 		stmdb   r0!, {r4 - r8, r10, ip, lr}
> +-		bge	12b
> +-	PLD(	cmn	r2, #96			)
> +-	PLD(	bge	13b			)
> ++		bhs	12b
> + 
> + 		pop	{r5 - r8, r10}
> + 		cfi_adjust_cfa_offset (-20)
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
> index 9b2cf1bdeb4..38563b1a7b7 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -43,6 +43,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0028-inject-file-assembly-directives.patch \
>             file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
>             file://0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
> +           file://CVE-2020-6096.patch \
> +           file://CVE-2020-6096_2.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>
> 


--------------3A15D44544E2DF7E0BA9C04B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/20/20 2:49 PM, akuster via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1623945384257296.5706@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>

Source: glibc.org
MR: 104799
Type: Security Fix
Disposition: Backport from  beea361050728138b82c57dda0c4810402d342b9
ChangeID: 29df826fb697fdd2742c3bace33388bda962c5f1
Description:</pre>
    </blockquote>
    <br>
    Any issues with this?<br>
    <br>
    -armin<br>
    <blockquote type="cite"
      cite="mid:1623945384257296.5706@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@gmvista.com">&lt;akuster@gmvista.com&gt;</a>
---
 .../glibc/glibc/CVE-2020-6096.patch           | 112 ++++++++++
 .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   2 +
 3 files changed, 308 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
new file mode 100644
index 00000000000..9c26f76432d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
@@ -0,0 +1,112 @@
+From beea361050728138b82c57dda0c4810402d342b9 Mon Sep 17 00:00:00 2001
+From: Alexander Anisimov <a class="moz-txt-link-rfc2396E" href="mailto:a.anisimov@omprussia.ru">&lt;a.anisimov@omprussia.ru&gt;</a>
+Date: Wed, 8 Jul 2020 14:18:31 +0200
+Subject: [PATCH] arm: CVE-2020-6096: Fix multiarch memcpy for negative length
+ [BZ #25620]
+
+Unsigned branch instructions could be used for r2 to fix the wrong
+behavior when a negative length is passed to memcpy.
+This commit fixes the armv7 version.
+
+Upstream-Status: Backport
+CVE: CVE-2020-6096 patch #1
+Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>
+
+---
+ sysdeps/arm/armv7/multiarch/memcpy_impl.S | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/sysdeps/arm/armv7/multiarch/memcpy_impl.S b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
+index bf4ac7077f..379bb56fc9 100644
+--- a/sysdeps/arm/armv7/multiarch/memcpy_impl.S
++++ b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
+@@ -268,7 +268,7 @@ ENTRY(memcpy)
+ 
+ 	mov	dst, dstin	/* Preserve dstin, we need to return it.  */
+ 	cmp	count, #64
+-	bge	.Lcpy_not_short
++	bhs	.Lcpy_not_short
+ 	/* Deal with small copies quickly by dropping straight into the
+ 	   exit block.  */
+ 
+@@ -351,10 +351,10 @@ ENTRY(memcpy)
+ 
+ 1:
+ 	subs	tmp2, count, #64	/* Use tmp2 for count.  */
+-	blt	.Ltail63aligned
++	blo	.Ltail63aligned
+ 
+ 	cmp	tmp2, #512
+-	bge	.Lcpy_body_long
++	bhs	.Lcpy_body_long
+ 
+ .Lcpy_body_medium:			/* Count in tmp2.  */
+ #ifdef USE_VFP
+@@ -378,7 +378,7 @@ ENTRY(memcpy)
+ 	add	src, src, #64
+ 	vstr	d1, [dst, #56]
+ 	add	dst, dst, #64
+-	bge	1b
++	bhs	1b
+ 	tst	tmp2, #0x3f
+ 	beq	.Ldone
+ 
+@@ -412,7 +412,7 @@ ENTRY(memcpy)
+ 	ldrd	A_l, A_h, [src, #64]!
+ 	strd	A_l, A_h, [dst, #64]!
+ 	subs	tmp2, tmp2, #64
+-	bge	1b
++	bhs	1b
+ 	tst	tmp2, #0x3f
+ 	bne	1f
+ 	ldr	tmp2,[sp], #FRAME_SIZE
+@@ -482,7 +482,7 @@ ENTRY(memcpy)
+ 	add	src, src, #32
+ 
+ 	subs	tmp2, tmp2, #prefetch_lines * 64 * 2
+-	blt	2f
++	blo	2f
+ 1:
+ 	cpy_line_vfp	d3, 0
+ 	cpy_line_vfp	d4, 64
+@@ -494,7 +494,7 @@ ENTRY(memcpy)
+ 	add	dst, dst, #2 * 64
+ 	add	src, src, #2 * 64
+ 	subs	tmp2, tmp2, #prefetch_lines * 64
+-	bge	1b
++	bhs	1b
+ 
+ 2:
+ 	cpy_tail_vfp	d3, 0
+@@ -615,8 +615,8 @@ ENTRY(memcpy)
+ 1:
+ 	pld	[src, #(3 * 64)]
+ 	subs	count, count, #64
+-	ldrmi	tmp2, [sp], #FRAME_SIZE
+-	bmi	.Ltail63unaligned
++	ldrlo	tmp2, [sp], #FRAME_SIZE
++	blo	.Ltail63unaligned
+ 	pld	[src, #(4 * 64)]
+ 
+ #ifdef USE_NEON
+@@ -633,7 +633,7 @@ ENTRY(memcpy)
+ 	neon_load_multi d0-d3, src
+ 	neon_load_multi d4-d7, src
+ 	subs	count, count, #64
+-	bmi	2f
++	blo	2f
+ 1:
+ 	pld	[src, #(4 * 64)]
+ 	neon_store_multi d0-d3, dst
+@@ -641,7 +641,7 @@ ENTRY(memcpy)
+ 	neon_store_multi d4-d7, dst
+ 	neon_load_multi d4-d7, src
+ 	subs	count, count, #64
+-	bpl	1b
++	bhs	1b
+ 2:
+ 	neon_store_multi d0-d3, dst
+ 	neon_store_multi d4-d7, dst
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
new file mode 100644
index 00000000000..905e44c8e33
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
@@ -0,0 +1,194 @@
+From 79a4fa341b8a89cb03f84564fd72abaa1a2db394 Mon Sep 17 00:00:00 2001
+From: Evgeny Eremin <a class="moz-txt-link-rfc2396E" href="mailto:e.eremin@omprussia.ru">&lt;e.eremin@omprussia.ru&gt;</a>
+Date: Wed, 8 Jul 2020 14:18:19 +0200
+Subject: [PATCH] arm: CVE-2020-6096: fix memcpy and memmove for negative
+ length [BZ #25620]
+
+Unsigned branch instructions could be used for r2 to fix the wrong
+behavior when a negative length is passed to memcpy and memmove.
+This commit fixes the generic arm implementation of memcpy amd memmove.
+
+Upstream-Status: Backport
+CVE: CVE-2020-6096 patch #2
+Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>
+
+---
+ sysdeps/arm/memcpy.S  | 24 ++++++++++--------------
+ sysdeps/arm/memmove.S | 24 ++++++++++--------------
+ 2 files changed, 20 insertions(+), 28 deletions(-)
+
+diff --git a/sysdeps/arm/memcpy.S b/sysdeps/arm/memcpy.S
+index 510e8adaf2..bcfbc51d99 100644
+--- a/sysdeps/arm/memcpy.S
++++ b/sysdeps/arm/memcpy.S
+@@ -68,7 +68,7 @@ ENTRY(memcpy)
+ 		cfi_remember_state
+ 
+ 		subs	r2, r2, #4
+-		blt	8f
++		blo	8f
+ 		ands	ip, r0, #3
+ 	PLD(	pld	[r1, #0]		)
+ 		bne	9f
+@@ -82,7 +82,7 @@ ENTRY(memcpy)
+ 		cfi_rel_offset (r6, 4)
+ 		cfi_rel_offset (r7, 8)
+ 		cfi_rel_offset (r8, 12)
+-		blt	5f
++		blo	5f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	rsb	r3, ip, #32		)
+@@ -98,9 +98,9 @@ ENTRY(memcpy)
+ #endif
+ 
+ 	PLD(	pld	[r1, #0]		)
+-2:	PLD(	subs	r2, r2, #96		)
++2:	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #28]		)
+-	PLD(	blt	4f			)
++	PLD(	blo	4f			)
+ 	PLD(	pld	[r1, #60]		)
+ 	PLD(	pld	[r1, #92]		)
+ 
+@@ -108,9 +108,7 @@ ENTRY(memcpy)
+ 4:		ldmia	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
+ 		subs	r2, r2, #32
+ 		stmia	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
+-		bge	3b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	4b			)
++		bhs	3b
+ 
+ 5:		ands	ip, r2, #28
+ 		rsb	ip, ip, #32
+@@ -222,7 +220,7 @@ ENTRY(memcpy)
+ 		strbge	r4, [r0], #1
+ 		subs	r2, r2, ip
+ 		strb	lr, [r0], #1
+-		blt	8b
++		blo	8b
+ 		ands	ip, r1, #3
+ 		beq	1b
+ 
+@@ -236,7 +234,7 @@ ENTRY(memcpy)
+ 		.macro	forward_copy_shift pull push
+ 
+ 		subs	r2, r2, #28
+-		blt	14f
++		blo	14f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	rsb	ip, ip, #32		)
+@@ -253,9 +251,9 @@ ENTRY(memcpy)
+ 		cfi_rel_offset (r10, 16)
+ 
+ 	PLD(	pld	[r1, #0]		)
+-	PLD(	subs	r2, r2, #96		)
++	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #28]		)
+-	PLD(	blt	13f			)
++	PLD(	blo	13f			)
+ 	PLD(	pld	[r1, #60]		)
+ 	PLD(	pld	[r1, #92]		)
+ 
+@@ -280,9 +278,7 @@ ENTRY(memcpy)
+ 		mov	ip, ip, PULL #\pull
+ 		orr	ip, ip, lr, PUSH #\push
+ 		stmia	r0!, {r3, r4, r5, r6, r7, r8, r10, ip}
+-		bge	12b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	13b			)
++		bhs	12b
+ 
+ 		pop	{r5 - r8, r10}
+ 		cfi_adjust_cfa_offset (-20)
+diff --git a/sysdeps/arm/memmove.S b/sysdeps/arm/memmove.S
+index 954037ef3a..0d07b76ee6 100644
+--- a/sysdeps/arm/memmove.S
++++ b/sysdeps/arm/memmove.S
+@@ -85,7 +85,7 @@ ENTRY(memmove)
+ 		add	r1, r1, r2
+ 		add	r0, r0, r2
+ 		subs	r2, r2, #4
+-		blt	8f
++		blo	8f
+ 		ands	ip, r0, #3
+ 	PLD(	pld	[r1, #-4]		)
+ 		bne	9f
+@@ -99,7 +99,7 @@ ENTRY(memmove)
+ 		cfi_rel_offset (r6, 4)
+ 		cfi_rel_offset (r7, 8)
+ 		cfi_rel_offset (r8, 12)
+-		blt	5f
++		blo     5f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	sbcsne	r4, ip, r2		)  @ C is always set here
+@@ -114,9 +114,9 @@ ENTRY(memmove)
+ #endif
+ 
+ 	PLD(	pld	[r1, #-4]		)
+-2:	PLD(	subs	r2, r2, #96		)
++2:	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #-32]		)
+-	PLD(	blt	4f			)
++	PLD(    blo     4f                      )
+ 	PLD(	pld	[r1, #-64]		)
+ 	PLD(	pld	[r1, #-96]		)
+ 
+@@ -124,9 +124,7 @@ ENTRY(memmove)
+ 4:		ldmdb	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
+ 		subs	r2, r2, #32
+ 		stmdb	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
+-		bge	3b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	4b			)
++		bhs     3b
+ 
+ 5:		ands	ip, r2, #28
+ 		rsb	ip, ip, #32
+@@ -237,7 +235,7 @@ ENTRY(memmove)
+ 		strbge	r4, [r0, #-1]!
+ 		subs	r2, r2, ip
+ 		strb	lr, [r0, #-1]!
+-		blt	8b
++		blo	8b
+ 		ands	ip, r1, #3
+ 		beq	1b
+ 
+@@ -251,7 +249,7 @@ ENTRY(memmove)
+ 		.macro	backward_copy_shift push pull
+ 
+ 		subs	r2, r2, #28
+-		blt	14f
++		blo	14f
+ 
+ 	CALGN(	ands	ip, r1, #31		)
+ 	CALGN(	rsb	ip, ip, #32		)
+@@ -268,9 +266,9 @@ ENTRY(memmove)
+ 		cfi_rel_offset (r10, 16)
+ 
+ 	PLD(	pld	[r1, #-4]		)
+-	PLD(	subs	r2, r2, #96		)
++	PLD(	cmp	r2, #96			)
+ 	PLD(	pld	[r1, #-32]		)
+-	PLD(	blt	13f			)
++	PLD(	blo	13f			)
+ 	PLD(	pld	[r1, #-64]		)
+ 	PLD(	pld	[r1, #-96]		)
+ 
+@@ -295,9 +293,7 @@ ENTRY(memmove)
+ 		mov     r4, r4, PUSH #\push
+ 		orr     r4, r4, r3, PULL #\pull
+ 		stmdb   r0!, {r4 - r8, r10, ip, lr}
+-		bge	12b
+-	PLD(	cmn	r2, #96			)
+-	PLD(	bge	13b			)
++		bhs	12b
+ 
+ 		pop	{r5 - r8, r10}
+ 		cfi_adjust_cfa_offset (-20)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 9b2cf1bdeb4..38563b1a7b7 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -43,6 +43,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            <a class="moz-txt-link-freetext" href="file://0028-inject-file-assembly-directives.patch">file://0028-inject-file-assembly-directives.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch">file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch">file://0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2020-6096.patch">file://CVE-2020-6096.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2020-6096_2.patch">file://CVE-2020-6096_2.patch</a> \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------3A15D44544E2DF7E0BA9C04B--
