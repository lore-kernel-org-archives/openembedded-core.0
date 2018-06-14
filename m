Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id BFA0175345
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 20:15:52 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id a5-v6so8546172otf.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tu5BIRjPGLB7mxKj9nNqR3eP2XMc/phcmZaQnbXQvc4=;
	b=HKloNMMblRpc9YWsR7Ea0bySzoHN/YlE8C8Xpr/rEPs15XA+hBAXnYTcOvTYashyMN
	LvQesnKtdFWlA1w1Qy5UV+Zb5aw6JJvIvPDfyjT792JSC040MNlFxeLVLZSUmeAAZODH
	2mNBL7+UYVeINqp+sZvVubW9pIXGOk2T1166h1fYx2hoyV/NfFB6Y2pkqkYWSAZ2orDe
	rHSjBlK8W2+mUPPljF/VJUBCzDkPdZ1jg6ZaWQ/aizSmoD83PnKxd+KztbbZk/31P+r/
	1owO+07fQQDhs4UmFKhZ9GR5mDF9GC/K8qaJFVCfc52qZbkaLkR6dbGn3wvjihIAERem
	hyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tu5BIRjPGLB7mxKj9nNqR3eP2XMc/phcmZaQnbXQvc4=;
	b=hPJiFtutmMNzKlw5Gq9Pb3RMdEHdSlm7zJXP5f5io+jd90A15hEsm4+EvjmLwetmj0
	Y1mLMxTE5mKKhDPpJoseBvxR2ZCMCW24edpOPYN2VWY/SBPeuNxp89Xyp5jKq05eteCS
	GVaMj2+Fso+kb9o3Dy45/7su+eZ0bwC0b0XJ7+RS1XO5zBc74v8yLdSWk7Yv233sj+7f
	Kcweb7lvY1zxBUhm5SgUQvShhmgTJrJwtrSv9QFYOhdTpyrxPaOBJEUNFaSLrIWoLim4
	d0HSaRvI5c7k2Yz4li+U/VBv7uLnkEA+C6RotskC1Cq1MIkqM0ZKoOW+8VqruePyv5D7
	jnTw==
X-Gm-Message-State: APt69E3D9aBWjSMlUSzEe8mDlzDk0SwP+y6XPuWcianHzFGe0BbPULkB
	KXLR5U+r/5RspPFhcPHt9kqPX4RhLdz6Q9NoNAo=
X-Google-Smtp-Source: ADUXVKJF+El+lb+oz9S0U/AL3CqFvN+lBuryJUvlhC9rHu8LEszQAeymI7B3fgiarvfw+NS1Dn2UpWcnqRHhFV7iCdo=
X-Received: by 2002:a9d:1f3b:: with SMTP id
	x56-v6mr2105674otd.369.1529007353821; 
	Thu, 14 Jun 2018 13:15:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 13:15:53
	-0700 (PDT)
In-Reply-To: <20180614194507.93168-2-alistair.francis@wdc.com>
References: <20180614194507.93168-1-alistair.francis@wdc.com>
	<20180614194507.93168-2-alistair.francis@wdc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 23:15:53 +0300
Message-ID: <CANNYZj_ikF7-3VCM7o7ouHJL0r0h_7_QfP8To-HhyMEtiMzvVA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] recipes-support/nspr: Add RISC-V support
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
X-List-Received-Date: Thu, 14 Jun 2018 20:15:53 -0000
Content-Type: text/plain; charset="UTF-8"

The patch file needs Upstream-Status in addition to SOB.

(also why is patchtest not reacting to patches anymore?)

Alex

