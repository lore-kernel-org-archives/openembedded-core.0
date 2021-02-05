Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.54])
 by mx.groups.io with SMTP id smtpd.web09.8182.1612534089812490758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=prFT37PK;
 spf=pass (domain: kpit.com, ip: 40.107.139.54, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecFWI1fBXi9eiFQj065mcBNtW17WurgOc8sFyHM0SDzST7JG5hgAcDm5wdT/KLEMFhnkGHWX9nhPRwChRYyGayP/x7nHdfDmRAiu63Wwa45YMa6flsuveX5kZMTCqAUz7Vquo888TRpb5h3qr2Ybwz26Y+ySOoNpfmrpGRoT8BdRiZhIAlCxzjUWcJZDPJs/hx98SX6vdE+y5jL8h36SPZ24uTnybLvQ5BABiHbb3UurmB7pIcDavwUrV5ape8FjT+wK7W9IUsvm3f8jH+J9W/0psMtYqbBATUJxB1Xr8Cd5O+CoKOMQexFq6sEPDMrlM7cGEOKGMvk1AQoD3GgxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7NvvQCZBzopT5MTAqCufpdQkAjYJwCOaMVQyJrnf1w=;
 b=ZCeFPl297StLKWXC8AlXkF3GmRkZrhFqbz93qSKCRK2La25hhE9xzn5pZgQIwzmEVv1HJ6akoHnFV4pIWy3lx2mH+FqlY5uhFPcQydLnBaA24uXSJ5OqkZEPMVC6ZnzQQfiMSURYoyjtJvyNro/tJj48x2NO1tCfTYQCGNi0tMveogjkWPmamd9nFLVEe26cf4gsBY36yG8nxiulCHrZDvIq7Ys6hl9GwCBi7LUnyeJnWtEiTtkjb7ra0nJCX7hfPvPwVFW1Svt2skZrYxzVP0v/M0qbtJEsZ19e+QfW7aJ2G5mZRbwWg7uWR2tKTj300toick3ieKF6bhYW12944w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7NvvQCZBzopT5MTAqCufpdQkAjYJwCOaMVQyJrnf1w=;
 b=prFT37PKLPnXSiWbZA6D3Ddf68LU2BudGBMm+/Pj4/J6x8a+y3Z7xTFN7aSK6ZM14u2Af26+WpBLYJd3jMc7g59GKN2/e2OmODSQSyM5fWG7JabD97xrV0lf2iM9UK5i5diM4woeaK777BkednbZaXYyl8t8jJ2fCDDeJ5n/SwI=
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB0898.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:08:05 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 14:08:05 +0000
From: "saloni" <saloni.jain@kpit.com>
To: Steve Sakoman <sakoman@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] libgcrypt: Whitelisted CVEs
Thread-Topic: [OE-core] [poky][dunfell][PATCH] libgcrypt: Whitelisted CVEs
Thread-Index: AQHW+Y6RgFDukGvS00WkcXqWmsNv8apGg00AgAMVNjU=
Date: Fri, 5 Feb 2021 14:08:05 +0000
Message-ID: 
 <BM1PR01MB40192700C14FD7DC0849B13787B29@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1612289367-10977-1-git-send-email-Saloni.Jain@kpit.com>,<CAGDS+nmxYCFTrt-Sd3_cO94tSBWvg4U15P7UFr2cTw8fQo_vWQ@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nmxYCFTrt-Sd3_cO94tSBWvg4U15P7UFr2cTw8fQo_vWQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2409:4043:2e10:1952:e87b:d65:9b3f:2ae2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: afb3ef48-4d08-4e4d-0db7-08d8c9df752f
