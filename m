Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id A2FCC7C4BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 19:52:29 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v10so17029175qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 11:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VEJtQxxVEzvbYtYZqreA8Xsw1Whxy838MmRyPkGpmuM=;
	b=AyEe9H6fsp5ZXfWbfmePQwcGPRdK4+QcOjIy31PrFwyiJnMWMOJ6M5xzkojxksm40E
	gzb9kWr1klymTRWyy4cdGdLqGjmdkvDDtbAQJ69DmW6MtMmZ91Cc78MC7+Xk99VZLiXs
	TLrAkXFRipmnYXDS0VyZRm9pD6vbLaa0u4Uud0Go/QXY+jIUTTpGTNDyQ8NMgECjIPsv
	RIAqXZF2kF0YHVvFcl1S4Irh9e5yTR3we7DPkFcV4wI2xl1fKrAxltFtPktTf/Q1sDeO
	jb8sTKStoMWDh5hnfsJM9eimj6Jkv7be8FdtWA5lY23B9KZ7gXYpaSCdOizAcycGa01t
	gLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VEJtQxxVEzvbYtYZqreA8Xsw1Whxy838MmRyPkGpmuM=;
	b=CqjTSzkTduDx6ML4Gj1OtJTr+25XH28ZKeYZLaIE+V1rQR8i73pHU4Or4RMSiIp313
	iuyv1XxAgu3UnVW6WgtBRrSDXIfb6LvGF2FOXKBtxEABuHp3tSijto8GeiEhzw0eEnuq
	c9wdBzyfc/vWg2ucjMR3PiYPUk3bCo9tGOJAFhpj7pq11d3ehTMJxvORJvpG8CJ9piT0
	60v9dTE3QWoPhZS/bDiqNkuO5A+/oQjVz9Psg8K5zWq7RQnRACi94n65lH5eL/UOni87
	wtvTTcQasVTf/gB0auFRAa5dMm4bHh/zAxPvfqOZtZlVvZOCZOU4CKR02VdttDEohF82
	08aA==
X-Gm-Message-State: AHQUAuYSn8udw93NchW5YwFYAoqgyBJpCEQoVsssYnuXcpdyZG6r++t2
	AItNWVOo7Z9THFpFZMXAcwYnl5JXz974V1LAH/QxiA==
X-Google-Smtp-Source: AHgI3IZd+5k1He6krGxqAuZtwfgRiTVWcOGFKX8Kpl1nbHDSRkj/AxZgFXM6vzobHRkTJXmkigDOrPBq+QbmY0bH3gk=
X-Received: by 2002:ac8:67d3:: with SMTP id r19mr15360935qtp.196.1550433150244;
	Sun, 17 Feb 2019 11:52:30 -0800 (PST)
MIME-Version: 1.0
References: <532d6b9d7e8349699b24514c80ef8be9@XBOX04.axis.com>
	<CAMKF1spgmzAczHO27m5B48UKG6qE0N705C-kTUfTpWMdNBNxLw@mail.gmail.com>
	<390b6cbcc6ed4789920483803133b986@XBOX04.axis.com>
In-Reply-To: <390b6cbcc6ed4789920483803133b986@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Feb 2019 11:52:04 -0800
Message-ID: <CAMKF1sravd6RPfKZ_snjs92P3-+fSkEbaikFHpDSPtdb9oZ7YA@mail.gmail.com>
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
X-List-Received-Date: Sun, 17 Feb 2019 19:52:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 17, 2019 at 7:04 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 14 februari 2019 16:56
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/3] libc-package.bbclass: Use install
> > utility to create directories with right permissions
> >
> > On Wed, Feb 13, 2019 at 10:05 PM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-
> > > > core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > > > Sent: den 12 februari 2019 06:48
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: [OE-core] [PATCH 2/3] libc-package.bbclass: Use install
> > > > utility to create directories with right permissions
> > > >
> > > > Could fix issues where dirs with wrong permission is created with mkdir -p
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/classes/libc-package.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> > > > index 0b4c666a74..34025635ce 100644
> > > > --- a/meta/classes/libc-package.bbclass
> > > > +++ b/meta/classes/libc-package.bbclass
> > > > @@ -61,7 +61,7 @@ LOCALETREESRC ?= "${PKGD}"
> > > >  do_prep_locale_tree() {
> > > >       treedir=${WORKDIR}/locale-tree
> > > >       rm -rf $treedir
> > > > -     mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
> > > > +     install -d $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
> > >
> > > This does not change anything (install -d and mkdir -p does the same
> > > thing).
> > >
> > > >       tar -cf - -C ${LOCALETREESRC}${datadir} -p i18n | tar -xf - -C $treedir/${datadir}
> > > >       # unzip to avoid parsing errors
> > > >       for i in $treedir/${datadir}/i18n/charmaps/*gz; do
> > > >               gunzip $i
> > > >       done
> > > >       tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/${base_libdir}
> > >
> > > This is where the problem happens. When the files are copied from
> > > ${LOCALETREESRC}, the ownership of $treedir${localedir} is changed
> > > to that of ${LOCALETREESRC}${localedir}. However, I now realized
> > > that the problem may be due to the fact that I have usrmerge enabled
> > > in DISTRO_FEATURES, which causes the above line to copy things it
> > > was never meant to copy, in this case ${LOCALETREESRC}${localedir}.
> > > I tried to just remove the line altogether and then it built just
> > > fine. But I do not know what the consequences are of removing it...
>
> It turned out that the consequence is that if one actually does use qemu
> to generate the locale files, then it fails without that line. However,
> since qemu is not used by default for this since quite a long time ago,
> it is not needed in the normal case.
>
> > > I guess it is related to setting up an environment for qemu to run
> > > in, but since that seems to work fine without the files copied by
> > > the above line, maybe it is not needed? Or maybe it is just not
> > > needed when having usrmerge in DISTRO_FEATURES? I tried to
> > > backtrack it through the commit logs, but it was introduced with the
> > > do_prep_locale_tree() function, so no help there.
> >
> > I wonder if we should use --preserve option to tar -xf call here for
> > making it explicit.
>
> I have added a pattern to the tar command that unpacks the files so
> only the files that are needed by qemu are unpacked (see the patch
> series I just sent). That should avoid the problem.
>
> However, I wonder if anyone actually sets
> LOCALE_GENERATION_WITH_CROSS-LOCALEDEF to 0 (it is 1 by default), and
> uses qemu to generate the locale files? It takes quite a lot longer
> (four times on my machine, totaling nearly half an hour). Otherwise,
> if we removed that, the code could be simplified and avoid the copying
> of these files in the first place.

I think the option to not use cross-localedef should be kept alive,
even if its slower, its
helpful in cross validating issues when we might have them with cross localedef

>
> > > > --
> > > > 2.20.1
> > >
> > > //Peter
>
> //Peter
>

