Return-Path: <prvs=95557a815=Alistair.Francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id E31F96C107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551389627; x=1582925627;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=uDwtlreUXRMGT4wDSCO65Qsr4lInNbHkOuvVcLVptwM=;
	b=XoCQV7ttLIEpYI6KUeuXbYH8r8wlynJoeiOJFVIB72M0ZhFYH0qZlLRi
	mET19WDdET15Gy5MwRUUP/pDiP83v+XJSe/U7NPIB9mcDypZE8BHRkipt
	9VF/+BCgEV8gV8EeBb+TA+PT4OpEWT6AiIw5x+m0DzdUwxBjwAAAuX1g8
	h8UYa+7knBltxRZrjnTQgUsADYWTDmCmfrdV3sSAj+Pv8vLJSCTwz54mC
	ic7b41UjjbVCRJUfwrJ5TETweG1BntdeaEnpCXD6wgBv4Jfk96rz8AE53
	x8Zv7aRJClwdodc0VRvC5gcUulP3D6NDFQCes81KKlYV1dmwvYhaJTVH7 Q==;
X-IronPort-AV: E=Sophos;i="5.58,424,1544457600"; d="scan'208";a="200840003"
Received: from mail-co1nam05lp2054.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.54])
	by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2019 05:33:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mepRGMznkyGzcJsKWCGN8D7Ro6WPGCATcbLTd9LfYn4=;
	b=J0z+5LhbL3jW3T7rivDRIcwTRT4e3MuIkHgbm59DJvQ1m7DMtrG6FcTenIBkh0eXvayFUS+JAEhlOtWmwp0aBSaBKhqq8WDzbqCFp4dC/ZpMMcSSg5uvKKt0jrayEHj1QnMugpDtjoTMZie/jgbmDsy90q3unsjiu6/1JXkkEco=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0656.namprd04.prod.outlook.com (10.172.166.145) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.18; Thu, 28 Feb 2019 21:33:30 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Thu, 28 Feb 2019 21:33:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
Thread-Index: AQHUz60/GUWPP3c1Q0uD0zu7mrAPYA==
Date: Thu, 28 Feb 2019 21:33:30 +0000
Message-ID: <20190228213251.31036-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR08CA0033.namprd08.prod.outlook.com
	(2603:10b6:a03:100::46) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1fe001f-4102-4ad3-8dad-08d69dc461dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0656; 
