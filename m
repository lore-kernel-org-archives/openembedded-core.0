Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15121.1795517107282030762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=B63WgpW/;
 spf=pass (domain: siemens.com, ip: 52.101.70.4, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjFlIyNINXyvlLD+amIvUz/ak/ICwTduidJ01YbaZ+v3liDk3Jy7d/NCi/9EGCq4yZY73F0pmCJOG32KVu2WANhU0Xu8+J/dplsApS6eX11sxZ6uQ02ULZDQedUbRsBP49B1Zyr75+LfA4kSIZ5imfNW1r2CJUbMKJ6FfpdAtX/dZObKZOjVjKRBrAsJ7SAfjjzG8lHKkRxZzIPuAwgCavgSIZ4VBt5LKJzeOnDZcgq/Rq5RhlqIESgGRw0KoVkKiew5pcmu3n7dE7SFTlFyr6liDIBYLOj72X9+A+Crg/2SXGSm2ZZXwQMIuktYWDx1xZYA8yc01+WG6RqCFS1TEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl/0UH+YqfebcMR9Y8loPntCx6XIWGt+uLWaekz3eZs=;
 b=GoDpguPq5iRLV8Z5hBy8/SIENspGVpMUzaveQvs0Q/n8JXws/mUnOpZfdn58M9MQQAbmmbPOA1pXfsJoF1aAXGbBFv03d7MknW5/M6WkZWZZBceL6D2h56UAnxvuQgCwcOCTvXJICLNgzJwR1V3A7cCxKjpfvjoqrcG0123yXqh2QY/F3hq48n30LLe+Rhf61thbSDPn2DW2HHdMhQ/n4qP7IKSS6T95QIxyKJDFudgqTjv62O6C1QuOPqJZihvrNJTy5wkoYvE0sZsmN9EQHRm9h2GfD6Fkl+RHdSYrvbuNmD4Xy/O3urVxktv0JN9n7SGd88sl3O3+VsFcJP9V6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yl/0UH+YqfebcMR9Y8loPntCx6XIWGt+uLWaekz3eZs=;
 b=B63WgpW/v3xPZ2lDTZCNShOIVY1k77aMQLQjf/V19sFImRddun0RjwkPUEXeFK9ji2QnxCFommKMfqaSaVYi3tNxdRDeEzndpQJVuqOg60HApzanx0DWIQQYECmJarxtTYIsicpjSmdJLb7HqqXkvit71SYkKl8HC5F/QXrrSAGHT/8LCYViRw6jRxBg3ycCovh3w2eCc6Gtop8MvNrelfKZnyC64s/6CUf3iAEWrwMA9PkfbgHcEvbiRZZIz+KsahDGOYLgzrecz/NBI8uSn87Gl8Gnsh2WOZ8LXX2nBGcom/JpQHQzX1KYz8eXkpjcCkRa7U3HupSeozU03jrcjQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB8PR10MB3750.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 10:45:02 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:45:02 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "devanshp@cisco.com" <devanshp@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][blacksail][PATCH] zlib: Ignore CVE-2026-76844
