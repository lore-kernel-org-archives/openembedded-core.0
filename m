Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web09.7524.1611238366972346259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 06:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=h90Uu9u1;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6504; q=dns/txt; s=iport;
  t=1611238367; x=1612447967;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=AimRnTJbHFOjCxiSRBliWTENdO1xx2uARmh0ss69rYU=;
  b=h90Uu9u11izSdf6vKeJvafiHcgHoY4JtGqfqrDnTR4swCDrqxkAud/TH
   VuxY9Jwjg0lwdUKoc+D7VYX13B4U10iRukGjOBGgwuGyhycuV3H1oJQrl
   S4gFH1SzwcXKtwSatR//FwKT3/+63NvaRVDd1ZuycnW++OzgMMA8IGfOO
   A=;
X-IPAS-Result: =?us-ascii?q?A0AoAwC3iQlgkJtdJa1igQmBT4EjAS9RfVsvLwqHfgOOC?=
 =?us-ascii?q?gOUI4RzgS6BJQNUCwEBAQ0BARgBCgoCBAEBhEoCgXcCJTQJDgIDAQEBAwIDA?=
 =?us-ascii?q?QEBAQUBAQECAQYEFAEBAQEBAYY4DIVzAQEBBAE/AQEJAQIrAQ8CAQgRAgIBA?=
 =?us-ascii?q?QEuKAkBHQgCBA4FCBUEgwUBgX5SBQMuAQ6nDAKKJXSBNIMFAQEGgQYBLAELA?=
 =?us-ascii?q?YNaGIIRCYE4gnaDdIZQJhuCAIFUglY+gl0EAYFeKxGDD4IsgkmBCwErgRAJT?=
 =?us-ascii?q?RpijzWLBSmdTwohglaJL4tDhxiEWp4VnzmWNQIEAgQFAg4BAQaBVjiBWXAVg?=
 =?us-ascii?q?yQJRxcCDY47gz4ZhRSFRHQCNQIGCgEBAwl8iXgBgRABAQ?=
IronPort-PHdr: =?us-ascii?q?9a23=3AtguLDBLP7LckHNvIOdmcpTVXNCE6p7X5OBIU4Z?=
 =?us-ascii?q?M7irVIN76u5InmIFeGv68/hkLTQYLd6vRFzeHRtvOoVW8B5MOHt3YPONxJWg?=
 =?us-ascii?q?QegMob1wonHIaeCEL9IfKrCk5yHMlLWFJ/uX3uN09TFZX0ekfOpXuz6z9UER?=
 =?us-ascii?q?L6ZkJ5I+3vEdvUiMK6n+m555zUZVBOgzywKbN/JRm7t0PfrM4T1IBjMa02jB?=
 =?us-ascii?q?DOpyhF?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.79,364,1602547200"; 
   d="scan'208,217";a="632129767"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jan 2021 14:12:45 +0000
