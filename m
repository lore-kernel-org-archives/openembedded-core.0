Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.360.1594657646485099211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 09:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vDARIPpw;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id j19so6221629pgm.11
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uri6etNRUGU8dXlcDjW4qBUv1M0mSjXfNkuD1EzeY5k=;
        b=vDARIPpwilf63IWss/sD6O0XVbbrxGvmZcPiJgxSdfa/cDPyu893X2fay2aKZjWjMp
         nPle87TIncGY8im8dCbHfG6vaHa5/MV+psT4UCSW9DCIN30KwYIcP/sFkvRc2AkgporD
         9ItSYB+6NI2lwIlyS2VxuFIGUvpBa87SLjBmIz7gcu9XOfc3sOj+rCLp3miLHn1Q6vj+
         VQ9Qess00VN3CGxeuQ480XrZ/gVjHpdCR5i/nCuHCgHgzLaML570ypHo+AZdDs2hZAyF
         mFNAt8KW/pQZ7AdydaOkxIZwW1sNZF4xim1jgHz+3dD1x0+KCnTu1XaZ7npIIYPaM2wu
         urBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uri6etNRUGU8dXlcDjW4qBUv1M0mSjXfNkuD1EzeY5k=;
        b=UQ/ksZM4rI2bKd3WBG9X4m3Ii6CLWgraM/mvPIFt7UTeNhHJRfx6hmsq0A+trR5O77
         CLr0PXKEtOqH0X7EE3L0hTPQovs8DLkU+VjyO6FQjiDmfT//Azn6e87NFP04DV8UHwuw
         9CC951NSQB0IA4s2SBHk6b8hsbQ4FtNp532uA3V1C6z5nH4+ncy3cG5GrhvTNv2Zhida
         dNa8oLdAuvdGnTC2Ryhe7aX7CilCiKySTdXf4rPOXWRmP6P5zCp3CWLHYxfeuiOAb0lu
         xZ+811fO8MNtcWuejylDas7WD3/419cCemLhss13keXrSdoNHba5drVaY4ouHLWXKWCL
         yHbg==
X-Gm-Message-State: AOAM533y5TvxDuOlRLGEnQeSrq3IJjjYJ+J4FE24n0rMBsFSxPJizXRM
	vtIl1c8WX85vCCVY3/aCQAk=
X-Google-Smtp-Source: ABdhPJxtQIKnrYYvZb5gyGMqR2EYzqZ2jXHNyOC7yDtqHB+lm47dqFnUJjWenV3pjkQcfnCzu0UYAQ==
X-Received: by 2002:a63:3d07:: with SMTP id k7mr18233pga.93.1594657645708;
        Mon, 13 Jul 2020 09:27:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5886:34b9:1392:15a2? ([2601:646:9200:4e0:5886:34b9:1392:15a2])
        by smtp.gmail.com with ESMTPSA id u66sm14675681pfb.191.2020.07.13.09.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 09:27:25 -0700 (PDT)
Subject: Re: [OE-core][zeus][PATCH] glibc: CVE-2020-6096
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200713055213.88388-1-zhixiong.chi@windriver.com>
Cc: akuster808 <akuster808@gmail.com>, Steve Sakoman <sakoman@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <d476dcd8-77bc-799d-bf9e-ff4201b80471@gmail.com>
Date: Mon, 13 Jul 2020 09:27:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713055213.88388-1-zhixiong.chi@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/12/20 10:52 PM, Zhixiong Chi wrote:
> Backport the CVE patch from the upstream:
> git://sourceware.org/git/glibc.git
> commit 79a4fa341b8a89cb03f84564fd72abaa1a2db394
> commit beea361050728138b82c57dda0c4810402d342b9
> 
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>   .../glibc/glibc/CVE-2020-6096-1.patch         | 193 ++++++++++++++++++
>   .../glibc/glibc/CVE-2020-6096-2.patch         | 111 ++++++++++
>   meta/recipes-core/glibc/glibc_2.30.bb         |   2 +
>   3 files changed, 306 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096-1.patch
>   create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096-2.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096-1.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096-1.patch
> new file mode 100644
> index 0000000000..01c0328362
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096-1.patch
> @@ -0,0 +1,193 @@
> +From 79a4fa341b8a89cb03f84564fd72abaa1a2db394 Mon Sep 17 00:00:00 2001
> +From: Evgeny Eremin <e.eremin@omprussia.ru>
> +Date: Wed, 8 Jul 2020 14:18:19 +0200
> +Subject: [PATCH 1/2] arm: CVE-2020-6096: fix memcpy and memmove for negative
> + length [BZ #25620]
> +
> +Unsigned branch instructions could be used for r2 to fix the wrong
> +behavior when a negative length is passed to memcpy and memmove.
> +This commit fixes the generic arm implementation of memcpy amd memmove.
> +
> +CVE: CVE-2020-6096
> +Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>

This is needed on master as well, so please propose it for master and 
then backport it to release branches, dunfell will also need it.

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
> +2.17.0
> +
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096-2.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096-2.patch
> new file mode 100644
> index 0000000000..bfb2d7e7f5
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2020-6096-2.patch
> @@ -0,0 +1,111 @@
> +From beea361050728138b82c57dda0c4810402d342b9 Mon Sep 17 00:00:00 2001
> +From: Alexander Anisimov <a.anisimov@omprussia.ru>
> +Date: Wed, 8 Jul 2020 14:18:31 +0200
> +Subject: [PATCH 2/2] arm: CVE-2020-6096: Fix multiarch memcpy for negative
> + length [BZ #25620]
> +
> +Unsigned branch instructions could be used for r2 to fix the wrong
> +behavior when a negative length is passed to memcpy.
> +This commit fixes the armv7 version.
> +
> +CVE: CVE-2020-6096
> +Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
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
> +2.17.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glibc/glibc_2.30.bb
> index e9286b6b49..b674b02706 100644
> --- a/meta/recipes-core/glibc/glibc_2.30.bb
> +++ b/meta/recipes-core/glibc/glibc_2.30.bb
> @@ -45,6 +45,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://CVE-2020-10029.patch \
>              file://CVE-2020-1751.patch \
>              file://CVE-2020-1752.patch \
> +           file://CVE-2020-6096-1.patch \
> +           file://CVE-2020-6096-2.patch \
>              "
>   S = "${WORKDIR}/git"
>   B = "${WORKDIR}/build-${TARGET_SYS}"
> 
> 
> 
> 
