Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RKvPt-00013M-VM
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:12:58 +0100
Received: by wyh5 with SMTP id 5so1403695wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:06:48 -0700 (PDT)
Received: by 10.216.4.207 with SMTP id 57mr4531866wej.110.1320080808260;
	Mon, 31 Oct 2011 10:06:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id es5sm33545445wbb.11.2011.10.31.10.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:06:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 31 Oct 2011 18:06:41 +0100
In-Reply-To: <4EAED524.50306@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319510805.git.wenzong.fan@windriver.com>
	<1848a21e3972096a5169697c16abf2dd9edd17ba.1319510805.git.wenzong.fan@windriver.com>
	<4EAED524.50306@intel.com>
Message-Id: <406DBB9E-C6C4-4CAC-9A6B-6C796C5ACBA6@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Mon, 31 Oct 2011 17:12:58 -0000
X-Groupsio-MsgNum: 11699
Content-Type: multipart/signed;
	boundary="Apple-Mail=_391092C1-70E5-4A0A-BC66-AD4DCCEE6DD4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_391092C1-70E5-4A0A-BC66-AD4DCCEE6DD4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 31 okt. 2011, om 18:04 heeft Saul Wold het volgende geschreven:

> On 10/24/2011 07:49 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>=20
>> Update packages tracking fields including ccache, chkconfig.
>>=20
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>>  .../conf/distro/include/distro_tracking_fields.inc |   12 =
++++++++++++
>>  1 files changed, 12 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc =
b/meta/conf/distro/include/distro_tracking_fields.inc
>> index 1f3540e..f053f87 100644
>> --- a/meta/conf/distro/include/distro_tracking_fields.inc
>> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
>> @@ -5976,6 +5976,18 @@ RECIPE_MANUAL_CHECK_DATE_pn-libsdl =3D "Jul =
28, 2011"
>>  RECIPE_MAINTAINER_pn-libsdl =3D "Kai Kang<kai.kang@windriver.com>"
>>  DISTRO_PN_ALIAS_pn-libsdl =3D "Fedora=3DSDL Opensuse=3DSDL"
>>=20
>> +RECIPE_STATUS_pn-ccache =3D "green"
>> +RECIPE_MAINTAINER_pn-ccache =3D "Wenzong =
Fan<wenzong.fan@windriver.com>"
>> +RECIPE_LATEST_VERSION_pn-ccache =3D "3.1.6"
>> +RECIPE_LAST_UPDATE_pn-ccache =3D "October 19, 2011"
>> +RECIPE_MANUAL_CHECK_DATE_pn-ccache =3D "October 25, 2011"
>> +
> This should be MMM (as in Oct), not spelled out, please fix.
>=20
> (Koen: Yes I saw your email about the date, not address that at this =
time as we are re-thinking the whole distro_tracking_fields.inc file).

When the month is spelled out ordering becomes less of an issue.=20

regards,

Koen


--Apple-Mail=_391092C1-70E5-4A0A-BC66-AD4DCCEE6DD4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6u1aEACgkQMkyGM64RGpEShQCfbhU9ocLDOygHYXuSoKsIP9Kc
QsIAnj99xGvIln3awmKQ45vU6iMD83PY
=5Bw0
-----END PGP SIGNATURE-----

--Apple-Mail=_391092C1-70E5-4A0A-BC66-AD4DCCEE6DD4--
