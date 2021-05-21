Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web08.5699.1621577556578750378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 23:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=MoGwQcv5;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=768015020=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1621577556; x=1653113556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2zKYHmZZpAVEIxQ3kKG4Jwh0yWRP7ktyPezfGsKcKYw=;
  b=MoGwQcv58M1Xs5ceZkYLqSIB5KyoJvwL8lgfaAGrnO/t9bXc8fn0/Udp
   1cTlxkxhIaAMjlVVlhRxitOGL6Ip5wMy8acwlJ5MeT9pa09wiTTcuojmB
   An3aMsCJQrEPzdsG8ZrzNNSU8mj8uuou58K3d6qvCuVS3H/XAdSwGTCwe
   w=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 21 May 2021 08:12:28 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
 21 May 2021 08:12:28 +0200
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb4.muc with ESMTP/TLS; 21 May 2021 08:12:28 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Fri, 21 May 2021 08:12:28 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Fri,
 21 May 2021 08:12:27 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <ross@burtonini.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: enable branch protection by standard
Thread-Topic: [OE-core] [PATCH] gcc: enable branch protection by standard
Thread-Index: AQHXTZ0U8A9pg4cZTUi0y70TxGVPZqrtU8kA
Date: Fri, 21 May 2021 06:12:27 +0000
Message-ID: <YKdPSn9E1MOUmJsz@korppu>
References: <20210520171511.3177430-1-ross.burton@arm.com>
In-Reply-To: <20210520171511.3177430-1-ross.burton@arm.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7542294489637488EDC096E019B1190@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 20, 2021 at 06:15:11PM +0100, Ross Burton wrote:
> Pass --enable-standard-branch-protection.  This is an aarch64-specific
> option (currently) which does nothing on other targets.  On aarch64 this
> generates code uses BTI/PAC instructions to mitigate Return Orientated
> Programming attacks.  This approach is backwards compatible and the code
> size/performance impact is typically negliable.
>=20
> More details can be found at
> https://events.static.linuxfound.org/sites/events/files/slides/slides_23=
.pdf

Do you recommend this for dunfell and other stable releases? Any requireme=
nts
to gcc version? What about clang?

Cheers,

-Mikko

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/r=
ecipes-devtools/gcc/gcc-configure-common.inc
> index a64c4caf00..dc7f458b25 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -40,6 +40,7 @@ EXTRA_OECONF =3D "\
>      ${@get_gcc_mips_plt_setting(bb, d)} \
>      ${@get_gcc_ppc_plt_settings(bb, d)} \
>      ${@get_gcc_multiarch_setting(bb, d)} \
> +	--enable-standard-branch-protection \
>  "
>  
>  # glibc version is a minimum controlling whether features are enabled.=
=20
> --=20
> 2.25.1
>=20

>=20
>=20
>=20
