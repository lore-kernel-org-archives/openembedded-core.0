Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1062C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:52:25 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.14110.1635263544490374622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UnXpH0We;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id f1so739859qto.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lrLZcDJlL+D5nve3oWKWuGOyUsECczjzG/cBQRKdFYw=;
        b=UnXpH0WeHrLORKB/TPY2hB+PbZKkD9NwyxbtZiL/3LI36+xfP83No1hWUqPItXEoaY
         jx8xbt4pvtJKFauflSZHXR86bsnww/gheFxi6w8f0+DHMV2koouABjtXHkWENfek+LSo
         gZvAUwRkxu6F6qYeATEiiHNFarjVpnG8I7nvwjl2hb7CZ8I+o8xAzf4KQ/AUnKghoxjv
         PQODG/A0khcBGllzDMWoBzuFcZayGG9gm66uRwzuhhs7cgJ8ZlsQrbGxBIe9FTEexavZ
         7KcC658tuJQL5JaTmh3zSg+BkKDdq/zSfiVAUnUhnJIdHFDNsN85BU9+j+m6L01CT5Gu
         WBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lrLZcDJlL+D5nve3oWKWuGOyUsECczjzG/cBQRKdFYw=;
        b=aUSDWel9PHbMShznEKoQl0k0BoCl7GZbuq9YDOBoOcvI84p3/BluchL5zluEnD0Dfc
         5sLBVCSTmDtzlpCFwtGVPJF35CvRTlSJljJvpJkhJxUXbiKATr3in0uNGFFa535/hWDP
         wn8VlvVSkci9KSqpjZHfB9WD793KKNnageG/xd4hrGZLSQx6lO7lqT9h+2WqXVeAlj1M
         X4XaAZCowY6/fWPz+jOyoDB4gGAaUi3NuLnUqUFG/fgNWBoB6ivYCuHqm3y68ZMalEzI
         FKbRPqU68aF6BEUvE8eW8ZV93X6irNq05VNmsGB77zMReY5avG4bJvV5jceX4EbMlQjF
         0lEg==
X-Gm-Message-State: AOAM533ijdD1LZo/BSF77xkTNtskygI74HV8OR6NlE2TbBljZGDzoSHf
	/C7XlvfgOIQqnQ99mm5vJv0eSDiR0Ej4k7M9kcc=
X-Google-Smtp-Source: 
 ABdhPJyPI82uzbnoCjOUUyciz+IO1QDczz+CduqIhOmzpOx1qrK7IKTZlPm0zMa43GEObd+HgOi8JEi7ZU7db/fp6Dw=
X-Received: by 2002:ac8:1e0b:: with SMTP id
 n11mr24931005qtl.274.1635263543479;
 Tue, 26 Oct 2021 08:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
 <20211026111140.3298966-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211026111140.3298966-3-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Oct 2021 08:51:57 -0700
Message-ID: 
 <CAMKF1spX3O-jdGUxXQrOhjBzAGz6dFa_kR13ZbyLixpgZUu=jQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] gcc: Fix nolibstdc++ patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:52:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157400

thanks, I guess since it was documentation no one noticed it.

On Tue, Oct 26, 2021 at 4:11 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Somewhere along the line the docs patch was corrupted with incorrect
> changes. Strip these out and clean up the patch.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../gcc/gcc/0005-optional-libstdc.patch       | 28 ++-----------------
>  1 file changed, 2 insertions(+), 26 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
> index c921ac3340c..c64fbf6a976 100644
> --- a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
> @@ -55,12 +55,10 @@ diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
>  index 6659a903bf0..9ee63dbe52f 100644
>  --- a/gcc/doc/invoke.texi
>  +++ b/gcc/doc/invoke.texi
> -@@ -239,6 +239,9 @@ in the following sections.
> +@@ -239,6 +239,7 @@ in the following sections.
>   -fno-weak  -nostdinc++ @gol
>   -fvisibility-inlines-hidden @gol
>   -fvisibility-ms-compat @gol
> -+-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> -+-fvtv-counts -fvtv-debug @gol
>  +-nostdlib++ @gol
>   -fext-numeric-literals @gol
>   -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
> @@ -74,7 +72,7 @@ index 6659a903bf0..9ee63dbe52f 100644
>   -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
>   -u @var{symbol}  -z @var{keyword}}
>
> -@@ -15708,6 +15711,33 @@ Specify that the program entry point is @var{entry}.  The argument is
> +@@ -15708,6 +15711,11 @@ Specify that the program entry point is @var{entry}.  The argument is
>   interpreted by the linker; the GNU linker accepts either a symbol name
>   or an address.
>
> @@ -82,28 +80,6 @@ index 6659a903bf0..9ee63dbe52f 100644
>  +@opindex nostdlib++
>  +Do not use the standard system C++ runtime libraries when linking.
>  +Only the libraries you specify will be passed to the linker.
> -+
> -+@cindex @option{-lgcc}, use with @option{-nostdlib}
> -+@cindex @option{-nostdlib} and unresolved references
> -+@cindex unresolved references and @option{-nostdlib}
> -+@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> -+@cindex @option{-nodefaultlibs} and unresolved references
> -+@cindex unresolved references and @option{-nodefaultlibs}
> -+One of the standard libraries bypassed by @option{-nostdlib} and
> -+@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal subroutines
> -+which GCC uses to overcome shortcomings of particular machines, or special
> -+needs for some languages.
> -+(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> -+Collection (GCC) Internals},
> -+for more discussion of @file{libgcc.a}.)
> -+In most cases, you need @file{libgcc.a} even when you want to avoid
> -+other standard libraries.  In other words, when you specify @option{-nostdlib}
> -+or @option{-nodefaultlibs} you should usually specify @option{-lgcc} as well.
> -+This ensures that you have no unresolved references to internal GCC
> -+library subroutines.
> -+(An example of such an internal subroutine is @code{__main}, used to ensure C++
> -+constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> -+GNU Compiler Collection (GCC) Internals}.)
>  +
>   @item -pie
>   @opindex pie
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157385): https://lists.openembedded.org/g/openembedded-core/message/157385
> Mute This Topic: https://lists.openembedded.org/mt/86599749/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

