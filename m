Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 236D16FF64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 18:43:01 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 9522518100C;
	Tue, 22 Dec 2015 19:43:01 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<55c3139023d3c2d418e5c34b2a7f4a000fdbc1dc.1450288828.git.mschiffer@universe-factory.net>
	<CAJTo0LZfmtfw-XsnVd7THwv1gKfmY=hjBF9EiNknA9jhLRS6Aw@mail.gmail.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
Message-ID: <567999B4.8090201@universe-factory.net>
Date: Tue, 22 Dec 2015 19:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZfmtfw-XsnVd7THwv1gKfmY=hjBF9EiNknA9jhLRS6Aw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Tue, 22 Dec 2015 18:43:02 -0000
X-Groupsio-MsgNum: 75192
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="2U90CdJrShbRCsmCrMwlRxRQsqrspUuuJ"

--2U90CdJrShbRCsmCrMwlRxRQsqrspUuuJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/22/2015 06:31 PM, Burton, Ross wrote:
> On 16 December 2015 at 18:11, Matthias Schiffer <
> mschiffer@universe-factory.net> wrote:
>=20
>> -dirs755 =3D "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
>> -           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin=
 \
>> +dirs755 =3D "${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/de=
fault \
>> +           ${sysconfdir}/skel ${nonarch_base_libdir} /mnt /proc
>> ${ROOT_HOME} /run ${base_sbindir} \
>>
>=20
> I think the *intention* of /lib was to be $(base_libdir).
>=20
> Ross
>=20

Maybe adding both ${base_libdir} and ${nonarch_base_libdir} would make
sense?


--2U90CdJrShbRCsmCrMwlRxRQsqrspUuuJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWeZm1AAoJEBbvP2TLIB2cgJUP/R/xLVWtaqrXGSGZ6L68k9iK
B+SajNRq4kq+1hTrzRs4ZP7NyWM2x8FJVwSb3ZA3BtAGgsh1j9ke9uw4JlCIwABJ
n9uYOgjqfKCkzYda2pRuCiu7srOGAeCbPsGaH2T4ZkpwQ2zP5bKMM38oSA0wo9Xv
b0zRZ2OMpnQLG8irNd6G9PsUWndocgJ1u4t3ssFfnxQKyBK4HBdP97GhAnWcJv7b
wM39qnTv2g70JdPhR5c8WCIYJovvE2/gFdPM/IHtJnc8rek8qlIgcX8p7YVtu6ZC
FyTFX2c3HPXMx9+nb1W0DwO2S0pP6KHESSMvj8ra1z4r4IJwS6S8SSgwMsyg3QCZ
uYSNKUpALzsWAOeDfc6LuqHSrYf3AcJsV7bw1TaZ6g/XBgAi//X91WMBj6Q7pkSl
thJugCzQEkHpEfHtdoz1lNuDAMrNqwrjiWWn7a2Yj9J3fdv4DVs+Z3TWeYjer+Oh
wn7Jd46+ji6IEPxgIlWiMKv3cB6+c9RPBnZbWll3yUN/puM2NLmMI61yjyN3ihsC
cVV00uhbEYhmAzIhaD1JR9UM/8BTgr+ZGIiM24di3AyPG4Qp4HeJr+QzfyXIT5/P
gHwjOWdcCQPLy43Kp5ZKdM7DR13YV9BJxk2Kw0cGlwP10eX1Pkx2koo3qo0BdbCT
6BdTzx2yK53hZQNbuwWG
=NahO
-----END PGP SIGNATURE-----

--2U90CdJrShbRCsmCrMwlRxRQsqrspUuuJ--
