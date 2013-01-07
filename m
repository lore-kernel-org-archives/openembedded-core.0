Received: from mail-wg0-f50.google.com ([74.125.82.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsBfa-0001QQ-Tf
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:19:21 +0100
Received: by mail-wg0-f50.google.com with SMTP id es5so9383859wgb.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=c7YUjOiNUQTmYYK67CScujFwIgxTfRxedoG3OTcuN1U=;
	b=Gc7WSO5Hn1mt1yiiswJUX6GK2ofWXr2WrlRaG6ecJnTvAAmQ+wH1ooa8b0gT+PVHIv
	/5le9XNRtgWdSPoPlfS9Iqkb+Iy70j3ab10AJ7YO2nu6WSXnBkT18I38PpMiwH2AHlBJ
	VdKr68/uF1nUZoKha2BMUl4EPP65OvbJTP27sLIlhytofdrqzvQY1dQxHbwcdAqzSK9I
	n8kQXNibl4byJGX0a0WC9GFKuG7+KLX1668hWW02KzxK7YsVQeLwgRtznKYNgxWel8v2
	ZrDpdwWkAxofTLoHwZZFfelLgNjmpLXOh8j8Alq8g7l/2gIh3R+NtFlY9OdbWseM9QNI
	WBxQ==
X-Received: by 10.180.73.202 with SMTP id n10mr8903695wiv.17.1357560241968;
	Mon, 07 Jan 2013 04:04:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l5sm13246489wia.10.2013.01.07.04.04.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 04:04:01 -0800 (PST)
Date: Mon, 7 Jan 2013 13:04:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130107120405.GB3285@jama>
References: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
	<1357558573.28649.231.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1357558573.28649.231.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dropbear: don't use IMAGE_FEATURES
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
X-List-Received-Date: Mon, 07 Jan 2013 12:19:33 -0000
X-Groupsio-MsgNum: 33394
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2013 at 11:36:13AM +0000, Richard Purdie wrote:
> On Mon, 2013-01-07 at 12:15 +0100, Martin Jansa wrote:
> > * IMAGE_FEATURES are image specific, but dropbear recipe isn't
> > * if you have debug-tweaks in EXTRA_IMAGE_FEATURES or added to
> >   IMAGE_FEATURES in distro config, then it will set DISTRO_TYPE
> >   to debug as expected, but if you add debug-tweaks only in
> >   your-own-debug-image, then dropbear never sees debug-tweaks and
> >   your-own-debug-image won't allow empty password login.
> > * best way would be to patch dropbear to enable empty password by
> >   runtime config or argument and enable it in ROOTFS_POSTPROCESS_COMMAND
> >   like openssh_allow_empty_password does, see
> >   http://permalink.gmane.org/gmane.network.ssh.dropbear/845
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/dropbear/dropbear.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-cor=
e/dropbear/dropbear.inc
> > index aa313df..2c170c6 100644
> > --- a/meta/recipes-core/dropbear/dropbear.inc
> > +++ b/meta/recipes-core/dropbear/dropbear.inc
> > @@ -2,7 +2,7 @@ DESCRIPTION =3D "Dropbear is a lightweight SSH and SCP =
implementation"
> >  HOMEPAGE =3D "http://matt.ucc.asn.au/dropbear/dropbear.html"
> >  SECTION =3D "console/network"
> > =20
> > -INC_PR =3D "r0"
> > +INC_PR =3D "r1"
> > =20
> >  # some files are from other projects and have others license terms:
> >  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
> > @@ -40,7 +40,7 @@ EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1 PROGRAMS=
=3D"${SBINCOMMANDS} ${BINCOMMANDS}"'
> >  EXTRA_OECONF +=3D "\
> >   ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable=
-pam', d)}"
> > =20
> > -DISTRO_TYPE ?=3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "=
debug", "",d)}"
> > +DISTRO_TYPE ?=3D "debug"
> > =20
> >  do_install() {
> >  	install -d ${D}${sysconfdir} \
>=20
> How about we ditch DISTRO_TYPE entirely and check for "debug-tweaks" in
> DISTRO_FEATURES? This would bring it more into line with the other
> places we do things like this.

Fine with me, I don't use dropbear, but I've spent some time to debug
why drobear sometimes doesn't work as expected and shared this change
just to make it more deterministic.

I'm fine with debug-tweaks DISTRO_FEATURES but afaik it's first use and
can be confusing with IMAGE_FEATURES with the same name, that's why I've
kept DISTRO_TYPE which was used at least in OE-classic days.

Cheers,

> FWIW I agree this should ideally be runtime configured and we should
> really add an enhancement request to the bugzilla for that (or patches
> welcome).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDqubUACgkQN1Ujt2V2gByDRACguDQ7EMyMf1gbONvMDM5jj81O
mQMAn0SvdSr/UK98KJM4c0UhdRgUYiMm
=1x97
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
