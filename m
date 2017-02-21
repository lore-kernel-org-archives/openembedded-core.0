Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E886060291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:33:27 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n127so6759505qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 02:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c+sjXjMibz1baMorhit0gHT+ylfnh08lUKtj2Iq6Fnw=;
	b=QFaYNPfTLw30jQllHbwudWsTJUfZV3DFdlquqdjsgHEgGeL0thV1SHxUhcs8YyXCZe
	brWo6jnNnT0L6O9sLRGRLJkJugawuWSlbtuPlYcA5YqRO9tYL+3nV+v3KqopqrJALahL
	wXi9C7FoZIiMzrY+Bte7tdmZVwmkhL+IhOArqnmFDz3Y5mz03iIlGy2ZW0mJfPSPUZvI
	+PjWkTPGYmTTHg9QZ+E/WjCTF1Dl8SRwrKgX5ilvyAmb4HsPgStV9x/tFOkUOjAR7Rtv
	8KP3MtW7U18Y8XJ2awlwokJQ+7nNF8xVTkZYhTIHstWkBNbfEaS+t4nxclRvTbJdUDWC
	Ks4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c+sjXjMibz1baMorhit0gHT+ylfnh08lUKtj2Iq6Fnw=;
	b=X43ziaVysUr8IFwV9j978IyGwAexBr2AkUomxXbbOUbU8PFGYgtqY3Z2zC+KzabfjE
	fuwJVob+6k0JlY8BYP2aLv+95u5pqovdsq3nnXCQKD8PSrDcXG2BGa1kT1tnAR4Df0Im
	O2f3OjiXaIXey7zgTwMUJ1B/GuoC0sjU5G6FXnYWf0WfIQZNwoHsUW3esUpQfjlXfjM4
	eSx9RaRN+ANlAKJ5/6dRCtYEMUL0cTdatQ3axx50oSPnySGoSEuAaCHe9ikepgKD4ReP
	G/W4OXi/BGRVwiZN+1NLJp6JwFe7kCiyEM9+yE53RHYgw6JwJJr5r3LJpHAs9eIpZeG2
	mB0w==
X-Gm-Message-State: AMke39mI2crRWV91tgXYI7fRJOxQP8Ue1C6n5YaSZFdrQLNdwnNvV0snIAyK23GhU9hrpHylP6JJoo3T1Q+jgA==
X-Received: by 10.55.44.197 with SMTP id s188mr23128416qkh.131.1487673208909; 
	Tue, 21 Feb 2017 02:33:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.136.75 with HTTP; Tue, 21 Feb 2017 02:33:28 -0800 (PST)
In-Reply-To: <20170130074351.32016-1-nathan@nathanrossi.com>
References: <20170130074351.32016-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 21 Feb 2017 20:33:28 +1000
Message-ID: <CA+aJhH2W=uUogdhHb-wJ4dXOL-R41SzE7xCQQ7O2urmwFJDSDg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alistair Francis <alistai@xilinx.com>
Subject: Re: [PATCH] gettext_0.19.8.1.bb: Add 'gettext-libintl' package
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
X-List-Received-Date: Tue, 21 Feb 2017 10:33:30 -0000
Content-Type: text/plain; charset=UTF-8

On 30 January 2017 at 17:43, Nathan Rossi <nathan@nathanrossi.com> wrote:
> Whilst gettext is not the default provider of libintl for most libc
> configurations it is possible for it to be the provider of libintl. In
> the cases where it is provided it should be shipped in a separate
> package so as to allow for it to be included without pulling in
> additional gettext content/dependencies.
>
> This change adds a package called 'gettext-libintl' which ships the
> libintl shared objects (and is otherwise empty if libintl is not
> provided). This allows for the library to be shipped without the
> additional components included in the gettext-runtime package.
>
> This package is prefixed with 'gettext-' to define the source of the
> library due to the existence of multiple providers for libintl.
>
> This change also makes the libintl*.so and .h packaged into the
> gettext-runtime-dev package by default. Removing the need for a uclibc
> override to handle packaging these files. Targets that don't intend to
> distribute these files already remove them during the do_install stage
> (e.g. musl).

Ping, any comments or feedback?

Thanks,
Nathan

>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index 7b8c1e8eb4..2af7373209 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -66,6 +66,9 @@ PACKAGES =+ "libgettextlib libgettextsrc"
>  FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
>  FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
>
> +PACKAGES =+ "gettext-libintl"
> +FILES_gettext-libintl = "${libdir}/libintl*.so.*"
> +
>  PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
>
>  FILES_${PN} += "${libdir}/${BPN}/*"
> @@ -82,15 +85,12 @@ FILES_gettext-runtime = "${bindir}/gettext \
>                           ${libdir}/libasprintf.so* \
>                           ${libdir}/GNU.Gettext.dll \
>                          "
> -FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so.* \
> -                                             ${libdir}/charset.alias \
> -                                           "
> +FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/charset.alias"
>  FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
>                        ${includedir}/autosprintf.h \
> +                      ${libdir}/libintl*.so \
> +                      ${includedir}/libintl.h \
>                       "
> -FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.so \
> -                                                 ${includedir}/libintl.h \
> -                                               "
>  FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
>                               ${mandir}/man1/ngettext.* \
>                               ${mandir}/man1/envsubst.* \
> --
> 2.11.0
>

