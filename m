Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 06755601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 17:16:18 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so1371087lab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y6Daj11JxFaLjanssER2IeGlz2nTt0yXXPAa/Ya6wbo=;
	b=sIHfJpF3IkcmGLvr812sdUEObhoIS/Q+bsuXudi03AtnCudx61zf4MjRl3GsFfdUwB
	S4nXuTG2Nvq5L9V8nVtWozxReWDU/IpVMW3if4TcyqF3gQ0wUVt1FSN6mGfG02QpxnL/
	SKILuysbyKBlR+bmJVbp+zFTcqsxnyPqSkFej7E9BMoarF4pXYjdwIjyWGi468VOJ1J1
	kfE7f0PZUw+hUTgoePm1pZgNleh8z9TvqlcV8E1vtLl3cE9DfYXgJILcUzQKx+SShEHY
	WXrcUj3Avj5OEnblFIchMK8bCad51RA31qXC0ocr2WAOHt61Iy30okaL7kCax5aM/FFf
	ZyzA==
X-Received: by 10.152.198.195 with SMTP id je3mr6825511lac.59.1408036577574;
	Thu, 14 Aug 2014 10:16:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm3430606lah.20.2014.08.14.10.16.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 10:16:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 19:16:53 +0200
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20140814171653.GN14848@jama>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
	<1407497829-9330-3-git-send-email-paul@paulbarker.me.uk>
	<20140808121346.GE14848@jama> <20140808121628.GH32767@gmail.com>
	<20140814165033.GF13399@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140814165033.GF13399@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG
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
X-List-Received-Date: Thu, 14 Aug 2014 17:16:25 -0000
X-Groupsio-MsgNum: 56523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X0SE41fMwR5j09rE"
Content-Disposition: inline

--X0SE41fMwR5j09rE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 04:50:33PM +0000, Paul Barker wrote:
> On Fri, Aug 08, 2014 at 12:16:28PM +0000, Paul Barker wrote:
> > On Fri, Aug 08, 2014 at 02:13:46PM +0200, Martin Jansa wrote:
> > > On Fri, Aug 08, 2014 at 11:37:09AM +0000, Paul Barker wrote:
> > > > The 'opkg-key' utility requires gpg to manage the list of trusted k=
eys. The
> > > > ability to verify package signatures is not much use without the ab=
ility to add
> > > > keys to the trusted list...
> > > >=20
> > > > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > > > ---
> > > >  meta/recipes-devtools/opkg/opkg.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-dev=
tools/opkg/opkg.inc
> > > > index ba21d84..56c54b6 100644
> > > > --- a/meta/recipes-devtools/opkg/opkg.inc
> > > > +++ b/meta/recipes-devtools/opkg/opkg.inc
> > > > @@ -27,7 +27,7 @@ OPKGLIBDIR =3D "${target_localstatedir}/lib"
> > > > =20
> > > >  PACKAGECONFIG ??=3D ""
> > > > =20
> > > > -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-er=
ror"
> > > > +PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-er=
ror,gnupg"
> > >=20
> > > Shouldn't this be gpgme?
> > >=20
> >=20
> > Which bit? The PACKAGECONFIG name or one of the comma separated fields?
> >=20
>=20
> Sorry Martin, I didn't understand your comment. Could you clarify for me?

Sorry for late reply, I haven't noticed your earlier e-mail.

It has build-time dependency on gpgme and runtime dependency on gnupg
(in comma separated fields) - it could be OK, I just wasn't sure.

Is opkg-key calling gnupg tools?

> Thanks,
>=20
> --=20
> Paul Barker
>=20
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X0SE41fMwR5j09rE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlPs7wUACgkQN1Ujt2V2gBy3BgCeN3p7UrcLV0YZ2+1LB7ORu03V
Z6MAmIHvmTuPvFhAkIEc68Wc2ZXsGSE=
=OSW4
-----END PGP SIGNATURE-----

--X0SE41fMwR5j09rE--
