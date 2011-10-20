Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RH0Z7-0001bM-OR
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 23:54:17 +0200
Received: by bkat8 with SMTP id t8so4276155bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RnQd94p+AK6hoHnAN3Vt467sAhqvdNoVkO0QWtwGeTk=;
	b=If8V52+kqLOYr4Fu42sPjF6jMH/enqq7YkaqlB7Hr2vM3KvNLJk+ksnNj6koQyk8y8
	+jlvs1GjvzZPmld3z8R9CF3TqiZV9/bDPbNNc44LgR+fJJZ/oYFP2qKFh9ACsO5a5wEu
	/Ik/FR+EcZS0rEDragmnBeaLZwi/VGI0I8uoc=
Received: by 10.204.137.72 with SMTP id v8mr9330802bkt.35.1319147305346;
	Thu, 20 Oct 2011 14:48:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm11244170bkv.8.2011.10.20.14.48.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 14:48:23 -0700 (PDT)
Date: Thu, 20 Oct 2011 23:48:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111020214817.GM3522@jama.jama.net>
References: <cover.1319139126.git.raj.khem@gmail.com>
	<15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
	<20111020194453.GL3522@jama.jama.net>
	<B412182F-53D6-406D-8751-2E179257D135@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <B412182F-53D6-406D-8751-2E179257D135@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/4] xserver-xorg: Add mesa-dri to DEPENDS
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
X-List-Received-Date: Thu, 20 Oct 2011 21:54:17 -0000
X-Groupsio-MsgNum: 11370
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rpGc+ACYPE+RMC+Z"
Content-Disposition: inline

--rpGc+ACYPE+RMC+Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 11:42:27PM +0200, Koen Kooi wrote:
>=20
> Op 20 okt. 2011, om 21:44 heeft Martin Jansa het volgende geschreven:
>=20
> > On Thu, Oct 20, 2011 at 12:36:01PM -0700, Khem Raj wrote:
> >> Fixes the compile problems e.g.
> >>=20
> >> | checking for GL... yes
> >> | checking for DRIPROTO... yes
> >> | checking for DRI... no
> >> | configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D
> >> 7.8.0) were not met:
> >> |
> >> | No package 'dri' found
> >> |
> >> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> >> | installed software in a non-standard prefix.
> >>=20
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> .../xorg-xserver/xserver-xorg_1.11.1.bb            |    1 +
> >> 1 files changed, 1 insertions(+), 0 deletions(-)
> >>=20
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb=
 b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
> >> index 0f94fe2..2aa71e5 100644
> >> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
> >> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
> >> @@ -1,2 +1,3 @@
> >> require xserver-xorg.inc
> >> require xserver-xorg-${PV}.inc
> >> +DEPENDS +=3D "mesa-dri"
> >=20
> > You can do this in xserver-xorg.inc
> > just change
> > LIB_DEPS +=3D "virtual/libgl" to
> > LIB_DEPS +=3D "mesa-dri"
>=20
> that will drag it in for -lite as well, is that OK?

No it will not, this is not xserver-xorg-common.inc

I'll send patch for default-providers.inc to switch default to mesa-dri
too.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rpGc+ACYPE+RMC+Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6glyEACgkQN1Ujt2V2gBzeEgCglbt2nh+RGMnl8m5FD1bQqTsW
HAIAn0xh4Zdbe3Ys3DIi9hRHuzzI7zp7
=KoZP
-----END PGP SIGNATURE-----

--rpGc+ACYPE+RMC+Z--
