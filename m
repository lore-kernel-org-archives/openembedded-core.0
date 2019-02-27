Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7EA7C6B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 22:01:16 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id j8so16877996uae.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 14:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EpvFafp2CJYDTKTkGHmdGj1Rr+Fnf7aekDdMCr4z7Mc=;
	b=ipiRr2x71X6OBCEZSddyWbVOgGJebEh5qmj2D9PwH7OFIzP4aOQlxHf7PdZvrjh9bw
	18v09wyElCKrQ4L2KaY+POniZB3gN1WswcvkhY+tjl2JerPiCq7BcmaOnF8l9RvOZKvJ
	L4qeWuvAdUwhtKJianC+m2ypajcRqh4tOG5X/CjfQVRsdzTTlKfO0By9aT0fQuP9N36J
	JSc3E8G6Nm9js3gvBN06q33erUHGOW79Zw9hkB/dyw+FDONiEgslrbbkzgEghXW56uVL
	lXMG1oY/xLUiq1WTe+xo4eO1Uls8IIfqHYhhTDvvq6g+OydBnB4ALmF0qWQlFMV3egz/
	bonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EpvFafp2CJYDTKTkGHmdGj1Rr+Fnf7aekDdMCr4z7Mc=;
	b=Kjnhz2jl1tTQb0/0Y5zLtswjfHH9ppQHAaCpj7ig6rlhb9Im0LfkzsgnJBxR8fNvwm
	HMdsAFVrMzezJ4UXwoloHRAKQsx1VoZOGspp2T9LLjF4ZzIZS1gVc+ZHRgbL3XCRYqyJ
	EdZZSc9Up9F+uEFLm06WOmm8gzG8bou+mBV7egyG9ukfm5Rsz1o1qlFQpy1+dQBG1Qg+
	wucpAGwM11Co4jRzY7c0bfKZewQe/Hsvi0ii/1Mlb9NCqJOgaRUKmg8KfD+f8sUMTN4L
	5z5GK2VvjaZlaawMlTwKNXOZ1qITwoOTC2+qLeOcNZSbhaMglcoi/gD22LNkKEk5O2IU
	cp8w==
X-Gm-Message-State: AHQUAuZ9feekptGVybtl7Fh5KlCmcCMLOtx3sjAULt2TnSMapxEbHIjQ
	Hw8unIKxlI/eBj9wEj6rLffWez3JWeq9SUGkjAA=
X-Google-Smtp-Source: AHgI3IYKlIFwp3/DXG89ZVcXNZslmXInrqDr3jj87QuBrzw61LD6Eqt0XkZugEGWMjbS1vl2WbPTUcHhoEM3eNpsrnc=
X-Received: by 2002:a67:c914:: with SMTP id w20mr3237343vsk.223.1551304877235; 
	Wed, 27 Feb 2019 14:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20190227205042.44813-1-raj.khem@gmail.com>
	<20190227205042.44813-2-raj.khem@gmail.com>
In-Reply-To: <20190227205042.44813-2-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 27 Feb 2019 14:01:06 -0800
Message-ID: <CAJ86T=WH03EBVFh-OU=pKDcsKL-YK3efEzHXDmwouGjvp7z9GQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Disable Werror when building with debug options
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
X-List-Received-Date: Wed, 27 Feb 2019 22:01:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 27, 2019 at 12:51 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Since compiler does not optimize away a lot of stuff we end up with
> Werrors e.g.
>
> ./sysdeps/ieee754/flt-32/s_log1pf.c: In function '__log1pf':
> ../sysdeps/ieee754/flt-32/s_log1pf.c:114:22: error: 'c' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   114 |        + (k * ln2_lo + c))) - f);
>       |          ~~~~~~~~~~~~^~~~
>
> which otherwise wont happen, so lets build with warnings-as-errors
> disabled in debug mode
>
> given we disable werror, now we don't have to restrict user to compile
> without -O0

Did you actually test with -O0? Even if it builds, there may be issues
at runtime:

  https://sourceware.org/glibc/wiki/FAQ#Why_do_I_get:.60.23error_.22glibc_cannot_be_compiled_without_optimization.22.27.2C_when_trying_to_compile_GNU_libc_with_GNU_CC.3F

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc.inc     | 9 ---------
>  meta/recipes-core/glibc/glibc_2.29.bb | 1 +
>  2 files changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 67af396133..a382a22b73 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -2,15 +2,6 @@ require glibc-common.inc
>  require glibc-ld.inc
>  require glibc-testing.inc
>
> -python () {
> -    opt_effective = "-O"
> -    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
> -        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
> -            opt_effective = opt
> -    if opt_effective == "-O0":
> -        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
> -}
> -
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
>
>  PROVIDES = "virtual/libc"
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
> index bd8aa6d503..9b6fab066b 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -90,6 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --disable-crypt \
>                  --with-default-link \
>                  --enable-nscd \
> +                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
>                  ${GLIBCPIE} \
>                  ${GLIBC_EXTRA_OECONF}"
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