x-ms-traffictypediagnostic: BM1PR01MB0898:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB0898617FD35E94CDAEA00ED687B29@BM1PR01MB0898.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ypmxbn0HodiqH9v8b7NLnuPP+3J05g8QoxfpCeixXP902C6++g3VrbfFcJGsu2u2BsS5ORPj3roFsI2FYsGA1D9k97VRas2uCNDZ1VIR9noTo2pzsBcat07AptLtWWvfEYflaATcFqUnYMgwpGYAMojWfTJebjcTS64tZjUXPjmMNo0vX2gWnn+1tYmApasW7ze4wyOT1suUvmcoMTHOEI3nqOeRZms1yyJpxynXNa5UdkV2hZWtWJQVvP/wQMuD7H4Pyva8vbm/QFYexPPkmiObnu4JrLox5e7iYf7VHCV1/etpJaN/VhB6VEJnTZTdZltgiZoR/vY8dYjmFbmvbQ5xpDJgl+oncy5oJcfVagx67aTgCZATTKfxY87HjERyLj1PICY5ZPqqwIElk9dNoIjtQmQQQ/dSRrgdno/pZcFBymNsJkDqy09n5szJKqGeWfrnDpwHGwu3XdobDdWjjoF32Ecpqf93fJCth099u4FfAd7XmveeY/FG+8kF3hVf6oCx1nQpiHo+G1xWVOOsb/49ZheYvWvFTLYB/giHaal2dfI55gj5UHoouvpnoJGCLhh2VEeqnxyx3jR86esk1wg+CWXXY/9Lv2P5q5OrV/8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(4326008)(5660300002)(186003)(966005)(55016002)(6916009)(9686003)(8936002)(66556008)(66946007)(76116006)(66476007)(64756008)(66446008)(107886003)(53546011)(52536014)(6506007)(66574015)(45080400002)(2906002)(86362001)(71200400001)(166002)(33656002)(7696005)(54906003)(478600001)(83380400001)(316002)(19627405001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?bju++17gzS3k4RqLb6/5Oxu4D1sKTxEeimTXt9OwpatD3FyzrLU1ekfMU4D4?=
 =?us-ascii?Q?la6rERMaT/JbSBF7K8fNhhfkjqNDIHZ+Ccww4MsPS1/tWk8yhIXZKcqhaxCw?=
 =?us-ascii?Q?CLVwqN4BFSvubH7TLZpY1Unueog9f3d+7bqWncCFBMdzhGqJFX7rFyDAs8Th?=
 =?us-ascii?Q?QS1EsQpBg0U5AA8F1IAnrxnlSPpFzNVAmV+nN1OcAgzi4c2YTUwDEhRBWVeW?=
 =?us-ascii?Q?Oj6tPskCNB3EYZ/tvUBB+PEcEWCKNgioR8GXoaZLmH5d0+ofpIMfkuYz6H8E?=
 =?us-ascii?Q?Dsd5GtC57PqG9anwPVzpLr5q99wRYesrmpK1q+FSUpBeer79dLPsddPXc0rq?=
 =?us-ascii?Q?DvNSLNro1r+zVAljjDPWFzITc+g3YUgtoRH4pAtoXt9ka4NNyfNclkRQXYlX?=
 =?us-ascii?Q?/o2L+eBnBaCXItK8aCWJDBKocK1mN1ndD/4DruAnv6NvisxQwBHgPsW48f1m?=
 =?us-ascii?Q?Z07flRTRI3/jJW9iT03I1vtWrYjzDVp8qQ4Zi8AWmIeajwn8VHOmPpk7SBBx?=
 =?us-ascii?Q?4TAJIGr1hpCCo5k/uL8xY9WB+UST2Ar9hElJ1NPSfUOQwmJQy5LIKy4hS6hT?=
 =?us-ascii?Q?vNyxJB9YjVPAstkrmTeYdltuVvV0apfUfJ8Hi6IvueXIxkb4BBdfBsAeezWa?=
 =?us-ascii?Q?WD/yK2DcMU4HcqYO5XHUVhHTp/8yX9fMyJhq8AECsOwhW+5nNSmPtFYfaIYg?=
 =?us-ascii?Q?1go4tujbweeCn3ym2iEa3wkPilbMYHOaP8Q0fhJy55cq76ADVTmJA293gT9k?=
 =?us-ascii?Q?nd9lDy1aNNP3bTMYtC0twu5BMzYgWY/Ed84mwaGT7mRIVyQZU/pJlLvkjGNo?=
 =?us-ascii?Q?gCpNE/HZxRuRh/YnkVruJml7OzdHPy93F74yOL/If/c67XQCI4kyli9xi/ms?=
 =?us-ascii?Q?cOCIp1tZmidbCTok2TbeDLQ4Vm4NWMmx83LHdqqSnu8jBfknSa85vp4hUIEy?=
 =?us-ascii?Q?5vUDNDXddOozbv6YDeD/nMDrFo2x3tedLIV340RzjKC2kryG2uSHi9YrXP49?=
 =?us-ascii?Q?PZB4q7wFkGPKqy84tjGlvoyeLX2zTmzmYqnwCmP++ohd9znnblPz88voe6w8?=
 =?us-ascii?Q?dHxfqx3G9L8uEAUa+kIh5C5ehD43Ebn+iKPhTSTe/s8mfK0fk1XypwsBE60r?=
 =?us-ascii?Q?54A+3k6G7cuEipC/FFI/1/bxqhRV4s4wAC+/3MZR3oHejvrQeDol7AglHf7s?=
 =?us-ascii?Q?2tTlzz1C60vxyUbI8i8BnH5QXVP2PsnTqOwY3SJNxo4yvYQKkavPC04PrPiy?=
 =?us-ascii?Q?7iMd9R3vcvrChCxrQ4HW8SICnU7AZJCXpoHHm4iFTQtwB1UdWjo22LJ/hH58?=
 =?us-ascii?Q?x85vSaTOVFdUT8r3MrHJNPTCs2D4wrDzWdd57I1D/QtjFc7crHE3KZfe2t4T?=
 =?us-ascii?Q?T98tnvS+xUZI8ifyn3VZM9ygz9/z?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: afb3ef48-4d08-4e4d-0db7-08d8c9df752f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 14:08:05.1954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIKdJtibQWLuyt7PC6dVAAX2vs1Xav6jHpBRwe0VyGxRyT+2xqAYx8UX5ohsbcdIXyc6GcbfqOmc4q6JM1xsig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0898
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB40192700C14FD7DC0849B13787B29BM1PR01MB4019INDP_"

--_000_BM1PR01MB40192700C14FD7DC0849B13787B29BM1PR01MB4019INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

The patches are generic to all Yocto implementations and are not reported =
for any particular distros.

I have re-sent another patch version mentioning in detail why these CVEs c=
an be safely whitelisted. Please review and let me know for any change.

Thanks & Regards,
Saloni
________________________________
From: Steve Sakoman <sakoman@gmail.com>
Sent: Wednesday, February 3, 2021 8:15 PM
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lis=
ts.openembedded.org>; Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nisha.=
Parrakat@kpit.com>; Anuj Chougule <Anuj.Chougule@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] libgcrypt: Whitelisted CVEs

