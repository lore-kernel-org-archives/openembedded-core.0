Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web09.10875.1629869272911408456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 22:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=XZY9dxIn;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=864285786=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1629869273; x=1661405273;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ALkl5UP5SHZbKfkEu43B0iuGT0L8ZPHD6UyTmtv0fLs=;
  b=XZY9dxInbpzfCcRSozI09bKWIlT+WSKQRa2Jcl6kL5T1l3SRXTGkXXkK
   P2XzO8E4PGW1w6Jg6GYbjZeU2eBG2umAZnC9Zmv45OqkH9pVGZZVoIEzF
   X1VGXMB4++mMQyfi9r79kv2P3EYcmVcfbfEIXrBmsax+pl7k0qui7OoPB
   M=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 25 Aug 2021 07:27:43 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 25 Aug 2021 07:27:43 +0200
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb2.muc with ESMTP/TLS; 25 Aug 2021 07:27:43 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Wed, 25 Aug 2021 07:27:42 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.018; Wed,
 25 Aug 2021 07:27:42 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <randy.macleod@windriver.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: upgrade from 1.1.1k to 1.1.1l
Thread-Topic: [OE-core] [PATCH] openssl: upgrade from 1.1.1k to 1.1.1l
Thread-Index: AQHXmWN+79e0j0BU7USzyjYMvD0tLauDj4uA
Date: Wed, 25 Aug 2021 05:27:42 +0000
Message-ID: <YSXUzcngsQ2T+0KE@korppu>
References: <20210825034405.142072-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20210825034405.142072-1-Randy.MacLeod@windriver.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3D6B5105E41A7E4CAC7AA3420295E907@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 24, 2021 at 11:44:05PM -0400, Randy MacLeod wrote:
> Includes fixes for:
>=20
> CVE: CVE-2021-3711
> CVE: CVE-2021-3712
>=20
> as described by:
>    https://www.openssl.org/news/secadv/20210824.txt
>=20
> Ptest results on qemux86-64 with kvm:
>    All tests successful.
>    Files=3D158, Tests=3D2532, 137 wallclock secs \
>      ( 2.59 usr  0.33 sys + 104.71 cusr 44.19 csys =3D 151.82 CPU)
>    Result: PASS
>    DURATION: 137

I sent the same with CI test runs passing on x86_86 and aarch64 products
on dunfell. No problems seen with the update.

Tested-by: Mikko Rapeli <mikko.rapeli@bmw.de>

-Mikko

> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../openssl/{openssl_1.1.1k.bb =3D> openssl_1.1.1l.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1k.bb =3D> openssl=
_1.1.1l.bb} (98%)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb b/meta/r=
ecipes-connectivity/openssl/openssl_1.1.1l.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
> index 09afa27ac1..b241ba78bc 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
> @@ -28,7 +28,7 @@ SRC_URI:append:riscv32 =3D " \
>             file://0004-Fixup-support-for-io_pgetevents_time64-syscall.pa=
tch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "892a0875b9872acd04a9fde79b1f943075d5ea162415de30=
47c327df33fbaee5"
> +SRC_URI[sha256sum] =3D "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7=
f9153aa16fa76bd1"
> =20
>  inherit lib_package multilib_header multilib_script ptest
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> --=20
> 2.30.2
>=20

>=20
>=20
>=20
