Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 058547E5FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 18:37:15 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id p13so4534405vsr.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XJqnqIbxh1JNmPqclOSmc+bgBOl2p3143dKoETN/pMY=;
	b=oVa0r8vFZ3hH+mn9cEhyrkIFplm23EV99jw0yO2XYEB/8u39gQqr879Dx5yc7NQYpg
	cfgjrLwT7nWAip+EINlTbVPpxc/WowVsUPNc3s1pgiFIqmLdpRtq9IR+toLTOBzRTt2o
	9SNNIFzETdVIcRlN/rEO6EiuTc1TfUdzLITt3fBa8vKww3cqln3AJjra7z87z8ex/qPA
	+BeGbMpxmmaVrkp2W2Gkp2lfD6HK3er0zt7gDUOZcx7475GqjY0OrR7aOn7Oq3g8mtp/
	ZAeH3wG8xJZtAPJ4TGrKR10uEw/y5fV58GmKHVB87w2U2HJDmhBu4hc9L5MUijYJoqbP
	pXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XJqnqIbxh1JNmPqclOSmc+bgBOl2p3143dKoETN/pMY=;
	b=GXmvSdXj2U+eP9uuWYg0h97wHLnAggIOJNaVDAVIcrzrD9cUmuvhvrRWuDy5EDw1NI
	Qd6vg9b3OkB5UGzwzxBKQ90hyX6J4+ooZngF+kH6zLEW3ql9gQCQoOqa3qzzpn+4eiSl
	GSJFQHDY9TwH8QC0WTwvgulf1XgaJeCzE10pMYBfgxVc5vcupMzTgpSRJvyOW89z253C
	sRlHDhwSV/tQy8nBpBdA45Gueeob62xlM8yyKPubdS3JRK2A/RwNJTQXYTEAsIQ+lwCd
	aLkBCA6WiLZ01vVDOM9SXBK2lcMd7VDuWLasvVBeOBplaQ6z6lPcvNVAcU2yW4T4feNz
	b1Uw==
X-Gm-Message-State: APjAAAXrWZyKIDB+evdnXotj+yzwhn/on6ezM6rQHWZFSHIXPALYBMh3
	8/rAcP/b1ll1pZKT0PajsPe8jO8MthFkI7VN1h8=
X-Google-Smtp-Source: APXvYqwe20fhM+xA3Naq3k6Ny51qPX7F9L5wGUvl7x4eZ1JoMlEGzcDLh1v93xo3pQrrp7Nshy9qlqBnjACf60HNGDY=
X-Received: by 2002:a67:b44b:: with SMTP id c11mr5641740vsm.137.1569436636692; 
	Wed, 25 Sep 2019 11:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
	<39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
	<CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
In-Reply-To: <CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 25 Sep 2019 11:37:04 -0700
Message-ID: <CAJ86T=UXCxS_X86dG+WL_rvh=pB7WAP8_Vg5wCUru6hmnzrstQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Sep 2019 18:37:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 11:13 AM George McCollister
<george.mccollister@gmail.com> wrote:
> On Wed, Sep 25, 2019 at 11:08 AM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
> > On 9/25/19 6:52 AM, George McCollister wrote:
> > > Set OPENSSL_ENGINES to the path where engines are actually installed.
> > >
> > > Signed-off-by: George McCollister <george.mccollister@gmail.com>
> > > ---
> > >  meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > > index 072f727e0b..8819e19ec4 100644
> > > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> > > @@ -148,7 +148,7 @@ do_install_append_class-native () {
> > >           OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
> > >           SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
> > >           SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> > > -         OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> > > +         OPENSSL_ENGINES=${libdir}/engines-1.1
> >
> > Is this a bug in the openssl recipe (it's placing engines in the wrong place),
> > or a bug in the recipes providing acceleration engines and THEY are going into
> > the wrong place?
>
> This recipe installs:
> packages-split/openssl-engines/usr/lib/engines-1.1/afalg.so
> packages-split/openssl-engines/usr/lib/engines-1.1/padlock.so
> packages-split/openssl-engines/usr/lib/engines-1.1/capi.so
>
> libp11 in meta-oe installs these:
> packages-split/libp11/usr/lib/engines-1.1
> packages-split/libp11/usr/lib/engines-1.1/pkcs11.so
> packages-split/libp11-dev/usr/lib/engines-1.1
> packages-split/libp11-dev/usr/lib/engines-1.1/libpkcs11.so
>
> >
> > The ssl-1.1/engines makes more sense to me..  as /usr/lib/engines-1.1 obscures
> > that they are OpenSSL related.
>
> I don't have a strong opinion either way but ssl-1.1/engines does make
> a bit more sense.
> Debian appears to install them in engines-1.1 though:
>  https://packages.debian.org/buster/amd64/libssl1.1/filelist

It would be interesting to know when the path in the -native wrapper
script stopped matching the path where the engines plugins are
installed. ie was the wrapper script always wrong? Did the default
install path used by openssl change at some point?

> I do need this fixed in warrior though and wonder if anyone would
> gripe about changing where they are installed post release.
>
> How shall we proceed? Does anyone else want to chime in?

The change being proposed is for the openssl-native wrapper script, so
won't affect anything on the target.

I'm curious why openssl-native needs engines plugins at all?

