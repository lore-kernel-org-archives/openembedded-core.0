Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 55CA27E4C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:29:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id w25so8638640qkj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aMOq/bGkAZ6Vy2OHJV+feT0QOLi88JFoO7SjGiy0Dx0=;
	b=qQJgerXdO+udqAzqYfdPwxGiZj9V6YtnffP5MtQ4x9LHqPcQ2+/XiCghqYg3tuJNDo
	7AdEBRZzw98SXtBYb2Pm04hmoSmDRsPTWJj4vzNjzHrKkudRCUPVMtGBcqv1YTYE2ADO
	NLlYAchHlVpEjGjn2DTmcisCZVakAc7eOxW5Q4SPx8R2rS3VEmh6fTecwzUbzRLox/cW
	woFakHWRKX2wPUi/Uci3BwAJhLSYzj2btGNJoJ2sQCjd9O/e5j/63sxsjRzI/07epVwl
	no7nLnpZM0Ifl81bhxrlechL3+jUrgIR8yfrbYO0IDo0gU2apHV1K2CNweI+k970A7tH
	Qfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aMOq/bGkAZ6Vy2OHJV+feT0QOLi88JFoO7SjGiy0Dx0=;
	b=mrzvuTJ7UY6xg4idw5+gKdIajypUZWTseT7taVA50y0iLpLh1yX5RVoKEkRVMv1PBw
	Jg6v1qhq3IPomt6crqXK9AXxZPPmPepT95kq+7DM485Brh/pZrBKtoN7EKMQaN/Fl9lJ
	YUzc+etFZxdnyUP8MCPb42gTSfHCwPIfGZ4x0ryGbD1Ua5ezl8LyyBw7rWToMkW0Ihm8
	snCw1gZ3D8N2wwW1yVNVR7Na6kgGreCnm9tXtbWBRBnOpxgkyHxeYK/EkHua5BAq2te6
	OBieRMdi9QrLEy/hUB5mituZ8jjwdlx8XMFHDk5fxW7tymBK2lCXu8Fbo+vr+Fi1X8Dd
	0qAg==
X-Gm-Message-State: APjAAAWGxhQma+ysRhoGECV34NmxukS/M8BbAvZxLVIFkcdz0/rgWig7
	LRCuxmytK5+1czrhRONFyyyChI0rW0Sk0N2foAw=
X-Google-Smtp-Source: APXvYqxUwqxlGpwkWNs4J1SJgx9HHb2SAbOypvCWaPQLiGz9W0mw7lLeNXPzjj1y9Eg/NwLOtfAD5Rc1dBUZF62PPbE=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr82013813qkb.24.1558718999077;
	Fri, 24 May 2019 10:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
	<20190521123641.16768-1-luca.boccassi@gmail.com>
	<CAMKF1so9O7VG2VrXRCu260FiZzeL5ywTbr1y9CeVpou6T1reAg@mail.gmail.com>
	<ee8e59bddf657fa7736a713cc3c9db16c97091ca.camel@gmail.com>
In-Reply-To: <ee8e59bddf657fa7736a713cc3c9db16c97091ca.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 10:29:33 -0700
Message-ID: <CAMKF1so2vXwvoXhidY64+JcHUiyaQVhqdP3SrWmcNmoZEooWaA@mail.gmail.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Fri, 24 May 2019 17:29:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 3:58 AM Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Tue, 2019-05-21 at 19:06 -0700, Khem Raj wrote:
> > On Tue, May 21, 2019 at 5:36 AM <
> > luca.boccassi@gmail.com
> > > wrote:
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
> > > v2: restrict new RDEPENDS to class-target. As advised by Alexander,
> > > bitbake
> > >     cannot resolve native rdeps that mention package names rather
> > > than
> > >     recipe names.
> > > v3: manually add RPROVIDES to the native class instead of
> > > restricting the
> > >     RDEPENDS to the target class as a better workaround. Also
> > > document why
> > >     the package is being split.
> > > v4: re-send to the correct thread, no changes.
> > >
> > >  meta/recipes-devtools/python/python-setuptools.inc | 11
> > > +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> > > b/meta/recipes-devtools/python/python-setuptools.inc
> > > index 357aa07086..f49e078697 100644
> > > --- a/meta/recipes-devtools/python/python-setuptools.inc
> > > +++ b/meta/recipes-devtools/python/python-setuptools.inc
> > > @@ -37,3 +37,14 @@ do_install_prepend() {
> > >  }
> > >
> > >  BBCLASSEXTEND = "native nativesdk"
> > > +
> > > +# The pkg-resources module can be used by itself, without the
> > > package downloader
> > > +# and easy_install. Ship it in a separate package so that it can
> > > be used by
> > > +# minimal distributions.
> > > +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> > > +FILES_${PYTHON_PN}-pkg-resources =
> > > "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> > > +# Due to the way OE-Core implemented native recipes, the native
> > > class cannot
> > > +# have a dependency on something that is not a recipe name. Work
> > > around that by
> > > +# manually setting RPROVIDES.
> > > +RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
> > > +RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-
> > > native"
> >
> > do we need to handle nativesdk case ?
>
> Hi,
>
> The parsing step of "bitbake core-image-minimal -c populate_sdk" works,
> while without the append_class-native workaround it fails immediately.
> Is this enough or is there something else I should run to check?
>

yeah usually to test nativesdk we need to do it with generated SDK

> Thanks!
>
> --
> Kind regards,
> Luca Boccassi
>

