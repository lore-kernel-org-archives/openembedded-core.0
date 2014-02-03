Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 39AD06E88D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 14:19:16 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so3685723eek.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6f5POOvGYrZY2WCi6EAtMe/eazyiG267SfItmk0QSZQ=;
	b=ReroN5etQKZq0c5ttLO4nTyr02foYz6ssMln2MdXj0bc6sTjvvWsWXl2qJEZ0NvaDi
	XYxazLfBR0tEZavg9pCTTHDreMRVlvppBOimg3aPrT9M7/6i0ftYq+7poKCgDWKgg4v+
	YUNofpzaAQxnyenZsZVbSInfX5EX6oZLbe/xImDBqBllrVKGkw8TPNj9yvgoF8XqlpBO
	2VGLn6IxLANu9lHJ66y2Up1ZgsZxwV1HdrKyuwlfveqTVIKaSkbEd2A8E2NMWS+e5IIV
	piEEgIOiGCtYuQc3YFfacA2ZzFA1OsHCwDfV4qYxna4cw8UaVvC5utg0t+5c8ZNF52je
	LYzA==
X-Received: by 10.14.204.200 with SMTP id h48mr88971eeo.116.1391437156767;
	Mon, 03 Feb 2014 06:19:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id f45sm19070031eeg.5.2014.02.03.06.19.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2014 06:19:15 -0800 (PST)
Date: Mon, 3 Feb 2014 15:19:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Message-ID: <20140203141914.GB3698@jama>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
	<1846327.CZeKFxv0XS@peggleto-mobl5.ger.corp.intel.com>
	<52EF97D6.8090708@gmail.com>
MIME-Version: 1.0
In-Reply-To: <52EF97D6.8090708@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] udev: add udev-utils to RDEPENDS
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
X-List-Received-Date: Mon, 03 Feb 2014 14:19:18 -0000
X-Groupsio-MsgNum: 49789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline

--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2014 at 02:21:26PM +0100, David Nystr=F6m wrote:
> On m=E5n  3 feb 2014 14:03:47, Paul Eggleton wrote:
> > Hi David,
> >
> > On Monday 03 February 2014 13:58:49 David Nystr=F6m wrote:
> >> An intended fix for below error message with core-image-lsb,
> >> Sending this as an RFC since I dont really know what constitutes
> >> a RRECOMMENDS vs. RDEPENDS.
> >> Is this clearly defined somewhere ?
> >> Below should be an RDEPENDS, no ?
> >
> > Does this actually fix the problem though? An RRECOMMENDS would only no=
t be
> > satisfied if the package ended up empty, or you were using BAD_RECOMMEN=
DATIONS
> > (or NO_RECOMMENDATIONS). I can't see this change actually accomplishing
> > anything.
> >
> > Cheers,
> > Paul
> >
>=20
> Thanks for the quick reply,
> I was using --no-recommends, via the opkg package-manager.=20
> (rootfs-sandbox).
>=20
> Regarding the split between RRECOMMENDS and RDEPENDS:
> In my understanding, RRECOMMENDS would be when the functionality is=20
> optional,
> RDEPENDS when dependency is hard.

Don't forget on RSUGGESTS :)

RDEPENDS - hard dependency
RRECOMMENDS - optional dependency, but good to have in most cases by
default unless it's unavailable (e.g. typical for kernel-modules-*) or
distro/user knows what he is doing and decides to add it in
BAD_RECOMMENDATIONS or removes is on target explicitly
RSUGGESTS - really optional dependency

> To me, this seems like a hard dependency. But a definition between the=20
> two would be good to have
> for future patches.
>=20
> Br,
> David
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLvpW4ACgkQN1Ujt2V2gBwA7QCeO0BjN0RKkXWFyQSsrKhSSdhM
BpEAniL6+L07vV43OcSW4627xfOLVcm2
=LT/H
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
