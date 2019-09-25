Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 68DDD7E6B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:25:25 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id b123so4636185vsb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VRpnuNhccA6hwnbhjWmeTQzyFl8Wc1gA60YDuNVIznc=;
	b=cfWj7ktOjkRQnelclITvA11pqFO4qFf5eDnk5d+ACYLd0mubzuYOI3AAnDF1oIiMV3
	fJTQk7MstxxGxQKudgMRwhN5Jvj7bzgSE5limZ52+sIZkWXS0f6xx6u4ltObqIEhiKTO
	e1AOJn6107uRKj8CdUYfnjOZD808tYctWqgnKpMKCxTA7gw5ChU0szq1OBkpdN2FZBDQ
	GZJ7s3ZrzBDobo5z75EJl3ugFG4oHqBrFEMazy+QJ9f8IlG69NP/cgjTHoBjuhTAxtUE
	BCHtZBBvYSvZEQZVrR7UaglJOcoduKoDCvR3O4rfqhJGuHKqP+fbpN5ElFkiLzSkEBGR
	Vkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VRpnuNhccA6hwnbhjWmeTQzyFl8Wc1gA60YDuNVIznc=;
	b=ZtfFV1IC5Z6v6Psh0ve30b5sXjDgE+2sbDL8mNMDN3IB0UeWf5F5IrqVhZpxe8bvug
	gMIhnxEZZqYcVRk0HoMtt9LyoryHtDgCpuXll8rtv65MKIEhBQdgtkq6RkFqGKV3l3MX
	SLgKnAfi1czgmYw5cfOkzx3Ov2JTyrFriPAlzBE68hiRslJF44IQooLwVK6Ea+eZCVg9
	0LxLDt180a22G8iuOCdWJnQclRYQbl+FA35v3TLQZaLy+bwB9CDhLjVDaHhc+35csxzA
	jM7mtOmbL663g65jZjXU+5d9+9Rx4yqzaaIuiKdfDmuc0Ln7AhqI6zXgd21ZKy/BO/PJ
	jahg==
X-Gm-Message-State: APjAAAWcahvPg4cg1PXyLYDmNKd6u/4KQFqzIHbMApHyID2XYP+FeJ7p
	bCqBucVke99/flcnFjI3MvZ1pcGmaoO/m4/WfgI=
X-Google-Smtp-Source: APXvYqy2M8FgZCSGAq9WlLGmGGM9JaPP+W1HTrjohApsdE6K8g7TGyppFW0K/ZgSDcinHB/H5IbMnsufqy9YXsIqJ3Q=
X-Received: by 2002:a67:d29d:: with SMTP id z29mr6117557vsi.222.1569439526158; 
	Wed, 25 Sep 2019 12:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
	<39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
	<CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
	<CAJ86T=UXCxS_X86dG+WL_rvh=pB7WAP8_Vg5wCUru6hmnzrstQ@mail.gmail.com>
	<CAFSKS=MJU=n3vN28WA400yS=_-gN0CGq=V2bg59wmPvnYgAp=A@mail.gmail.com>
In-Reply-To: <CAFSKS=MJU=n3vN28WA400yS=_-gN0CGq=V2bg59wmPvnYgAp=A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 25 Sep 2019 12:25:14 -0700
Message-ID: <CAJ86T=UcqMLn5ia+95XpkqT0zj8uqEJv4C6UZTHTyt_8iERDEw@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Wed, 25 Sep 2019 19:25:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 12:13 PM George McCollister
<george.mccollister@gmail.com> wrote:
> On Wed, Sep 25, 2019 at 1:37 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Wed, Sep 25, 2019 at 11:13 AM George McCollister
> > <george.mccollister@gmail.com> wrote:
> > > On Wed, Sep 25, 2019 at 11:08 AM Mark Hatle
> > > <mark.hatle@kernel.crashing.org> wrote:
> > > > On 9/25/19 6:52 AM, George McCollister wrote:
> > > > > Set OPENSSL_ENGINES to the path where engines are actually installed.
> > > > >
> > > > > Signed-off-by: George McCollister <george.mccollister@gmail.com>
> > > > > ---
> > > > >  meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > > > > index 072f727e0b..8819e19ec4 100644
> > > > > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > > > > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > > > > @@ -148,7 +148,7 @@ do_install_append_class-native () {
> > > > >           OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
> > > > >           SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
> > > > >           SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> > > > > -         OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> > > > > +         OPENSSL_ENGINES=${libdir}/engines-1.1
> > > >
> > > > Is this a bug in the openssl recipe (it's placing engines in the wrong place),
> > > > or a bug in the recipes providing acceleration engines and THEY are going into
> > > > the wrong place?
> > >
> > > This recipe installs:
> > > packages-split/openssl-engines/usr/lib/engines-1.1/afalg.so
> > > packages-split/openssl-engines/usr/lib/engines-1.1/padlock.so
> > > packages-split/openssl-engines/usr/lib/engines-1.1/capi.so
> > >
> > > libp11 in meta-oe installs these:
> > > packages-split/libp11/usr/lib/engines-1.1
> > > packages-split/libp11/usr/lib/engines-1.1/pkcs11.so
> > > packages-split/libp11-dev/usr/lib/engines-1.1
> > > packages-split/libp11-dev/usr/lib/engines-1.1/libpkcs11.so
> > >
> > > >
> > > > The ssl-1.1/engines makes more sense to me..  as /usr/lib/engines-1.1 obscures
> > > > that they are OpenSSL related.
> > >
> > > I don't have a strong opinion either way but ssl-1.1/engines does make
> > > a bit more sense.
> > > Debian appears to install them in engines-1.1 though:
> > >  https://packages.debian.org/buster/amd64/libssl1.1/filelist
> >
> > It would be interesting to know when the path in the -native wrapper
> > script stopped matching the path where the engines plugins are
> > installed. ie was the wrapper script always wrong? Did the default
> > install path used by openssl change at some point?
>
> It's been wrong on and off with openssl 1.0 and I believe always wrong
> with openssl 1.1.
>
> >
> > > I do need this fixed in warrior though and wonder if anyone would
> > > gripe about changing where they are installed post release.
> > >
> > > How shall we proceed? Does anyone else want to chime in?
> >
> > The change being proposed is for the openssl-native wrapper script, so
> > won't affect anything on the target.
> >
> > I'm curious why openssl-native needs engines plugins at all?
>
> I need the pkcs11 engine for pkcs11 signing with an HSM. Unfortunately
> for me most people won't notice if the wrapper doesn't match the
> installed plugin path.

OK. Not a use case which others are very likely to see, but good to
have it fixed anyway.

Note that (for unknown historical reasons) native and nativesdk use
different approaches to ensuring that these paths are correctly
defined. Native uses a wrapper script and nativesdk exports
environment variables globally via the SDK environment-setup script.
They probably both need fixing.

