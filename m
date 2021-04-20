Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web10.6590.1618899711214225078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 23:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=HiloE2uu;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=737acabf9=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1618899711; x=1650435711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=goTxlbeYEOQgbcA6lYL2Ut5hKBh2+HX+pRSutqSOPDo=;
  b=HiloE2uu7jQgCQCSpIO/SkT1WkeMO3Rg3ifmDvDBck+4E3oiW7JACWn2
   0L5DQrY76EAr+9V72DIt2PKKhxJv4Tg8RL0dO4dyNlUXkmWuYJ8oxKxvV
   KhlY6assCQe2GlZLPQ/nj22DlkK0g8kebWaOuoxBk5NAAw0JMvsoU6TAr
   s=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 20 Apr 2021 08:21:48 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw5.muc with ESMTP/TLS;
 20 Apr 2021 08:21:46 +0200
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb3.muc with ESMTP/TLS; 20 Apr 2021 08:21:47 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Tue, 20 Apr 2021 08:21:47 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Tue,
 20 Apr 2021 08:21:47 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <Qi.Chen@windriver.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] db: update CVE_PRODUCT
Thread-Topic: [OE-core][PATCH] db: update CVE_PRODUCT
Thread-Index: AQHXNY2Ls7TN5jdL9Eih2nBFN6VNdaq8zj4A
Date: Tue, 20 Apr 2021 06:21:47 +0000
Message-ID: <YH5y+sroyvAtOYjC@korppu>
References: <20210420023252.61501-1-Qi.Chen@windriver.com>
In-Reply-To: <20210420023252.61501-1-Qi.Chen@windriver.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E18037F875FCD045A07AE0F1D75E7AA2@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 19, 2021 at 07:32:52PM -0700, Chen Qi wrote:
> Update CVE_PRODUCT to also include 'berkeley_db'. For example,
> CVE-2020-2981 uses 'berkeley_db'.

Yep, this is correct. The situation is rather complex as CVE-2020-2981
is an example of a bug which only affects the newer version with a lot
of additional (buggy?) features from Oracle. The db5.3 (Debian source pack=
age name)
and yocto db recipes are not affected by this.

https://security-tracker.debian.org/tracker/CVE-2020-2981

Hence, the CVE checker data needs to know the version and the vendors and =
even
then there may be false positives for it. It's a good idea to check what D=
ebian
and Ubuntu do with the same source package and CVEs...

Acked-by: Mikko Rapeli <mikko.rapeli@bmw.de>

Cheers,

-Mikko

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support=
/db/db_5.3.28.bb
> index 9cb57e6a53..b2ae98f05c 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -15,7 +15,7 @@ HOMEPAGE =3D "https://www.oracle.com/database/technolo=
gies/related/berkeleydb.html
>  LICENSE =3D "Sleepycat"
>  RCONFLICTS_${PN} =3D "db3"
>  
> -CVE_PRODUCT =3D "oracle_berkeley_db"
> +CVE_PRODUCT =3D "oracle_berkeley_db berkeley_db"
>  CVE_VERSION =3D "11.2.${PV}"
>  
>  PR =3D "r1"
> --=20
> 2.30.2
>=20

>=20
>=20
>=20