Thread-Topic: [OE-core][blacksail][PATCH] zlib: Ignore CVE-2026-76844
Thread-Index: AQHde/k7CpHgLakH+kion279osiDhbc9CWGQ
Date: Tue, 24 Nov 2026 10:45:02 +0000
Message-ID: <AS8PR10MB507343A3CBDBB0F4257E4F32FD442@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261124094943.1560218-1-devanshp@cisco.com>
In-Reply-To: <20261124094943.1560218-1-devanshp@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3c0291dc-8df3-4a59-bdf1-a0e377c45a39;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-24T10:43:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB8PR10MB3750:EE_
x-ms-office365-filtering-correlation-id: db430361-ee7a-489e-9743-08df4a17feb3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|10067099003|261026140227099003|56012099006|11063799006|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|55112099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 8T1DEYOPJjtzJ3FgkaXehoJ4YlYhnlPW+tPlh0cQsMi5RpTXjMDfC/BPmPSyW1QbV9mWjFf1h+L2rfmzYI2vLWtGSNqoitUeMcN1wt1NDpHMnvP/ZC+WX7HUU1mGOoae+ywjDRx/cgpn75zKbv3IpGyDeHpoxCjNBCoR65N1MEjbydSahkl3pW0+8QXEj7LiFJBUhJNNe3Evn6BXtptrx0i2zrcEFYsoOA2WknHh5YM+x74dmGEondkZPYBGt+lt+s6pemK7uurRIiICJl/AN//ETQufeiwnoxj/oGSiQF3mHif8nunJ6sqejXoydxvKEgOMAgZSfkYF5Yd1D4RDht7Fo5WG8TSS++FNvpQDdg97/7XcqVcFIML9mirGjfMcj8TG7AerOqGuxXwpOmFgCZPhtLd6TzGg0TVxkCkXp0uWzI4YWGpfMo1nLMIKZ4seMzxLv1ELJE0Td4r/sItU6L74lMGmkbGFXKCQvZIS3cyo/NRbf6+1zlqKVwlCtTXklnYJefII0i0WuMfZChldcPi62xfOh/JxbO7+SE/jIG1sQY819u32F+isN83B9ZncgkKboMUAxQss56KjHYTS3QlYB89UUMnvC1MsS/1EPvhRCxF/5xoqoAjQSqSV9Vdy1kBr1YzpNDMOH/1VRyJlfU2+NflNOD3nwopaOPKjQAnra+muWuEw4wy1EeEZnz63I2SdA28+URURd47h7yRX66eQbZv0JbNThFYwH5xxnaQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(10067099003)(261026140227099003)(56012099006)(11063799006)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OSyEnU79fPJvzCC4TtxFf1pTnLkdpgNQ1KZtoDjfHSj1CoNJ/+dHWuEoHBdm?=
 =?us-ascii?Q?dgjID5mQde3G7FByyhE96Wi/NWgRFmAQbZOK/ZluzGnWCYvPh6HAcqUrKZVn?=
 =?us-ascii?Q?kqnbEtAV21ZA79fMslJJ0WJ/317PnZk4jXHKz+Th/m/o2TKBB4w/QVOFDwK8?=
 =?us-ascii?Q?TZw+OndGmcB6TLsEYyjx1KfhPFG8B0R4LaCjTXsMGwzo1vXNnKtZ7TL9iEqp?=
 =?us-ascii?Q?4RqhjYQG6fr+UJRB5oZfAp82P/KZ53mReXM/JBWybc1uKDRgUplasc06C14U?=
 =?us-ascii?Q?Io/UfzErppBtzcW2lyn/DKPkTFoABtrNXI8iGiIPMbVQW/FGlbCWs86tH6dY?=
 =?us-ascii?Q?DrIbwXe+DBLntthkWiYxLFzlamVb92A4JzmVDeYsWc4dcuEiBEnG0kb8tCU4?=
 =?us-ascii?Q?oWPQv0huDaygF9GhJblqvRoHOK9fdivRASoJp/PqzV7UoI64xLz2v5iZ2eni?=
 =?us-ascii?Q?KC8h1S/EW/GRtEbG4bln0M0rInV0RBA8T1qaZdSXgNRTLWF4uX3YVUzkEK0Z?=
 =?us-ascii?Q?Y99AhRJMj8uMXpDTmYUARyAkfYxGQqG3pqs9K14tbUX/fyWiFRuQwQtlEWVJ?=
 =?us-ascii?Q?UlM86sl3t1n7nmi7L4cv6ULq07P3re7boU435RrlXYiySYmyJvidTFGKknV8?=
 =?us-ascii?Q?xv224tQwxmpdzTg8S5W4x6q5BIRRb4sptXfYelisfxT8/4A6drc54BBkyohc?=
 =?us-ascii?Q?0MjQDoCAcBLsmKRuXx4laMeHrn5NRshY6TobW7WUIpbzNu0xZ/uP7T8FHqJ+?=
 =?us-ascii?Q?Nk5VrMIAeRZgwUezUxur3JNNWDzPwFnLWD0Z4rNBlSd5XQpBMNJFyGLfoA/b?=
 =?us-ascii?Q?wTunzxwcXNmW5cgysyBCDc/9TOm5kusLc99UiBeLLYkYq3nmmeyT2nge9wve?=
 =?us-ascii?Q?wRQQLNJGAk8QejivWdJRdU2skdZsA76UO/SIFT7ltneYI9hP+1ccxKWV0W4E?=
 =?us-ascii?Q?e8D+NVw3n905GLFKhD3wxyDwVRXhkXPMKM54C2ovAYPegKRbAOWu2+8Zygly?=
 =?us-ascii?Q?BNbzxoeysDr+2NLVDiVaVDGgTBzt52/7jK5QlZP6BMNp0IkaLTWZiSwt3ZzW?=
 =?us-ascii?Q?oCy2dxHbrqzWqgs/wo6ffh5GER0ZIuDCBlGon1Da5njScQT44ErH6esL83fM?=
 =?us-ascii?Q?z4kY99hOauMFydikqxJTlsZGM/r5bMImUXeqFsEhnFr5/7iruOxVex8Dzn+q?=
 =?us-ascii?Q?gYingyuWm0xKNGGogz6faAa26MOGWwYBwPOf64VLzV0+qw1NnZw8BxsPCWtm?=
 =?us-ascii?Q?A2Tt1TEP/42MOkrR7waaKVutnVZH+Yq60LhWF/yho2ihwnsXsDcikMiye8B1?=
 =?us-ascii?Q?Yaw477MEPWhw+O0VjZuNYiRqSnRdl0JDkaLk0PktjW279Vo35zvvsl5+t3mO?=
 =?us-ascii?Q?BRcaP/yD3ZJWkJtJNwJhMubOVTRxAuJnAx9GacLzPMLyBk2vw+ufZxTPPJ7b?=
 =?us-ascii?Q?GkWrGiV14D1JS/9l90EMxcWqpOBLLH89pQNc8ucHLzUnzfWrUyZt1oVKmk/W?=
 =?us-ascii?Q?0p+ZSff5iunK5GFG8V47SJXvUJDI6aUGIQX6EUJD1FJQ+psdcpSlSUcctgsc?=
 =?us-ascii?Q?ygeRM0hEMxHbqKr7mF3h15P6BPgOxh4vPk88ahgL10WOibpCgwfT2aPsALAU?=
 =?us-ascii?Q?kaiuJUGEe8xAZxCHlomrlO+r2a+TupkrDhszqjbHC0ALKuT3vvf7KooxXA2W?=
 =?us-ascii?Q?GM0j5aLOGrC+GKTbP4cNQR9R3sAiNUFb98nuyv1w3NiZzwwqoXXt9KB+NUVD?=
 =?us-ascii?Q?KAzjhz1DIQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: db430361-ee7a-489e-9743-08df4a17feb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 10:45:02.7700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6aGmPSkWvZ1kvPPeRM4lyFoiP/rUBPRkgYwmUxVMV5LmQ0osNsOb6fYsYBZGwrwBvSh35rf9ayMLUw/Oqb+D/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3750
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251004

