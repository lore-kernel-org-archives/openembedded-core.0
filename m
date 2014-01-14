Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9468A6AE73;
	Tue, 14 Jan 2014 12:13:27 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id b15so91343eek.18
	for <multiple recipients>; Tue, 14 Jan 2014 04:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9lY88ePVmB8JF6TRXj8Kltc/1Ps7yHOLxrU3scY/M/g=;
	b=lcqQ76MJY+XdnJ9ZELQpGgxhMStUvH42JZROS7R6MtN8kE4/94NWg68IlzBu0JARp6
	0kRSwD9yrXFZl/a0HLbVCvREEHTVDp5MvfyGT3xtSDe7bhFCDh05z+KjP3M5dqdmZ0y3
	5l/sXzwaHwxAEQDySUlZweU+mnHmoUl+EQEJB5CRMcRT/X94nCQIQ/meBx/w4CUrn3mN
	i1uOPnCE4ugtyyLTjybp3By24md91Nblc4naEMO5FWBV/KsIaJrTNe3+bkfljoH04OfA
	1f4PVVvDB7KyDaZoclX5vcB5kZnSgjpwW8V9YJ92B12fiJDdbKMiGXmn+iGXzPaimCG2
	vjOQ==
X-Received: by 10.15.45.135 with SMTP id b7mr1781652eew.88.1389701608252;
	Tue, 14 Jan 2014 04:13:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm1107997eeh.8.2014.01.14.04.13.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 04:13:27 -0800 (PST)
Date: Tue, 14 Jan 2014 13:13:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140114121347.GB3717@jama>
References: <7166127.YkfX3aIoNI@helios>
MIME-Version: 1.0
In-Reply-To: <7166127.YkfX3aIoNI@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Public TSC / OE Workgroup meeting today
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
X-List-Received-Date: Tue, 14 Jan 2014 12:13:28 -0000
X-Groupsio-MsgNum: 48963
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2014 at 10:08:35AM +0000, Paul Eggleton wrote:
> Hi all,
>=20
> There will be a public OpenEmbedded TSC/workgroup meeting today - there=
=20
> wouldn't normally be one scheduled but there was quite a lot of discussio=
n=20
> last time (which is a good thing!). If you're interested in discussing lo=
ng-
> term technical efforts around the OpenEmbedded project please join us on=
=20
> irc.freenode.net in channel #oe at=20
> 17:00 GMT (9am PST, 11am CST, 12 EST, 18:00 CET) today.
>=20
> Topics we covered last meeting:
>=20
> * Qt 4 / 5 recipes in OE-Core
> * Rising bug count in Bugzilla and what we can do about it
> * (briefly) Patch review/merging process
> * Absentee layer maintainers
>=20
> Issues we didn't get to last time (that weren't resolved on the mailing l=
ist):
> - janitorial day/week?
> - "bitbake world" failures scrub
> - initrdscripts/init-live needs work
> - lava evaluation
> - website and other infrastructure issues
> - next release
>=20
> New issues for discussion are also welcome.

Not sure if it's worth new item on agenda, but maybe we should move
meta/classes/image-prelink.bbclass functionality to package.bbclass,
maybe we have more cases like this where image build is changing files
which are provided by normal packages (such cases are lost after
upgrading on device with packagemanager).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLVKfsACgkQN1Ujt2V2gBwYYQCgtcmHMctvoPP+jto2qQbE9R/b
nk4An1+VCh457MOoMdK39wKokUpTOQv4
=nqT5
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
