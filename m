Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7924C6A8E9;
	Sat,  8 Jun 2013 09:15:37 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so2006312eak.23
	for <multiple recipients>; Sat, 08 Jun 2013 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nAyRWmha0BBapZoWR3jgnmoHoEN/joH+F6fMA6U/4ms=;
	b=ZXenq56TNmVrueHArQS4CDIw5mGrDtNo/4RWTG9NBwbQxj2N67Rxw0DOpMvNVUuYSG
	FaWdrVrA5gZc+Lrl2VHYE5w+CCq6jtVVw+a6A/1AeUGoyacgsE/6DIyGWO/E9fn0mvrR
	RvNQlZcV102JidBQ478SED3BOsAQYAHzJ8mK39+LF1rES5EQmK+/QkGpLYpe04EDuua8
	pqMnVpvlN9aS1Al8KDBlhDCpa/s8m4Sw3J+M891qoQHLmPfxufod+416GTm4XKnzKBg9
	xbZ/mxdpYm99yCfX8ttKNSTg2glzyU/quOCGU+ECDkeMimszhDuGzR2a/YtOW51N5K0N
	UZmg==
X-Received: by 10.15.35.71 with SMTP id f47mr2500071eev.15.1370682937913;
	Sat, 08 Jun 2013 02:15:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y44sm4762643eel.10.2013.06.08.02.15.36 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 08 Jun 2013 02:15:36 -0700 (PDT)
Date: Sat, 8 Jun 2013 11:15:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andy Voltz <andy.voltz@timesys.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20130608091556.GP22710@jama>
References: <20130607154357.606025038F@opal>
 <20130608091020.GO22710@jama>
MIME-Version: 1.0
In-Reply-To: <20130608091020.GO22710@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andy Voltz : tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Sat, 08 Jun 2013 09:15:38 -0000
X-Groupsio-MsgNum: 40352
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iiZKCn1f/U0ES2iY"
Content-Disposition: inline

--iiZKCn1f/U0ES2iY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 08, 2013 at 11:10:20AM +0200, Martin Jansa wrote:
> On Fri, Jun 07, 2013 at 03:43:57PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 3e4f4a1cf07ff7cf4c71566492385f8fbf581789
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D3e4f4a1cf07ff7cf4c71566492385f8fbf581789
> >=20
> > Author: Andy Voltz <andy.voltz@timesys.com>
> > Date:   Wed Jun  5 11:52:29 2013 -0400
> >=20
> > tune-cortexa.inc: create a common include for cortex-a armv7a tuning
> >=20
> > The tuning files for the cortex-a* processors are mostly identical for
> > the A7,A8,A9,A15 processors. Rework these files to use a CORTEX_ID
> > variable to setup the tuning for each specific processor.
> >=20
> > Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> Something is wrong with this one:
>=20
> ERROR:  OE-core's config sanity checker detected a potential misconfigura=
tion.
>     Either fix the cause of this error or at your own risk disable the ch=
ecker (see sanity.conf).
>     Following is the list of potential problems / advisories:
>=20
>     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (${AR=
MPKGARCH_tune-cortexa8t-neon}).Toolchain tunings invalid:
> Tuning 'cortexa8t-neon' has no defined features, and cannot be used.
>=20
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>=20
> Please use tests like
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
2-test
> to check that all tunes are still valid after such change.

Also it was using -mtune and documentation talks about -mtune, but
actual tune-cortexa.inc is using -mcpu, this change wasn't mentioned in
commit message and I don't think it's improvement.

> >=20
> > ---
> >=20
> >  meta/conf/machine/include/arm/README         |    3 ++
> >  meta/conf/machine/include/tune-cortexa.inc   |   35 ++++++++++++++++++=
++++++++
> >  meta/conf/machine/include/tune-cortexa15.inc |   35 +-----------------=
-------
> >  meta/conf/machine/include/tune-cortexa7.inc  |   35 +-----------------=
-------
> >  meta/conf/machine/include/tune-cortexa8.inc  |   35 +-----------------=
-------
> >  meta/conf/machine/include/tune-cortexa9.inc  |   35 +-----------------=
-------
> >  6 files changed, 46 insertions(+), 132 deletions(-)
> >=20
> > Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcom=
mitdiff;h=3D3e4f4a1cf07ff7cf4c71566492385f8fbf581789
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iiZKCn1f/U0ES2iY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGy9kwACgkQN1Ujt2V2gBwhFgCgsDx/poCBVUVnlscGmXAtEj9N
Ho4An1mP3vgforLmEG6rnrNWTnY8n6Cs
=3P4P
-----END PGP SIGNATURE-----

--iiZKCn1f/U0ES2iY--