Patches for this CVE for different branches are no longer needed.
CPE was corrected for this CVE to webpack couple weeks ago...

Peter

> -----Original Message-----
> From: Devansh Patel via openembedded-core
> <devanshp=3Dcisco.com@lists.openembedded.org>
> Sent: Tuesday, November 24, 2026 10:50 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][blacksail][PATCH] zlib: Ignore CVE-2026-76844
>=20
> From: Devansh Patel <devanshp@cisco.com>
>=20
> Analysis:
> - The corrected CVE record identifies webpack-dev-middleware [1].
> - Its affected product and source fix are unrelated to zlib [2].
> - Hence ignoring the CVE for zlib with a cpe-incorrect annotation.
>=20
> Tested with bitbake zlib zlib-native.
>=20
> Reference:
> [1] https://www.cve.org/CVERecord?id=3DCVE-2026-76844
> [2] https://github.com/webpack/webpack-dev-
> middleware/security/advisories/GHSA-g84c-rxfj-3j2c
>=20
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  meta/recipes-core/zlib/zlib_1.3.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-
> core/zlib/zlib_1.3.2.bb
> index 8a23d98c..3792af55 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.2.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
> @@ -50,3 +50,5 @@ BBCLASSEXTEND =3D "native nativesdk"
>=20
>  # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
>  CVE_PRODUCT =3D "zlib:zlib gnu:zlib"
> +
> +CVE_STATUS[CVE-2026-76844] =3D "cpe-incorrect: Applies to webpack-dev-
> middleware, not zlib"
> --
> 2.35.6

