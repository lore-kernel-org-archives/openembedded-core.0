Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 13E4E7F89C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:01:42 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id i6so4918398ilr.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rZ/Tjr6dESi4GlOGDX4F7Iny9GIF/Ni7g3fJ73qdOMc=;
	b=euxob54ZlXI95Iys4RH0Wi+ZnLyX5kbiMiStfiTSOs7l322UA+ywjPrxsfh5ie2bgO
	rwVJaqxrVDN2Sg/rnBexr6kKh+Q1ctQpaW/3t9eB+Po0lbZ5SqWbhrcMpr4CDOQ/mMus
	dIjU/+/y0irwpaQgOzr3IerdY7wwTMhUXOmsPe6hbXrhzoKuRzMdB0ptoZyDhxD0TCNL
	81Iu9eVhv6V/GDIWa9RKJdAONIqtDnpYdebl0HB3J9rzNsPeX+9XxCXilarLtlEHLIt2
	ITKh1iX7D/9bMeOQ1GuzQNJhdouz1Qq724LtTW7/I2wZKlC1H0D/BseHUjaalFkXCpxX
	XVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rZ/Tjr6dESi4GlOGDX4F7Iny9GIF/Ni7g3fJ73qdOMc=;
	b=E+F7PxMebRug2+/erFmXZ4mCfc2wWQABbxwI2evwQN09xy1zab+C/uqKwqKTOkrfTf
	5GdQpnl1swde9NnQTcyHOSVFZcgL6cl6ma7VbkXSh3ci0P3gjKIHguUirAYZvpvgI+w9
	khT8vmSzAqqHmD3TvNI8DUqoA17GAf6GpI8kHyXIJrQ0zw98Vy3BKa5JtdIc2spEk+Rz
	xz53LOFvLV/Yq3B2HUsnHHbql+oPMNFvW3CiPw/d0kmtn31IgDgSxqFRqAC3o6VH/wkY
	+mIQSrdXN/NbRqWGLoEoH5JDDRkrqnaSV7P5kz5WwzNFzaUTpPymy5BghfAjYtFz5Kny
	jSSw==
X-Gm-Message-State: APjAAAWIs0ahiqr2aqklmpC9/aYVzgig6nRhWj6faID1AiqZIyl71dax
	Yj3jGtRfPoS7peAhlGX89BC9EGuGkWMwSVT0NyClwbbr
X-Google-Smtp-Source: APXvYqwkSATyDuckd/UolxLjZEl2g9duZ/Y/a0P0lovfpUrCBA6B6YBjmw+KUev0I/kp8vSEh44vNLPiP0uHOWQQqDs=
X-Received: by 2002:a92:104a:: with SMTP id y71mr9385847ill.220.1573729304086; 
	Thu, 14 Nov 2019 03:01:44 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
	<7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
	<17c4c8b5-09da-f8f7-effb-b67c33624840@intel.com>
	<CAMKF1srtAu02xK-7QWcnrPsgJ8qCWRLnGc2FKnDZCXAYtui9Ww@mail.gmail.com>
In-Reply-To: <CAMKF1srtAu02xK-7QWcnrPsgJ8qCWRLnGc2FKnDZCXAYtui9Ww@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Nov 2019 12:01:33 +0100
Message-ID: <CAMRc=MfMmfDMWOAH6VnP8WRBKJL7sgQKxGxTmhcr4gfLO3v-HQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pthreads should rdepend on libgcc
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
X-List-Received-Date: Thu, 14 Nov 2019 11:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 13 lis 2019 o 23:37 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a)=
:
>
> On Wed, Nov 13, 2019 at 7:50 AM Ross Burton <ross.burton@intel.com> wrote=
:
> >
> > On 13/11/2019 15:04, Mark Hatle wrote:
> > >> This is because the implementation of __pthread_exit() in glibc call=
s
> > >> pthread_cancel() which leads to pthread_cancel_init() being called i=
n
> > >> which said shared object is being loaded with dlopen(). When this
> > >> fails, the program aborts with the following error message:
> > >>
> > >>      libgcc_s.so.1 must be installed for pthread_cancel to work
> > >>      Aborted
> > >
> > > Fix for this would be to declare a runtime-dependency on libgcc_s.so.=
1 in the
> > > glibc libpthread package.
> >
> > On my todo list for a long time has been:
> >
> > 1) a QA test to find binaries that link to pthread_cancel but don't
> > depend on libgcc_s
> > 2) Automatically finding use of pthread_cancel and adding the RDEPENDS
> > automatically.
> >
> > (2) is definitely the best long term solution, but as Mark says: the no=
w
> > fix is to add libgcc to RDEPENDS.  There's plenty of prior art in oe-co=
re:
> >
> > $ git grep -h RDEPENDS.*libgcc
> > RDEPENDS_${PN}-ptest +=3D "make ${@bb.utils.contains('PACKAGECONFIG',
> > 'python', 'libgcc python3-core python3-logging python3-shell
> > python3-stringold python3-threading python3-unittest ${PN}-python', '',=
 d)}"
> > RDEPENDS_${PN} =3D "libgcc"
> > RDEPENDS_${PN}-ptest =3D "${PN}-modules ${PN}-tests unzip bzip2 libgcc
> > tzdata-europe coreutils sed"
> > RDEPENDS_${PN}-ptest +=3D "libgcc"
> > RDEPENDS_${PN} =3D "libgcc"
> > RDEPENDS_${PN}-ptest +=3D "libgcc"
> > RDEPENDS_${PN}-ptest +=3D "libgcc"
> >
>
> There are two issues here, one is where dependency is missing which
> this solution will address
> however, there could be another problem, where libgcc_s is lazily
> loaded during pthread_exit and
> application is not using root user which many daemons do where they
> use less privileged user to run
> and it would fail in the exact same manner. I also see few other uses
> of libgcc_s.so being dlopened in
> nptl unwind code and libbacktrace in glibc. so even if you were to do
> one of above you won't solve the
> problem. in fact the part this will solve can simply be solved by
> adding libgcc_s as rdep for libc6
> and then if we still get failures of such kind then we know its the
> second problem since we would have
> taken care of the first issue with rdep. Its fine if we want to be
> surgical, but it might be over-optimization

So can I submit such a patch then?

Bart

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

