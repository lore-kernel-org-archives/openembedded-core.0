Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 05729609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 17:19:10 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so1451796lab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QPgrqtnZhwSRLeTIwX1bJRKClukZhTePawWzsoJJPT8=;
	b=eS96FnCQ1qKN+9irF5zFll2uqJe3ro45dky/rwNLguMTSqyumlKOHr69G45its/kyJ
	d3kZ0Bsf1v4fLite35zXw8G7qNo8qdWZ2zacNkY6z6OvScf0J+5pqNCe4TTtEO+Lfm2i
	ZogNq9EgBhTr60HeT19qxfSCCixvEpt0yhaGnxMT/EdyFKthywBvE4bnk9CB5Pp8HomF
	qHSQtLWvwoy/BChGdIaTDLsX/8jINYD/FTcCsdRCiNjeW6DKj0EmdCUeFihIRlqi8fpu
	Gss6pf8FUU0UlkfYClMUSRYUwxqxz2TGe+khvV+9a3a9NulMaRGUtPHCknKfZ8TrpHuo
	OjiQ==
X-Received: by 10.112.35.97 with SMTP id g1mr6469821lbj.20.1408036751145;
	Thu, 14 Aug 2014 10:19:11 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id kv3sm8702374lbc.37.2014.08.14.10.19.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 10:19:10 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Thu, 14 Aug 2014 17:19:06 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140814171906.GG13399@gmail.com>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
	<1407497829-9330-3-git-send-email-paul@paulbarker.me.uk>
	<20140808121346.GE14848@jama> <20140808121628.GH32767@gmail.com>
	<20140814165033.GF13399@gmail.com> <20140814171653.GN14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140814171653.GN14848@jama>
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
X-List-Received-Date: Thu, 14 Aug 2014 17:19:11 -0000
X-Groupsio-MsgNum: 56524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Content-Disposition: inline

--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 07:16:53PM +0200, Martin Jansa wrote:
> On Thu, Aug 14, 2014 at 04:50:33PM +0000, Paul Barker wrote:
> > On Fri, Aug 08, 2014 at 12:16:28PM +0000, Paul Barker wrote:
> > > On Fri, Aug 08, 2014 at 02:13:46PM +0200, Martin Jansa wrote:
> > > > On Fri, Aug 08, 2014 at 11:37:09AM +0000, Paul Barker wrote:
> > > > > The 'opkg-key' utility requires gpg to manage the list of trusted=
 keys. The
> > > > > ability to verify package signatures is not much use without the =
ability to add
> > > > > keys to the trusted list...
> > > > >=20
> > > > > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > > > > ---
> > > > >  meta/recipes-devtools/opkg/opkg.inc | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-d=
evtools/opkg/opkg.inc
> > > > > index ba21d84..56c54b6 100644
> > > > > --- a/meta/recipes-devtools/opkg/opkg.inc
> > > > > +++ b/meta/recipes-devtools/opkg/opkg.inc
> > > > > @@ -27,7 +27,7 @@ OPKGLIBDIR =3D "${target_localstatedir}/lib"
> > > > > =20
> > > > >  PACKAGECONFIG ??=3D ""
> > > > > =20
> > > > > -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-=
error"
> > > > > +PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-=
error,gnupg"
> > > >=20
> > > > Shouldn't this be gpgme?
> > > >=20
> > >=20
> > > Which bit? The PACKAGECONFIG name or one of the comma separated field=
s?
> > >=20
> >=20
> > Sorry Martin, I didn't understand your comment. Could you clarify for m=
e?
>=20
> Sorry for late reply, I haven't noticed your earlier e-mail.
>=20
> It has build-time dependency on gpgme and runtime dependency on gnupg
> (in comma separated fields) - it could be OK, I just wasn't sure.
>=20
> Is opkg-key calling gnupg tools?
>=20

Yes, opkg-key is just a shell script which runs 'gpg' with appropriate comm=
and
line options. The main opkg program uses the gpgme library instead.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT7O+KAAoJEBwoJlo7UPQDVNcH/Rvd0o2XIG7jgyUACb4M4tDR
i4Nkgm9yVyDxskkoNG7I/v8jlGsiI2Dx6s2FZEndpMjFFxBHJwh7iaYK+LJ2z8Ne
8Qf7+iAg7hgF51TX11i/fnoSa7iBsq5MjqGE5+bBk7JO6ulpt4fJ6IURbkI1alTH
vHs7HpsqNoqhq29xiRtFA8hYTJEgwal+abJE4drkVjYIQScBRe+j/Rfr/ovj3uJU
erzHZ9zKfuCmWZBvFOTBwvBz2ZeX1yICqzHHyAS7sQEOEQo5vouH6G11yw5vwkF0
B1/QUw5LmPJU4Yz/7p+1XtOm6RvahN7Bo2Q95QdYKpANOpzl0C4+j9BlDNDUOVk=
=+WOC
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
