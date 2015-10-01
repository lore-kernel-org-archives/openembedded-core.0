Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 06FD4762A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:03:56 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BUCQD5SQ1W/5tjdVteGQECAQGDCVSGObhEGYFOhXkCgTM8EAEBAQEBAQGBCoQlAQEEeBELGAkWDwkDAgECAUUTCAKILgEIy2kBAQEHAgEbBIZzhH6FFBeEFQWVeYJLgWFqh36bUzgrhAQ8iisBAQE
X-IPAS-Result: A2BUCQD5SQ1W/5tjdVteGQECAQGDCVSGObhEGYFOhXkCgTM8EAEBAQEBAQGBCoQlAQEEeBELGAkWDwkDAgECAUUTCAKILgEIy2kBAQEHAgEbBIZzhH6FFBeEFQWVeYJLgWFqh36bUzgrhAQ8iisBAQE
X-IronPort-AV: E=Sophos;i="5.17,618,1437429600"; 
	d="asc'?scan'208";a="28591476"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 01 Oct 2015 17:03:55 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1ZhfOl-0000Lm-Ks
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 17:03:55 +0200
Received: from ip149.dynamic.igalia.com ([192.168.10.149])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZhfOl-0004V9-Er for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 17:03:55 +0200
To: openembedded-core@lists.openembedded.org
references: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
organization: Igalia S.L.
message-id: <560D4B55.3090007@igalia.com>
Date: Thu, 1 Oct 2015 17:03:49 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 15:03:58 -0000
X-Groupsio-MsgNum: 71846
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="1gkiECFgaTXU5cvJcLeXt9h714woOneiA"

--1gkiECFgaTXU5cvJcLeXt9h714woOneiA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/10/15 16:28, Khem Raj wrote:
> I would also suggest to not use codenames in branches
> but rather the numbered release. If we want to use codenames for
> branches then lets drop the numbered release names.
>=20

I suggest using both (codename+release_number).

Ex: jethro-2.0 or 2.0-jethro

(probably the later one is better as it can be sorted by release number
easily)

That way everyone has clear which release number and which codename is,
without having to fire a browser to
https://wiki.yoctoproject.org/wiki/Releases



--1gkiECFgaTXU5cvJcLeXt9h714woOneiA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJWDUtVAAoJEJZQic5rlfiC7pIP/3qJC/2GsVnmqf2pBBBoxxI5
Rry0GlC6/8trgY79mLT+2af5PMg9eYyZ3y9oGla51V1XBvXizMuaeJSAN+qNIf9v
Ar/1l8RgbxUBhyaf9BodOCevoZ2v3O+4tg1SPgew4HZyXAESW99hkNaocruLUeLC
nVhVOPAvSapOVq9+Yy3pRXEzo/6JJBemwmATNq4OwI3hdf3Sr8PP1NZzojCb7lIF
D2VB8ob1vu/r4/WTl7Kym/jbdmJ94TLelT29S6PBH+HDykYkwOFoJlw8AqqdRVT9
ptsciEyPuPhhymBfeo+12Sx6y9LHsAbrDM9iMGwq85dUCdaW0gsKWKzlxhQOCQE4
8kc8SO/AiJeojwNVpYwTeU38wSZlmlqB/Rk3bWttb5oxsBCpqlqLxa/I6vmmlOkk
FwaaD4EvH7q6y+9hDKdD211N/uknnLR72fZ2UU57ILufFtfT5cQZ45WToxehWhA5
6VCpPml3054Mau0sg8e7lutl/kMYW11HWSy8u87Lft443c8lt8HNU6iBmW03NLXF
FuFfvSez6OaYiP3pmw5cuHoOAFz05g8T/jA18SwkuUV5SqrnBVwKs0/GyTBDXT1N
Fwv9ZlR4CAFp3+SPJX37Ic27XeEi7DUAyNrjhx3CyTY/k2IXpum/M82iPluNhCLz
MlKPohFbaN/4TwoyUMow
=PIzI
-----END PGP SIGNATURE-----

--1gkiECFgaTXU5cvJcLeXt9h714woOneiA--
