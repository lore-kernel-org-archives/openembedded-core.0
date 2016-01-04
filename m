Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id DEDD96FFCC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 23:46:11 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 355C0181500;
	Tue,  5 Jan 2016 00:46:12 +0100 (CET)
To: Mark Hatle <mark.hatle@windriver.com>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<f8b6e0a67be1bede97cded62d1ee42aae8b8977b.1451778497.git.mschiffer@universe-factory.net>
	<568AF96A.50302@windriver.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <568B0443.5090407@universe-factory.net>
Date: Tue, 5 Jan 2016 00:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568AF96A.50302@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Mon, 04 Jan 2016 23:46:13 -0000
X-Groupsio-MsgNum: 75408
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="1d4nKIOS7UievmAwbo5r4wf7uDGJct1AA"

--1d4nKIOS7UievmAwbo5r4wf7uDGJct1AA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/04/2016 11:59 PM, Mark Hatle wrote:
> On 1/2/16 5:53 PM, Matthias Schiffer wrote:
>> These directories conflict with the symlinks created for merged-usr se=
tups.
>>
>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>> ---
>> v2: create both ${base_libdir} and ${nonarch_base_libdir}
>>
>>  meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/=
recipes-core/base-files/base-files_3.0.14.bb
>> index b71d5c5..2af7ecd 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -33,8 +33,8 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>>  docdir_append =3D "/${P}"
>>  dirs1777 =3D "/tmp ${localstatedir}/volatile/tmp"
>>  dirs2775 =3D ""
>> -dirs755 =3D "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
>> -           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin=
 \
>> +dirs755 =3D "${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/de=
fault \
>> +           ${sysconfdir}/skel ${base_libdir} ${nonarch_base_libdir} /=
mnt /proc ${ROOT_HOME} /run ${base_sbindir} \
>>             ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
>>             ${libdir} ${sbindir} ${datadir} \
>>             ${datadir}/common-licenses ${datadir}/dict ${infodir} \
>>
>=20
> I agree this new set looks correct.. but I'd like to see the correspond=
ing
> change to fs-perms that sets the permissions and such for each of these=
 new
> locations.
>=20
> --Mark
>=20

The current meta/files/fs-perms.txt doesn't mention any of /bin, /sbin
or /lib, and seemingly never did. I guess they could be added, but that
could also be done in a separate patch (and as I mentioned in another
mail, I'm not exactly a fan of the fs-perms concept, so I don't really
care.)

Matthias


--1d4nKIOS7UievmAwbo5r4wf7uDGJct1AA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWiwRDAAoJEBbvP2TLIB2ct8EQAOat2JEoCYgRXaGUu3C2Pd+y
UjBU5phhlyfhk3cjDhq1K7GwKQAdh5xn63rE3wxzoGDoyHTRZS9vTOOTgqkb5se/
XEP/1T6BMuW+I92+og74oSLEvSeSLNYQ7t0ZSrtNGPRxIUHLL7Of5LOVVdDmrG7Q
0pMYE1ys31S9ejSHJLln9mSBOKDEYJiEgjxlt1GaLlmf9yqBhNaYk5+Q4rIQA+hf
s71AZX8npcl80JI5c+ZgrEnvOeEPyxIMWYBszs40uAu3eFQgfOADaKFCOkI2SCsE
tai6wza5OfEMcvUilrRHmZfRc88X1SFYa6gPl4VKnkgLNBWzMcAUMXT3HHdO+O37
CX0iQ0GfdHr53pQIJQDQNwxG663rNPcnFPI/8vdIaPUe627YA5NHjrv0fogNlgsL
uiGp+pwKjhZEG4PUxWUPzT5w6m45tohAq9AsWElHJOk/v4JH0jc88+/0q0JglMDA
lub9npuAhWM4iLXraE85rZj9xT3xkv2nQoetrsKeo6YzDKLKbwKdkrWDRMQPdqXy
/vJ0axWEdkQdX/gjFBTwnt8uqM/JPAftVvmQm3khBCdXlOZfVcLK4L3BmoSjWfuX
3A8oHZyUlB/AH0knhQC+rZzYsxGNfPIsy1gDV7NPFM+RF27Zi2zaRfoFQFIHJQG4
LIecM/fAdtLsLz5McyMO
=A3bN
-----END PGP SIGNATURE-----

--1d4nKIOS7UievmAwbo5r4wf7uDGJct1AA--
