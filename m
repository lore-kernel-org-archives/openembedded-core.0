Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F41BD6D548
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:25:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z7so35767902wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=924K7z46BoxMxagUF91cmSHdQ7y+5961ezFT8ejiySk=;
	b=kdESg4kKscIosmlNWh4YOOfLzPvRRR5+b/rHQXbZlYckFu4subq8caAJuCXnytBl7s
	7nGdaiRVV7L1xtFxIVwZ/rWvDjay7al+TUDPOe/iZApz8SQJxkfGvc5mvTft6aVm7OXq
	z4FxYYpiLQWaK2veizRDrpb6lncsYyo2V3DaaDUY6uwN21wircaYGDSHeM5rJkUvhWpy
	2oQUCZKGzrwPsVgjn7d4qff4xauxrjyFd/nkva6KJLmkeP8e1LVZcdKKvwVnaYn7xBE0
	7RD5mmg1v83sY4UxeATytFdQ2DaFnngspZLzJzc8MwmX9VU8c0WM97Z22tCEsc4BDmVe
	dsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=924K7z46BoxMxagUF91cmSHdQ7y+5961ezFT8ejiySk=;
	b=Tf3EolVL8j5fD9T0i8sdnHdXhNrtv/0cTLF5WgjyfKkwWJj4n7D8ZjQGjYt5x/mWwb
	gQFnT6f4K/iaoib6AONNBIen6kp0XoGANR3lKD7P3rU5SNC5s1cBdKIGE7bVDNoIh90Y
	zHyl8TfJX6gVB0FeS9M2jkiVqGsGDuoA0ZmtRxDI2g2T8Ob7ffZdBwZEdV3SNizRrloL
	Lax9fARiltqOFMfNTjJUqFB3SSDltVRvrvWX3066/LYM2wmenSMpPDEMWp4HA+6Alu0Y
	ne5bxPijMt4595QpPXmVsnqGnNVxhifkpp40Hilbou/Qfgh2b5rb0tRlpxqncXpFD7jJ
	NcXg==
X-Gm-Message-State: APjAAAXtNaepoZSDJyU2/AKYsUi/HWGN+GDn06nGBWMdx3b7VltCXgb6
	WTpi/yDxUVckrsnhZlGROLjEs9dwlpxQCsq/SA8=
X-Google-Smtp-Source: APXvYqxWZ0Q44whUvGbvIFru4mp3wXN/E2HbdZ1l015o52w9y04V8iTA9c7NwWWMDEmCI09Pdz1CwIBKbAi7fYkwBQw=
X-Received: by 2002:adf:e290:: with SMTP id v16mr76495726wri.16.1577820351607; 
	Tue, 31 Dec 2019 11:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20191230205941.1878175-1-JPEWhacker@gmail.com>
	<20191231190657.2411408-1-JPEWhacker@gmail.com>
	<CAMKF1srq0Y67L7bKRSCREfjJ6G23M+UuxVJh=C69ugt3CUjrXQ@mail.gmail.com>
In-Reply-To: <CAMKF1srq0Y67L7bKRSCREfjJ6G23M+UuxVJh=C69ugt3CUjrXQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 31 Dec 2019 13:25:40 -0600
Message-ID: <CAJdd5GaWnVcSteVPQjsJjON5_un-T5wdZ2oKAqACfW9MkDyqMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: RDEPEND on libgcc
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
X-List-Received-Date: Tue, 31 Dec 2019 19:25:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 31, 2019 at 1:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Dec 31, 2019 at 11:07 AM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > Python uses features of glibc that require it to dynamically load (i.e.
> > dlopen()) libgcc_s at runtime. However, since this isn't a link time
> > dependency, it doesn't get picked up automatically by bitbake so
> > manually add it to RDEPENDS.
> >
> > There is an outstanding bug in Python to make it explicitly link against
> > libgcc at link time which would remove the need for this. See:
> > https://bugs.python.org/issue37395
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python3_3.7.5.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
> > index 137b540dba..78312b05f3 100644
> > --- a/meta/recipes-devtools/python/python3_3.7.5.bb
> > +++ b/meta/recipes-devtools/python/python3_3.7.5.bb
> > @@ -306,6 +306,8 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
> >  PACKAGES =+ "libpython3 libpython3-staticdev"
> >  FILES_libpython3 = "${libdir}/libpython*.so.*"
> >  FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
> > +# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
> > +RDEPENDS_libpython3 += "libgcc"
>
> while this is glibc specific change depending on gcc runtime, it seems
> we should only apply is when we use gcc runtime and glibc
>
> glibc part is easy just use libc-glibc override for gcc runtime piece
> perhaps, its good to introduce, virtual/compiler-runtime and let
> libgcc
> provide it by default, but let apps depend on virtual/compiler-runtime

I'll use the libc-glibc override so that it's specific to glibc, but I
think the virtual/compiler-runtime might be a bit premature, unless
you know of a usecase where it would currently be necessary?

>
>
> >  INSANE_SKIP_${PN}-dev += "dev-elf"
> >
> >  # catch all the rest (unsorted)
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

