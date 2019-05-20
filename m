Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id D3C7B7E0AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 16:28:28 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id u64so1235590oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rvnVrxlxKUzJUODAPKcQJBnFfkUdAV7dYwgRJ/gP9BU=;
	b=CNkxp56Na5+TDQkF+zcVgns6L/gRx/T00krewf30i2ALrUB81nJRf5QMTB1qwhIlWm
	C2z0DrkXoKbhMWwK+nrMFg36GyfYY4m5oZhQAzwkQt2uZ42cwLa1icgcktv/D6TMUGWK
	X4Lz/6Rkw8qt8rHw2hOIQKuG1A+g79YUj77llTqAzSqzwxw92OIu8JOoKYp3OSqRi1ZQ
	k18LsYz76K9txkesnuik2Eh58H9yT8TjcbLp4bKp4qpr/1islk3d6/MNk8PNiHBnY0eQ
	0xCP6vxK3mq43hd0/MkBj7V1YVif42yrk7Rg7WEewwVyXfhP7br5S3DPn/L4kfM4nw7y
	wkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rvnVrxlxKUzJUODAPKcQJBnFfkUdAV7dYwgRJ/gP9BU=;
	b=FvFquGddtEFR6HNM36Ex5c3gOuYjHwHMVZdU/C6jRGB1Ro2nmgLyrjqtUMcVGCeDS7
	wpzh/RlysTkhpfSVB+rOXNm/JzvZiKH+4wERo7i4ZiN3hE/ZEpAEY7Xagn0OEn1PA5Ow
	J+albjXD6kGa+ksmlcgG0Fj1RR51AgJBTOMIjH0K2zylyqdAyLCps+Z6ZEmglDb3UJqV
	GhgLgjxv0/+DcsK8TFPwDUdG5Cne+NQ7UUK+vZCOhoIacLFjKHdgcLe5ahYHzGa6dEKK
	MLuoFmcfXy+Kc92FOgwgTsyVgbCjYHrhXAxB4dz3Kp4x+gfaZ15bY8vxa7Oii2AezWyN
	Pc4A==
X-Gm-Message-State: APjAAAVBbTJxOObLdkFpc5Hjb01KGUYOAoRuXtFjRiiwSzqetLJFDFjI
	p6ybHZURGFr8G2pI2d3/auTrf0yQl9/S4jzzkSE=
X-Google-Smtp-Source: APXvYqzcIJryU4W7+yzP1phylYWNpdH/wcJK9cCJ4etPNKm3BlV6ceX7u1WAoJXmXj27cZvWUzhvNrX+qMAeDFbR2rU=
X-Received: by 2002:aca:d40b:: with SMTP id l11mr5763oig.132.1558369709905;
	Mon, 20 May 2019 09:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
	<e8e8d3b516e2a0e3b30fe2aa1882700f3ad5df43.camel@linuxfoundation.org>
	<9ca3cf5a62ce6c2aaee7e15b68be684184644200.camel@gmail.com>
In-Reply-To: <9ca3cf5a62ce6c2aaee7e15b68be684184644200.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 May 2019 18:28:18 +0200
Message-ID: <CANNYZj-i_B7Rd3Po7nVboKpTCgx4AUu-iUDxJqQBSJJSubuO4w@mail.gmail.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Mon, 20 May 2019 16:28:29 -0000
Content-Type: text/plain; charset="UTF-8"

I think you need to reset RDEPENDS to an empty string for the native
class. This is a long-standing problem, where bitbake is not able to
fulfil RDEPENDS for native variants, if said RDEPENDS contains
anything except recipe names.

Alex

On Mon, 20 May 2019 at 17:05, Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Mon, 2019-05-20 at 15:14 +0100, Richard Purdie wrote:
> > On Thu, 2019-05-16 at 22:09 +0100,
> > luca.boccassi@gmail.com
> >  wrote:
> > > From: Luca Boccassi <
> > > luca.boccassi@microsoft.com
> > > >
> > >
> > > The pkg_resources Python module is useful by itself, for example
> > > for
> > > automatic loading of resources shipped in a Python package.
> > > Add separate packages for it, so that users can depend on them
> > > individually and avoid pulling in the entire setuptools, which
> > > include scripts to download other packages, which might not be
> > > desired on minimal images.
> > >
> > > Other distributions like Debian and Ubuntu already split setuptools
> > > and pkg-resources in this way.
> > >
> > > The setuptools packages now depend on the new pkg-resources
> > > packages,
> > > to avoid regressions for other packages that depend on them
> > > already.
> > >
> > > Signed-off-by: Luca Boccassi <
> > > luca.boccassi@microsoft.com
> > > >
> > > ---
> > >  meta/recipes-devtools/python/python-setuptools.inc | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> > > b/meta/recipes-devtools/python/python-setuptools.inc
> > > index 357aa07086..ad00cbe0ef 100644
> > > --- a/meta/recipes-devtools/python/python-setuptools.inc
> > > +++ b/meta/recipes-devtools/python/python-setuptools.inc
> > > @@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
> > >    ${PYTHON_PN}-html \
> > >    ${PYTHON_PN}-netserver \
> > >    ${PYTHON_PN}-numbers \
> > > +  ${PYTHON_PN}-pkg-resources \
> > >    ${PYTHON_PN}-pkgutil \
> > >    ${PYTHON_PN}-plistlib \
> > >    ${PYTHON_PN}-shell \
> > > @@ -37,3 +38,6 @@ do_install_prepend() {
> > >  }
> > >
> > >  BBCLASSEXTEND = "native nativesdk"
> > > +
> > > +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> > > +FILES_${PYTHON_PN}-pkg-resources =
> > > "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> >
> >
> > This breaks native builds:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/614
> >
> >
> > (and many other similar failures)
> >
> > Cheers,
> >
> > Richard
>
> Hello Richard,
>
> Thanks for the heads-up, any suggestion as to why the above patch
> wouldn't be enough to build both native and target binary packages for $python-pkg-resources?
>
> --
> Kind regards,
> Luca Boccassi
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