Received: from XCH-RCD-001.cisco.com (xch-rcd-001.cisco.com [173.37.102.11])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 10LECjeX025084
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 21 Jan 2021 14:12:45 GMT
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by XCH-RCD-001.cisco.com
 (173.37.102.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 21 Jan
 2021 08:12:45 -0600
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by xhs-rcd-002.cisco.com
 (173.37.227.247) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 21 Jan
 2021 08:12:44 -0600
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-002.cisco.com (173.37.227.247) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 21 Jan 2021 08:12:44 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF+rIQ+B2H5o9EsEjcKEDut+rjQq9qAfbAqsf4wNr7o+ytqyuXFpWwa97AExJE6Br+MT3PIIVjF5U/Dj9Ckg5vuDDTtxjE3FVgdVmYQsL4pCv8xZhL/SQ3q7+u4H5ByOspfsxakPvBEEhFbsFH7Mtv9D2WMetGmmCObAZP80fsZyeoF+z8cB3nbvorQcLSrKRNWFLo62OYK7P2sBDj5xXdrLwgjEKyephtIj0J7nR7uP4ABEn2+xW+LE7Uo223mcueY3D/6OdIC0rFm0zOb6GpP5FjApmRXOzpKw5lRpLJhVeGpGW2p6ESHjy+XFZr5CD3Gc2YibGCAEeCoPDdZiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah1Nfk0ecNbQIrBQK3LopYmG50RxXSLE7U1mbUlFHDo=;
 b=BHrgEFhlyYHcEZ6xSvLE9q33unvGmf/HPWZCVTDEbIx7ie2d0bsL0IRVDN7i9/FtLfpyrx5e5K5u0IplGjEWZO/5wCD/GiLLi3l/3OP7FaEklDLtQhVsiDulbAC8HHh8+oRYIVBkRyJSmLomMNDJ82mUIgwszFToQWgBOnyKCeJ93O0Z+XMek9WfEAFOHTPKJJj2shQ0lF+TBnoMlTWLWxgXOOwvOzludIXwObWFy7P9dCu2AdowMlMAH6SBk8uIz5hH7oAdG+AL3uu8cLCKRmXwXy38ZN+/SrOWAW077YsJi+KPCpSICHInJeZEPjeSppQ2LC91l0VFPpIUVTqE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah1Nfk0ecNbQIrBQK3LopYmG50RxXSLE7U1mbUlFHDo=;
 b=RmuXHpHC/NiXjveWCcIgW9HLQZubQzZ4IIzJwOoERmsoIyBNp08zTPG9+XKT+cdVubhT/L25Z2r+nexpOywLaVlmah6TCLOSfZYH79KqTFtmsZObCvwT/XSL28EKn1uCfMAgIgBunBLQabjBPJqRsWH/h8NEO9KRmYfeMy5HQlI=
Received: from SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 14:12:43 +0000
Received: from SJ0PR11MB5088.namprd11.prod.outlook.com
 ([fe80::adf2:ff40:84e8:fe79]) by SJ0PR11MB5088.namprd11.prod.outlook.com
 ([fe80::adf2:ff40:84e8:fe79%5]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 14:12:43 +0000
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pango: improve reproducibility
Thread-Topic: [OE-core] [PATCH] pango: improve reproducibility
Thread-Index: AQHW7/Z2xZuFYQVLDkyP4K31SqpJOKoyE6gAgAAK08o=
Date: Thu, 21 Jan 2021 14:12:43 +0000
Message-ID: <SJ0PR11MB508811F7B64304F3D9B5C188D7A10@SJ0PR11MB5088.namprd11.prod.outlook.com>
References: <20210121130758.104506-1-oobitots@cisco.com>,<CAAnfSTtv=vf6SFqkAKcd_nRgCbiOafFWVd4HdenLqoTGmPhuKQ@mail.gmail.com>
In-Reply-To: <CAAnfSTtv=vf6SFqkAKcd_nRgCbiOafFWVd4HdenLqoTGmPhuKQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6515e23-fa16-417a-20a5-08d8be169ec1
x-ms-traffictypediagnostic: BY5PR11MB4307:
x-microsoft-antispam-prvs: <BY5PR11MB43075EFFC14B0C4125FD1597D7A19@BY5PR11MB4307.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tVs3yHPjSpJIYVFvHtPHEiG+wQcuSBc/OhYyI6jNLHXYwa/YXuV1bKuDEgKDN4nGa1l8nh1qCeDnloGj2MWKvFeZL4z16bo9ikzrKHokzF7en5AHjzkEVYE5WqaCH1hORPGKk9aevS5x15YIgxYCxleTauUUMr3WozCIlApd9DO32PbIVFJZ2IHpoXQ+FyedwVnxzrO/8ODPDfIhHfFQmESkBtFPJIbb1tvaq7vi2kUGyMxkmSfjk+mTXoPRO6tIhF/FK4/Ktxc+ueM+nOgMYGVd9UEWaZ/zXUPiO93LX0jLUxWohRDnCh6BU4IgOqhqhTTX9ucQY2u7nSrhr46qWEP8wuAFMRs8iCmYYKTZrwcybRM5AjXlUTpDuddCk4/AGwF871w1PNLFZAt5J6Yfy6ZtQbM2XxqS+4/LoDRdH2+YIaQHMk1CaymyBurSowb+1NRj5WD1nu5zQgnI6YYiNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5088.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(366004)(39860400002)(6916009)(478600001)(86362001)(316002)(8936002)(2906002)(4326008)(966005)(71200400001)(8676002)(52536014)(7696005)(5660300002)(76116006)(9686003)(66446008)(166002)(64756008)(55016002)(66476007)(26005)(19627405001)(6506007)(53546011)(66946007)(66556008)(186003)(91956017)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?bpeowblQZJP9bMoY5Mi3ECPebzoUPTo6iGsaQWqQwi+fw7nnvrgWoUh5JMbG?=
 =?us-ascii?Q?/W2zju0CPP/7Dp6aAOXN5B4wj6G4wgiZLp6ml0ZS0Xdiki4YFrA1TMTvPoEo?=
 =?us-ascii?Q?PL/CNdkUAAW7iRsZpagFVpSe9Arg0CjHeeZ7+zSY8v+KaWNmzSpm2m83gsKk?=
 =?us-ascii?Q?QJsGk0iDeWnoQ9kueQ9JTIceZxyaFclG8q0gZy84TEM3H70MX6GWMB3MPzzd?=
 =?us-ascii?Q?RqZJ02s/5L3VsFqcYDiUGGS8n+HovBPFJZbnIzBf5/0xrSzQ04oBQWPUj0nA?=
 =?us-ascii?Q?19lTfnhUld6rnQb4CWfr7W6vU4/PQ4l6TBIui45V0spFSbxRljuJFcrqzM7B?=
 =?us-ascii?Q?lqr0dZBivLX5EUaan7dDP0s232rio1Dpe+IUrKfiAgbYZHtmSGA2Vso1oTjm?=
 =?us-ascii?Q?M9FJCVtMgBFByOpFupwSa7GYy4+tf4vp4A4Ca1D8SVXXEvTDI3ZGQBj/ncz4?=
 =?us-ascii?Q?qp+7dcwp8GLKchulNAWvEZ9E/YfFvXSEVnle8nOaYrGbx1Ld3/dY8iP1rrj7?=
 =?us-ascii?Q?ugJCGt3WBC3Cw+NfyclOyt84FKTrUPnh7RukgbdhG+nYJgsfEmBvABIyd4iS?=
 =?us-ascii?Q?qBLSu0aX+kTRcVJgDP+tlnAVAt3qCrkMik4qvIeqHkqNTsIZJBqiD1uAGQmZ?=
 =?us-ascii?Q?X6LgWdBFxrMlN1yOeMeb/5Qw6qzWYoU/bGWNRrMnhIdpk4/5LfDJ8C429998?=
 =?us-ascii?Q?hS9/1pQZRs/U1S08g2+NF7z1DwyXZofthK2bilpFBEoqjuLZgNlP5U50PoBi?=
 =?us-ascii?Q?CdXGCaCcV3PY9kCwZ3pL8B0tl9Bdm+UyC/+/lG6p6MAWfJRK91oPw4vBSCH7?=
 =?us-ascii?Q?d2wsDGvMavSqUnJPwBHjAJfv059Az+0pSejqLOo9erQJxB7DqeUH1hsAPFF3?=
 =?us-ascii?Q?2UcrrKAlQyr13q4mgx4YGpDZPfdwOFaUjYsSEWJ+p4mk+pOnRsGKT2FCGs1E?=
 =?us-ascii?Q?KMoE2uPFWEDZ1WLK+0KG14MRBsqbEXiUwOa2iJgly7WrTGM6lQyOBlmuSp1K?=
 =?us-ascii?Q?CBsSuUGVAVDoII0G1dG6sFb3uNHAeV+DAI6rq0uFasrJCyM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5088.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6515e23-fa16-417a-20a5-08d8be169ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 14:12:43.3526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZJeEFQac6WZ0kWeOoXVKwyAW6mOG7FC/r58snY1vCIACmlQ/uJBAVpDMs2hSASqFmyKtJsFkEtHBbmSw/8xIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.11, xch-rcd-001.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB508811F7B64304F3D9B5C188D7A10SJ0PR11MB5088namp_"

--_000_SJ0PR11MB508811F7B64304F3D9B5C188D7A10SJ0PR11MB5088namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My bad. Already fixed in upstream master.

Regards,
Oleksiy
________________________________
From: Ross Burton <ross@burtonini.com>
Sent: Thursday, January 21, 2021 15:31
To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@=
cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pango: improve reproducibility

I thought we'd already fixed this once already upstream - maybe new
templates have appeared.  This would be better as an upstreamed patch,
can you submit it there too?

Ross

On Thu, 21 Jan 2021 at 13:08, Oleksiy Obitotskyy via
lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Replace filename with basename in templates
> to avoid absolute path in generated source files.
>
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  meta/recipes-graphics/pango/pango_1.48.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-graphics/pango/pango_1.48.0.bb b/meta/recipes-=
graphics/pango/pango_1.48.0.bb
> index 552a44583c..a070581732 100644
> --- a/meta/recipes-graphics/pango/pango_1.48.0.bb
> +++ b/meta/recipes-graphics/pango/pango_1.48.0.bb
> @@ -35,6 +35,9 @@ GIR_MESON_OPTION =3D 'introspection'
>
>  do_configure_prepend() {
>      chmod +x ${S}/tests/*.py
> +    if [ -n "$SOURCE_DATE_EPOCH" ]; then
> +        find ${S} -name "*.template" -print0 | xargs -0 sed -i -e "s/@f=
ilename@/@basename@/"
> +    fi
>  }
>
>  do_configure_prepend_toolchain-clang() {
> --
> 2.26.2.Cisco
>
>
>=20
>

--_000_SJ0PR11MB508811F7B64304F3D9B5C188D7A10SJ0PR11MB5088namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
My bad. Already fixed in upstream master.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Oleksiy<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;ross=
@burtonini.com&gt;<br>
<b>Sent:</b> Thursday, January 21, 2021 15:31<br>
<b>To:</b> Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) &lt=
;oobitots@cisco.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] pango: improve reproducibility</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">I thought we'd already fixed this once already up=
stream - maybe new<br>
templates have appeared.&nbsp; This would be better as an upstreamed patch=
,<br>
can you submit it there too?<br>
<br>
Ross<br>
<br>
On Thu, 21 Jan 2021 at 13:08, Oleksiy Obitotskyy via<br>
lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openembedded.org&gt;=
<br>
wrote:<br>
&gt;<br>
&gt; Replace filename with basename in templates<br>
&gt; to avoid absolute path in generated source files.<br>
&gt;<br>
&gt; Signed-off-by: Oleksiy Obitotskyy &lt;oobitots@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-graphics/pango/pango_1.48.0.bb | 3 +++<br>
&gt;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/pango/pango_1.48.0.bb b/meta/recip=
es-graphics/pango/pango_1.48.0.bb<br>
&gt; index 552a44583c..a070581732 100644<br>
&gt; --- a/meta/recipes-graphics/pango/pango_1.48.0.bb<br>
&gt; +++ b/meta/recipes-graphics/pango/pango_1.48.0.bb<br>
&gt; @@ -35,6 +35,9 @@ GIR_MESON_OPTION =3D 'introspection'<br>
&gt;<br>
&gt;&nbsp; do_configure_prepend() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod +x ${S}/tests/*.py<br>
&gt; +&nbsp;&nbsp;&nbsp; if [ -n &quot;$SOURCE_DATE_EPOCH&quot; ]; then<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find ${S} -name &quot;*.t=
emplate&quot; -print0 | xargs -0 sed -i -e &quot;s/@filename@/@basename@/&q=
uot;<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; do_configure_prepend_toolchain-clang() {<br>
&gt; --<br>
&gt; 2.26.2.Cisco<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB508811F7B64304F3D9B5C188D7A10SJ0PR11MB5088namp_--
