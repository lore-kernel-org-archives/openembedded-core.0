Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id B8F507E71B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:39:33 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n7so287926qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lJ86FWQ6+OXFviHxiW0DNqx8DmEn0Uug4NYRpCH5rk8=;
	b=SiKMGpMfIO4sXYE1fZ8/4S7AkCHIPHwmE+LZqn+qxMUxzRtkJ+FzEBAOtIitBqAD7S
	PxN2yPxLozeZ09YGiin2LqLYowuwf8rXgDMusM2PPFOCAwIRHgvtX5cSvp1ttXaGlsvs
	All4ooJ9jiitz4k1WkJ1bzmVeXcQ6amAd9LclfxPrTtPiTKNFQPEEwPK46PLio7CduOD
	30MLFtMVldUffM2hfLT7uEnId1IGyWnnwmzEDMb036XW1RC/1myOQckuaV0+NJemC50n
	ltdvUhdDdM3vKsF6FOdaf9q8pjBl+IuVmd6zgKbdZXzeUeQc7StEGkEndox6fthcA8lX
	+iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lJ86FWQ6+OXFviHxiW0DNqx8DmEn0Uug4NYRpCH5rk8=;
	b=I7bl5/D43Q9tWWQjHwCogaaFnddIzbBAn3qISduIFQ+hQ5/cCHfIC3PD829fdkk5uu
	nZ66p40Tcs0myqCI/eySo4JQ3p7zF+VEv7wW2mGvvi1Yp+MFrbJUrdKgaPmLmp/zstKB
	sbOWiym8WB0xScG+QxPaZYNW8VScYjzMZIMmbkIQsJfqShFQT/iWbUr1QVi+jtH2lfwU
	3jepPYq89491JxsG4+iJy/LiFVur1wsitgFpDhi2UJjdzErVbV2jUnmvphQbFN/gHdwq
	F4dVO5GTJ5nmfAOo7Lo+Q3VDSo80Vazn7dcsYJYtR307TBuV7E9L069Dh1TK5xwP5L6b
	GSyA==
X-Gm-Message-State: APjAAAU6qLfFHCta4BTw/ckPwYXDgWkROniqUvOgOb3rTxEu+zADjUQe
	NpM29mmdKGAfgYJgNVCtn6IIzfYX7q8L6At8jbo=
X-Google-Smtp-Source: APXvYqzyvyN8IW/p9C4FlArtxEuFmNHSFkqpWhaNp7lnvKDD3LMBZEQF3DFvkpZkkkI0Y7E/24paZpFF2tPAvMJWx7I=
X-Received: by 2002:ad4:5551:: with SMTP id v17mr1594232qvy.65.1569447574111; 
	Wed, 25 Sep 2019 14:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
	<39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
	<CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
	<95bec5ac-7a79-d302-303c-28251f10ec3f@gmail.com>
	<CAFSKS=ONUnQ_1LcQXE52H3B-KXyejM4Zy1e_JayGA5NTspwfwQ@mail.gmail.com>
In-Reply-To: <CAFSKS=ONUnQ_1LcQXE52H3B-KXyejM4Zy1e_JayGA5NTspwfwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2019 14:39:07 -0700
Message-ID: <CAMKF1soM57Hph9bYVF7QOb0SPehicGV-OQrWsTbZ82Yar5s2zA@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Sep 2019 21:39:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 2:30 PM George McCollister
<george.mccollister@gmail.com> wrote:
>
> On Wed, Sep 25, 2019 at 1:34 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On 9/25/19 11:13 AM, George McCollister wrote:
> > > On Wed, Sep 25, 2019 at 11:08 AM Mark Hatle
> > > <mark.hatle@kernel.crashing.org> wrote:
> > >>
> > >> On 9/25/19 6:52 AM, George McCollister wrote:
> > >>> Set OPENSSL_ENGINES to the path where engines are actually installed.
> > >>>
> > >>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> > >>> ---
> > >>>   meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
> > >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > >>> index 072f727e0b..8819e19ec4 100644
> > >>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > >>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > >>> @@ -148,7 +148,7 @@ do_install_append_class-native () {
> > >>>            OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
> > >>>            SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
> > >>>            SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> > >>> -         OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> > >>> +         OPENSSL_ENGINES=${libdir}/engines-1.1
> > >>
> > >> Is this a bug in the openssl recipe (it's placing engines in the wrong place),
> > >> or a bug in the recipes providing acceleration engines and THEY are going into
> > >> the wrong place?
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
> > >>
> > >> The ssl-1.1/engines makes more sense to me..  as /usr/lib/engines-1.1 obscures
> > >> that they are OpenSSL related.
> > >
> > > I don't have a strong opinion either way but ssl-1.1/engines does make
> > > a bit more sense.
> > > Debian appears to install them in engines-1.1 though:
> > >   https://packages.debian.org/buster/amd64/libssl1.1/filelist
> > >
> > > I do need this fixed in warrior though and wonder if anyone would
> > > gripe about changing where they are installed post release.
> > >
> > > How shall we proceed? Does anyone else want to chime in?
> > >
> >
> > Using /usr/lib/<package> is known jargon and lets use it. I think doing
> > it the way other distros are doing it and how upstream defaults are is
> > also helpful. it reduced one more thing to worry about. Release branches
> > should not be an issue as long as we have them packages in same output
> > package.
>
> It looks like Fedora is also using engines-1.1:
> https://apps.fedoraproject.org/packages/openssl-libs/
>
> I've found there is no Configure switch to set the engines directory.
> I believe it will require a patch to changes 3 - 4 lines in
> Configurations/unix-Makefile.tmpl.
> meta-oe/recipes-support/libp11/libp11_0.4.10.bb would also need to be
> changed to use the new path.
>
> Is carrying a custom patch to deviate from the upstream package and
> major distribution behavior really wise?
>

right. so lets not do it.

> If there is somewhat of a consensus to go that way knowing it requires
> a custom patch I'll send a patch for openssl and then one to fix
> libp11 (which the first patch will break).
>
> >
> > >>
> > >> --Mark
> > >>
> > >>>   }
> > >>>
> > >>>   do_install_append_class-nativesdk () {
> > >>>
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > > -George
> > >
> >

