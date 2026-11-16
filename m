Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1794827832949193272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=s4COTKUK;
 spf=pass (domain: est.tech, ip: 52.101.83.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8xzDPN76GG7dCAlxzRaMjEw0DTtYA/Ry4fyv3FIhbjV2bnJlRNAdSMSvuupWzw9dkDNaIJVMnxpPuDI2wNSGg8JNAncn1WQf2/U2okXPXCeYDDzd/qHDj5uObvvl8hOlBM0pzQA5inqfcwtLPGXne2MhNI52iEsMTVSrrb18ecPfk9pUAxC7DC2IJYLYeMeFUzk6iiDNctJjaJouXvG4HHzq0zrSDNuaiBtsKjFMAm+oBQwVYn5f4N6vTItQXu1V2jdJePBx3oyDEkLdA/48EPdzz+X4awShDNIKtwidNLld4NZQ1v3NT0ZtESklO4J3cLfJsjsavbAQDE/9ISZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbFcE8Wwi2fdluXQls+nbedayiAwtIeE1rKTvR7nUUk=;
 b=ekWZxWjKG+ee9Koc6H87RPL1KHZcdI1G66flooKBJpvFLRu8M2zwQYoahzTmyJpdvg9M9nwvS3TLJLx9TtGHD/HtW2cL6jQytu0pCGVaJ9vgJzinCxUIxaW0PQ0WcXar+VyvLzfx90e11wpT3thMUbch4OJFQdby/IVqF+h55mclMbel4SDS4GaD+8GF3vFCUqKGKUVYDTwXcVmsCk8QnQeIAgRr5Audul3buyknOKlv0hn+MFq/NHoXq2wWJg5y6oEFaHjsWNIOsQfJWCnFqS74yCSeagMz2I8hYxdcMkts921j2h4YxPcMuxfdgGPK3XR+pbQ8hh5UUjem5MTqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbFcE8Wwi2fdluXQls+nbedayiAwtIeE1rKTvR7nUUk=;
 b=s4COTKUKr1Y9tHVMWSKFHTuQDe5l69ZrfR6jKHYASGvritWpht594aY9O90L/DTPyCfh4mF7IfkMWqvnqYLKt74YQX7yZg2GyyztKc8gBtNithnxzs0h5cIQsMst08qIOPTQ6J+yLm/odQwBNhkod2Wfj3/q2l2WJG0VMgNYPizWX2Om1EuA1ULLdhMb6z4mpv/rRguiRdV7dlTfctVE9gO7VcScI7enPY+2DuWR4SJSVqQ6bg0dwxkQD9S+OWeMVX4a02ISaPxoWPNQFJj+phkOdBamEhOiL5QVjAGOg8mcWdAAN6VZxXrxog1exzUAFhS6vrTaBC47w/8box1FBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAVP189MB2617.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:17:08 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] diffoscope: upgrade 332 -> 339
