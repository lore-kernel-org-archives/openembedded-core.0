Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5204.1794037381404467256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 23:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0ad4Dv6Y;
 spf=pass (domain: est.tech, ip: 52.101.83.20, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOI1cogO735EYHylZ9Jgfi0cmVMqBvNcr/6mscqCiy1SRz08ky9NCVei6cp72nH9L9drr7xMGsWfBTw7r+UmEUVqQ7d7/72OVq8BHxsGPF93wx0QRXYtFyyxHGLqSyHp8T0fBSNbhgRzfXR39P5j2Ub/IsD60qTh91yPDgmUb8oyiTKNusAVI7PJna5OY/keygoP/y7++xHjeO1nNqTOBkklggf8AEake/8LZOkez7DUgJW1bxbpFEqOLm2QEhrrz7T8rk3Awy5h+IG5ih7MNbUs+ZO1ToId4Vfrjjkh148mZjznNm4dD0WBQJ4u4dYaoRvju6mOznbB0S39JK5rNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrG4IqUB1bqcwLymWRay0VnJAHYVKtWFEGYisBTumho=;
 b=OUif9BGHuQ/0xdZD70dvMkKQcGhybkGvGRQd33OlQY1DZk02bqyhDvhvcnia+xo9kn9gUiYrSjxGny9qJErPCO4uATBTEOO1gO5clmals/Z6daC6EeA2AHe05Pt/xp7HiaQ6NUo1QoMci5W+jpOMvdU/s2s0pdsx7ic4+pFZPGUxvVuIXc592pDsl1rbUf6J8cOCQz8E+TUn0ZMP1Hn3bXcmTs+3jsxBAR+p4IUPh7WtP86+zSZH0f044g7LC6fhstAyeu6gu1KeF0ts1o/6KY9nRm+T//5JEeU3mXeX3+PNV94mwcMF230byxfDJRazIS4r7EV3gLgKDHpu/NLcCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrG4IqUB1bqcwLymWRay0VnJAHYVKtWFEGYisBTumho=;
 b=0ad4Dv6YuqhVspxpHoDWWX7ttHFfyyt2epicKeKWvBtSRhQdHriV4uwbfEGAw/FjL5Q1FkYmUJ8EF2w0HhEvOG9PsxcNKtC8sjZMrpdYhcPfuCTxpM1wcHSQ1A+BJs4L+frp0CqMLBGD9ialhGJtmWVs4uXhE2nTauR1ysfOn0MifDu3jlnKpHrpKgmYvweVtAOTxw8Ve7bIEWU7RT+x3Y3xwc/M48roVFMDks6N9rnOYimWDMEbw9KgQEUnY/Ypabo6t5i0VJKYzn97R9o/3HPomyMnIYxoTF4kapxb8RjLyqaGx0SXzyFObLxVoKVyKHIQiP8ExWSO3vyzcpsm0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:138::10)
 by DB9P189MB1857.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:326::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 07:42:55 +0000
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7]) by PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7%6]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 07:42:55 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: tim.orling@konsulko.com,
	Anders Heimer <anders.heimer@est.tech>,
	Henrik Nilsson <henrik.b.nilsson@est.tech>
