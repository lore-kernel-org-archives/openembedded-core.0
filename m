Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6154.1795729610414450331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 13:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FgXI9bWn;
 spf=pass (domain: siemens.com, ip: 52.101.69.24, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib0SAO2b32GwRu1BtOn8FqNmA5/aZzuQLy1H0q02hiBrNdCVhJpmaxPojYGQEr3HnLreIoKf3GpSfBeZ/ArxET16mwoC7PedDMa9PcpW66Uvax6bS4b/X7YX2mLLmOwcdsSqs8ar3SY8y789GyMUN7fzqvTq/G4rrwo62MUl1dCaglp+NNMoxWq81jsgNVI3McO4XLJHDn/oTfW1gLNb0e3NHIaFiDQF9gEBfaT5L2p1vNI6cunaYEE/iFrU205ILXQWx/xhVsjjQhprH1UcQcscn6Itz8YbNlCnQGwG2qN5SOgUuZcPFMRts4VGAidCjwH/iV/k6OTuhtld+h7J8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHSeuWVWd4ISSbGHQAI8UuKUFszCLsGGHyomTsLELfU=;
 b=cm0Sil67hLnN74B7Lmkca0W03k9/HiaoRXrMpyPV7jCu9+2M14GGrLnQ0ygTbLUxeZrpXcrNohAz5yUu3QCE1uW2hC195O5fU+HNaDovBN//8MDMvyVNyIXnYhCMxbLJ+InITeY3UmHkZrjju3JA0lnKud/frL5nh3MldG37PsGmo9Sr9QPZZfrmK1sqQzgVG/ar5oidTZW0+oDuFEeth2E9Hj24/iiWjPe9lFSImhPObA9cKbGDkfrPiOtMSySvwgPZj5NhscfOgYpxOgAOTzn7bvob3wzxua4I+wZKvd7b6X71a8owtu4k7vFvV/8mFLI5CULagWZAm7rdv8OxEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHSeuWVWd4ISSbGHQAI8UuKUFszCLsGGHyomTsLELfU=;
 b=FgXI9bWnYNhZfRaAc0GAV44JV65fGdxdvXOa+sbab27vXHDmESc1swwsmnkQ+al0YXNuvM21f17Q86NZlgVhaxA7Nebdgzlz7wChCTkQJLaUTKax+ssS8bTEerKvyAreWbK7U+6bdmgSSb4Cr4vH8HjU6UoM1wg5/loIbNbodmA4/6vtHPxwWrnYdO/817yYEk4ZWsytx2MIH1Oq7rRaRFAjtvvHunYRm5kqjGtbjHktZKxuFXIWk6Buav96GgBfJzmvrXWmzDmLCK3noq7GAT4becTuXZ338mHRhgvfYANAWiFYHvjU8YtfTomqTtJ6Tlp3f9tQMr6YoohIw8+Rmw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by VI0PR10MB9657.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Thu, 26 Nov
 2026 21:46:46 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0688.001; Thu, 26 Nov 2026
 21:46:43 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: RE: [OE-core] [PATCH] sqlite3: Enable unlock-notify for native builds
Thread-Topic: [OE-core] [PATCH] sqlite3: Enable unlock-notify for native
 builds
Thread-Index: AQHdfe1SfyZwZm3QXE2wJv8SUUGHZLdA4tMA
Date: Thu, 26 Nov 2026 21:46:43 +0000
Message-ID: <AS8PR10MB50736108AE7D8F72A3683EB5FD422@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261126212957.2477520-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261126212957.2477520-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=67421cae-221e-4361-938e-d50bfdb2b774;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-26T21:44:40Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|VI0PR10MB9657:EE_
x-ms-office365-filtering-correlation-id: 93ec07a3-77e2-4f60-5a2d-08df4c06c321
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|3023799007|55112099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261009223027099003|261021121427099003|261022075727099003|261102123227099003|10067099003|38070700021;
x-microsoft-antispam-message-info: lWedXSTaAYxJuCxMDRgFW71lI0LnWHwyQwPI4t8hYBVVHXrXkwi/tIhjZElVhGHxbwYKB/2daxaOiBxdlss12edz5vuOrHCu2X98K1lsNvJfkYd7ikzqpiiJ3YC2AaAPR9HQqIGL9s4YwSGJY7m7mPSQXNsMboZECQRvp3blunWv+rsLHjLzDyiQUKNVzCfkXgl0u75eg8uwnPFaOYnWz3yMBrMfN8i8ImVu1zSdbz/RBPKBUuLjnVfkJ4QLky6jY4ZRR0BHFCYCUjc9skR2IC9xTsFA1lNhG1KxuLjfmPn6+kqcM6bxnAlONDV9OtPs4bfYmHiQVB011aLQ6HmMUXvEPlwp6OF/UIdircyGiaodXdTeSoHhyNVL2Lb28LZ/lSmiPJAKPc70N3WF3czJXsx/WPdMkH+wCwmx5AOlP9IeO/LyL1SFAQdqzaAaGy6fEkWm/CraSZi4GGKjDfw3KMyYTONOr9e7WMHb7Vxm5uv6dDuW5/fZF9O5ALfYPD63fTnZPbOfX9NxC/kHqD8O78H36+i7JRdwgcSYUySEshouXlVMrxWLx+60oCYrlRG/j0yfnkacWq0+V/fTR7HyfuupcNlaSUf3e7PQqDPsbub0jGVhyld+5S6MHlVy/rfKqYgKrn8x9Grs3hMaX0zrWE7R1GvX9L4T0/7N+KthgHLjyHao6glOkB3qZ0LpYHhPZ+qgSnJQh55A9XPHotpZZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(3023799007)(55112099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261009223027099003)(261021121427099003)(261022075727099003)(261102123227099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nTE4QCaKfhryZcIaixp3EjGOJvH1qLhznVV5ytNf34Trh4l7oYditd1m/pJy?=
 =?us-ascii?Q?/3grOJT6uboOi3HvHogAdyW0OTY8QGIsCIE+HpZz9cwpgDVV0RaqOAIJcJUA?=
 =?us-ascii?Q?/VXmzqa8hjDLZ2XGoTeF1XYhMSjfv7FQQopwX4p+c1/exydDMUrmgd+B37lf?=
 =?us-ascii?Q?XKQsU/R0BoyBaAkp4uvE2+fHp47Q9OFimS/+0VOA3UEbPo/ECcl3vSsfS6zt?=
 =?us-ascii?Q?oFw9FuJBBf2Pi4KJGxjBnSNybxH+yhISzWMT+eUEb7cm3mt53NZ+iE+W3EpH?=
 =?us-ascii?Q?VATVwhALHkAhUJa8K9lmQz1LOjVNuwmNvFehnua4mtyTjI1saQvYKcTT/EC3?=
 =?us-ascii?Q?917tXyy1bbo6BN6BETHz0cBxXwrZ0O5FnBJ6iZEa+uWoVTBHB63WOjMlh0ay?=
 =?us-ascii?Q?1e83nB5K4q/w1zQkNa8I31+eGuro9UIqrAP53sh2ja7GEgBzUBQoQNfej9tS?=
 =?us-ascii?Q?FIhwI+tjRY1CeHPU8qq6r9bZUJz3BLklz8rzryvewkIloeTHfCClmLd+E9Eb?=
 =?us-ascii?Q?NsU9+OL1RrELgMY4feR4NBWhhZOEIbmA2yf/W9JTUAppqVtE7Zs+Hp3YUUjg?=
 =?us-ascii?Q?dpitD2b23NYXX5kcWURrCf3E+I1oDNgMnfeRjW6TdKtqQaqWQnnhXf3LEEJU?=
 =?us-ascii?Q?cjCTxXX6XtfyKmMbF+TeoJcRSg4PHLflP/CUUi9MKoLze7PR7bBn+dO4gpxf?=
 =?us-ascii?Q?QuLBOjgzzYYtWFtbzEuDChWGID3taVE87C2xVMDZvJVYfxPkiIYEHaPSSg81?=
 =?us-ascii?Q?EsfCBKk99MLvVuj2ZZvPtLKYbilPDNq/2HES+ROlZS29J9Two3uS4o1nQrvM?=
 =?us-ascii?Q?8arWoH28HYlX7p0DUyuGX+L9dvv8Ce+bt7BKQI+sd+eZO8UanFA+v9ons7c2?=
 =?us-ascii?Q?Zq6z8VonGsp8GQyBHgJRS2lDQurlvVhzIB/QOoy5pdfWS7UjngePUPp8jlbL?=
 =?us-ascii?Q?RCXhv2dxnFvvZxiEa31ZXH7DYslvCEH7obJNFwaNgMJvtNh4pYdj8OgmzTr4?=
 =?us-ascii?Q?VRCt5XH2MDuCIxwihvMLo5fy9UXHEy6Cp9cefHzJfBxrozDd1RHRaRXgyeJK?=
 =?us-ascii?Q?uiOYIzYE5kyg26Xg/mv9Lx5DHow0gxonm7M1sNOFWR8BFZgQmpbPYhOPm9Sq?=
 =?us-ascii?Q?N38K1pFezFHL+vqrgbKppjfpw8oRS63swy+t4yQyMNn3d3pLU2zVtcJHq40K?=
 =?us-ascii?Q?lViM4Gm5Lf7fPBnrrK+9su/G9N/0kB2CIvl0gIGSs/Z/T46JIX0yE/dDK2At?=
 =?us-ascii?Q?2+ikdX1NU+sC0GUFM8QG7PL52QR1LFvVdZu2ZzWT9rx8bPn3KJUzJ916i9CF?=
 =?us-ascii?Q?7TxMbMtNEXG3X0pD9VLlhkPXKMNz0OOEt/XtXb43MJzR3JnYKWmASLrZ4tw8?=
 =?us-ascii?Q?PhkEEjqK8Yn9xeMYyQenQv4RQahbcHBePGWwC3J+iN7bJSwbr3yuR1FChKX2?=
 =?us-ascii?Q?ER2CdeufO0BGJgETVNEeaCI7MGaHY3L2Yi7k7si8Cjn6HygT9TXSz28HY6PP?=
 =?us-ascii?Q?uotKvWThSY0edkzvNTzFn+P4mQjZXQmjlbXFuDnl5giWFmpb4+MyCp2YUZ96?=
 =?us-ascii?Q?/Rk6aMrne7G3A2SjwThZXGSsAT5UMXRvN6V3z+hMjtwNR13r6dz1yWSQWUPo?=
 =?us-ascii?Q?MeIWgYbDzQ9lKR5v4PyA3EmVgCp8zqyUw1lTaFQFdiKlMs8YweTa8UGUoRuQ?=
 =?us-ascii?Q?ZRc9RKIFA60nGSHJI8YWpceUgJs75trz6WfPuPJ+n1Nbcd6Qd3eDZMY/YIha?=
 =?us-ascii?Q?QFiINIM7kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ec07a3-77e2-4f60-5a2d-08df4c06c321
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 21:46:43.6876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/c/h1Q2kQjmu1DrW+T4ZEEj8o/y+46VnjjCzdUFYmzcUpG7urmk6o8RhiAjGDShn407yHt1FNwRoZN6jkd+uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 21:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251331


> -----Original Message-----
> From: Khem Raj via openembedded-core
> <raj.khem=3Dgmail.com@lists.openembedded.org>
> Sent: Thursday, November 26, 2026 10:30 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <khem.raj@oss.qualcomm.com>
> Subject: [OE-core] [PATCH] sqlite3: Enable unlock-notify for native build=
s
>=20
> Rust crates that use sqlx with the system SQLite build their sqlx
> proc macros for the build host, and those link sqlite3-native. sqlx
> needs sqlite3_unlock_notify(), so without it the macros fail to load,
> e.g. for influxdb3 in meta-oe:
>=20
>   libsqlx_macros-<hash>.so: undefined symbol: sqlite3_unlock_notify
>=20
> Enable unlock-notify for native as it already is for target.
>=20
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  meta/recipes-support/sqlite/sqlite3_3.54.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb b/meta/recipes=
-
> support/sqlite/sqlite3_3.54.1.bb
> index 681b8e1e20..5daea010fe 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
> @@ -32,7 +32,7 @@ CVE_PRODUCT =3D "sqlite"
>  inherit pkgconfig siteinfo upstream-stable-release-point
>=20
>  PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext unlock-notify"
> -PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
> +PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext unlock-notify"

These two PACKAGECONFIGs are now identical, so should we just remove the na=
tive override instead?
Peter

>=20
>  PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-
> header=3D${STAGING_INCDIR}/editline/readline.h,--disable-editline,libedit=
 ncurses"
>  PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-
> header=3D${STAGING_INCDIR}/readline/readline.h,--disable-readline,readlin=
e ncurses"
