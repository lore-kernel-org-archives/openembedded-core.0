Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVQ38-0008KK-Sd
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 16:56:51 +0100
Received: by bkbzs2 with SMTP id zs2so9519356bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 07:50:11 -0800 (PST)
Received: by 10.204.154.77 with SMTP id n13mr51775223bkw.83.1322581810850;
	Tue, 29 Nov 2011 07:50:10 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e18sm37808952bkr.15.2011.11.29.07.50.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 07:50:10 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322579029.7964.0.camel@ted>
Date: Tue, 29 Nov 2011 16:50:04 +0100
Message-Id: <FBD66FA7-8184-4933-AB82-124F18225ECF@dominion.thruhere.net>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: ulf@emagii.com, "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Tue, 29 Nov 2011 15:56:51 -0000
X-Groupsio-MsgNum: 13127
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CC452A43-22CC-40CC-A159-66B912021EEE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CC452A43-22CC-40CC-A159-66B912021EEE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 29 nov. 2011, om 16:03 heeft Richard Purdie het volgende geschreven:

> On Sat, 2011-11-26 at 12:24 +0100, Ulf Samuelsson wrote:
>> Downloaded the latest, and tried building console-image for qemuarm.
>> Host =3D Ubuntu 11.04 i686.
>>=20
>> Looked through the build log, and thought I'd share it with the list.
>=20
> Thanks for doing this, its valuable feedback.
>=20
>> A number of warnings (see below)
>=20
> We're trying to work through addressing those. Some of them are from
> versions in meta-oe where there is a fix for the error in OECore (such
> as the libgcc linker hash style).

Assuming your statement is true, why isn't the hash style fixed in the =
.inc? Meta-oe uses the ones from OE-core, so if the include files are =
sane, the toolchain for meta-oe is sane.


--Apple-Mail=_CC452A43-22CC-40CC-A159-66B912021EEE
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7U/y4ACgkQMkyGM64RGpFQKACglha7Wg0E6Z0ZGx30IlV/aGxe
XpQAnA0O5hRWn14xyGeYH8A005975dxz
=emxt
-----END PGP SIGNATURE-----

--Apple-Mail=_CC452A43-22CC-40CC-A159-66B912021EEE--