2018-06-14 22:45 GMT+03:00 Alistair Francis <alistair.francis@wdc.com>:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../0003-Add-riscv-architecture-support.patch | 103 ++++++++++++++++++
>  meta/recipes-support/nspr/nspr_4.19.bb        |   1 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch
>
> diff --git a/meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch b/meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch
> new file mode 100644
> index 0000000000..14911440bd
> --- /dev/null
> +++ b/meta/recipes-support/nspr/nspr/0003-Add-riscv-architecture-support.patch
> @@ -0,0 +1,103 @@
> +From ff3d77742bd3b0272c48ff7472a45e9c537709f2 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 4 Oct 2017 11:55:10 -0700
> +Subject: [PATCH] Add riscv architecture support
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + pr/include/md/_linux.cfg | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> + pr/include/md/_linux.h   | 14 ++++++++++++++
> + 2 files changed, 60 insertions(+)
> +
> +diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
> +index 31296a8..d0dde57 100644
> +--- a/pr/include/md/_linux.cfg
> ++++ b/pr/include/md/_linux.cfg
> +@@ -360,6 +360,52 @@
> + #define PR_BYTES_PER_WORD_LOG2   2
> + #define PR_BYTES_PER_DWORD_LOG2  3
> +
> ++#elif defined(__riscv) && __riscv_xlen == 64
> ++
> ++#undef        IS_BIG_ENDIAN
> ++#define       IS_LITTLE_ENDIAN 1
> ++#define IS_64
> ++
> ++#define PR_BYTES_PER_BYTE   1
> ++#define PR_BYTES_PER_SHORT  2
> ++#define PR_BYTES_PER_INT    4
> ++#define PR_BYTES_PER_INT64  8
> ++#define PR_BYTES_PER_LONG   8
> ++#define PR_BYTES_PER_FLOAT  4
> ++#define PR_BYTES_PER_DOUBLE 8
> ++#define PR_BYTES_PER_WORD   8
> ++#define PR_BYTES_PER_DWORD  8
> ++
> ++#define PR_BITS_PER_BYTE    8
> ++#define PR_BITS_PER_SHORT   16
> ++#define PR_BITS_PER_INT     32
> ++#define PR_BITS_PER_INT64   64
> ++#define PR_BITS_PER_LONG    64
> ++#define PR_BITS_PER_FLOAT   32
> ++#define PR_BITS_PER_DOUBLE  64
> ++#define PR_BITS_PER_WORD    64
> ++
> ++#define PR_BITS_PER_BYTE_LOG2   3
> ++#define PR_BITS_PER_SHORT_LOG2  4
> ++#define PR_BITS_PER_INT_LOG2    5
> ++#define PR_BITS_PER_INT64_LOG2  6
> ++#define PR_BITS_PER_LONG_LOG2   6
> ++#define PR_BITS_PER_FLOAT_LOG2  5
> ++#define PR_BITS_PER_DOUBLE_LOG2 6
> ++#define PR_BITS_PER_WORD_LOG2   6
> ++
> ++#define PR_ALIGN_OF_SHORT   2
> ++#define PR_ALIGN_OF_INT     4
> ++#define PR_ALIGN_OF_INT64   8
> ++#define PR_ALIGN_OF_LONG    8
> ++#define PR_ALIGN_OF_FLOAT   4
> ++#define PR_ALIGN_OF_DOUBLE  8
> ++#define PR_ALIGN_OF_POINTER 8
> ++#define PR_ALIGN_OF_WORD    8
> ++
> ++#define PR_BYTES_PER_WORD_LOG2   3
> ++#define PR_BYTES_PER_DWORD_LOG2  3
> ++
> + #elif defined(__sparc__) && defined (__arch64__)
> +
> + #undef        IS_LITTLE_ENDIAN
> +diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
> +index 551918f..3a3cc2e 100644
> +--- a/pr/include/md/_linux.h
> ++++ b/pr/include/md/_linux.h
> +@@ -31,6 +31,8 @@
> + #define _PR_SI_ARCHITECTURE "x86-64"
> + #elif defined(__mc68000__)
> + #define _PR_SI_ARCHITECTURE "m68k"
> ++#elif defined(__riscv) && __riscv_xlen == 64
> ++#define _PR_SI_ARCHITECTURE "rv64"
> + #elif defined(__sparc__) && defined(__arch64__)
> + #define _PR_SI_ARCHITECTURE "sparc64"
> + #elif defined(__sparc__)
> +@@ -151,6 +153,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val, PRInt32 newval);
> + #endif
> + #endif
> +
> ++#if defined(__riscv)
> ++#if defined(__GNUC__)
> ++/* Use GCC built-in functions */
> ++#define _PR_HAVE_ATOMIC_OPS
> ++#define _MD_INIT_ATOMIC()
> ++#define _MD_ATOMIC_INCREMENT(ptr) __sync_add_and_fetch(ptr, 1)
> ++#define _MD_ATOMIC_DECREMENT(ptr) __sync_sub_and_fetch(ptr, 1)
> ++#define _MD_ATOMIC_ADD(ptr, i) __sync_add_and_fetch(ptr, i)
> ++#define _MD_ATOMIC_SET(ptr, nv) __sync_lock_test_and_set(ptr, nv)
> ++#endif
> ++#endif
> ++
> + #if defined(__powerpc__) && !defined(__powerpc64__)
> + #define _PR_HAVE_ATOMIC_OPS
> + #define _MD_INIT_ATOMIC()
> +--
> +2.14.2
> +
> diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.19.bb
> index de2c87131f..5c37509b1b 100644
> --- a/meta/recipes-support/nspr/nspr_4.19.bb
> +++ b/meta/recipes-support/nspr/nspr_4.19.bb
> @@ -11,6 +11,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
>             file://remove-srcdir-from-configure-in.patch \
>             file://0002-Add-nios2-support.patch \
>             file://0001-md-Fix-build-with-musl.patch \
> +           file://0003-Add-riscv-architecture-support.patch \
>             file://nspr.pc.in \
>  "
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