On Tue, Feb 2, 2021 at 8:09 AM saloni <saloni.jain@kpit.com> wrote:
>
> Whitelisted below CVEs as their status is disputed
> and ignored and not affecting the Ubuntu and Debian
> environments. Hence, marked them whitelisted.

I'm not sure why you are referencing Ubuntu and Debian environments.
We care about whether it is affecting the Yocto implementation.

Could you explain your reasoning a bit more?  Are you saying that
Ubuntu and Debian maintainers don't consider these CVE's to be a
serious enough issue to mitigate and thus it is safe for us to do the
same?

Thanks!

Steve

> 1. CVE-2018-12433
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-12433&amp;data=3D04%7C01=
%7Csaloni.jain%40kpit.com%7C552396efe6014cdf8dbb08d8c8526011%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637479603466304421%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DNBbGFes6ahGsJLIXXcmqnQ%2Fi95ziKHMHnGzD%2F%2FPFEBM%3D&amp;reserved=
=
=3D0
>
> 2. CVE-2018-12438
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-12438&amp;data=3D04%7C01=
%7Csaloni.jain%40kpit.com%7C552396efe6014cdf8dbb08d8c8526011%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637479603466304421%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DuBYKEgLQ3vY8%2FH0QuBxS2znVtRPJANKv%2FWF0nOGpkI8%3D&amp;reserved=
=3D0
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.8.5.bb
> index 4e0eb0a..ba3666f 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> @@ -29,6 +29,9 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}=
.tar.bz2 \
>  SRC_URI[md5sum] =3D "348cc4601ca34307fc6cd6c945467743"
>  SRC_URI[sha256sum] =3D "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809=
339cdada0eb577ac3"
>
> +# Below whitelisted CVEs are disputed and not affecting Ubuntu and Debi=
an environments.
> +CVE_CHECK_WHITELIST +=3D "CVE-2018-12433 CVE-2018-12438"
> +
>  BINCONFIG =3D "${bindir}/libgcrypt-config"
>
>  inherit autotools texinfo binconfig-disabled pkgconfig
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.

