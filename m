Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38474.1795597599787432426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=z5jAwnjn;
 spf=pass (domain: est.tech, ip: 52.101.84.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awG1sBm69TKTm10rILg2ttnrJTzd/FSeYLqxmzVOhgJDdIlsVHchx5QxpbTx9EiUPvBXV6iWX0udq1kfCCf8Zbh/uKsvIQfk4zx6m3cm1VTojis3vxxsnTXdSKXvVF2DZBCRhmmttGjSM4XGwCPWLuACutqLHbvqqyjmjXwGqkuX66lfoALLZB3mAKEm/5b8g5gSNERFfx+TEKXYW19JQ8HxS9mBA8H8dgoXyYOyvVJdWbnfpO6eum6U4f1pHv2Ds2/XhF2Xfs/NynoCUR1FZvzs8Hn0Cb3+AJJEqRwdupqFVrz4oLEpLsTrNaV9BqF7KxrHL+r/R3jbYwvvIsAEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9P/xK0pylYmyT9mslPjlI3PTjqSo7tiSOcZ0ijvwnI=;
 b=F8OJhGi1x6V7byWarjq4yZwYEL6Sy6+njtYm99hxh171OWq+Mti9l3DsICHd4R+ROVmnwCQgOYIZ9o7umR6+ddCJuiGqgTRwA0Jj4Li6LLEkqdGQhfKoC9QMSmlw0tKEKW+M/Y3VASIXLXiiO6mDNBssv5xpaDy6dJvDpe0V/9Q8Jb4PxA/fPjhLya50ip8tM+kaAXsrCCKFMO4xk6mvqPx0/EA/QIdDdYinMM6p+dS5E4GijUxQGHsUDq9UqrIwSgtBOfbivsg3ttxnt0mQIvPpvWBXrkHdVxsf7SVMME5IXllme5Es2HGj5VOWSMbdkWxxB6kog0XdQtDxx/P6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9P/xK0pylYmyT9mslPjlI3PTjqSo7tiSOcZ0ijvwnI=;
 b=z5jAwnjnVt6rRJW13shI1YFhtStp30HyWajHmb0HQSKZrr+UUHfGjOVEFDM/oUiMzTO802LYJ8yA/OJtXJkxEkhlG1S6rrCZQtYqjuSpTIyUWp4KVLUahleEnqmb5JfvCZIYyqDj9Qx1miLHBMpBLwtZSRJCQK/nBbwBDl4GnEsvljbEip6eh7PZHDRFxzBB7UkxB4SQ/TFCsdX4xIzZnxZCWeZAowuhthywTpmpGgfPQd9jZIgDXtGAClJkZndc3mc9p0AMSZjmWb+8DdwlGiVhS/dtp23jVg8G+HD+XXo1SleXZxR+dVZhw6D4ZJi05yJl7HGou4w/qONkFHVhpA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2746.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:06:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:06:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Upgrades on 25yh November
Date: Wed, 25 Nov 2026 10:06:24 +0100
Message-ID: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PAYP264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2746:EE_
X-MS-Office365-Filtering-Correlation-Id: 2238c05d-44b4-4eb3-ecb9-08df4ad36457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: wrZ1UGlZQgYelXx6goHezbbLDb/9Fkr7XjU43Scj3cOIQ7p26+mOhK0o/Qpo/wXeRohrbQjryRbkc+4kqW8HNhkoDTE63llsDkMtPGm9BZy7/KIXzBOA4kj9cJcIFcoftcIUiueU6v5jueJu8ejXkM7WWPp++78G3lHlQHH2mwTwojjINUd+ILAH152JM9HCRasWhnXxKlWV2qBqGR1BrTxezH2vPSyhzZji2HRKuk8FKbGfWvOT4xxcIZsWU0lnEex9oUuooprx8Vh8HLnU1LJUm67/8auuw4gKnyyNoTkpF4d/cYBysGgAODw70W8D58CdUmyhxAW7Hs2dih229jZq0D4wNOGZ0RvGxxFxgPXzBxAVqnYyrJptXVBqUiqOCjKWM9IiPxqJf6YkMscJYvf0lTGmo1x07lg8xRXp1hsm2c6ARlL62aYTCE5fQb2WB4NXWz08EyTovSdUf/x3aNvhBKTi/v8g/LjgHnzmD41dty+airupB4VQTO7Js+d0z9C13sdkCHOmZ8FzTwJKpvt4LIUZ+uJ8SuE3LngAl0p5+cGlh1uq+H5Nb2pSwIldrNV80BHFIFIinBvJ5HCqEchMgax4t0zf/7qv+wHyQjY+KLglOJNXytdpVZHdl0f9mq8/wRuxJkEelhABXcTDj1DV0DowUd9ptl7Z3lwwFbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IYhLLsUBRRmNgat+nfE41XVhZ+97nmxIwQIgBZm/HCa5AYDW+Y6Db9H0crjQ?=
 =?us-ascii?Q?v4rlcSujS1BQ7iTGMTOIVKkreHGitwox1sV86oY5cCOM3K9kxJLwx2cSHvFq?=
 =?us-ascii?Q?4Z1ObL2HXINR97VZJbv7lVTs4RpF10UmEfx2HfkSVEIW1xpi9RaAUY5enAWd?=
 =?us-ascii?Q?igsZTe4nntoMwovCbUDUKm01LrsOGTEDyzdPpQaeQ/omY6lD6H82Z5Y/jDvq?=
 =?us-ascii?Q?p2vmwUNZRwWutk7CzqBR77nclzpBStAU66jghgRpnWMP8pYQ+mQ/zqw6UKxZ?=
 =?us-ascii?Q?rYrQSThq3SnTry+WHDHZmDj8eFixhhWkEmobpfZVY8dHJKcdzWXfF138plKI?=
 =?us-ascii?Q?Psijn3xxox5o1SaGUEMyL+JED3pXKuqlYO7b01BAlwBRV7m9OKW9zt5h79JZ?=
 =?us-ascii?Q?mn1qvNr3Pn1zD3S/aj1HQIP2NqT1kPUOoWDf9u7D68l0lL9g2ZnqKW+WksRu?=
 =?us-ascii?Q?i5qEDAJ/MFjnNb4RmS8z2A1c9WuiueK8E7YZELevKmwqfwy1SyOEfLJyukwZ?=
 =?us-ascii?Q?LXp4Q/Y2uclG6lnGnRbCSQeCswLXzrPnJ/v/BvqqJA51wSqxeN2O05VYojtb?=
 =?us-ascii?Q?qTlsu+/BKl1EZtVw7V8lfdl9iTHjD4QVGkGRZ3rli7RhkkUKCx+w+MR5kVus?=
 =?us-ascii?Q?jJAqQkHFC8r3OhxfmL16TVWZCfHzYdnpeqiR9+gJgHqG3fGuXPxz3D5k6i1t?=
 =?us-ascii?Q?DZlFXpk1fXDoPR0xgNNmxxy4tzxDNUC+ir2WM7nh5CbppLQwTM6RQBVDPOft?=
 =?us-ascii?Q?pe/Fan+zlXFbkEVbnE3JKQQ8A1W2KOgCAriS+KxSpBg1z8RMdkkHYU/6bt/u?=
 =?us-ascii?Q?k3ceEM2aw/IhxBd/e1+6Bed6vf+eK3o2bj9HKWH+PzeLm4/WgQaW26q/a6yo?=
 =?us-ascii?Q?z6FNLDZ2l9a06jNUh4u9qnNUEmAJAjoYz4RhYZ4PjBYeUzuDGlrv6Czg2lzx?=
 =?us-ascii?Q?I0LVnHC345dNjtSJ1oAdNWASC6VPesN/ds7LLqJuEI8PrZALA2GU2SoW9IbN?=
 =?us-ascii?Q?j+fQqh89QCAk1pvuptYkS1AxBrjvkX/h2J8914B/uyTN3KS4E+d4k+kGcqk+?=
 =?us-ascii?Q?+oQ5kHPUxoQkG/zzv7D2XyaLcwEuh8p8sDwNNb27skmwxJPHR0dOVZnUF+js?=
 =?us-ascii?Q?RrwNJSQf9jqgbclANRLULxNCXRc2ow7qX50yHFRi7J+19mCdFfUouazb7ivj?=
 =?us-ascii?Q?A4paNDU56d+3H7F25GZmjLx3sm3j36tISdJz2+QIzFJlOK+Bf1cDbnusMniP?=
 =?us-ascii?Q?ihzI8z3QG4idacRGnFW5V7qPs6pCZq+q7K4gpOwsKyDiu75a9nxhSQNZ85XM?=
 =?us-ascii?Q?hYhL1+AHXKq035kVWrIrSI/JJfBA/6lnNQalFZs/yMUwTiL0Pqc/mMZbIXzx?=
 =?us-ascii?Q?iFCEf5VMrJFGhdYejERsUAQca1566/l1gZtQpCysCyMwJD/DK1WOCeE2ALuc?=
 =?us-ascii?Q?sTrWjzjVptL6VWjMWS7VIyZlr4CYw53qUepKeNIC3im2y9c56oHbxaU2V96x?=
 =?us-ascii?Q?1xSCxXrgqZ1eVK6F3D2m4mlz2QjIv1FpTrk9oaE08W3hsv/BQvZb6IQHJjzt?=
 =?us-ascii?Q?Y5bdJZ8mCXcoXgOCfMYGxmKIiRylj6j6NEaUtQ9iZodGXHQ3PWHq43aJTRm+?=
 =?us-ascii?Q?7334Ppf82P351UxBKq4gkTNUhmy0R3w7dgdk4FKAEg5PdRcjMowHUbrbsvAO?=
 =?us-ascii?Q?Dto72mSPOIaYEQj3ax2gnUbOsjyumF/h0no01rTTJMUJU1k/i/V9lgQvcPrA?=
 =?us-ascii?Q?eRZXlrSOF8VYc1roUOxIVZLVf63vkkU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2238c05d-44b4-4eb3-ecb9-08df4ad36457
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:06:29.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dv7hGXMIJx66HZ2D+UyZ2BaoBDRPBWPZEH1Cu2c7CVLm9F8i9ej1CDAKd1ZYYZ1NQ4euo5f7+laPymcXq07GnHXYOlL9tRTfyxSDmIL5/q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251169
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (3):
  libpcap: upgrade 1.11.0 -> 1.11.1
  repo: upgrade 2.73 -> 2.74.1
  screen: upgrade 5.0.2 -> 5.0.3

 .../libpcap/{libpcap_1.11.0.bb =3D> libpcap_1.11.1.bb}            | 2 +-
 meta/recipes-devtools/repo/{repo_2.73.bb =3D> repo_2.74.1.bb}     | 2 +-
 .../screen/{screen_5.0.2.bb =3D> screen_5.0.3.bb}                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.11.0.bb =3D> libpcap_1=
.11.1.bb} (96%)
 rename meta/recipes-devtools/repo/{repo_2.73.bb =3D> repo_2.74.1.bb} (94%)
 rename meta/recipes-extended/screen/{screen_5.0.2.bb =3D> screen_5.0.3.bb}=
 (95%)

