Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBOma-00029m-RB
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 12:05:16 +0100
Received: by wgbdr12 with SMTP id dr12so2419436wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 03:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bqTkCtM/0IIKZOH3a5HfMLsSfyRXMpcKjiMM8KPkwQ8=;
	b=fdRA7GYt7T+hGHs3O7xUkzcG9D4+rmNMwh+Yi0352qMsT5EnqWxo7CY9EuXur6rsf1
	s0p2YnhhcnvzHSNbybM/QlZbLBcXND1ED0xHjugUVCttN8y7P2U4mi3byQjOMUniO9ki
	J2Wt/vDZ8kqc661D3p8gqrHyob2EcLROK45TOVeFIiEJcUclsBUb5apcJKTevRPKNPla
	oD28tTBNp8tuuiJ472ZFyoxWfohMdjjjSDhzvVojtYjDPtSabIkDS+nSh2mjgZr2wINB
	wZZmTjig9wWkuK50OODJKJqjqUpZ2qphrzhrnN4+g5AnZ0a7N6Uho7DQfd1rRQQ+w1TJ
	tq4g==
Received: by 10.180.107.101 with SMTP id hb5mr4949149wib.3.1332586579762;
	Sat, 24 Mar 2012 03:56:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm36034672wib.7.2012.03.24.03.56.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 03:56:19 -0700 (PDT)
Date: Sat, 24 Mar 2012 11:56:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120324105622.GI4604@jama.jama.net>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
	<313583f23e026bed3155643d1e8914313fce7478.1332541342.git.Martin.Jansa@gmail.com>
	<1332583353.9740.500.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332583353.9740.500.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv 08/10] libusb*: import native support from meta-oe
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
X-List-Received-Date: Sat, 24 Mar 2012 11:05:16 -0000
X-Groupsio-MsgNum: 19674
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="poJSiGMzRSvrLGLs"
Content-Disposition: inline

--poJSiGMzRSvrLGLs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 10:02:33AM +0000, Richard Purdie wrote:
> On Fri, 2012-03-23 at 23:30 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 +++++--
> >  meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 ++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> Looking at this, it makes no sense. Why does our build system need to be
> trying to extract information from the *native* system's USB bus?
>=20
> I can understand pango and cairo for font rendering in something like
> icons but libusb-native?

It's useful e.g. for native tools dfu-util, libftdi, usbpath

> Are you really sure we need this and have no other options as I can't
> see it actually being used...

Yes we can keep .bbappends with BBCLASSEXTEND =3D "native" in meta-oe, but
my point was that having 2 lines in .bb is less error-prone then
renaming .bbappends after version upgrade in oe-core.

> Looking at the other patches, I'm guessing they're broken without your
> PACKAGECONFIG change to fix -natives. A goal of this release is to have
> everything building and working that we ship. These 'simple'
> BBCLASSEXTENDs are likely going to change that.=20

Those weren't failing for me (maybe just because their native deps are
"usually" built before them), gtk+-native was first where I've seen
libx11-native and libxrender-native missing in every build from scratch.

And this happens only since gtk+ was improved with PACKAGECONFIG to
respect DISTRO_FEAURES.. that's how I've found that bug.
=20
> I don't really want to spend my weekend trying to fix and then test the
> PACKAGECONFIG change so I can merge these patches, particular as I've
> spent most of the week including the evenings just getting things to
> build. Arguably there could be other PACKAGECONFIG issue already I guess
> so we probably should fix that before release anyway. With -rc1 on
> Monday, that will be tricky :(.

I don't mind if you merge it after release or whenever. I'm using shr
branches anyway.

Maybe it would be usefull to put patches you think are good enough to be
merged after release to master-next or somewhere so that people know
that some patches are considered generaly OK, but not just before
release. Or create named branch for release.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--poJSiGMzRSvrLGLs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9tqFYACgkQN1Ujt2V2gBzRbACeIC+KZhihOaZ6TR7M0LDMX/Ka
n58AoJRK3GqjMc0xyXoIhltdH+Zk9qrE
=QbFf
-----END PGP SIGNATURE-----

--poJSiGMzRSvrLGLs--
