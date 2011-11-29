Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVV4v-0005dy-Gz
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:19:01 +0100
Received: by eaad13 with SMTP id d13so3671338eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:12:22 -0800 (PST)
Received: by 10.213.13.65 with SMTP id b1mr44977eba.86.1322601141913;
	Tue, 29 Nov 2011 13:12:21 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d6sm109276557eec.10.2011.11.29.13.12.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 13:12:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 29 Nov 2011 22:12:19 +0100
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E3D9E7EE@orsmsx504.amr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
	<1322598026.3077.11.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E7EE@orsmsx504.amr.corp.intel.com>
Message-Id: <BB6EF238-BA85-4C45-AF7E-4C15C7146CDA@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 21:19:01 -0000
X-Groupsio-MsgNum: 13166
Content-Type: multipart/signed;
	boundary="Apple-Mail=_19DB585B-12C8-4BFC-A53C-BCEDDE0419F7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_19DB585B-12C8-4BFC-A53C-BCEDDE0419F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 29 nov. 2011, om 22:08 heeft Kamble, Nitin A het volgende geschreven:

>=20
>=20
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf =
Of
>> Phil Blundell
>> Sent: Tuesday, November 29, 2011 12:20 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 1/4] gmp: also generate the libgmpcxx
>> library & package it properly
>>=20
>> On Tue, 2011-11-29 at 11:30 -0800, nitin.a.kamble@intel.com wrote:
>>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>>=20
>>> configure runs few checks to make sure c++ compiler and runtime are
>> working
>>> as expected with the --enable-cxx=3Ddetect option. And it enables
>> building
>>> of libgmpxx library.
>>>=20
>>> Same as earlier the libgmp.so.10.x file is packaged in the libgmp10
>> package,
>>> and a new package named libgmpxx4 is added for libgmpxx.so.4.x file.
>>>=20
>>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> Signed-off-by: Phil Blundell <philb@gnu.org>
>>=20
>> Um, why does this patch have my name in Signed-off-by?
>>=20
>> p.
>=20
> Because I took the code from your email.

That still doesn't explain why you added a signed-off-by without asking. =
A SOB has a defined meaning, willy nilly adding people amounts to fraud.



--Apple-Mail=_19DB585B-12C8-4BFC-A53C-BCEDDE0419F7
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7VSrMACgkQMkyGM64RGpFfdwCgsruVZsgIe4hF78FCE6AgfC71
oNQAn3Ekh6DzZf+Aef73ucqnhBSqIrGh
=YLIM
-----END PGP SIGNATURE-----

--Apple-Mail=_19DB585B-12C8-4BFC-A53C-BCEDDE0419F7--
