Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7715F73CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 12:34:43 +0000 (UTC)
Received: by widjs5 with SMTP id js5so9704507wid.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6SLNEYquDxSpTF3Xx3rzKoMGh+bt8zbXersqLv3kINc=;
	b=YbfxLyjTdEvrnFJnfbnaGNR1kpkBF7WX4JXBcwGk75bC40xgfe4YLl0S6waL53MNQz
	nDgGjpJHbG3ikxUt2wim7qAAb344I0XESHwsGlewjdqlp6gCkH/qciiFMpqnsWxqx2a9
	qudxPCGojQ3/E6ZpTXkofDml1utTmKQkQ/8HxsaRTQ0zw5NN27D602SVKUW4XepXcHE9
	JT2k2nr0oKSRsi2iHnCpCr5Mm1Zk7ee4SbVbWGFX1H7v+lARWG3Rd8w4g8km5EzJAQIV
	W/d/hp32zzUGf7YDOQf1DneH653Jk1fTQcYB0uTAFGBRXVJDKLhBaF/HkKtkAhHhDYLT
	jKvw==
X-Received: by 10.195.13.168 with SMTP id ez8mr39027589wjd.30.1428410084961;
	Tue, 07 Apr 2015 05:34:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id n1sm10860560wix.0.2015.04.07.05.34.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 05:34:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Apr 2015 14:35:27 +0200
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20150407123527.GD2340@jama>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
	<20150407105521.GA2340@jama>
	<969F26A8BAB325438E7EB80D3C3134FB2F496CCF@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F496CCF@irsmsx105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 12:34:46 -0000
X-Groupsio-MsgNum: 64073
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline

--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2015 at 11:21:09AM +0000, Iorga, Cristian wrote:
> Well:
> 1. That's a thing for the future
> 2. Who will maintain support for bugs reported to BlueZ 4.x? It's a matte=
r of resources.
> 3. "Projects using different Bluetooth implementations" is something diff=
erent from switching from BZ4 to BZ5 and vice versa. We don=E2=80=99t suppo=
rt multiple Bluetooth stacks, but (incompatible!) variants of BlueZ. That's=
 different. In the future, we will no longer support both, why complicate t=
he code?

Because OE is supposed to be flexible build system?

"switching from BZ4 to BZ5 and vice versa" is something different from
"all mechanisms for having BlueZ alternatives will be removed"

> /Cristian Iorga
> Yocto Project
> Intel Corporation
>=20
> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
> Sent: Tuesday, April 7, 2015 1:55 PM
> To: Iorga, Cristian
> Cc: Otavio Salvador; Peter A. Bigot; Patches and discussions about the oe=
-core layer
> Subject: Re: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as the d=
efault BT stack
>=20
> On Mon, Apr 06, 2015 at 02:32:13PM +0000, Iorga, Cristian wrote:
> > for 2.0 (why 1.10??), if that will be the name, all mechanisms for=20
> > having BlueZ alternatives will be removed, and BlueZ 5 will be the=20
> > only official supported BT stack.
>=20
> why would you remove mechanisms for having BlueZ alternatives?
>=20
> Some projects are still using different bluetooth implementations and hav=
ing the possibility to disable/replace bluez* is still useful.
>=20
> Cheers,
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org=20
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=
=20
> > Otavio Salvador
> > Sent: Monday, April 6, 2015 4:18 PM
> > To: Peter A. Bigot
> > Cc: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as=20
> > the default BT stack
> >=20
> > On Mon, Apr 6, 2015 at 9:57 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> > > On 04/06/2015 02:31 AM, Iorga, Cristian wrote:
> > >
> > > I thought of 1.9 as the preparatory stage for complete removal of=20
> > > bluez4, so that in 2.0 it would be very easy to remove the support fo=
r bluez4.
> > > Continuing to have bluez5 added to DISTRO_FEATURES create the=20
> > > impression that BlueZ5 is still a second class citizen compared to=20
> > > BlueZ4, and it is not my intention to sustain this opinion via code.
> > >
> > > I hereby standup for my solution. At the moment, we are 1to1. =E2=80=
=9CWe=20
> > > think=E2=80=9D =E2=80=93 Who are the others persons, Ross?
> > >
> > > /Cristian
> > >
> > >
> > > While I fully support moving to bluez5 and use it in all my images,=
=20
> > > I do think it's a bit abrupt to make it the default in the first=20
> > > stable release that provides a usable bluez5.  On the other hand,=20
> > > Yocto's late to the
> > > bluez5 party and it's going to be harder to support bluez4 now.
> > >
> > > Six of one; sign me up as weak support for delaying the move to=20
> > > default
> > > bluez5 until 1.10.
> > >
> > > Just an opinion.
> >=20
> > I prefer bluez5 default in 1.9 and removal in 2.0 (or 1.10). We shouldn=
't be support legacy without a very strong reason and if any member shows u=
p to officially support bluez4 for longer we may drop its removal but bluez=
5 default should be done as soon as possible so we iron out regressions.
> >=20
> > --=20
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br        http://code.ossystems.com.br
> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUjzw8ACgkQN1Ujt2V2gBxwCwCeO7qKNPiDF1/NeTpnsJb6DfLP
7hYAoIuaz1nSGL1B0ZeOCQ7OFGQ3h5O9
=j9/Z
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
