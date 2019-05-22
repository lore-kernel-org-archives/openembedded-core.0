Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D060F7E3C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:58:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s17so1780185wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kUJgMqHMm2a4ONx+JUXmqZgGtE+cMZC+oywBkU77TLg=;
	b=URCh/ElEFRAHZ4Mk492HPlZ2K9e/272e3EGNdMPzTNpQp/5Ipz8Bsah3FlAy/f0aDf
	TeSWWVAj+XavabeCqLmki86xbiHDxR6ija0ZQy6oPPHdwgnPT9fqhOWYbIUnQBxz3bf2
	MXle4Tinlp8PfkVIxaM+LrR0czE3whWnJJjGAdZm6IkqSUsp4gsnNOhmJu+Mi8SFTqxT
	2JYYEjFrWekc5HlodnpXEIqcDByYhAL/eCq6NjmQwLrKjwAffcObHnSOpCPMeMS5mZ2T
	gtd3P/NnsT1m1PUfDkz7SLDqQ/cXztTwdsYi3sUr+vpTduKJd8UX/06Szq4O0tKf75bU
	GADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kUJgMqHMm2a4ONx+JUXmqZgGtE+cMZC+oywBkU77TLg=;
	b=V35H/gPsRfCFM4FWZT48ZAWy8+114dO1TWuOjN0cYrxWhBpCtIqvec1qkapmzGe0L1
	h9T32VqypQuV8IFT9xsCNY6prlYwjGLh08LPpee88xlac+De1fFp22xqW787M/lH8pnr
	FY8+ZY3SNa8Ni4mLA12tfVqabnZNOcMVH1jTW9e2k/DbJMA+pgmVbgF2OzruJmidYwZU
	bhDJhLgGI8K0B4dl32uh9H1ZfAT5OoIbm49wuCG3w/XevvD2CQrVC8sUMP+GqfzElF9K
	AnoIJBC0OqbnJQryAdqlSs6nvFQ2YqYPsxnpmvj38uZ4SJAT3d3xn1oiP6Ggv8O05A7Q
	V9Fw==
X-Gm-Message-State: APjAAAX0JdRK+9YMBeknPlBiTCV52rUbdxvJW0gmVwnZyZZjtQohgzAh
	ccf/DDYn2CGHCrCdEM8BIeQ=
X-Google-Smtp-Source: APXvYqwDMmu2UWPM19rOoJqvlXBH/s0yOiJwgqUPHFiKqZ0yhdCvxfbHbEWhN85KRQTaIL9agCp0cw==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr2583051wrw.134.1558522738431; 
	Wed, 22 May 2019 03:58:58 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	m206sm7297799wmf.21.2019.05.22.03.58.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 22 May 2019 03:58:57 -0700 (PDT)
Message-ID: <ee8e59bddf657fa7736a713cc3c9db16c97091ca.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 11:58:56 +0100
In-Reply-To: <CAMKF1so9O7VG2VrXRCu260FiZzeL5ywTbr1y9CeVpou6T1reAg@mail.gmail.com>
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
	<20190521123641.16768-1-luca.boccassi@gmail.com>
	<CAMKF1so9O7VG2VrXRCu260FiZzeL5ywTbr1y9CeVpou6T1reAg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 22 May 2019 10:58:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-21 at 19:06 -0700, Khem Raj wrote:
> On Tue, May 21, 2019 at 5:36 AM <
> luca.boccassi@gmail.com
> > wrote:
> > From: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > 
> > The pkg_resources Python module is useful by itself, for example
> > for
> > automatic loading of resources shipped in a Python package.
> > Add separate packages for it, so that users can depend on them
> > individually and avoid pulling in the entire setuptools, which
> > include scripts to download other packages, which might not be
> > desired on minimal images.
> > 
> > Other distributions like Debian and Ubuntu already split setuptools
> > and pkg-resources in this way.
> > 
> > The setuptools packages now depend on the new pkg-resources
> > packages,
> > to avoid regressions for other packages that depend on them
> > already.
> > 
> > Signed-off-by: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > ---
> > v2: restrict new RDEPENDS to class-target. As advised by Alexander,
> > bitbake
> >     cannot resolve native rdeps that mention package names rather
> > than
> >     recipe names.
> > v3: manually add RPROVIDES to the native class instead of
> > restricting the
> >     RDEPENDS to the target class as a better workaround. Also
> > document why
> >     the package is being split.
> > v4: re-send to the correct thread, no changes.
> > 
> >  meta/recipes-devtools/python/python-setuptools.inc | 11
> > +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> > b/meta/recipes-devtools/python/python-setuptools.inc
> > index 357aa07086..f49e078697 100644
> > --- a/meta/recipes-devtools/python/python-setuptools.inc
> > +++ b/meta/recipes-devtools/python/python-setuptools.inc
> > @@ -37,3 +37,14 @@ do_install_prepend() {
> >  }
> > 
> >  BBCLASSEXTEND = "native nativesdk"
> > +
> > +# The pkg-resources module can be used by itself, without the
> > package downloader
> > +# and easy_install. Ship it in a separate package so that it can
> > be used by
> > +# minimal distributions.
> > +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> > +FILES_${PYTHON_PN}-pkg-resources =
> > "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> > +# Due to the way OE-Core implemented native recipes, the native
> > class cannot
> > +# have a dependency on something that is not a recipe name. Work
> > around that by
> > +# manually setting RPROVIDES.
> > +RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
> > +RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-
> > native"
> 
> do we need to handle nativesdk case ?

Hi,

The parsing step of "bitbake core-image-minimal -c populate_sdk" works,
while without the append_class-native workaround it fails immediately.
Is this enough or is there something else I should run to check?

Thanks!

-- 
Kind regards,
Luca Boccassi