Subject: [blacksail][PATCH] python3-certifi: correct license to MPL-2.0
Date: Sat,  7 Nov 2026 08:42:01 +0100
Message-ID: <20261107074201.1995747-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0001DC0B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::274) To PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:138::10)
Return-Path: anders.heimer@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP189MB1776:EE_|DB9P189MB1857:EE_
X-MS-Office365-Filtering-Correlation-Id: f407db8f-a17f-4898-5579-08df3ca2bc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|261021135927099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: +bm7loT9NX5fA+pPA+vVw/7BTYPuevaYa29Zrmuu1vgMLI8li840xQL7oAwhBj9TJiFGkvD7esdND+J4ku6AGh9epj0pq9lV6XytlW8SY4ZIcoPuWi7GvfA0L8O3l8+86rzDrRlThiJWeVolLQAiaYJLLXO5LPDDN3N5jlARUjz3XXNNt+PAmQR3N7ee9Dx6eW+sqYD2OhSxVhg8hLFhkfx2x3ArQNnj6SbPu2BmdVj+i7lTnBGAHIkg/etLOjwjmiiiw0+hN2MC8PvZfgqXncT8RyK8fsva33+90vnpHw4YSnIUAKZ9vIPCpxwMh2T50Z8UZZbcLZh8Tr8uFpB7oHXNEV+PpcCgJigIXvXGq9/pMtXpGKbJQaPDqxN+v3q+p9BsMpC9FvA7ENINol35hZPKbefz4XTlr9SeoqEuJrzUn0Ctpy34d6h4AqBQ3Y3ijum5A52fcCxZyQnzU7+2rWSl0ITVB1vVILjVjwwEpKU9+hFN7cVQo+0ZVwsRrtlWxgbQ1YG6dsn8RCxTSAy1iJGDfCBA5cV8RNV/11vdl0MSpWMPy02lKf9p1Y1XnOjmHwUezaADied1/bSDb7vnCcbE0L0iRPRMWdKtmBkw2PE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP189MB1776.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vac7atSxzFjJgaFWYy66X6Q6f9mrT2bLveG79RLNnVh9dchcLbFHbaSg2/zB?=
 =?us-ascii?Q?LtIPyQ5hqQTy33F/jas8dLeoCCYXVmpn+6JZB9dSnDSCOmuQCm9qR475Laha?=
 =?us-ascii?Q?HYbdRg3P0wK+Pe9x+Pi5AFfRrUcgeF1UGXZy4yX6PUHc+htYwxrObVQp7tVO?=
 =?us-ascii?Q?71H2iIJ5iQki90iJUpUWQrd5+mt5ovFfoMYuNJt54LrdUWGH80HiCrDOSQM5?=
 =?us-ascii?Q?5a7CMHicFI7Px/kh/peftIpG6YsNN8DUsH3O/aI2qU3A9KCS4C4B23xzIiaA?=
 =?us-ascii?Q?udmDUph6ll9WEkh3guTgKklOuaLeTGZXnNgyxbArAy9t3iO8j5DcOEWa7bm1?=
 =?us-ascii?Q?lbRST+oabtymxCWVEYgnVWkYq7Qsbu91QYr5SjhR4bSl24FaBA8C7HbUDEAz?=
 =?us-ascii?Q?C1bRmfAYLcBnVK0XqABcoYj9ot8ZwJGQtLtVtPf6MW2xXzyB4cI/bZlCCGgE?=
 =?us-ascii?Q?g4STuskFBLJDnZTJ6elKEMJaQ00izO6yCHcVxLpgPzPkuDcIs2ts6uxx61um?=
 =?us-ascii?Q?Fkibq5Dujv2MsHf7d1FO9UjoO6GIKDSZfVYX8XpbeJ4BklLV/GcDCgr+1vrR?=
 =?us-ascii?Q?BEf/kR9w9QPka3cWSoOIluAwZcXYggwAo2R41RRG2OJQIWbXnVM3KFgDFQsU?=
 =?us-ascii?Q?iDl4gp1exRQuuAvbFljHyhQ33x4rfZFn/W6vw10lrVs7LrvqojxzgjJ3UufU?=
 =?us-ascii?Q?8ggc1thJhZadpi/u9K18h+fah/zTtERuPMTmmTgRv+psbG6HYWUPxLSPqItp?=
 =?us-ascii?Q?thlzPJzOwaXaZBYev/IV6F8bVY0I551PzAtA6AH5u9isWYH738+SL1Mzj3+G?=
 =?us-ascii?Q?LY9m40q0sC3yb67nO8FdTFu3+P6tLkNaH1DfvddWiEUQDW3rEuEXk7qWDDIR?=
 =?us-ascii?Q?mOs86Z7s46ECoTCmXSxiitiPNXpUKWMJs41ji/pxfZ8vzya0f+AFlwU+HgXV?=
 =?us-ascii?Q?RhBTnkjBhv7aa2XlSZtSdYrDKACcwnrUwqxQUGjuqWOx9LmAeZ4xIXVLGqPg?=
 =?us-ascii?Q?hJNkpCqV7sj9MhP1o6iV17Ov3kXbxSYh7UA7KDvoKxjfKBFR0efBnROeVNlC?=
 =?us-ascii?Q?Dwt0ZXMolYfh4Oj8O2jE/8prBhml2Xg2f/4Ofb/APnuc3c3qgFPkj0EH9lXX?=
 =?us-ascii?Q?/sNbaXKqmM+vkaO7+G2RuIzmEXkKmZNaA5Yw14STwZQTo6u65rIVH7nzAqXD?=
 =?us-ascii?Q?+i1DRfaTuyWy44WKBpl5Xcw5C3jbjWJpD20nP/gbGXXNhra1zDjL97JLxu7O?=
 =?us-ascii?Q?g6kqw9IEMoJsxFgeSe5OZsdss36OtxZZJnCvAWXZ+o0kTB37d4wFSn+pkmEA?=
 =?us-ascii?Q?kXyWMMB2hpAxy0mtMBng11PZYTqg35DB6jAwasOMRLF1UnvxhaRP7AXU/aEs?=
 =?us-ascii?Q?KorkrBAtae4YEnzuU+eD9mplZ9oJ3gdnlDoLLwXiTg7I3/S7snmrl96g5QxR?=
 =?us-ascii?Q?x1qD+MwGJ4pcgnh6s6jqi65l7DXKSkvDXHeDLULIw5Kh6x1Hoz5JOKcRbTRS?=
 =?us-ascii?Q?Jpl1IY5Aatn5AP3Tibg95vOlXr+Se9oJEHWmZ/Oq3S/n72O5+e+CeoGkp9bW?=
 =?us-ascii?Q?O9Wlj5GNI/90/P0bLLhaTyak+Acxu7oOv7NLxSS8ul/PzkooF2foHxuDbSaQ?=
 =?us-ascii?Q?5EooiwYLtcoG+NFPepHQ1JhJs19eZrbLOzxDJ6k3bkGpoTGA+oUESKQGilwU?=
 =?us-ascii?Q?7mfVO/Ompsaa/PBRU5cUmnaAe3BLCOb1+dN2u83XDSiiUCRyo3vPGdrSjvd3?=
 =?us-ascii?Q?7dwDtStVbg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f407db8f-a17f-4898-5579-08df3ca2bc78
X-MS-Exchange-CrossTenant-AuthSource: PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 07:42:55.5411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V69uSQxZn7/zZWXcBClWZRwNg43eFat/xVdbks2JWrHQDLECbGMq5ACMupAgjWkPicApOpqLkkU47+b6ovwbVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 07:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249737
Content-Type: text/plain; charset="utf-8"

Correct the LICENSE variable to match upstreams MPL 2.0.
The LICENSE file and checksum remain the same.

License-Update: Change declared license from ISC to MPL 2.0

Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
(cherry picked from commit dc95b2df65be00643f280a5ee9c885131f001263)
---
 meta/recipes-devtools/python/python3-certifi_2026.10.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/m=
eta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 02cdbe9a08..e65e5ede60 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -4,7 +4,7 @@ Python code. This is useful for verifying HTTP requests, fo=
r example.  This is t
 which ships with the Requests codebase, and is derived from Mozilla Firefo=
x's canonical set."
 HOMEPAGE =3D "http://certifi.io/"
=20
-LICENSE =3D "ISC"
+LICENSE =3D "MPL-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11618cb6a975948679286b1211bd573=
c"
=20
 SRC_URI[sha256sum] =3D "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075f=
f8d2fea780a1ae"
