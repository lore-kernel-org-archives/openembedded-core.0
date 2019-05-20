Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F94D7E0D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:57:25 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id e9so5657231uar.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wZvoiO/EWE+Q9GVW5L46KMzcSiL1N4DVa9eaipvWDsI=;
	b=kS2I/BUQew5ZfXqi42TRBJ+fqzxuGXq5t683Z7u7M9rdvs39SJF4Ce0tEwcqUVVR3e
	8LJ0a32PIxhhbSccaVWhlhzERsJrlfCzt8PccpDVWkf9Ru1xT3PMLym7JKF6HF4dCuZR
	1A1NBY4y8mPQ7sFKBBuXqyPfLxkxg1I46xEioqhGhXrlFXOqsdgOAtnFvdTY+oSLEzak
	+PRYPoH9L4AmoSU9T5VTRMjs8z0Af5D2QrMc9rIE9gDxNHI5YNLq6KJoUC6g6lYYZMF/
	OgMzpTH/OZBBbUjHdx8CpO7eEJsTU3aTL60rRKBdqI3MfFqBTWKh16lsLTb4KEs6hEau
	7VAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wZvoiO/EWE+Q9GVW5L46KMzcSiL1N4DVa9eaipvWDsI=;
	b=nq9NcG70RnygfXOxQDXL6CeyLrZ9YvSzQmBYGrYvDzNDOd4njVrnpcAeWyettVfQuz
	rriBHHA5qP1rYC6/X577g5aEtFdz1KCbIckHEL3D+pqHPVlegPVsp4isgpG8DKBMqF8L
	yABym4id6bSY6ifBy8Yyw4O2/oxZYJawa6FnuO3plF7/+4YnEIu+R0mrmlY7lluKd2mF
	7S+FB9Ufc25JC/IqKl11Bg2I7ENpRAmChnHJMhmcZyIqSd35cvC9XgqmCneAyyb4P0x6
	kWa4EGFneNCgGCBrLFw47/I/ICztoM8biHWweQQqddf2yy/GF1UlPCRZy8Mjf7QR3xRH
	chFQ==
X-Gm-Message-State: APjAAAVNAdsYiwR+e5/76EoMdDgx8+laTvbew2+gkC4Pc7+GaY1yeKnK
	u8xhDyslGFDzKcQDjUdduizEuhG0azMxLvhovRE=
X-Google-Smtp-Source: APXvYqxyv0dMWQIYH8YJfnvrWF4dupabmZbNqgVWYPHJ/I5JruGkmJ4ACwyjxl4ZigEmfV8SOTRAJfpij/ZcFd7F75k=
X-Received: by 2002:a9f:3045:: with SMTP id i5mr24246234uab.81.1558378646014; 
	Mon, 20 May 2019 11:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190516114914.12427-1-richard.purdie@linuxfoundation.org>
	<20190516114914.12427-2-richard.purdie@linuxfoundation.org>
	<4744125d-7cce-3325-414b-f05c5fe01a52@gmail.com>
In-Reply-To: <4744125d-7cce-3325-414b-f05c5fe01a52@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 May 2019 11:57:14 -0700
Message-ID: <CAJ86T=WLB8HGdDC-YEOvAp7zdB77Es-QhbQs10c0kXeHPP3v7A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] apr/apr-util: Add ptest dependency on libgcc
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
X-List-Received-Date: Mon, 20 May 2019 18:57:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 20, 2019 at 11:43 AM Khem Raj <raj.khem@gmail.com> wrote:
> On 5/16/19 4:49 AM, Richard Purdie wrote:
> > Avoid:
> >
> > libgcc_s.so.1 must be installed for pthread_cancel to work
> >
> > when running the ptest without libgcc.
>
> this is interesting, do we get this error explicitly from running some
> tests ?
>
> I wonder why libgcc is not detected during rdep calculation time.

Other questions... why does it only affect ptest and not other use
cases? Is calling dlopen() on libgcc glibc specific? If so, perhaps a
better fix would be to add the rdep to the glibc pthreads library?

> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/recipes-support/apr/apr-util_1.6.1.bb | 1 +
> >   meta/recipes-support/apr/apr_1.7.0.bb      | 2 ++
> >   2 files changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
> > index 0c90f8d2527..1f9fea25d87 100644
> > --- a/meta/recipes-support/apr/apr-util_1.6.1.bb
> > +++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
> > @@ -79,6 +79,7 @@ INSANE_SKIP_${PN} += "dev-so"
> >   inherit ptest
> >
> >   RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-iso8859-1 glibc-gconv-iso8859-2 glibc-gconv-utf-7"
> > +RDEPENDS_${PN}-ptest += "libgcc"
> >
> >   do_compile_ptest() {
> >       cd ${B}/test
> > diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
> > index a58651d0774..09a65bfdd68 100644
> > --- a/meta/recipes-support/apr/apr_1.7.0.bb
> > +++ b/meta/recipes-support/apr/apr_1.7.0.bb
> > @@ -53,6 +53,8 @@ do_configure_prepend() {
> >   FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
> >   RDEPENDS_${PN}-dev += "bash"
> >
> > +RDEPENDS_${PN}-ptest += "libgcc"
> > +
> >   #for some reason, build/libtool.m4 handled by buildconf still be overwritten
> >   #when autoconf, so handle it again.
> >   do_configure_append() {
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