--_000_BM1PR01MB40192700C14FD7DC0849B13787B29BM1PR01MB4019INDP_
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
<div>Hello Steve,</div>
<div><br>
</div>
<div>The patches are generic to all Yocto implementations and are not repo=
rted for any particular distros.
<br>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div>I have re-sent another patch version mentioning in detail why these C=
VEs can be safely whitelisted. Please review and let me know for any change=
.</div>
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni <br>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Steve Sakoman &lt;sa=
koman@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, February 3, 2021 8:15 PM<br>
<b>To:</b> Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;openembedde=
d-core@lists.openembedded.org&gt;; Khem Raj &lt;raj.khem@gmail.com&gt;; Nis=
ha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Anuj Chougule &lt;Anuj.Chougul=
e@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][dunfell][PATCH] libgcrypt: Whiteliste=
d CVEs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">On Tue, Feb 2, 2021 at 8:09 AM saloni &lt;saloni.=
jain@kpit.com&gt; wrote:<br>
&gt;<br>
&gt; Whitelisted below CVEs as their status is disputed<br>
&gt; and ignored and not affecting the Ubuntu and Debian<br>
&gt; environments. Hence, marked them whitelisted.<br>
<br>
I'm not sure why you are referencing Ubuntu and Debian environments.<br>
We care about whether it is affecting the Yocto implementation.<br>
<br>
Could you explain your reasoning a bit more?&nbsp; Are you saying that<br>
Ubuntu and Debian maintainers don't consider these CVE's to be a<br>
serious enough issue to mitigate and thus it is safe for us to do the<br>
same?<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
&gt; 1. CVE-2018-12433<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-12433&am=
p;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C552396efe6014cdf8dbb08d8c85=
26011%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637479603466304421%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DNBbGFes6ahGsJLIXXcmqnQ%2Fi95ziKHMHnGzD%2F=
%2FPFEBM%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
ty-tracker.debian.org%2Ftracker%2FCVE-2018-12433&amp;amp;data=3D04%7C01%7Cs=
aloni.jain%40kpit.com%7C552396efe6014cdf8dbb08d8c8526011%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637479603466304421%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am=
p;sdata=3DNBbGFes6ahGsJLIXXcmqnQ%2Fi95ziKHMHnGzD%2F%2FPFEBM%3D&amp;amp;rese=
rved=3D0</a><br>
&gt;<br>
&gt; 2. CVE-2018-12438<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-12438&am=
p;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C552396efe6014cdf8dbb08d8c85=
26011%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637479603466304421%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DuBYKEgLQ3vY8%2FH0QuBxS2znVtRPJANKv%2FWF0n=
OGpkI8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
ty-tracker.debian.org%2Ftracker%2FCVE-2018-12438&amp;amp;data=3D04%7C01%7Cs=
aloni.jain%40kpit.com%7C552396efe6014cdf8dbb08d8c8526011%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637479603466304421%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am=
p;sdata=3DuBYKEgLQ3vY8%2FH0QuBxS2znVtRPJANKv%2FWF0nOGpkI8%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 3 +++<br>
&gt;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta=
/recipes-support/libgcrypt/libgcrypt_1.8.5.bb<br>
&gt; index 4e0eb0a..ba3666f 100644<br>
&gt; --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb<br>
&gt; +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb<br>
&gt; @@ -29,6 +29,9 @@ SRC_URI =3D &quot;${GNUPG_MIRROR}/libgcrypt/libgcry=
pt-${PV}.tar.bz2 \<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;348cc4601ca34307fc6cd6c945467743&quot=
;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;3b4a2a94cb637eff5bdebbcaf46f4d95c4=
f25206f459809339cdada0eb577ac3&quot;<br>
&gt;<br>
&gt; +# Below whitelisted CVEs are disputed and not affecting Ubuntu and D=
ebian environments.<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2018-12433 CVE-2018-12438&quot;<b=
r>
&gt; +<br>
&gt;&nbsp; BINCONFIG =3D &quot;${bindir}/libgcrypt-config&quot;<br>
&gt;<br>
&gt;&nbsp; inherit autotools texinfo binconfig-disabled pkgconfig<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; This message contains information that may be privileged or confident=
ial and is the property of the KPIT Technologies Ltd. It is intended only f=
or the person to whom it is addressed. If you are not the intended recipien=
t, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</body>
</html>

--_000_BM1PR01MB40192700C14FD7DC0849B13787B29BM1PR01MB4019INDP_--
