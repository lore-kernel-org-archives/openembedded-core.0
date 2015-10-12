Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id CA0D375A38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 22:26:13 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2C6BgClMhxW/5tjdVtdHAEBAYMHVIY6tBWGCh2CdoIKfwKBODwQAQEBAQEBAYEKhCcBAQR4EQsYCRYPCQMCAQIBRRMIAoguAcAMAQEIAgEbBIZzhH6BM4NhF4QXAQSWE4JOgWFqiAGcAzgrhASHYAEBAQ
X-IPAS-Result: A2C6BgClMhxW/5tjdVtdHAEBAYMHVIY6tBWGCh2CdoIKfwKBODwQAQEBAQEBAYEKhCcBAQR4EQsYCRYPCQMCAQIBRRMIAoguAcAMAQEIAgEbBIZzhH6BM4NhF4QXAQSWE4JOgWFqiAGcAzgrhASHYAEBAQ
X-IronPort-AV: E=Sophos;i="5.17,675,1437429600"; 
	d="asc'?scan'208";a="33087787"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 13 Oct 2015 00:26:12 +0200
Received: from 1.14.117.91.dynamic.mundo-r.com ([91.117.14.1]
	helo=[192.168.0.12]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZllXo-0001ik-Ae for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 00:26:12 +0200
To: openembedded-core@lists.openembedded.org
references: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
	<561900D1.5060906@igalia.com>
	<CA+chaQffPJOrTzmZRoxUAJ1LnixtbJHLtJ5wm7eJAWGiZxnpXg@mail.gmail.com>
	<56198707.8@igalia.com> <561B96D1.9000703@linux.intel.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
x-enigmail-draft-status: N1110
organization: Igalia S.L.
message-id: <561C337A.5010305@igalia.com>
Date: Tue, 13 Oct 2015 00:26:02 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <561B96D1.9000703@linux.intel.com>
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Mon, 12 Oct 2015 22:26:15 -0000
X-Groupsio-MsgNum: 72097
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="IapqiIH18TMeSqOwdRxibxFq4alVrrdpO"

--IapqiIH18TMeSqOwdRxibxFq4alVrrdpO
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/10/15 13:17, Alexander Kanavin wrote:
> On 10/11/2015 12:45 AM, Carlos Alberto Lopez Perez wrote:
>=20
>> So, could we set ARM_INSTRUCTION_SET=3Darm only for armv6 or older
>> machines in this 3 recipes?
>=20
> Indeed. Webkit has other issues on armv6 or older (JIT fails to build i=
f
> you try to), so I believe the upstream developers test the builds only
> on v7 onwards nowadays, and don't actually support anything older.
>=20
>=20
> Alex
>=20

Yes, that's true.

The buildbots we have continuously testing [1] only do it on i686,
AMD64, ARMv7+ (traditional/arm and thumb2) and ARM64 (Aarch64)
architectures.

Regards
-------
[1] https://build.webkit.org/builders


--IapqiIH18TMeSqOwdRxibxFq4alVrrdpO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJWHDN6AAoJEJZQic5rlfiCVlAP/RdDJnf6EpiqXD7mEihLWH9Z
9IIPiEcg2mMjk+mLM01OW6s4u58pP1Mog9TAM6PhQSaYDDBo0Q3ELoDkwlbB0Kv/
+rBi7QVY9bZXidISD0E8u9hMpeyjmCgvG3BMBaPF9s3CsiWi6xr4Wc52Ys2T0+IX
n0raOCnSwrqWovtDWw8rxVEqvBVoE99yfev68Xav358LrLbwTdKKi47TFyw5feyd
mxdto7ju7fgPhCHj/SUCY9QQdJk8lxtaYCPHfyr6oWK5jMBxPZzJIpXNqS5V4RiV
9I3bVNTtppRpdtDVgtx6MFQtkSuzGhbEvQ5IX5WAQUtgMrvkBY4AURo8ucsAaQPZ
PvH8KtAimMWWYMwc2Ivybz8aOpl8RFzgJqa3Kp/IUU7qqDSOUovIF1aCavkRSdnD
zVtp2sSQmZC4QOYD7RgsZf+vlRLFnqHprwN3lmbm66+2oeXqsrLm/6GQ4ydJlH4i
gLxq0P6Wg50LoU0hqQ6+bEf9wJl3Gr/moCfdyp8OBcreFMz+UcU7mDNUKzVA4r6h
0AdtqMkqJbyGpEmG1RkyXSErxPstOplFT5pRQilF89aaKVjHfkw/fEbzgjBhV4oq
+cjJld6pdsFhKesMCis4IbNDayI7BcqIUWlhuU+YKPFXxksGFn6VB+dHce0yWvK6
Hu/vn7JKCwr2jxdUwy8X
=dGj2
-----END PGP SIGNATURE-----

--IapqiIH18TMeSqOwdRxibxFq4alVrrdpO--
