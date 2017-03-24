Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C5E2277AF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:43:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z133so1699868wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XH4DpKiNREjio9diZSIxEvSRla62g+9LtmNrrKZHeLg=;
	b=tLiNGSXQDHd7OJx7lPMzRCmkwjDVyver7I83K7oeu4MiDwCb3kmCtG5QhgrKPBvVbo
	r3VJN5n0Wx2jqnhyefp4V9H6KtVBuogMLSKXy95tuqVU/ufUOGVdoGGlx6nO7/wQNZO1
	aCi9Y2OUI1MJBfQkbLOSGGR/Lx1pKol0z5Er83NgFTusQa5vTg+z+UdXdCfeoyeeRNc/
	+HOkMCaT/pk2R1vx3GG81pljyiriyX6JCP/o92Vs5yOamU6/3BjEZebkuQcQIiQdLZmB
	Ywpdu4vKJvM82/kK9qVRa/xaSDPZ0H6Ns5IdCOKxV97YtYK2+iklgyaaK1X01LAGUfwO
	jJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XH4DpKiNREjio9diZSIxEvSRla62g+9LtmNrrKZHeLg=;
	b=rTP+B9WSSNwhnGGzMB/+MuD9JQiMPLIsaVH2/RQx8Ep5WyK4TBIWGt8r+2iA6xmm6b
	GyrRQZzwN86tm7ZHC84HwcotnL7UQsYQN28UVthxvjI1CqlkQfBNEmfBJqRjvhsW+4C7
	N2O6JVz9WidrI/mWiqIYWGWyXSVMlsI5izrIyYypR5LoB6Mo/Wj4WT3FHsSSizK7KiBT
	qELZ23ipQbe4slQgjW9tTS9nufFTFQDJGFAag5sRdwWwiBd7qBwmvJsA6qrBKHOBE3Q6
	16pj0++dBYrPxhSN3pfY8x4Ly3Pt5qnwVDf7vuiTBj3zdd5lpywhdUsD5taGsacjtzvJ
	T5ug==
X-Gm-Message-State: AFeK/H0N0yz08H8fOWVbMWftS0nKRIagIKo4l2d9SD1HpP2a2zl5RaqanOyPqyrN3bGOx/EJIonVmwxmb9uzVg==
X-Received: by 10.28.199.132 with SMTP id x126mr3819165wmf.37.1490373805421;
	Fri, 24 Mar 2017 09:43:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Fri, 24 Mar 2017 09:42:54 -0700 (PDT)
In-Reply-To: <1490367674-24329-1-git-send-email-max.krummenacher@toradex.com>
References: <1490367674-24329-1-git-send-email-max.krummenacher@toradex.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Mar 2017 09:42:54 -0700
Message-ID: <CAMKF1sqeCfBGA=ez=DczBt=TCWRDJ8KE6nt14abSP-75x9t_TA@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix regression when building for thumb2
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
X-List-Received-Date: Fri, 24 Mar 2017 16:43:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 24, 2017 at 8:01 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Commit 'c8da8ce openssl: Fix build with clang' introduced a regression.
> do_compile fails when building with gcc/thumb2.
>
> Note that I did not test if it still builds with clang.
>
> Prevents the following when building with thumb2:
>

I sent out a similar patch. There are many thumb2 changes that would have
been needed to build this in thumb2 mode. So this patch is fine, which only
enables unified syntax for clang and leaves everything else same.

> | ghash-armv4.S: Assembler messages:
> | ghash-armv4.S:88: Error: thumb conditional instruction should be in IT block -- `ldrplb r12,[r2,r3]'
> | ghash-armv4.S:98: conditional infixes are deprecated in unified syntax
> | ghash-armv4.S:98: Error: thumb conditional instruction should be in IT block -- `ldrplb r8,[r0,r3]'
> | ghash-armv4.S:105: Error: thumb conditional instruction should be in IT block -- `eorpl r12,r12,r8'
> | ghash-armv4.S:107: Error: thumb conditional instruction should be in IT block -- `andpl r14,r12,#0xf0'
> | ghash-armv4.S:108: Error: thumb conditional instruction should be in IT block -- `andpl r12,r12,#0x0f'
> | ghash-armv4.S:144: conditional infixes are deprecated in unified syntax
> | ghash-armv4.S:144: Error: thumb conditional instruction should be in IT block -- `ldrneb r12,[r2,#15]'
> | ghash-armv4.S:231: conditional infixes are deprecated in unified syntax
> | ghash-armv4.S:231: Error: thumb conditional instruction should be in IT block -- `ldrplb r12,[r0,r3]'
> | ghash-armv4.S:248: Error: thumb conditional instruction should be in IT block -- `andpl r14,r12,#0xf0'
> | ghash-armv4.S:249: Error: thumb conditional instruction should be in IT block -- `andpl r12,r12,#0x0f'
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  .../0001-Fix-build-with-clang-using-external-assembler.patch        | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
> index 47b83a5..2270962 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
> @@ -29,18 +29,14 @@ diff --git a/crypto/modes/asm/ghash-armv4.pl b/crypto/modes/asm/ghash-armv4.pl
>  index 8ccc963ef..442fed4da 100644
>  --- a/crypto/modes/asm/ghash-armv4.pl
>  +++ b/crypto/modes/asm/ghash-armv4.pl
> -@@ -124,7 +124,14 @@ $code=<<___;
> +@@ -124,7 +124,10 @@ $code=<<___;
>   #include "arm_arch.h"
>
>   .text
>  +#if defined(__thumb2__) || defined(__clang__)
>  +.syntax       unified
>  +#endif
> -+#if defined(__thumb2__)
> -+.thumb
> -+#else
>   .code 32
> -+#endif
>
>   #ifdef __clang__
>   #define ldrplb        ldrbpl
> --
> 2.6.6
>

