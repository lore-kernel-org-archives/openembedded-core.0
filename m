Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 056DF71AD1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 21:52:56 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id u205so10295615ywa.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 14:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RyC6HuP/Yh0YyARbHWZnwf6VtJUEdldumx9ovAA06Ac=;
	b=K+6gtxyI37M4XzOa0ytnopazYc2mG40WLdijsjdf7nbO5ex2hOIeFdYxqiJUhPFRyz
	eiBsjjjyNFQKXMppSbfYa9IFBFHM9wGh8UsGyyH8sIdulrWndGoIK8ceMObBrP0g+Px8
	B5IQBjRP/VA5dVvRaY8x5rjcB2G5wcVBa+1Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RyC6HuP/Yh0YyARbHWZnwf6VtJUEdldumx9ovAA06Ac=;
	b=REFikpkNYbglnyVcTTqHcHTRGDPzUObMZ+f4EE2UHN+25HgfZ0QyusaGjSajl1cUtB
	uAG9EGvowa5DEw9Zd0iJrj3eKXDaocntOoYQg+tq3ifyfJFpv93LY7+6CiNg/Afd4MZS
	vLM/UZZFRL9xbFZ9bJ24UcLgaotUg3DIi9cf90AVW8BwtcD2vgluM9D3RqQDOtsfm5YP
	75B3XBk/dEOxrJScQ3PT9A0px+ZXARJEjGDnuok+DUtoAkxCGcwtfdvZyURX+lx6btTz
	Ugp3+Vhenk5uy/zNoyU5ildC6xPn2uT98mb13PkMCkLtxCsiu/bDQNaYXL8qD3ir+zyH
	sFQw==
X-Gm-Message-State: AHPjjUj5cRda2qiSi8gAARGctnZQuAT4PhUz5/3dAIjpgRnATTiXWgnj
	mDbY/e+KCUYWgDFNiI6tyyNccw==
X-Google-Smtp-Source: AOwi7QCROOUtme6E/2hNTJI9PQRPgKgwWXxJAEEjmK0S1JPznawREfjIeXD3evZ2Qu8WAqc8zK5Zmg==
X-Received: by 10.129.76.147 with SMTP id z141mr1985417ywa.258.1506549177754; 
	Wed, 27 Sep 2017 14:52:57 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:a523:8806:2b32:ed54])
	by smtp.gmail.com with ESMTPSA id
	g72sm5018777ywe.26.2017.09.27.14.52.57
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 14:52:57 -0700 (PDT)
Date: Wed, 27 Sep 2017 17:53:00 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170927215300.GD3112@bill-the-cat>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<CAMKF1srXi9mNZejjSK2+1irS4neRHbK+BQyka-czvjPLsc8E2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srXi9mNZejjSK2+1irS4neRHbK+BQyka-czvjPLsc8E2Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Wed, 27 Sep 2017 21:52:57 -0000
X-Groupsio-MsgNum: 103433
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="83Y2sXKo4f/n2njO"
Content-Disposition: inline

--83Y2sXKo4f/n2njO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2017 at 02:01:43PM -0700, Khem Raj wrote:
> On Wed, Sep 27, 2017 at 10:00 AM, Tom Rini <trini@konsulko.com> wrote:
> > With RSS we need to ensure that when making a bmap image that the
> > python3 that we created is found via /usr/bin/env rather than the host
> > python3.  Otherwise we're relying on the build host to have bmaptool
> > support installed.
> >
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > I played around with a few ways to try and fix this problem, and this
> > was the best I could come up with.  Once this is in we need this in pyro
> > as well as it's broken there too.
> > ---
> >  meta/classes/image_types.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_type=
s.bbclass
> > index 61dca626311e..3ff960e3a889 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?=3D "hddimg iso"
> >  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IM=
AGE_FSTYPES,
> >  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, h=
dddirect, hddimg, iso, etc.
> >  IMAGE_TYPES_MASKED ?=3D ""
> > +
> > +# bmap requires python3 to be in the PATH
> > +EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES')=
=2Efind('bmap') else ''}"
> > --
>=20
> I think somewhere inherit python3native should fix it.

Yes, image_types.bbclass could also inherit python3native but that
seemed heavy-handed.  There's not some other place that should be doing
it as the problem is saying we want to call bmaptool, and that's handled
here.

--=20
Tom

--83Y2sXKo4f/n2njO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzB28AAoJEIf59jXTHXZS2PwP/0bhfjajKumhQHEvyt19Wur/
hsG58qCQ/arJoqz26/eBrsDON/5gcqYypEevEr7Epwxk53L1sWuD154B3rKKi/Kj
h3cIBkncrzYt8FNTSuNqlrUrCCTFiI8pk9Ji3bGqMx5nvDXO9fGPja7BbjWpfwnO
Q38CIgWfgom2bLCOaFsZ/0/Gh7LuDdkgi38tkVwBkMBSirNgmqOdClqRrhypmN/n
0Ep4ufobcqQPo1PrnRH4eGMi6zIM6bLEbnFb8mrk76ASX7IQpyyxOi3I2BSFDxPk
yhALVCrS5aNpz2AclZO67xkxE+UfyVs2z22cbDcT8LyxusrNTDEg3faLvcJTGWNv
NO54WBYvABfoYEHKg+UxD5HQl6xkyvMuHj4kO2X7W3MSyWa4ur9FBvA5F5qNEZ4U
b7+mckfONJHNkWX65oE9JLZ+enLiNzp20qRr0IAsXUrS1ZvOYClkZRFBPQFdxHuA
zeqz9A44UvVSS1OMJYAZwzv9ViqnSiLSEsDwe22N+bws2HgsLbHkz7vjv8/bGJle
QthwfASt6v7pHDZFOaqBavouFaOSRa8IfA7xjVIGq+ERQQUDU+Z+HuYvIQ9lTKic
NhnDV9NtFm7UMgJeS6gLWZlig8wqBrPga4pcWlJsm2X/TpubpJbL3MnSW79SMEt1
jQR09rywJcLMqxQuhAN3
=xLyq
-----END PGP SIGNATURE-----

--83Y2sXKo4f/n2njO--
