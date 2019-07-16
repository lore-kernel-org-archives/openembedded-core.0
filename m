Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA277DD6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 07:20:03 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g18so13764672qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KQ2gvcRy9MXj6JGrUnIa/Fky5193ejbe8tzvGkAGxY4=;
	b=fJU14bdZruPKYH0d3YRdvqSOakivKJQF96hiOUZUNlY6mNjJhUpc/ht3WlN80PL4aK
	lKdRU28cR4B3+kZwoBtuXKGVcQOKCURmkBe8fzlVwANBjYjvjbrPHz5GOJQ4lhUoSyCi
	Tj0ITWKxAFtzMvgfQsQMkP9muIgUOEpT2cgR3ybTta1m/YvjGsw6M+mtURrumJerxrlS
	yc/FmwtLUD0eJjlga2gikOKVhYD0kXQDWyHBn3Hllcb+tx+4fqX+X+JS92HiWHtvElg8
	srurFqLEXQApUF2N0tV3tBeTcV7k/6NWTfqhQac8BbsagY8BNBiWNEyZ0HAEtPmEnb1b
	lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KQ2gvcRy9MXj6JGrUnIa/Fky5193ejbe8tzvGkAGxY4=;
	b=Us3vCUqlysntA3I5QPRc+077UMpnJfqPE42vXTiO7xP7xtoK4Bm5ymC8BDFDdLYtql
	kq61196hXVyytY89oA2A5FhzIetK0rb5kZ57DrRUNzeUvN7Kil1aOyfI+0vjSzCTAuHb
	ecBjozcYdEJOi+/lDv+9wevAymOsFtZGiGpVYDCOKeM6dNC8hjZ58jTLVvxUYdWJ7t+m
	sCuCh594UP7J4w1T3RiOL5oxm7YUI0I6R31q1RJiQVH3fDsGupM8fbZMO2zRtlVvFJD4
	8Lr3qJ4vi6WUg7GgQy6z/3SGFghbFxaBZ5e+BmZFlhNaEQ1KKGJ37qq7dY1af5YDvfdb
	khZg==
X-Gm-Message-State: APjAAAXbcrJ0OirlF7DBK792OI1gOkQTyKXywxuALZ+U39p0+0arUlfT
	ulo6UHQLnJU6V62sa/HFRlTJM6hnDwio35gEXFc=
X-Google-Smtp-Source: APXvYqwdc96VrAHj+MYRlzx0yVxB74As+I9m/f7NNwU4TuG/636/Q17R/tr0cbSdtOADgNOcFKI+t1Zgpv/eUGFP4go=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr20407704qkg.337.1563261604097; 
	Tue, 16 Jul 2019 00:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190715102016.114264-1-kai.kang@windriver.com>
In-Reply-To: <20190715102016.114264-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 00:19:48 -0700
Message-ID: <CAMKF1sq8rpdxdH2Yr8bHze06-R3hsmLTDdSLkX-TEj4utY2VYQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: set incomptible with tune mips
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
X-List-Received-Date: Tue, 16 Jul 2019 07:20:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 15, 2019 at 3:21 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to compile webkit when default tune is 'mips':
>
> | .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.24.2
> | /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:
> | error: static assertion failed: CLZ opcode is not available for this ISA
>
> So don't build webkit when default tune is mips.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.24.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> index 056334fff5..891266b220 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> @@ -43,6 +43,8 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>            gettext-native glib-2.0 glib-2.0-native libtasn1 \
>            "
>
> +COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null', 'mips.*-linux', d)}"
> +

this disables is for all kind of mips. I think thats a broad set, it
would be best to narrow it to what you saw it failing for
e.g. it should work for mips32 and mips64 so maybe mips1 is what you
want to disable for


>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
>                     enchant \
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

