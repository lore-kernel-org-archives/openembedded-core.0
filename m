Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web11.6336.1620367375639451209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 23:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=ZrK3bNBX;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=7544c86ba=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1620367375; x=1651903375;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pcHDGlaZDOwqzUGz/ppOiUplf3w9V/gJ6TjDV7THHlw=;
  b=ZrK3bNBXpK13Fjfo8d48H5zv0yPAciJZGOO3xZm0hS17oMOuHKI2xUr2
   iYoGmNdCT936nrXow2X57s+uafZT88Mt0ca87K7YvScH4jpAUhaOjz6Fz
   YIIceZbGcpH7H4+k5DwzIQwD20dPsLEHJ+GMv7EXUMOTHxnydnKjn4zRl
   I=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 07 May 2021 08:02:52 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw1.muc with ESMTP/TLS;
 07 May 2021 08:02:52 +0200
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb5.muc with ESMTP/TLS; 07 May 2021 08:02:52 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Fri, 7 May 2021 08:02:52 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Fri,
 7 May 2021 08:02:52 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
Thread-Topic: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list
 for intractable CVE's
Thread-Index: AQHXQpsm0j6kN6Yrw02UGPeqZqaLy6rXZnsA
Date: Fri, 7 May 2021 06:02:51 +0000
Message-ID: <YJTYCgxanqxIZvIw@korppu>
References: <20210506171232.2832063-1-steve@sakoman.com>
In-Reply-To: <20210506171232.2832063-1-steve@sakoman.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <653E0FD8696C6248BACC413A7ABCE655@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 06, 2021 at 07:12:32AM -1000, Steve Sakoman wrote:
> The preferred methods for CVE resolution are:
>=20
> 1. Version upgrades where possible
> 2. Patches where not possible
> 3. Database updates where version info is incorrect
> 4. Exclusion from checking where it is determined that the CVE
>    does not apply to our environment
>=20
> In some cases none of these methods are possible. For example the
> CVE may be decades old with no apparent resolution, and with broken
> links that make further research impractical.
>=20
> This patch creates a mechanism for users to remove this type of
> CVE from the cve-check results via an optional include file.
>=20
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../distro/include/cve-extra-exclusions.inc    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
>=20
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
> new file mode 100644
> index 0000000000..956b3a9a3c
> --- /dev/null
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -0,0 +1,18 @@
> +# This file contains a list of CVE's where resolution has proven to be i=
mpractical.
> +# It contains all the information we are aware of about an issue and ana=
lysis about
> +# why we believe it can't be fixed/handled. Additional information is we=
lcome through
> +# patches to the file.
> +#
> +# Include this file in your local.conf or distro.conf to exclude these C=
VE's
> +# from the cve-check results
> +
> +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-000=
6
> +# CVE is more than 20 years old with no resolution evident
> +# broken links in CVE database references make resolution impractical
> +CVE_CHECK_WHITELIST +=3D "CVE-2000-0006"

Could this be specific to a recipe?

It may be that CVE data changes and adds new CPEs and the same CVE could st=
ill
be valid for another recipe. I think the analysis also applies to a single
recipe.

Cheers,

-Mikko=
