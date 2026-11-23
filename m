Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53389.1795439987964844568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ebSt+Tg3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ebSt+Tg3;
 spf=pass (domain: arm.com, ip: 40.107.162.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dAolp+BwGuTiXg957qFL6TAXAlmWAbpQLK/uBViU6YkfzLCNd1X0qb3pjy3CoSFM/qpvn5EpYNE0lmQq1URzT23y7UpvXS5MfpbF6czzi0DGMOkTrBm/Li0vR7wWegXUk6ASQX/nB+4m7t0gZxcy8GROWJAQMwjXYaDn9+f4Q7q74s+OOjUbQ+EKHE1c1rWpFFP1uavutoR7F3a6y13mdlbY4oJLwfPULoJ0gUXbBqpqOeAYWnbWnTz4UUw07X2eXclRm6kqbAGAlftYeWgiiDyMTjJsObKewfvIOEbXFWqD9pU0M2x2ZxGSr0TT7OtbRn+mutQFOXJgXn7TKoo7vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xEBqq8/crnoiNnYjg7rNkQILgplHVO3wj6uK/RJYwE=;
 b=eOSt271X4w9ym+uquL8bntaOUqnHBg7jxpCu0adXf7FE+sAKNL+1lM2FvDH3HKWgVwEQA7fPILUAnckId3KAVKK7N94WQbiA7swTiLiagiqdIu+xKeMgm8Uv/90PbzQW75GPrUn5nELQgbEqLtWMLfb3hlzz9OE29nuUckUTg+hwNrt06ok/wBEV1vboMwjNm+8LpFa5y0U35G+uJbtl4Ihq62Nmdurc1uXuPAfEfIPnTT5v01XcnxbBhEZa23n6GiEhMM0RmlhlFSM5MILW94Xyt1S3BUt595/tQu6cWH0Df4CIT1XWPaDJ+t7bS1JSoyoE7pjpZxOeXQ6GHH+QBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=mailbox.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xEBqq8/crnoiNnYjg7rNkQILgplHVO3wj6uK/RJYwE=;
 b=ebSt+Tg3gZt8IIxOk+Bb/e+QZ+L+awhi0EO8BDPDkrioHAxT/jh/gF1QuOo33ra4nrRiiBs5SbTyusxXcsB5dz4jlovozSbDEuajOWkW29G2NPEX+E8/th8FgL2OKVa8m6AaOYpmqH12vTX6ZkXGC6b92hqeQQH/e7iteXlLFjM=
Received: from OS6P279CA0105.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3d::20)
 by AM0PR08MB388940.eurprd08.prod.outlook.com (2603:10a6:20b:7f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 13:19:43 +0000
Received: from CPH1EPF00000521.eurprd05.prod.outlook.com
 (2603:10a6:e10:3d:cafe::7a) by OS6P279CA0105.outlook.office365.com
 (2603:10a6:e10:3d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 13:19:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF00000521.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Mon, 23 Nov 2026 13:19:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSu7gq6DzEthbZ0/UkXtFiIdyger6u27Gzy4z4DFaZblUj3pGTRnGuJdFxlzjSd0D1Dw9RVQ+HIQifJ6Bo33V79EqRZOhcdahcY6UmIxq0WXBm6DoawkauNjIBQQmbFvSFVY8k0vAdTo4buYJ/pIKwzNPYJ9bFDSBfhaqf3+nE2e/j2V02baRVbQJXa2WPz5BJAQEZRkzgHkHQ2LrCatLRgfpZ62p+xICtl9LlIOtflQGiYYyYf+ROoiSwleRcYfxBIoXiYGW/joNqi29NrV/5Ixh6SYkwh/WuU0qMuxf38vAmt3gQki7WlgVOqMC0l5aTKZIwHPvkLBUjmqx8XsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xEBqq8/crnoiNnYjg7rNkQILgplHVO3wj6uK/RJYwE=;
 b=cvCE7BgLwicX4JU5YucttO4W3sZD/uPICFO5K6eSfbsv7KV+mY4RLdxEsd5sj6GiZHNeZ1s3r9J0Jh6m4UPeXIm/GpPPaclBcmwkUxkLUaQ8aC5ZderhDW8cX77+P1k1+A2tsUbw11u+0pIRGJN4qRboYL+3cOCQKDeGgLcA7BBRIQQfDWBWMSxg2aKQR1Bgb3V+n3/j1mwFBBYEaDm1VgICvkNikhrzuCIaXBxYKfq7x8mDQAW+y7uy0q/g9RJG/lQ2rWVzWSVhe5GMWNF8RpZCEX8/sWiQySGdiw5o4DHjPaz00xgu6tjd19cHJ4pe7SVqnv5pwhO4lFo3Ky013A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xEBqq8/crnoiNnYjg7rNkQILgplHVO3wj6uK/RJYwE=;
 b=ebSt+Tg3gZt8IIxOk+Bb/e+QZ+L+awhi0EO8BDPDkrioHAxT/jh/gF1QuOo33ra4nrRiiBs5SbTyusxXcsB5dz4jlovozSbDEuajOWkW29G2NPEX+E8/th8FgL2OKVa8m6AaOYpmqH12vTX6ZkXGC6b92hqeQQH/e7iteXlLFjM=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by VI0PR08MB11267.eurprd08.prod.outlook.com (2603:10a6:800:31e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 13:19:10 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 13:19:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Fabio Estevam
	<festevam@gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: Add U-Boot ELF SREC install and deploy
Thread-Topic: [OE-core] [PATCH] u-boot: Add U-Boot ELF SREC install and deploy
Thread-Index: AQHddWhu6SdMqpF7tU+Pu+pUjsCdw7c7ru8A
Date: Mon, 23 Nov 2026 13:19:10 +0000
Message-ID: <0281650D-6E7B-4184-94A4-BBC754225C68@arm.com>
References: <20261116011833.2775540-1-marek.vasut@mailbox.org>
In-Reply-To: <20261116011833.2775540-1-marek.vasut@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|VI0PR08MB11267:EE_|CPH1EPF00000521:EE_|AM0PR08MB388940:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b6a840-3540-45e6-e277-08df49646fa9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original: zxINckotpNJQdjK7iV6mSdq6eSzu/VaOsGQ/wgNpzjsoBVqHes6oRtiI6xyXLyrxeQaCYytANH14w7HIkBGJfyqMEcojB635fTy5xhynEETPCQ1S/cGbX6FJ6eR/Tnc2SekjGJjs3TMiXU1DIIz1hPF9DJFzu0v/+2MB1GbvM2ZwO0+97J1AsfzYjVXw61ysQBLeUJm5xiZIpNFVf/vjjdZmQhmCgVchypylVpERc31+rTHFsihlDIY5Hed4iX9vzYYqJtq6VpVu4T+MAIEFsj97RSo/Nx9KzrDll34pr08n/QsIJLrhweZ8jYptscrRrm2SGrL33pEKmT15/+NWT2HtUw++tZ6zl7wyxF9pPGhQrIdJHMErNTqx+xea2m16zECwKd9ebtBA8gCGra+TC+pIRSQ6LkRhQjqrsCOvzQq7Irh3ajVbgJxIBWUGAGU+QFB2WAJ+GcGwF8jsYIoVrQTrcR31HFKXJkCqonnxiKD66ScexMIK5G5K+Ft0I3mSWNn91BK2T343kRgbW8koKl+UBgYMDK5GP8N59zWmfeY4XjeKc7h9hUArWoeIsvcLzOluVSpAFefFBkYiQehb/Qq88fmbqy5NED3Mm5FFt7Gqka58pI9wYFV+l/ymGBXCTDvFqBrJEtddXVVupSJ0r8GypwC+h6WVONuUYMVhmwx18OuK7x7UdWd+x9s2Rx4tY6DNpbqgMuULpiXix4zMhxArF9F5WyeHP2i4qtJ1krs=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F3846D857A7D8439E2237C473360860@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HNvTtT/vIAOLRYIS+WfU2sbWbNQDPBTL+gWkLykBI97irtPi+z2lGCcwjZzpozU/m1jg08qnqWA+fzAkTQm3dDT5FHdD81/KbElxalTKcAV2f6H7pnQSjecxPpWAHYH54Uu1q/avDqUFflCBkC3ihJtLyT6uMQJ1y3saq/zuWQszSsI6YOlgT2D5snqAPXhwtsoAPZWwWkkbmCuP9NiDkmf1o1sLJSQ5xBs/ys4DD1BQK3XcgsxQf5Cn5JIMHGd0Bm3RZbVb6Peglu8zXpNceRZxSFzjE/fEiwOFas9unhUVmSXDDURMpFi3DYjBdfFSe07z/UMPMHbntS6ukEYQ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11267
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CPH1EPF00000521.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 065640b6-5cd2-46cf-9a97-08df49645c5d
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|14060799003|35042699022|376014|1800799024|22082099003|18002099003|11063799006|56012099006|261028144727099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: YlSZ7mmxg3owA9uCE3bAHiRMpw7uhcpac8zo/u1Cqb9u0CyQ0xui8nIxdEQtevOhL1lQG77WdatVhMepnv/ii3Fzxkba+DX//IZiTe58WJOn2QuaNEBSwZjNkhVLSj907+2aHnp/h8g6hR3O1rvK6WwiM2VZxV2Z2TZSLAwTKllSccn3iUhIuocVqn/kLYAU9Dba3WBBBgIrOXiYJvwDsRRGvExJnb2flLWdBPm9X8YIPBV/GSRu/5BEwFcIid1FJvetUX98iilvIVLqYrdIBy73Wa6fyF2dYbz2zeOuK9gNGLWI3AAJqiMUuQYiTZJDumztVzyxvkGJwQqT8m+uOLdewPwpLPFfxy20+dtRYssxmtVmzEAYYirzDp4QfgCMaVXVuq/8wcWaUIX79nUPRSKXqihi/2v2vOvBdkngbNqZl6SRNGEyAKgpOVwksaU/7vj85oYpTPdBqv/hW+JLLH6Mj2K8Lgkz1kg0iy2eZLoxcdP2u1x11AeoO3LwYmHfu/io1d1xDeRa6+ZjZNb+rRxvyzCzmFLTq+5vw6WV5DJb4VZZilpPAWoZc8ta+rC75WovE57axYc315GbG9mrjWAdXxpq2OmU0AEcqnYrtLeTLVGMLutOIn2TUBuXimqBRTb+AzAh49f+BMwxfjVTCkOgzwbZhcUqScxmQLzcd2D2SPPlFkdzXUDsbd4M9/6Xts7QqUxZ12dOexJRFFi8ug==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(14060799003)(35042699022)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: y/rpmnR2b3F+BaL7ejm8dUAvDlw2r4asi2GJS9N0Yex0b9RHhAO58A0QJCbT42kroGKu9WshNjcfWT7xawuqu1/oqmqlp/S41nFvyuf907JapyuBs2q0uKJpOWw4w4Xh5vugYcQr4nxm+GRvQq/vAQNKzPDXQVwNcGTN0bAsaJoReXOvWV0vO7ruIcrdqp3zI3eUdx+wDgfkj7uqoOm0fi/Y7/O6y+4buonMK+gxzzEaz2ptQG3VubwKzuD8gexSqygCZeA/8Zl9vwkmzFJI7JwgtcJiPyWPk56SfbC40js7sykHTCP2khmJ8ZimB0UBfeUXQrxwv3LYTnhOeageay/OWtYDPI5xcXm1cVnzCVipHRTLwz8nx+nMeJ46F45TwxfUzSjcy18l0yB7BNuTdk0ZkAwkzmKVNzrHl17Cwh3AA7kj+ngjYdXXHTqH6OAG
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 13:19:42.7427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b6a840-3540-45e6-e277-08df49646fa9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF00000521.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB388940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 13:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250918

On 16 Nov 2026, at 01:17, Marek Vasut via openembedded-core <marek.vasut=3D=
mailbox.org@lists.openembedded.org> wrote:
>=20
> Add support for U-Boot recipes to install and deploy the generated ELF
> converted into SREC files for each config. The U-Boot ELF converted to
> SREC are useful for SCIF loader booting.
>=20
> This additional feature is disabled by default, machines/etc that want
> to use it need to set UBOOT_ELF_SREC to the corresponding ELF SREC file
> (generally u-boot-elf.srec).

As this is disabled by default, can you add a test case to oe-selftest to v=
erify that the right files are generated?

Cheers,
Ross=
