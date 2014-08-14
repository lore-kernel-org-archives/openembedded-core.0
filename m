Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id CA5F760EFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 16:50:36 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id hr17so1414840lab.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZBR7GDjhtsCK2JUwh16a8siTB0Dqa+n38nplzkrzW+g=;
	b=bBPQEbNbNoZ9tbiWnwa5EFIiwH593eWm/thH11knJ2o5lLn0vacZL7HhpQE2NQyJES
	ZrOh/dWGmNtbxZJPNhilDNvhQW0kjWdyzkut1cL7RMRBkcnVTFdfgX5yKusy+oGfHIfV
	O80YyY5qq0xib7okESOVj9a9+d/bKTDtVneFmeiPsVUTdtWRA5zODoSelc+nOsT/K2Rt
	6sRsZRS7xeEWBXPjhJbGrqqOLT5kYEePzmqaYI1bVlzgbkbcba0tOIhZatYXtX/oTL7Y
	SICOx0rvm7fWxHVaD12AdpeLDs0YjBlA1lB1w9TrrIS2se9feIlZoIE+hf+XVnGhK6o/
	DK4A==
X-Received: by 10.112.242.162 with SMTP id wr2mr6212182lbc.10.1408035036923;
	Thu, 14 Aug 2014 09:50:36 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id dk3sm3395641lad.25.2014.08.14.09.50.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 09:50:36 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Thu, 14 Aug 2014 16:50:33 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140814165033.GF13399@gmail.com>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
	<1407497829-9330-3-git-send-email-paul@paulbarker.me.uk>
	<20140808121346.GE14848@jama> <20140808121628.GH32767@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140808121628.GH32767@gmail.com>
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
X-List-Received-Date: Thu, 14 Aug 2014 16:50:38 -0000
X-Groupsio-MsgNum: 56522
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Content-Disposition: inline

--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 12:16:28PM +0000, Paul Barker wrote:
> On Fri, Aug 08, 2014 at 02:13:46PM +0200, Martin Jansa wrote:
> > On Fri, Aug 08, 2014 at 11:37:09AM +0000, Paul Barker wrote:
> > > The 'opkg-key' utility requires gpg to manage the list of trusted key=
s. The
> > > ability to verify package signatures is not much use without the abil=
ity to add
> > > keys to the trusted list...
> > >=20
> > > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > > ---
> > >  meta/recipes-devtools/opkg/opkg.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devto=
ols/opkg/opkg.inc
> > > index ba21d84..56c54b6 100644
> > > --- a/meta/recipes-devtools/opkg/opkg.inc
> > > +++ b/meta/recipes-devtools/opkg/opkg.inc
> > > @@ -27,7 +27,7 @@ OPKGLIBDIR =3D "${target_localstatedir}/lib"
> > > =20
> > >  PACKAGECONFIG ??=3D ""
> > > =20
> > > -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-erro=
r"
> > > +PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-erro=
r,gnupg"
> >=20
> > Shouldn't this be gpgme?
> >=20
>=20
> Which bit? The PACKAGECONFIG name or one of the comma separated fields?
>=20

Sorry Martin, I didn't understand your comment. Could you clarify for me?

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT7OjZAAoJEBwoJlo7UPQD7hUH/2JDmdFFLl3lSihOSv30yrtC
vQ0eUWXny30ld7/vu59FK6grT5mk44NBIiUnQJTTvkWwoy2lJGieD3s9Gjam8SV5
hRPXtndmpZqNMcMqCP3EtjLY9nyqvt1Y9GnjrFR/Jh3zVgb3JMAwi3FX8Lrc4nAo
vt7DKkgctY8p0MhXrhjxzwsMmsN+n6SC9PoAUQ2GmL5oqztdyyYAcCLtFSWKZPp6
0sTpocQgDUFlKndq0/JWVVTfbEGfaL2Jha8zUbNEQnmwBtm4LJhvmtGRlFm1jCbR
CVWLCg4IcXGPh4KSjGUfm1ooRDoDT3PrZbG25dPFrbDTl6ceTp8k8Yx6mPkfo3A=
=qwmL
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
