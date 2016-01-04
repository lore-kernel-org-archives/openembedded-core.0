Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 22D776FEF6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:11:58 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 22E2E1814FD;
	Mon,  4 Jan 2016 17:11:58 +0100 (CET)
To: Ian Ray <ian.ray@ge.com>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
Message-ID: <568A99CD.9000800@universe-factory.net>
Date: Mon, 4 Jan 2016 17:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Mon, 04 Jan 2016 16:11:59 -0000
X-Groupsio-MsgNum: 75382
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="C16n5igHe9VJxCABedHfbxDMT3RGM5EL7"

--C16n5igHe9VJxCABedHfbxDMT3RGM5EL7
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/04/2016 02:14 PM, Ian Ray wrote:
> The recipe uses hard-coded paths (specifically /lib) in do_install
> and in FILES, however on a merged /usr system this directory might
> not exist. Prefer base_libdir.
>=20
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> ---

This should use nonarch_base_libdir, base_libdir defaults to /lib64 on
ppc64, which is not where the firmware is expected.


--C16n5igHe9VJxCABedHfbxDMT3RGM5EL7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWipnNAAoJEBbvP2TLIB2cKx8QALzAf3XUfxZtsMJSjvrP0e5x
cZ5MYtintoQOB+BY5g7t2ArpeTKjSwdSoP4+ffv2La33SUSqI4LOg6J9lQzxnlFW
kEaP7TxDu0tSceCckskNCCpl00f7PVVNaSNDJ4/TyChVYkwb80QqPuiTznxE5SXV
MFe7DhbDjIPcvPUaopTH5s3RWs5NitcZqTbxU8ceH5H1G9ZHJTol/Nc9NVy16XiD
YKVm+4bH9m+6O4mvOQdbqRhJD2wqvPGAv56uYRPjW8GKaapnZiwEx1HunXvuvXgI
uJzFmaIW55FRYSYDybBg6UJXww0XlAF1AAq47WAtDQO4KeyrYC3n+c0bROjbc0ky
Ko/aCuG+Nf9OBtF/aLL2UcXzKODYcsBOvIyyzXZGFIqeGjbhlDYPjRX1hvu0NXf7
oSpSRbcxRfLbw+FdqiLKwD93gYcggQGFKHZuG5E/6rt00lyoBjC+lCpxOKQp6tuy
/emy1d0p8RudNuk/E2QqK1TmfyofoL+GCvUqNH+ByxNXQuNLF0zQgGcH1lvde4Jq
VbUSBeWeJ+AM/dSC8T1pKY4J4FF1T77CRBKw7LzhKmQLZf9JQsBQVGTerQCY9saD
n5Nymp+Liu7Wczi8nA+sSto3ep1bKRVyYpqVsqTvDkOoFGnCrOeBHJW76FV/fjsX
N9Kbwoguk7WPZ1+eThRx
=thgf
-----END PGP SIGNATURE-----

--C16n5igHe9VJxCABedHfbxDMT3RGM5EL7--
