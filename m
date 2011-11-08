Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RNnxN-0003vv-GQ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 16:51:25 +0100
Received: by wyh5 with SMTP id 5so639074wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 07:45:11 -0800 (PST)
Received: by 10.180.107.97 with SMTP id hb1mr13903165wib.18.1320767110903;
	Tue, 08 Nov 2011 07:45:10 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hn15sm1078504wib.22.2011.11.08.07.45.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 07:45:09 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EB94C93.1080100@linux.intel.com>
Date: Tue, 8 Nov 2011 16:45:07 +0100
Message-Id: <E6229E4A-95BA-4B21-BDCF-7CD59D50D8AF@dominion.thruhere.net>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
	<ea69345b97a6115caa6b77782f2fd58dd9eb2507.1320675529.git.Martin.Jansa@gmail.com>
	<4EB94C93.1080100@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe-core 2/6] kbd: import from meta-oe
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
X-List-Received-Date: Tue, 08 Nov 2011 15:51:25 -0000
X-Groupsio-MsgNum: 12103
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1ABE1E51-8674-4ED0-88BF-70016D5EA514";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1ABE1E51-8674-4ED0-88BF-70016D5EA514
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 8 nov. 2011, om 16:36 heeft Saul Wold het volgende geschreven:

> On 11/07/2011 06:19 AM, Martin Jansa wrote:
>> * replaces console-tools used in keymaps
>>=20
>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-core/kbd/kbd_1.15.2.bb |   19 +++++++++++++++++++
>>  1 files changed, 19 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb
>>=20
>> diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb =
b/meta/recipes-core/kbd/kbd_1.15.2.bb
>> new file mode 100644
>> index 0000000..36e68a0
>> --- /dev/null
>> +++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION =3D "This package contains keytable files and keyboard =
utilities"
>> +# everything minus console-fonts is GPLv2+
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D587ce626d15bd61699a64a6b8a5afefb"
>> +
>> +inherit autotools gettext
>> +
>> +BBCLASSEXTEND =3D "native"
>> +
>> +SRC_URI=3D"${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
>=20
> Apparently this is not currently fetchable, do you have an updated =
location?  I found something at fossies.org, but the COPYING file is =
different that your checksum, so I am not sure of the differences.

http://www.angstrom-distribution.org/unstable/sources/kbd-1.15.2.tar.bz2 =
should be good for another 3 years.

regards,

Koen=

--Apple-Mail=_1ABE1E51-8674-4ED0-88BF-70016D5EA514
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk65ToMACgkQMkyGM64RGpFkGQCfTYn4ATHA6OwpZLrcDQkUXTs9
0cwAmgLWRnRMVWJfQnwxEpAaYh3yxgGW
=Fazc
-----END PGP SIGNATURE-----

--Apple-Mail=_1ABE1E51-8674-4ED0-88BF-70016D5EA514--
