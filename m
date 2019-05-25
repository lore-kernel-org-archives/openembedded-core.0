Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE3437DFB3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 12:59:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 7so11642521wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 05:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=W4i3KB3SRiTPvWAjW6Ko8JR8XlYXapdtIQiT1eCYdUQ=;
	b=XVaCi29FJW3iDx7xX1cUIy1eP8H6bLDEYFyBxJGHfk6QxVIRKzr/QZOISJAy0q/W+J
	32Xp0UL9kej1NfLZhqusMbXAr8hFNsqGO3kpHy7TFdn6uepNUhVumLrR8sSGQ6njvGx5
	pFitk1NNpHYDb7lEtCk/s7m6Q+uXdjVjjAGAbwrAvosahaQYrl8dwR79jf+KRhvQXF0+
	vb/58pbxss7DQtbo4+MFQsFZUxwJ1RkqplFI6WTL+AiEbZXrAyiZ4XC2N3RVU0VGkjWs
	bpQUtLFnBP+2leDTU8RzGmpzVsTFEqDVbZ0WXCvK8WYBLlmI9EZApliJ4PSigMmRaIEv
	4IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W4i3KB3SRiTPvWAjW6Ko8JR8XlYXapdtIQiT1eCYdUQ=;
	b=F80rgVBwUcqVhF/REnAolFCT823MdHcJC+R1cTcIx0ssuVCFMGRXXpzwzFgfUg30H/
	8DXK6NayMdredIKecigDR87A3u1qeG5VYcwVFQchnPwjkjylkFRtcA0Tbav7tCGDlgcC
	KnAB+QoGy2xnShb2oZYGhnqmixcEfhc91M3wBRPzsQZwDcfD5XtNa1pfDyIHdTHUzm6B
	EPIR4ukjHJo88fX0yE4cWBhIIOYID9pibRvUJpkkozJOeP9XVC15mA9zulOJqdycrnST
	zg2+wQSjs5py24zcdLEoTbpeI7r9ZVGyo+fGwoMiyBdJ9s2ZlHXTf9Q3MGtvbYy2l5w/
	mZzg==
X-Gm-Message-State: APjAAAUksLgDdZ5my/62XHn0Y/FgeCWDOMgasJI8nzUF89sYsjyvke0f
	EDRT1xKqLLrq0qxcU+qGzxA=
X-Google-Smtp-Source: APXvYqy3yIc7x81wfWD6bsuyy7ng9nRxjQJopfuhy6I+vg2ZfcKHrVeIH4DZL42KG8OTWMFvbnSTQA==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr3428524wmb.155.1558789175164;
	Sat, 25 May 2019 05:59:35 -0700 (PDT)
Received: from luca-desktop ([88.98.246.218])
	by smtp.googlemail.com with ESMTPSA id
	z25sm1045525wmi.5.2019.05.25.05.59.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 05:59:33 -0700 (PDT)
Message-ID: <1558789172.5382.2.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 May 2019 13:59:32 +0100
In-Reply-To: <CAMKF1so2vXwvoXhidY64+JcHUiyaQVhqdP3SrWmcNmoZEooWaA@mail.gmail.com>
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
	<20190521123641.16768-1-luca.boccassi@gmail.com>
	<CAMKF1so9O7VG2VrXRCu260FiZzeL5ywTbr1y9CeVpou6T1reAg@mail.gmail.com>
	<ee8e59bddf657fa7736a713cc3c9db16c97091ca.camel@gmail.com>
	<CAMKF1so2vXwvoXhidY64+JcHUiyaQVhqdP3SrWmcNmoZEooWaA@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
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
X-List-Received-Date: Sat, 25 May 2019 12:59:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-05-24 at 10:29 -0700, Khem Raj wrote:
> On Wed, May 22, 2019 at 3:58 AM Luca Boccassi <luca.boccassi@gmail.co
> m> wrote:
> > 
> > On Tue, 2019-05-21 at 19:06 -0700, Khem Raj wrote:
> > > On Tue, May 21, 2019 at 5:36 AM <
> > > luca.boccassi@gmail.com
> > > > wrote:
> > > > From: Luca Boccassi <
> > > > luca.boccassi@microsoft.com
> > > > > 
> > > > 
> > > > The pkg_resources Python module is useful by itself, for
> > > > example
> > > > for
> > > > automatic loading of resources shipped in a Python package.
> > > > Add separate packages for it, so that users can depend on them
> > > > individually and avoid pulling in the entire setuptools, which
> > > > include scripts to download other packages, which might not be
> > > > desired on minimal images.
> > > > 
> > > > Other distributions like Debian and Ubuntu already split
> > > > setuptools
> > > > and pkg-resources in this way.
> > > > 
> > > > The setuptools packages now depend on the new pkg-resources
> > > > packages,
> > > > to avoid regressions for other packages that depend on them
> > > > already.
> > > > 
> > > > Signed-off-by: Luca Boccassi <
> > > > luca.boccassi@microsoft.com
> > > > > 
> > > > 
> > > > ---
> > > > v2: restrict new RDEPENDS to class-target. As advised by
> > > > Alexander,
> > > > bitbake
> > > >     cannot resolve native rdeps that mention package names
> > > > rather
> > > > than
> > > >     recipe names.
> > > > v3: manually add RPROVIDES to the native class instead of
> > > > restricting the
> > > >     RDEPENDS to the target class as a better workaround. Also
> > > > document why
> > > >     the package is being split.
> > > > v4: re-send to the correct thread, no changes.
> > > > 
> > > >  meta/recipes-devtools/python/python-setuptools.inc | 11
> > > > +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > > 
> > > > diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> > > > b/meta/recipes-devtools/python/python-setuptools.inc
> > > > index 357aa07086..f49e078697 100644
> > > > --- a/meta/recipes-devtools/python/python-setuptools.inc
> > > > +++ b/meta/recipes-devtools/python/python-setuptools.inc
> > > > @@ -37,3 +37,14 @@ do_install_prepend() {
> > > >  }
> > > > 
> > > >  BBCLASSEXTEND = "native nativesdk"
> > > > +
> > > > +# The pkg-resources module can be used by itself, without the
> > > > package downloader
> > > > +# and easy_install. Ship it in a separate package so that it
> > > > can
> > > > be used by
> > > > +# minimal distributions.
> > > > +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> > > > +FILES_${PYTHON_PN}-pkg-resources =
> > > > "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> > > > +# Due to the way OE-Core implemented native recipes, the
> > > > native
> > > > class cannot
> > > > +# have a dependency on something that is not a recipe name.
> > > > Work
> > > > around that by
> > > > +# manually setting RPROVIDES.
> > > > +RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
> > > > +RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-
> > > > native"
> > > 
> > > do we need to handle nativesdk case ?
> > 
> > Hi,
> > 
> > The parsing step of "bitbake core-image-minimal -c populate_sdk"
> > works,
> > while without the append_class-native workaround it fails
> > immediately.
> > Is this enough or is there something else I should run to check?
> > 
> 
> yeah usually to test nativesdk we need to do it with generated SDK

I do have a nativesdk target in the distro at $work, but I realise it
might be different enough. Is there a simple config change/command to
generate it from Poky?

-- 
Kind regards,
Luca Boccassi

