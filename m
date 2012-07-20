Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsF8Z-00013g-Sd
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:29:03 +0200
Received: by weyr6 with SMTP id r6so2604786wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=brXKSZzFcfcPPzqKKNrcEGlJknD66hoW5Cpmwiz2ijU=;
	b=syoKZo1Bjh0RkrTWnITkUoOdDCv9DU1K3otgcVYBYccqnKH1U9UkyHOBdmEYwX1cWx
	iFMozqMzyNz5hpLDPILGP9GV1aIgL3pIRkF4irgoyGALt1S4i5DH1an2t8SNSkcmCyT3
	eNdKKSLUGvuAR13JkqiEouRqee/fcvhVHvixUO2daNy6IBqr+g0a4R5cdrYpEGZQ5XLj
	ch9kx/LtaD6QMClLyN22zhKWA546ygNh14YcASqUGzxdMhr7cQJNyB8KmQ+Fnma61J7j
	Y0pleluPe9jzhedGOePQHjn02uQhGc/Nvw6ENGeurGCGHnE30AQ1ZBsjbnpwyEsrm4LV
	+CbA==
Received: by 10.180.105.130 with SMTP id gm2mr26985322wib.6.1342797460733;
	Fri, 20 Jul 2012 08:17:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm45207786wib.10.2012.07.20.08.17.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 08:17:39 -0700 (PDT)
Date: Fri, 20 Jul 2012 17:17:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120720151751.GH3534@jama.jama.net>
References: <20120720093208.GD3534@jama.jama.net>
	<1342792561.21788.17.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1342792561.21788.17.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Yocto style guide change proposal
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
X-List-Received-Date: Fri, 20 Jul 2012 15:29:04 -0000
X-Groupsio-MsgNum: 25866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Content-Disposition: inline

--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2012 at 02:56:01PM +0100, Richard Purdie wrote:
> On Fri, 2012-07-20 at 11:32 +0200, Martin Jansa wrote:
> > Now we have horrible mixture of whitespaces (tabs and space) only in=20
> > recipe files, because yocto style guide recommends tabs in shell
> > functions. So if recipe has e.g. do_install_append as well as
> > populate_packages_prepend (not so uncommon combination as tabs fixing
> > patches show), then according to yocto style guide it should look like
> > this:
> >=20
> > do_install_append() {
> > 	foo
> > }
> > python populate_packages_prepend () {
> >     libdir =3D bb.data.expand('${libdir}', d)
> >     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s li=
brary', extra_depends=3D'', allow_links=3DTrue)
> > }
> >=20
> > especially with default tab width 8 spaces it's ugly and because it
> > is inconsistent, many devs used spaces in shell functions too. Now when
> > someone accidentaly use tab also in python function it will show warning
> > or fail to parse. Some devs are using mix of tabs and spaces even on the
> > same line (e.g. to indent SRC_URI multiline entries).
>=20
> We've said tabs for shell functions for *years*. I'm sure if I were to
> look at the mailing list archives, that would be clear.

Is new developer supposed to read all mailing list archives few years
back? Or can we assume that he will google for style guide? Note about
tabs was added to yocto style guide by Saul 21:05, 7 April 2011 and even
now it says:
"Use spaces for indentation as developers tends to use different amount
of spaces per one tab."
So tabs should be used already only in shell tasks, not for multiline
variables etc..

Not sure if it's worth your time trying to find it in archive..

> In summary, I agree we need to make the style guides consistent and have
> one version of them. I disagree with spaces for everything though,m
> particularly as we have said to use tabs for as long and many of the
> recipes do this (certainly more than use spaces).

If someone is using 4 spaces everywhere, then he wont probably make
mistake by using anything else then 4 spaces in python tasks where it
matters.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAJdp8ACgkQN1Ujt2V2gByp9QCfSYE8oyjyE/vF0MzGxt5cBqTf
1JYAni26s3L5ikNT5jl503KgZM6IEDYT
=G3iA
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--
