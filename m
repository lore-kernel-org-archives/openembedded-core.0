Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDAqp-0002lZ-Bs
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 10:36:59 +0200
Received: by eekc1 with SMTP id c1so726167eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7UnWqTlP7t5JPBYwJ4QK056gVrGkFZCgCOzIPF6urd8=;
	b=dI7HTKMZ6jhEewWqK4cKDpIH9TZH1SkXE0tQFMd6cQ7EDhPyoz8QVmitcQP0FqH8TN
	U0PGrejNdN5lW+V/nEcnVcwv/Y/VACNc0pVVc+x+YaJV0qjOG0WD7zOH1j3buETKXAVj
	Y9E4xdwGF0eQuDipHK7SsFiXa2pjw/iZzOoUoprRgai48AF7uDcaercJl1IFyQe2TR53
	hqiWx7o7bq8ZI0ge9xRX1EhvfTQIFR+AsnJOLQOq1t9hKIIsEyz7HBGC0htcMe4XrYSP
	0r/X2JpC956PZN0SdSxSTaHRzrNzDfl0yVVr8vtJPMVsdEhzeekcE97ZbOF/Ebtpebuu
	BgJQ==
Received: by 10.180.92.130 with SMTP id cm2mr3387983wib.4.1333009676168;
	Thu, 29 Mar 2012 01:27:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm25407239wib.6.2012.03.29.01.27.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 01:27:55 -0700 (PDT)
Date: Thu, 29 Mar 2012 10:27:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329082756.GJ4004@jama.jama.net>
References: <alpine.DEB.2.02.1203290409580.29356@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1203290409580.29356@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: why use both IMAGE_FEATURES and EXTRA_IMAGE_FEATURES in a single .bb file?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 08:36:59 -0000
X-Groupsio-MsgNum: 19936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/0U0QBNx7JIUZLHm"
Content-Disposition: inline

--/0U0QBNx7JIUZLHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 04:11:57AM -0400, Robert P. J. Day wrote:
>=20
>   given the recent excitement over "+=3D" and "=3D+", i thought i'd point
> out again the occasional weirdness like this snippet from
> core-image-sato-sdk.bb:
>=20
> IMAGE_FEATURES +=3D "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs to=
ols-sdk qt4-pkgs"
> EXTRA_IMAGE_FEATURES +=3D "tools-debug tools-profile tools-testapps debug=
-tweaks"

sometimes this is usefull to define "base" in IMAGE_FEATURES and then
stuff which people tend to override in .bbappend put in EXTRA_IMAGE_FEATURES

Maybe that's not the case here.. but separate variables are good even if
it looks weird in .bb alone

FOO =3D "blah"
BAR =3D "base ${FOO}"

allows to remove/replace "blah" very easy with .bbappend.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/0U0QBNx7JIUZLHm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk90HQwACgkQN1Ujt2V2gBwVFACfQOgdglpeEccpI67hYqGQqUX2
HaAAoKLEz1ivQsCGV4GAwqPPH6imhXCP
=ZG4S
-----END PGP SIGNATURE-----

--/0U0QBNx7JIUZLHm--
