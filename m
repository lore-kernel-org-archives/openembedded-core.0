Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1FC6BE39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 15:56:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id 2so7378079qtb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 07:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B4+V+ak1M/gejvp8txPeDi+EV46A88vkA9MZccgWQ7g=;
	b=O0eii9m4vBx86SVSuLeKyt1GHZ2yXZOyG74IfYfFsFsUMQLO36SkxJKf0/jk3D+iOl
	KRpbbeb9qmn5daPqiWrcnIK/4mrKQoV7IbpYHOv9cQs7vrjHD4w+CFDzs0yfAVBySkcR
	U7nA/D5LaM8iuLcSZFVeyfEYsr5jhuu9aE8lyNRQ04h33kp3DKI+lOMfYR8dCEEFOy+O
	3GFUMGQ/4UaeIZIN2W2jh39iPnVfIDjQ5dyqiiQKHNaQYdWyqC/W7NYkjpfa22dq1SZj
	rM+FcxEevKw91W/bj3EyXfKn2xJs7NfM+KVTcaUSHAeXW/sx7KP5IRRjTnPxSklWMYs8
	1iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B4+V+ak1M/gejvp8txPeDi+EV46A88vkA9MZccgWQ7g=;
	b=pAaCiJ0ZaTAq+Do7U83lkROqXdhEHOZC9u2OwGUWw+P9HjjlSHdhnIJigqDTKDj8Qx
	yd+z6DcNUVxHk37V3dDbSE1Rirn0y5XLMckwHbhGBtGqZI2DyFbKrDID3r7+TFHR0EsY
	jmfRZnY78XPdCAh12N/OkY2qgy1NvEKarx+VPWsfspd545Pg8C8MdxWcic3lgEXqkhbW
	/6oTYc7VEDpS5DSDHkpJyJTI+U6e9nLGWIPFtU2oEzrhcxSR0YNTEAgnRejerpLjVO2L
	ZQ0d9gyU0XpKgbSa7wlpLho8XUeKnnLZ9Io+sJss1nH0/Peb3HAFusEqxPF0csmdUXAo
	kalQ==
X-Gm-Message-State: AHQUAuZF0cH31Dgd+l1eB3uxH90iIROm8np8M/cEHMycq2dB5vyB44HG
	DONsdsR02Xh0pCIL1DXh6Q/jmW096lBRaMUm0Eo=
X-Google-Smtp-Source: AHgI3Iay5UjpjBEm+9AyJ7KiVyJ3mN/3dEp+bkYWJyB4UYKk+64/8cvckV7EGtycFt/yAzWfTWOuSnlTyCSZYapkCZA=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr3565094qta.254.1550159810882; 
	Thu, 14 Feb 2019 07:56:50 -0800 (PST)
MIME-Version: 1.0
References: <532d6b9d7e8349699b24514c80ef8be9@XBOX04.axis.com>
In-Reply-To: <532d6b9d7e8349699b24514c80ef8be9@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Feb 2019 07:56:24 -0800
Message-ID: <CAMKF1spgmzAczHO27m5B48UKG6qE0N705C-kTUfTpWMdNBNxLw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libc-package.bbclass: Use install utility to create directories with right permissions
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
X-List-Received-Date: Thu, 14 Feb 2019 15:56:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 13, 2019 at 10:05 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 12 februari 2019 06:48
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 2/3] libc-package.bbclass: Use install
> > utility to create directories with right permissions
> >
> > Could fix issues where dirs with wrong permission is created with mkdir -p
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/classes/libc-package.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-
> > package.bbclass
> > index 0b4c666a74..34025635ce 100644
> > --- a/meta/classes/libc-package.bbclass
> > +++ b/meta/classes/libc-package.bbclass
> > @@ -61,7 +61,7 @@ LOCALETREESRC ?= "${PKGD}"
> >  do_prep_locale_tree() {
> >       treedir=${WORKDIR}/locale-tree
> >       rm -rf $treedir
> > -     mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
> > +     install -d $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
>
> This does not change anything (install -d and mkdir -p does the same thing).
>
> >       tar -cf - -C ${LOCALETREESRC}${datadir} -p i18n | tar -xf - -C $treedir/${datadir}
> >       # unzip to avoid parsing errors
> >       for i in $treedir/${datadir}/i18n/charmaps/*gz; do
> >               gunzip $i
> >       done
> >       tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/${base_libdir}
>
> This is where the problem happens. When the files are copied from
> ${LOCALETREESRC}, the ownership of $treedir${localedir} is changed to that
> of ${LOCALETREESRC}${localedir}. However, I now realized that the problem
> may be due to the fact that I have usrmerge enabled in DISTRO_FEATURES,
> which causes the above line to copy things it was never meant to copy, in
> this case ${LOCALETREESRC}${localedir}. I tried to just remove the line
> altogether and then it built just fine. But I do not know what the
> consequences are of removing it... I guess it is related to setting up an
> environment for qemu to run in, but since that seems to work fine without
> the files copied by the above line, maybe it is not needed? Or maybe it
> is just not needed when having usrmerge in DISTRO_FEATURES? I tried to
> backtrack it through the commit logs, but it was introduced with the
> do_prep_locale_tree() function, so no help there.
>

I wonder if we should use --preserve option to tar -xf call here for
making it explicit.

> > --
> > 2.20.1
>
> //Peter
>

