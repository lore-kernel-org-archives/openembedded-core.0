Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1952A60043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 10:54:38 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so51821488wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=amz6Asv87kzSb31NeT7pvM8h5rmJoLp+rn19vbkpAwQ=;
	b=smsowthdBPTls/bJessr3JAUXwjd/XwQxhFanYnrOjFD9aQHih75UUJL8l2+Nhj24y
	00D+A8rHZSGNkJDIqmvvOBM2ycvzA63XjpdVysH4nMgUd76P1Fq5VzfB+btbz1eV4oZc
	zHVOe71167UGWWayUzOMx05vm7qOcN4D4t1IxUlTB9L0HT4+/bZl932RAKA6lAk3ClaR
	U3JUmusUHMOj624KBJKfNzi1yVF9q43+CE8eGd8a5q5hfvl6Tdes6QveGBLRIzLikXGd
	mUDrKaUkhoLMnpzX+A4U4xwINMOchESKAhWbSOIPEzhJQH/+zeyw2h4e3YvKjhqDLDLV
	Kx2A==
X-Received: by 10.194.85.129 with SMTP id h1mr39294098wjz.147.1428404079932;
	Tue, 07 Apr 2015 03:54:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ax10sm10408609wjc.26.2015.04.07.03.54.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 03:54:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Apr 2015 12:55:21 +0200
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20150407105521.GA2340@jama>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 07 Apr 2015 10:54:42 -0000
X-Groupsio-MsgNum: 64052
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2015 at 02:32:13PM +0000, Iorga, Cristian wrote:
> for 2.0 (why 1.10??), if that will be the name, all mechanisms for
> having BlueZ alternatives will be removed, and BlueZ 5 will be the
> only official supported BT stack.

why would you remove mechanisms for having BlueZ alternatives?

Some projects are still using different bluetooth implementations and
having the possibility to disable/replace bluez* is still useful.

Cheers,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
> Sent: Monday, April 6, 2015 4:18 PM
> To: Peter A. Bigot
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as the d=
efault BT stack
>=20
> On Mon, Apr 6, 2015 at 9:57 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> > On 04/06/2015 02:31 AM, Iorga, Cristian wrote:
> >
> > I thought of 1.9 as the preparatory stage for complete removal of=20
> > bluez4, so that in 2.0 it would be very easy to remove the support for =
bluez4.
> > Continuing to have bluez5 added to DISTRO_FEATURES create the=20
> > impression that BlueZ5 is still a second class citizen compared to=20
> > BlueZ4, and it is not my intention to sustain this opinion via code.
> >
> > I hereby standup for my solution. At the moment, we are 1to1. =E2=80=9C=
We=20
> > think=E2=80=9D =E2=80=93 Who are the others persons, Ross?
> >
> > /Cristian
> >
> >
> > While I fully support moving to bluez5 and use it in all my images, I=
=20
> > do think it's a bit abrupt to make it the default in the first stable=
=20
> > release that provides a usable bluez5.  On the other hand, Yocto's=20
> > late to the
> > bluez5 party and it's going to be harder to support bluez4 now.
> >
> > Six of one; sign me up as weak support for delaying the move to=20
> > default
> > bluez5 until 1.10.
> >
> > Just an opinion.
>=20
> I prefer bluez5 default in 1.9 and removal in 2.0 (or 1.10). We shouldn't=
 be support legacy without a very strong reason and if any member shows up =
to officially support bluez4 for longer we may drop its removal but bluez5 =
default should be done as soon as possible so we iron out regressions.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUjt5kACgkQN1Ujt2V2gBwBogCeM2P9mA5b5C0mEUlTurUCp9PH
y7gAnjTVcOQqrHlCSdRfDsdlYJd8vVKD
=B7eO
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
