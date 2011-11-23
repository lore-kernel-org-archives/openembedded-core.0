Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTD7o-0001iq-Hh
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 14:44:32 +0100
Received: by ywb20 with SMTP id 20so1239068ywb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 05:38:00 -0800 (PST)
Received: by 10.152.132.39 with SMTP id or7mr14387080lab.14.1322055085979;
	Wed, 23 Nov 2011 05:31:25 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	pw12sm15893626lab.13.2011.11.23.05.31.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 05:31:24 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2845140.Nh9cgQnlu0@helios>
Date: Wed, 23 Nov 2011 14:31:18 +0100
Message-Id: <F5794506-A099-4AA8-87ED-98587660C851@dominion.thruhere.net>
References: <cover.1321972798.git.paul.eggleton@linux.intel.com>
	<503E71C5-C1CA-4A51-82EF-C52CBC2E43C5@dominion.thruhere.net>
	<2845140.Nh9cgQnlu0@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/1] packagehistory improvement
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
X-List-Received-Date: Wed, 23 Nov 2011 13:44:32 -0000
X-Groupsio-MsgNum: 12813
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EF2A4FC4-98D3-4927-B8E0-45A8F4CCE016";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EF2A4FC4-98D3-4927-B8E0-45A8F4CCE016
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 nov. 2011, om 14:24 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 22 November 2011 18:25:25 Koen Kooi wrote:
>> Does it still suffer from the bug where it will break if you change =
machine
>> and something goes backward in PV (e.g. gcc 4.6 is used on arm, but =
4.5 on
>> ppc)?
>=20
> So unless I'm mistaken the fix that you yourself applied to OE in 2009 =
(and=20
> which was included in Poky, and hence OE-core) already works around =
this=20
> specific situation, since the package history is always stored under a=20=

> BASEPKG_TARGET_SYS directory (or MULTIMACH_TARGET_SYS now with my =
patch since=20
> the former is no longer available). Am I missing something?

I'm trying hard to remember why I disabled it last year, I was convinced =
it was the TARGET_SYS thing, but apparently not. Good to know that I =
fixed it already :) I'll ask my coworker when he gets back, but I =
vaguely remember something about it acting funny with nostamp making =
consecutive runs of 'bitbake some-image' really slow.

regards,

Koen=

--Apple-Mail=_EF2A4FC4-98D3-4927-B8E0-45A8F4CCE016
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7M9akACgkQMkyGM64RGpHcogCfTakExojVHscaZrxNGX++TkAX
82sAoKOSClpELOs7zGb+0y3AFlSGqryq
=ZguG
-----END PGP SIGNATURE-----

--Apple-Mail=_EF2A4FC4-98D3-4927-B8E0-45A8F4CCE016--
