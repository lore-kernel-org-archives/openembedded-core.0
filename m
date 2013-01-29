Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Dq3-0005DS-Ll
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:15:11 +0100
Received: by mail-pa0-f52.google.com with SMTP id kp6so473971pab.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 07:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=X2nLEekDtxcIpbzzQBaE15cdQYwsUhk+mYbD5fC/XuQ=;
	b=pFhS8HIflZ9O6TuS1KkC/q0Tcoagk8Bkb5XHDTOJ8MqhitlDC2R3WuIJDOquKQUbJ1
	mE5GLpUYOLWwxO6gbrxuNVaVJI+CyzwOqQ8Ue0v0yNOonfKp7UyacW1OGFK/mNapKy2s
	5pSK/1fpPvuaA4VqGFp6/FliKOjN8zoEQ/L4gLKH7G9wq9HjbdsuOGW6OoOXQIx4xZTl
	fsjXJTH5ZePIDSebvWzKpQtkWYpFggBgLh87ngTV1uTJYHKYzlfkro/j63ciPjC4LQQM
	jDn9FcQNZgRT4lTXGoV0Vlr2KMWysxnfT1ewvXSzHgyo0LijJwVyW2O16KDNpoGdVcdP
	5F2A==
X-Received: by 10.68.135.67 with SMTP id pq3mr3611279pbb.127.1359475170939;
	Tue, 29 Jan 2013 07:59:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gj1sm8629635pbc.11.2013.01.29.07.59.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 07:59:29 -0800 (PST)
Date: Tue, 29 Jan 2013 16:59:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130129155930.GQ16904@jama.palm1.palmone.com>
References: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
	<1359464656-27638-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANnz3b5W056P3NX0HktHfOrbE-Mu+88izcQtrTpaUnyszA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnz3b5W056P3NX0HktHfOrbE-Mu+88izcQtrTpaUnyszA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 16:15:12 -0000
X-Groupsio-MsgNum: 34656
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DnHvQagWhP6kG70s"
Content-Disposition: inline

--DnHvQagWhP6kG70s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 07:29:55AM -0700, Chris Larson wrote:
> On Tue, Jan 29, 2013 at 6:04 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > * as reported by Enrico on #oe
> >   11:06:50 < ensc|w> JaMa: might this be caused by
> > dc78ef91a2bf01efb8028c9afbe69e506e016265
> >   which checks for 'd.getVar('LICENSE_CREATE_PACKAGE', True)' evaluating
> > to 'True' for every
> >   string (including the default 0)
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/license.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index d4ebb26..229f755 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -103,7 +103,7 @@ python do_populate_lic() {
> >  # it would be better to copy them in do_install_append, but
> > find_license_filesa is python
> >  python perform_packagecopy_prepend () {
> >      enabled =3D d.getVar('LICENSE_CREATE_PACKAGE', True)
> > -    if d.getVar('CLASSOVERRIDE', True) =3D=3D 'class-target' and enabl=
ed:
> > +    if d.getVar('CLASSOVERRIDE', True) =3D=3D 'class-target' and enabl=
ed =3D=3D
> > "1":
>=20
>=20
> We do have an existing mechanism for handling boolean variables in a sane
> way, as an FYI.
>=20
> LICENSE_CREATE_PACKAGE[type] =3D "boolean"
>=20
> LICENSE_CREATE_PACKAGE =3D "1"
> oe.data.typed_value(d, 'LICENSE_CREATE_PACKAGE') =3D=3D True
> LICENSE_CREATE_PACKAGE =3D "0"
> oe.data.typed_value(d, 'LICENSE_CREATE_PACKAGE') =3D=3D False

I did the same and now it's failing with:
AttributeError: 'str' object has no attribute 'getVarFlag'

here is last version
http://bpaste.net/show/73667/

Cheers,

> Available types: boolean, integer (with support for different bases), flo=
at
> (with support for hexadecimal floating point values), regex, choice (which
> lets you only allow from a set of possible string values), list (which do=
es
> the (d.getVar() or "").split() crap for you).
>=20
> You can also INHERIT +=3D "type_check", and you'll know immediately at
> ConfigParsed time if any of the values are invalid for their specified
> types.
> --=20
> Christopher Larson

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DnHvQagWhP6kG70s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEH8eIACgkQN1Ujt2V2gBzUDwCfYa0zOzwqqpC5PWUrlzL744WL
jXwAnRpIuPNwno4WKzI8t8Zk6ayk/fG/
=Zkad
-----END PGP SIGNATURE-----

--DnHvQagWhP6kG70s--
