Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16649.1793100844675256225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=RCPzDoIe;
 spf=pass (domain: siemens.com, ip: 52.101.84.23, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZp6D/5rnP/m4HxihgSbp/N8GQScnBXCKG0OGsjolLN3AguvwrPypPIfLlUJGRUJ1hs0JSwOHbXBHVVQLUpe3qaQlx3sw0s480YHJzDMwAM4NS17PXKyzkolut2lBE0vRJGMOGb5ClqZLwGCcp7VamokO0EoIqOP/fABJxxfTmBR67aSO7CI6omfEfj65vIJeuUx/BYmwfFsIPzcxDycLSHqx5bGWYia9uMzfqfDuKlLk0T0HjqJleZJblJsY0Dz39ZLxMxEY8c3D+74buavFS1fhwjkAIzLXV1k1XQTqzZG5CfX5amad/79qsX+RYzUeMl8B1TOC0v1yyHLvPFhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvpVuT9opiENdW+G856pdZ2W13WEcrttleMgKzqz1cM=;
 b=Fhh3YyWqEUeBwXn8hndgvwqUhux0v2Jegej91A95sAjVnmZEX20SFuT5zH3RAEnBO1O4YbnIxRknPzNUcvKnbyATuAROYcF1Enrv8ISWBqNosOthWwYZcaNtxGM9Df1ScrKlAt9aOR/8/IYP8fpbYvyR1f9h4sdzSN34kn5+sji+n7i4cUWAh6d1m2tPWgH9/3EIEA7Cj18IfFo5TVidjvbcjlfXV5ehLqlV2VKFieCs9xHHP00x9Hv5CCZOazOR7DxsZKDu8pcGEwzDWtNS4Vw+o60L31CWSSrLqIwToWrib2S6SBaP+F3MH/iMNINixBBsERPtA4W5i/LvyhPDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvpVuT9opiENdW+G856pdZ2W13WEcrttleMgKzqz1cM=;
 b=RCPzDoIeuALrwBamvRdEJfMrFJd9lA7WGdMXvpu+mg4nq9Am1f0h9IqxoCAHzRk4gN1veDZfbCsGewXRmUTt6/+PVL1A+Pg/U1BOo4V8pCMfFicoooJps2Jp9XgSUeaNNmFS+yYQe1kBwNVovGG7bTj5/J66I+beiDcAMvzWiZ8D1VGcxp6nPtMMHo+cMkG7ubfnfocm550RIZfqQGKzPJ/zOsGNk6L3qxYPkR3P6nq4+0xsPyHGaR/bsGAZ2S4erm81GfJM+Df73PApzWqT77zz6SvrbTuDl/jt0IePktsU/cfYktvro8GeTg1XgfwNxGvyJ7yt4HxS7ZiRmI+i9A==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PA1PR10MB8475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:441::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.7; Tue, 27 Oct
 2026 11:34:00 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0569.006; Tue, 27 Oct 2026
 11:33:59 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/6] expat: use .tar.gz instead of .tar.bz2 in
 SRC_URI
Thread-Topic: [OE-core] [PATCH 1/6] expat: use .tar.gz instead of .tar.bz2 in
 SRC_URI
