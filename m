Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.12379.1589107213367930388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 03:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=ih/8E2dk;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1475; q=dns/txt; s=axis-central1;
  t=1589107213; x=1620643213;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=I+d9nEN1KU7EPDHwFtt8to+Buh0ylnJJ6VJm/q7ieGk=;
  b=ih/8E2dkZGVSMyHXu4BTgRnchs9vdXas+SWW6XEaBBOSwUXqA52ZjXOU
   DrjQNcV3HlhsQ5wUqY4BqWyP2AhK4qhjLGSAoSX2PjQKbZnBL+lEU2D2h
   PmDalc8+M6Twj/YI9R1iNx4Wh/I+ZFsbvvSn2qdkmIcJGozAFmL5pLbw7
   3c9sEbGQylx6KoItsyj9zSQV+Y/fX8ExO1YuXiv8lqI2U7KpmF6VArGlT
   KhIpzSg/NHicafWKcg9FYgo3a6/bApFx5DvqyTK5W9H/AQSS6QatTBsJe
   DugoRteOlTnLmbVvrQXTO8aegZUIpMEmdIb7W2qeUWi0vt3macHGwuoCD
   w==;
IronPort-SDR: +59XdqiMgfiDv9dbhFek3z48sl8Vv8+wp4xkFnNx2OBIAlGmgWgnGWnRzqPsd0+l3sTDoXcq8y
 B4cXeoBqtXdnIbdnUc+9DyCbS238XU3OgIZK53qzuyQrH9WR/QT3t2tzmHk1+N+M6j3SafxhcC
 O14CdZeaeBBHnqz4xSCY7oLHTINu6qb+GcRI9kqsKzEqpVlxwNAia2k2tXYrNlrYQYzHI4E231
 cUFqU46lXA8mHsfDNT4dlLJ4+K/qEVFCHqwJE9bUsiXE5LxRNUXnCqniEOFWZG4zvpBTR1Mg6W
 8uI=
X-IronPort-AV: E=Sophos;i="5.73,375,1583190000"; 
   d="scan'208";a="8334021"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] pypi.bbclass: mind package suffix on version check
Thread-Topic: [OE-core] [PATCH v2] pypi.bbclass: mind package suffix on
 version check
Thread-Index: AQHWJkEa9lweV+hiU0GG6zSz58oFAaihIZ9w
Date: Sun, 10 May 2020 10:40:05 +0000
Message-ID: <56e3d2f297e64b14b8f7e8373312cffe@XBOX03.axis.com>
References: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> Sent: den 9 maj 2020 22:33
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH v2] pypi.bbclass: mind package suffix on
> version check
>=20
> Some pypi packages do have suffixes like dev, or a0 or b1.
> When doing a version check on these, the version will get falsely
> identified as major release versions.
> Add a terminating slash to rule out those false positives
>=20
> Changes v2:
>=20
> - ignore suffix versions instead of reporting them

The v2 information belongs after the --- below as it relates to the=20
review process.

//Peter

>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/pypi.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index e5d7ab3ce1..ffa8aa3ff4 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -23,4 +23,4 @@ SRC_URI +=3D "${PYPI_SRC_URI}"
>  S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>=20
>  UPSTREAM_CHECK_URI ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> -UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> +UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
> --
> 2.20.1

