Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web09.5391.1618815570338993986
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 23:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=Rw5GNaP7;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=736b5af68=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1618815570; x=1650351570;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hFxalU/Mknk2Hz4Yedlav4M4DtBix2FINYP4Er3gv2c=;
  b=Rw5GNaP7Nu+qRhx44Z8aZAk+v2jBAAzjb7vbI8mYd1vUe/ode2pGZm95
   VBnygUurYj0XQ3iun2W9Zg2AudPVcpa0AptuyiSixKY6SftttGFohapEg
   J6g14sNy2Q1ySeNFYLRLNhflV7LnjjfxVHudSxRCs87879mk9LHI1r7I+
   k=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 19 Apr 2021 08:59:27 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw2.muc with ESMTP/TLS;
 19 Apr 2021 08:59:27 +0200
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb3.muc with ESMTP/TLS; 19 Apr 2021 08:59:27 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Mon, 19 Apr 2021 08:59:26 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.012; Mon,
 19 Apr 2021 08:59:26 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <zhengrq.fnst@fujitsu.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] db: correct CVE_PRODUCT
Thread-Index: AQHXNNrO6VhqyPEvD0CXWLkAisR5F6q7R9OA
Date: Mon, 19 Apr 2021 06:59:26 +0000
Message-ID: <YH0qTWrdEX5VH3eS@korppu>
References: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <527AA160BC94B54488CF38F94A1B16FE@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 09:45:01PM +0800, zhengruoqin wrote:
> In the CVE database, now it use db2 instead of oracle_berkeley_db.
> So, in order to be handled correctly by CVE check, modify CVE_ PRODUCT.

Which CVEs, please add an example? In the past oracle_berkeley_db was used=
.
I wonder if both would need to be there, or if using the new value is
sufficient from now on.

-Mikko

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support=
/db/db_5.3.28.bb
> index 9cb57e6a53..05720053f4 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -15,7 +15,7 @@ HOMEPAGE =3D "https://www.oracle.com/database/technolo=
gies/related/berkeleydb.html
>  LICENSE =3D "Sleepycat"
>  RCONFLICTS_${PN} =3D "db3"
>  
> -CVE_PRODUCT =3D "oracle_berkeley_db"
> +CVE_PRODUCT =3D "db2"
>  CVE_VERSION =3D "11.2.${PV}"
>  
>  PR =3D "r1"
> --=20
> 2.25.1
>=20

>=20
>=20
>=20