Thread-Index: AQHdZgapGyNoUJWGDk6dqeoKiu9YMLcRQa4Q
Date: Tue, 27 Oct 2026 11:33:58 +0000
Message-ID: <AS8PR10MB50736A62150518929372A762FD602@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261027113048.1086884-1-ross.burton@arm.com>
In-Reply-To: <20261027113048.1086884-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ddffd5b3-d10c-4eec-9637-4ae5c8ce3035;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-27T11:32:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PA1PR10MB8475:EE_
x-ms-office365-filtering-correlation-id: 6039440f-dba2-4663-69e2-08df341e314c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|11063799006|56012099006|261009223027099003|261021123027099003|261026121527099003|261021121427099003|10067099003|22082099003|18002099003|55112099003;
x-microsoft-antispam-message-info: VWefcpc497avV7aJScOmIepJE6J6fW/kw/CpvZPvjDuWL5rTNPNr09sui1/DC9f0CoU2tgc21e7C43GHxUGqksEtShaiPKAj5Spznml1a39BZ8upXY0bUzsUPdalq7x9x3y8F3T6Rd4Ro0mVpek3Jo1kvHdMI+nI9/i7yJ9J1JRAtEcNGm0k3qjHM2UV4ZbjrDs/W4q7YsH8NjbAlu/nc6LVdH3+7f7Z5qVenfS/t4p+FToqY8WyJe8zfl2rnKOL2FpKBmhl72yFfRp0zXdq0/jVkERCrpZqFxthVRZuPwnRziMqe5mZX0tvaY2YkcjpFRYtOO35y3dgTFKqYD3V/jO+9iTu2LvMFTZ18QXE0YrjlE9i4y5t/eofBqfFXkppnrVTsRpFeSt5led8RJVcOATMc3JEol3HyOswCvfu1FvEQlkykBPkL6poY2vkH8T0gJcgQPnaL0Y3y+YxFWZJo8AjLbhzVsR45R93dzWdoxdsD/oiUomS4yLb9kouTeC75PBJC6RDvCgdxQ6wss6ZyKrK9psk30BfPKzIO3hg3vvo150wZLBqfj2/faQyw5vLu3Yn1Xn9RK0y7HT9bzQ12W/mNTkw1nQtbf6O4nR1F/QDZowFzvKfRXGqqOe0K2jcmHXttS1m/EGvZZBtxuKZ6iwe7b8Ipp/KIqfPrylliuJJWZRHFE0rKAbi7MMrlGVyL1ySqxrQEobbFlqtPl6tLrMVaCNZiiHhUDfHDDVSU4M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NdDL+fmawGQxo+xO9aDrn4RfRyGFFeFE6kW8sg1T24FOBT1ZhvKyNXVQrPg6?=
 =?us-ascii?Q?t6XpXFpgvK1iRhEZKG0dgDYn8dW+9ah+CsTlfKX/ZVHa9ox0CU6Z/7YOEd7m?=
 =?us-ascii?Q?gUJ1S5XI3YykBC0n/taL6/8MWTFrqi4x0p13gkZehxiZM717czhcS03UTsdV?=
 =?us-ascii?Q?wyAGfLxXp3XUcMbR7eW5Fpu2QCKo08G0Z0UCb8hL/CQ7GvNo/r2ug7RzADh5?=
 =?us-ascii?Q?mRFMVMQxLHs50/wEztZvJIrwjzwrpLrFNWXjgzQSYsFIbzIXigVafti7ZuBo?=
 =?us-ascii?Q?xnHBGTt/W5b0VrKoE1cbyBr/bYekEn4WtuLy5UA6Lw//VozhB38mGwmRLsDK?=
 =?us-ascii?Q?hp/etgIN4g0In5cuGlKNVBTspid+Vjqj3FSGv5NrVI7/cR3wGF/DRBE2gIr5?=
 =?us-ascii?Q?7EmtGfSbo5loPPUM/EQv/INftHykrZvcemfz02YMhjFSpfAqKZqjADFmZDeo?=
 =?us-ascii?Q?ANyGYK3gApdMFzAq00SBLSdYsEIXtz3hyzswCbsFiNwsp/ITFDS057PFOI9r?=
 =?us-ascii?Q?Xf9w7AARigUNNMp5wCw+Rz6WIJGJx1QlRZAOjZwlQWqSCPRTwRo1gp+xqw0h?=
 =?us-ascii?Q?arV7qlPiVUpDuxtd1I6cEzEDl9rg7Vkmf0mOcc/1AG/jT4aCTw0yw/BrtS12?=
 =?us-ascii?Q?0Gn+PPdn0do19gxIpC+X+E0uWo1o0ZKu13aPBwh3f4PA+3JMILr8UMzG4AkJ?=
 =?us-ascii?Q?SUsoGEXweOBhYO+dWB4HgrrnusK7IxcUEgRxYAC8Sqwf8a3NJ5DwfmJsARMT?=
 =?us-ascii?Q?hUPYm1Chwc/0eGLeLVxAuxWkZaRdpvXX/YFsi325U3rgB10TFdOC8M+Obr9F?=
 =?us-ascii?Q?zk90JY06aZt4QdAqpROW/wD7BDCghr/Z6RMjfSMutpbxMmsjHGqDLyUBCmpj?=
 =?us-ascii?Q?edjAhYX0HvOIZE/jbxJEEB3hlpbeca2FKN07hDoRGL3l9v2r8s8WmxmdvYSS?=
 =?us-ascii?Q?LWL9F4eGx15WfEkp2e6x7i2hviN5A6/t4jFVxEyNEBW8yhyeaasM+xCImvuS?=
 =?us-ascii?Q?ABBjPpYtumxNQZXMk1DU23RZbCgZCS0OSt86V+zRj8THiz5TXrjPid8qPpMr?=
 =?us-ascii?Q?iPh2MOlTKN0hXBn60N6SJTO12b6c8kyJ4BxpiVjnuhquk5SbvHGVWGDtQkIp?=
 =?us-ascii?Q?z5RIwbYc1pnniW86AUFgw+YJ5Dr5J1G77zSeao1cFHUwfWIFfuscZ+VAgcXn?=
 =?us-ascii?Q?4p0BvN4Bb5SfLQ1CUuoKdlMR5HuBhuFDpPq7jfrMlavvIqQT9T3eAhShLHln?=
 =?us-ascii?Q?RqaYlFnju9QE31BWe1wWnUXeJxgfszwvUTDL5yRh39z1GPQlJ3M7iJRujgC1?=
 =?us-ascii?Q?Ce0lw7BmMToiUNvK3ZY+7znAQD1ybozQrVT7RYczOKj+4V1fyRD5i1FC03zh?=
 =?us-ascii?Q?lDM/2Nobtbh+n4wMXl23rzjvWheIAp2DFjrC8vQlXRWTsgA4xJe8nFWbGxg0?=
 =?us-ascii?Q?KpGMh4xQGDQ1FKn1hYMEa0VJjbL+nnUceGC+eCB1FM372cpMMEJy4/FqMdih?=
 =?us-ascii?Q?opg/qRn5UHCPvxCtHT8kI474PeZpUdU0ax6OvB4EbRLKH6sGc2IHztRw8pzI?=
 =?us-ascii?Q?hkys+AMnHZ53MQlTA5MpdKFeO9DSbmlHZ0aH+lRw2PIGWbDkzEQSKBWuzLNm?=
 =?us-ascii?Q?UimDPUgICrFiJSGbFIjgdjY6Y+aF7/c9MazgTyaqUDkq++qK35NFHTGZhZr1?=
 =?us-ascii?Q?BDxlkgqb+Ab7ITf6t5x0SWIudU3ntLr1ioCtTAfZhfgdBYdkfRS7su59Qwdo?=
 =?us-ascii?Q?+LR3gGz3hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6039440f-dba2-4663-69e2-08df341e314c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 11:33:58.9949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ODfc1AY1k09cDC+AygR5NyyiO/QYlANsJ3HhGEmnoyB+xi00STcjiiuZ8b3UmuhYZoZRfa1vJZ7vHRO6oSS+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248735

The commit messages in this series should be corrected to xz.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton via
> lists.openembedded.org
> Sent: Tuesday, October 27, 2026 12:31 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/6] expat: use .tar.gz instead of .tar.bz2 in =
SRC_URI
>=20
> .xz files are significantly smaller than .bz2, so download that instead.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/expat/expat_2.9.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/expat/expat_2.9.0.bb b/meta/recipes-
> core/expat/expat_2.9.0.bb
> index e9bb21bd55c..9b337648390 100644
> --- a/meta/recipes-core/expat/expat_2.9.0.bb
> +++ b/meta/recipes-core/expat/expat_2.9.0.bb
> @@ -8,14 +8,14 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Df4fedd6116da0e171f7cb4d2923d7ac2"
>=20
>  VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
>=20
> -SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-
> ${PV}.tar.bz2  \
> +SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-
> ${PV}.tar.xz  \
>             file://run-ptest \
>             "
>=20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
>=20
> -SRC_URI[sha256sum] =3D
> "775e8a68f81a748a401dc3168318d4a39484eb4f954726f21517c8f42c0ba984"
> +SRC_URI[sha256sum] =3D
> "1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051"
>=20
>  EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
>=20
> --
> 2.43.0

