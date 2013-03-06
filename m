Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UDMSG-0004mj-UO; Wed, 06 Mar 2013 23:04:59 +0100
Received: by mail-pb0-f45.google.com with SMTP id ro8so6608457pbb.32
	for <multiple recipients>; Wed, 06 Mar 2013 13:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=H4OekfcelYSaR6lWV6oNhVjZZo1HzLRljugdokVbE2Y=;
	b=pVpJPIkQjh7sw7SRV+NVFep2eozej/M70IZJfK23QLvTtcxu1f7t83j3Tuttr+Y6YT
	+RJhwIUAK06AzXqjjQebnukovrNiuVqap8g8ZlWyIIStQXYcPgN3vyBmQSqv+AOLGU9a
	uB/3mk8bwmZ71yEcBF6fQw3GlzgoQL45EtZrJaZ5LejMpXwFb6izEPK3kFVd9OwJFbPw
	q9JWJTjt+hqTuPt0/hl90e8QeQgGfXNtPdkJD7t66v32n93gt6swYYKHfxgDxIoGom7T
	PtHy6KxKJUVNSprO6tN7GxULIEJNboi/xjtkjqOGx2vZOIIiAV1JRXZve5/98cnPZ9Lr
	404A==
X-Received: by 10.68.125.169 with SMTP id mr9mr49064027pbb.74.1362606504692;
	Wed, 06 Mar 2013 13:48:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id c6sm9276421pbm.45.2013.03.06.13.48.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 13:48:23 -0800 (PST)
Date: Wed, 6 Mar 2013 22:48:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130306214818.GG32228@jama.dyndns-home.com>
References: <20130305131417.4F97A50394@opal>
	<20130306205339.GF32228@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130306205339.GF32228@jama.dyndns-home.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: Missing gst-plugins-good package Was: [oe-commits] Richard Purdie : recipes: Fix ALLOW_EMPTY with no package specified
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
X-List-Received-Date: Wed, 06 Mar 2013 22:05:02 -0000
X-Groupsio-MsgNum: 36296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NY6JkbSqL3W9mApi"
Content-Disposition: inline

--NY6JkbSqL3W9mApi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 09:53:39PM +0100, Martin Jansa wrote:
> On Tue, Mar 05, 2013 at 01:14:17PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: fe81bd4f600877e63433184cfc2e22c33bb77db6
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3Dfe81bd4f600877e63433184cfc2e22c33bb77db6
> >=20
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Sun Mar  3 15:54:29 2013 +0000
> >=20
> > recipes: Fix ALLOW_EMPTY with no package specified
> >=20
> > There are various usages of ALLOW_EMPTY with no packages specified. This
> > is not recommended syntax, nor is it likely to be supported in the futu=
re.
> > This patch improves the references in OE-Core, either removing them if =
they're
> > pointless (e.g. when PACKAGES=3D"") or specifying which package it appl=
ies to.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> > +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> > @@ -24,8 +24,6 @@ python populate_packages_prepend () {
> >      d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
> >  }
> > =20
> > -ALLOW_EMPTY =3D "1"
> > -
> >  PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"
> >  FILES_${PN}-apps =3D "${bindir}"
>=20
> This change is correct ('ALLOW_EMPTY_' + metapkg is set few lines above).
>=20
> Just wanted to warn others that I've found few examples in other layers
> which were RDEPENDing also on ${PN} not metapkg and after this cleanup
> some packages were failing to install in rootfs.

I take this back
even gst-plugins-good-meta is RDEPENDing on gst-plugins-good so
ALLOW_EMPTY_${PN} =3D "1" should be also set.

The problem is not in gst-plugins-bad, because this one includes few
/usr/lib/libgst*.so files (while only /usr/lib/gstreamer-0.10 are
splitted).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NY6JkbSqL3W9mApi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE3uaIACgkQN1Ujt2V2gBziFgCfWWoKvNFCxVUFI0yqgOqXkgao
ha4AoIUHhUFbLWG6BjFHAgfO4OGzxpnP
=CzV5
-----END PGP SIGNATURE-----

--NY6JkbSqL3W9mApi--
