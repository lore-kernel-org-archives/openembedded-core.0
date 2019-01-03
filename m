Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 535D579D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:51:54 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id n18-v6so31030162lji.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 14:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5pxxgCn8RA3AYToDegBh8qfDARIr8Ex7ZZbCUXOd3PQ=;
	b=E8YHTWsYsk5WOFboLWbqimS5bF9i+/WXWOGt9TEEDDovgzOhNOR07jxWCG19maKDkW
	g//ifmtcQz2BBD23U8SlKkNCikeH/yaPQ5PKpdx9GxwBwSuDfRpIKqPjrDtJsxE8PZes
	hKB3HyOPJAEeAU7axVo7UpBzaXLKi7m5RWTHAoiA0zyH2hSw79uekpZ9bPWEHKjDuUyx
	pN0M2t9QsAS6L4IrZCZsTFZRKwFpGO3H99xPjBrwISBxpCofgtJe1I+XbknZZ2nXJqJ4
	DtQW01641uIDg9gkOBFJ1gdkQGW8dlT1L97UIxAlUhMqZdfcV014MiNP8KKwV/2U+tJO
	sZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5pxxgCn8RA3AYToDegBh8qfDARIr8Ex7ZZbCUXOd3PQ=;
	b=XNBDTIMLmLan7xtubHOopDuVpJT/VVDF9SaCzKpzwaJZE0d/j9jjArQ5O3XzsDM5Ma
	k2Vle0RbVLGOudUWRM4N3fhivBygkWRXDJCQ2WKlyErQGk3TBowQmr4Ss2PANT6pCR43
	XD4dNitVlmvBjlPjZOTbRryrS8pvrWadAQbH7BUk9nSxxNoucC+s01BHISqoHFI5WLH9
	e0kXUpF60PCOH+xF42Wtb8r8EYJC9zBYMmIaSwhStEtf8etFReK73kTbOTEiSfMuUjMt
	TcCAqhdjQsH3RKA2iV7VmDRjidYSyDtI9HefNASlhV72nxVEWyYoazxJJWU2PLppNmn3
	7Fow==
X-Gm-Message-State: AJcUukfr0h7amj3x2eh+XmYrJ0yW7WGT/HMKtaEoOfSuJ6NiWY0gcg1z
	bN85PLwbovf/fTWwkjdhrGgMIsZDBcarvxA1DKY=
X-Google-Smtp-Source: ALg8bN44xAL/gb1GFfXoSS6h2VVaF/EWRNwgI8aHmP4YxuNRGx9MBTDJT0T3yvaB8yvMq3TkF70OH9IbMuR4VOT9h1E=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr30276084lja.111.1546555914645; 
	Thu, 03 Jan 2019 14:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20190103223211.23531-1-alistair.francis@wdc.com>
	<CAMKF1soQ4jSBtSXCZVHDtk6nHcyKTSG9UFK6-vLETxmoSwkeQw@mail.gmail.com>
In-Reply-To: <CAMKF1soQ4jSBtSXCZVHDtk6nHcyKTSG9UFK6-vLETxmoSwkeQw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Jan 2019 14:51:28 -0800
Message-ID: <CAKmqyKN99yaSkjXVMCjt+HFC+QR-N+yJkrjzVTDSwUaZkcsh2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fts: Bump FTS to version 1.2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 22:51:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 2:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jan 3, 2019 at 2:42 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-core/fts/fts.bb       | 22 ----------------------
> >  meta/recipes-core/fts/fts_1.2.7.bb | 18 ++++++++++++++++++
> >  2 files changed, 18 insertions(+), 22 deletions(-)
> >  delete mode 100644 meta/recipes-core/fts/fts.bb
> >  create mode 100644 meta/recipes-core/fts/fts_1.2.7.bb
> >
> > diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
> > deleted file mode 100644
> > index 02f54086a3..0000000000
> > --- a/meta/recipes-core/fts/fts.bb
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> > -# Released under the MIT license (see COPYING.MIT for the terms)
> > -
>
> I am sad you took this out :)

Do you want me to keep it in?

Alistair

>
> > -SUMMARY = "POSIX file tree stream operations library"
> > -HOMEPAGE = "https://sites.google.com/a/bostic.com/keithbostic"
> > -LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
> > -SECTION = "libs"
> > -
> > -SRCREV = "944333aed9dc24cfa76cc64bfe70c75d25652753"
> > -PV = "1.2+git${SRCPV}"
> > -
> > -SRC_URI = "git://github.com/voidlinux/musl-fts \
> > -"
> > -S = "${WORKDIR}/git"
> > -
> > -inherit autotools pkgconfig
> > -#
> > -# We will skip parsing for non-musl systems
> > -#
> > -COMPATIBLE_HOST = ".*-musl.*"
> > -
> > diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
> > new file mode 100644
> > index 0000000000..7ede6550f6
> > --- /dev/null
> > +++ b/meta/recipes-core/fts/fts_1.2.7.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY = "Implementation of ftsfor musl libc packages"
> > +HOMEPAGE = "https://github.com/pullmoll/musl-fts"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
> > +SECTION = "libs"
> > +
> > +SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
> > +
> > +SRC_URI = "git://github.com/pullmoll/musl-fts.git"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +#
> > +# We will skip parsing for non-musl systems
> > +#
> > +COMPATIBLE_HOST = ".*-musl.*"
> > +
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