x-ms-traffictypediagnostic: MWHPR04MB0656:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MWHPR04MB0656;
	23:L2AKylje+CLYC/xWagobhpZolMbDo6HHiAr6vsP?=
	=?iso-8859-1?Q?HnlAXFJCgnXza9uUsYzF6UHssnDo6RA9BdYBVou39tAsRc5fCVuuaqaPA6?=
	=?iso-8859-1?Q?84xiGzxp4HxfzN/KMthryu30zxEjSm8fVqsZlPFvKtPF6IE7f0DHxrNj5l?=
	=?iso-8859-1?Q?BAwm3nAJ4esgkQcOoOlCL9sATBiRbWV6pe3uz/PVQcvIw130Cu36D3+f35?=
	=?iso-8859-1?Q?J6aCPqq6Ks0DGHayxY+piYdnE1/nDPf2UrvTlMG0MQiBYkJoAzX1pdVWRl?=
	=?iso-8859-1?Q?tJJCgH77prV0FjIYRKKhcMqYmoidk5UdCqGZt2wqDKZa+a0A00CKG560/A?=
	=?iso-8859-1?Q?+ep0ugKxNO9Yff7V8U8PyH3mg5q91raImSF3pH+of560wVHzaQpaeEoxCX?=
	=?iso-8859-1?Q?rUzc6igkHI11bDi3HYoX8Zb+MUJsmDqXYNgDDpyuZq7Ydfg0TmyaS3P06p?=
	=?iso-8859-1?Q?/kaZWHgxDVu/R9gJkPu6mp5IuXiMY6+q4FloMYznuF4FCNstYe2IkfilSu?=
	=?iso-8859-1?Q?l4EdhBYlrOcaHNdkRBxDkaNOePewp17wCKTbFQ+d1OR+p7CC/mcx8vM7fs?=
	=?iso-8859-1?Q?91fCUdqtXUu4W5oXcDt8atZPgHLOPqT32FbRkYs5PAJCMgbg9yj7DKSLye?=
	=?iso-8859-1?Q?NNUyS7DqY5j5yRRcVa2UCOEBf/sFgh2qCPVUIfpw6AOgmiDEMRRTINKM74?=
	=?iso-8859-1?Q?IGf5ECluEnuGySY8g9XlbqXvgHmRo4kJxYXwlz4iLWe8I/YlLenusaZqzc?=
	=?iso-8859-1?Q?zy349+YA22vTi51HNTLJ7RoH5tN7gdcO7t0nv2swo9blBZFx7UK7YPUtOl?=
	=?iso-8859-1?Q?04tbdL18SoNOph/aRHVmdKviDLS2hNGQnWHT83yBBl8G6ijp9YSWCYrAU8?=
	=?iso-8859-1?Q?jFqNDcCEL8iI48y06SqMEVY+LX/WOK/m2PEQ7DbutRdrkd6Zip6+TjBmRK?=
	=?iso-8859-1?Q?5+5m9xbHv8C9qLw/+pHIX0CPFJfcRppxI2X2M8xBaeGlVK+gXHHwuZWxzk?=
	=?iso-8859-1?Q?g4oOOtjHZ+wATrGHeqrGz1m8qfVTIgHaXOX4FdRv/aAx4HKhQlwA1YIDf4?=
	=?iso-8859-1?Q?gC3gBcUWgPlD0YcVlVm480WtOwPGMO7BRvE7Adt5+wASyDagmGrQdRANGg?=
	=?iso-8859-1?Q?60tXF9PNm0BquJF+xAC45i3v6Rn276UmfngQDwJYjcRMjc5bliarfXD0Uf?=
	=?iso-8859-1?Q?k+8lTYkscCl7fKcuPOKgqD5+wWlsqwem/yyCodv6yR2Q+5G6sN6MNgZW5L?=
	=?iso-8859-1?Q?IhPoL527WXETGYbojaGafG5L6akF4YzRAdfqvOSBJth5/xYZ8wUdAhHqkE?=
	=?iso-8859-1?Q?cTgVCt3sg/sVuMrOdngkXvcZb+gOPWePF71lDkvfKd7hg=3D=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB06560E362BF842DF4F6C009990750@MWHPR04MB0656.namprd04.prod.outlook.com>
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(72206003)(4326008)(7736002)(71190400001)(106356001)(2351001)(6916009)(6512007)(71200400001)(81166006)(316002)(44832011)(305945005)(36756003)(8676002)(54906003)(105586002)(81156014)(99286004)(256004)(14444005)(25786009)(53936002)(2906002)(102836004)(386003)(6506007)(26005)(478600001)(186003)(2616005)(4744005)(66066001)(3846002)(6116002)(14454004)(5640700003)(97736004)(5660300002)(50226002)(1076003)(6436002)(8936002)(2501003)(486006)(52116002)(86362001)(68736007)(476003)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0656;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kEr3vzIXUbbLYPEdr9iMPiy2mXLvoxkFwvIMImgbLwMc8alWKYPfZ6mju3oh1H0EOVgmK4SeeMR1IzVhCQZLCYcPXNrRzxV5e1tP9hTKNc+WvjPzLnuaB5L+aPC74njwGysNEtBKkfbr9TgoOBY7w05sHwmz68DOBoOdXOhnsN2mgz/pCapnbHhRMeQQcexMmt0943R4XHNFec0gjkAMdYsASmeD8hIStukQE5jV1jVE720F+AJJUDrNM7kbhULgSOiiwlfzRklJbetegzk6KwRaUOzK1l/H6BmRwgTDRQL/+ItwwDC21FCoLRLUBP4E1KN9igbq2+ux1qNL8iZrSL6ENE7h7eg/rNV5eN+jTmGKwJ7msg0Oo09uR9eUy+6WP+8ojmH6S60ssJ4G7+vvU1kdTXjB7u8wa/W6dRAjIW8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fe001f-4102-4ad3-8dad-08d69dc461dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2019 21:33:29.9157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0656
Subject: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2019 21:33:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is required to fix this build failure:

qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such file =
or directory
 #include <libfdt.h>
          ^~~~~~~~~~
compilation terminated.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes=
-devtools/qemu/qemu-native_3.1.0.bb
index c8acff8e19..0b6a7f8b6e 100644
--- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
@@ -6,4 +6,4 @@ require qemu-native.inc
=20
 EXTRA_OECONF_append =3D " --target-list=3D${@get_qemu_usermode_target_list=
(d)} --disable-tools --disable-blobs --disable-guest-agent"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "fdt"
--=20
2.20.1