Date: Mon, 16 Nov 2026 12:16:52 +0100
Message-ID: <20261116111658.7745-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0180.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAVP189MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c8e000-2243-4440-d245-08df43d32676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: wriLk6NKm/tgmboYPx4FmeZ6/3ZgodJwDEX2VwJJ00O0GZeuSOXRdehecQ9cgtRXx/V6fn5xvxIMzwjTKbBiWwaKe//IJJfbENpSO1/cd7Y12LqkvLMm9tUsbGVrs0OsJDuAaKeXXrrTd+exyBw1w92wxLvKuSXv495mw9qxpKPBqAB1nkHEH7dPGdkNSbqT9PL0MtlBl6EjZA/qj9lO3O9E9P5v+zaVbaTmJwbgBE5SoBdlX90M6/CNUQr7UhhYZbbWbA4/D1Fx+I4qmHhvU64iWkCNBA6yExPvUUs1oxXleBE6leBAe9sZ30ksyzxyrcrTfyA+eItEuzK4LjTdBJItRmUStETJoZmlg80L6TxYdeJYTv+d79qpXnTycQJQZk5aLfpOJyLDbhyDxzyJEG9FjygSXrrFTEQgT+Yn+cQZBE6adBe/RFEJOMjGJXHOBq9ndnOwQ4OVgN1/Mf3/8/TYdWYJu0sc8y1tfgE0kfOz+h0Wczj+eYdtaJoMInlKmNmLqvPSkCdW05e5U7X2LEE7siTlfzEqMFMJ6LKIPTmVEwGnVxhQGhdUeoBZmQmioKCTQJd2jQTBo63Uy85p1ekHZ7037WkVq/fczsu87WVfEC1NTKU64kk0iW3x8Qwc/1xtDtHZM2S4HoIYXT1D9zk/SAVw8byenMacB6+PyIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eDDvV29rhCfGG+c4qfndch/+uGXk9u5IqmylgSWGalx84KEGGapyqxzLgsTK?=
 =?us-ascii?Q?PsEUCCzxKFj1DvtCjh3oHeBWlNAh03nm89Qn7oAwih9XzsWZG+hcZlhPlmma?=
 =?us-ascii?Q?A7ayRi17mTbfxG+VIYYKtyT6V+VkaiR8M+vDmQeikD2IwlKLCcP7aB/zaZOm?=
 =?us-ascii?Q?dWFBxeYIXwJ0xmekc43RvlaccaG1xAhnao3OJFuDObgN1p10zaHkdddj/fsI?=
 =?us-ascii?Q?sV/bcKz9W4uD/np3CNomvw4MTWe4Mdvu413lf3VceqYPuuY9JChqi/fNDeg/?=
 =?us-ascii?Q?3HSIIzuyG9DsBZdKFvLDvhDQ4p/Hv+Go/R3StfPyfBmqrRTEAocmVs/iHJy5?=
 =?us-ascii?Q?0uspD1b+0EqA1iFKM0ffmoeTxiXCeu3Gk1JWEsZfrOtuAZLLXswo51W2pSkY?=
 =?us-ascii?Q?IT7kHCIDOQqXSG4t8RpK2cPJLpa6OQsMS2REa6RQVToGiV9k2kq25BuLxSLE?=
 =?us-ascii?Q?Tja1QfqjUM5L1IkRJF7YPLRDT2E95nAEeAOTNEL13YutIhNVAtFr9M47JQXX?=
 =?us-ascii?Q?dKl0VF6kltx+vaxGfilYuCgS5N15ROwzLwyHOwUhulNmt7SuyLOojbcVZXgz?=
 =?us-ascii?Q?P8rbYhE3U3BZpcmwoErEQOFKMhwpSWUrJUDUyL1a6bfuwzEfC1NjPyg4WNKZ?=
 =?us-ascii?Q?m0EoT6s/ZzWEyc9TdM/rtnhMYoyR3WB5iz9XkJc7MUuOxwdpvNT4tsvWnqU2?=
 =?us-ascii?Q?8ujN+O9oVz7c2yhXNJj31jYxYQ5g/tZNvzL4CGqKOdTpCKqBUaiKL1sEiXAf?=
 =?us-ascii?Q?x93pZUWI41NrBiHgVRDGCGL6idGgGfDSz2cbKwuLvk8WZsPdfUPLFo/xM7n1?=
 =?us-ascii?Q?d35e7Bppjfvr920rVbYe+bYy0FCCIb9VSWuPIhF77fHIFBc2iWdfPdNkZ+sU?=
 =?us-ascii?Q?6SPjD0qZ8OLFqxgj/X5gMXHbTvsX/yYsLLS1CN0PqTJ/bFqKTKyxGF2mOKg+?=
 =?us-ascii?Q?QBUd0KG9U6xeN7a8OM0W1KY6er20lrdCFsIXcgqZFnPsCc1qb8XZJ0EhzTV6?=
 =?us-ascii?Q?KVaoYvF3zyYqAI9qlQ3B1PiCBaoCQlkwmiJOuLTkx5/IjYT+X0Wg1PDBvrvh?=
 =?us-ascii?Q?RwsWH4U5So58VHH9dK5toVIF3jWOIIg1p15IlgMVXw7ecYS4rYge79P4WRbo?=
 =?us-ascii?Q?bTvvk+5JVa2u5/G7VP0MX6PZ9A+HZYbYIIyJDPWndvkmhyxmWgwIK5cCuomC?=
 =?us-ascii?Q?wnzWf8Vbr59DSp44B9lvQzn+VYhFxeqkrf+T3Ud6rj9WxfkzpAAmah3OB4GM?=
 =?us-ascii?Q?z6Qg3F4Td1ShCMI4HZSO/ffxqWt/IQ+XDtRZopTKFV+NS7V7/IFtOzdl0Elw?=
 =?us-ascii?Q?hNHjor6RxDkoyFUVcrn6L2/qCP/K+yjhUa67xSBPaE6pdn/ED4pAXlpe0L04?=
 =?us-ascii?Q?1yasZxtdQ8GWyY0A04e49/mSeSgd0IxMMoikuME5nfCFsx1EPv4EZJf6dgYq?=
 =?us-ascii?Q?8Wubu20FwIg5WzfTjhPp5pKhxgES1+IC/2kdfiHC/8M9qNZ3oFWfnOHf9aqi?=
 =?us-ascii?Q?Ei5v0lWJz7Pt0m68yGVaUGd1Hc8RDkSG3XHPsM5gIJXS/7LosbBSP8KeS3RH?=
 =?us-ascii?Q?eeCJEsXi7YCmirtG3e1A/M0PGuReezeCynjGVT8pvaXdDImX0/UKIaVtv+nU?=
 =?us-ascii?Q?J4QGK8t5dhOajs4JfBSm7QzZ3UrInTCBPIi2XQ4ju8VENoaffcLcRcpx4AxF?=
 =?us-ascii?Q?X8GKijU28NzQh78k5YmR/x/j7AP2PZnPigQiqRE9KHsxe79ZQzzbwJYOwplZ?=
 =?us-ascii?Q?bN1xk/+NMw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c8e000-2243-4440-d245-08df43d32676
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:07.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeDxFKuFKxI6Sfs4syYi0b+3zoxbuB/4cZK3AYfJlDsPS7QbzGXwTNfXMgjMrgTp0A8t3R7Gj3Dw6gFy1fkRM5tADGgY9Fd5HXaZD1Ni7CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250332
Content-Type: text/plain; charset="utf-8"

CompareLog: https://salsa.debian.org/reproducible-builds/diffoscope/-/compa=
re/332...339

ChangeLog: https://salsa.debian.org/reproducible-builds/diffoscope/-/blob/3=
39/debian/changelog?ref_type=3Dtags#L1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../diffoscope/{diffoscope_332.bb =3D> diffoscope_339.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_332.bb =3D> diffoscope_=
339.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_332.bb b/meta/recip=
es-support/diffoscope/diffoscope_339.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_332.bb
rename to meta/recipes-support/diffoscope/diffoscope_339.bb
index a43b20b460..65c30d29cd 100644
--- a/meta/recipes-support/diffoscope/diffoscope_332.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_339.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
=20
 inherit pypi setuptools3
=20
-SRC_URI[sha256sum] =3D "da858807ce2535f1bb5c3942020b01c7aef14f870257c964b7=
0cd4e1f2333206"
+SRC_URI[sha256sum] =3D "fb033492c16017963bfa04290c3ffd8e3b7884e1226dfaa6da=
2b1a07368d8e82"
=20
 RDEPENDS:${PN} +=3D "\
         binutils \
