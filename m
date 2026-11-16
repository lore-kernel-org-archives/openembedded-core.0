Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1794827832949193272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oc5I6AqP;
 spf=pass (domain: est.tech, ip: 52.101.83.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peWnlgcmsKhuQniJyWrmPtVDjig3BgNAo0YExx8EjzGd24yvms8qMA1/wnaoImMZh4pKHiSvvLKqwLzwo2d0AesfrtM7tdyVM3CXF/oCExkCN5IhursRTooQKVuohTQgY09BFMMJudG8h6H3RgCj1PEfiNY2B0kFprut9bfMI7RUHnelCE+SJmS6895r1DrbxkohEpCmcPFM1BbCYF52ApfNaHLcp8GFrPRb9dw1l+jb0qRd4qfsL2pAu05sukvvDvnWpmNdPbxZaeABqPXh2HShaessP37aBdAJTTAup4DbR7/7koAVBKAGHNmgT7LpVHUXGrNDZm+7gBHY+Mvb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwWOm6B2nDjNZAhEw5Fb3OjN9C8Y696R5HKCfQwbp7A=;
 b=WV8uCjaO/3DTuNmPGOvqg8ysVYMH3PTtnXWbF5pZq84PDOzI/CCnRh6lM6bQyAzLN4NUC723RzZt3hLn5AW9MyDQGelBKszBWrf+FKJIMmtVYvWUxZxsn8XefJIcx5XQGlFGMIVmNn2xL/QNKpYmsETdkX2iV7vh5d8diL+NJX6MaAR3xO1hjkkkWDkot8NGAgRZ0oNXdQikOceeloA/ayyDBWAMqYrr7NQSU6vNkZGSI9cyquPrnfCFr+nXfKEQLl/kR/8vZZL5JyfDfTgkSZmgDL81B91BOeWRmVUhL+EHC0hiif+89UF//iGo1ST67jMdzmDZuV5tBb1L/TA6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwWOm6B2nDjNZAhEw5Fb3OjN9C8Y696R5HKCfQwbp7A=;
 b=oc5I6AqPmi4wYAcZslzG19OuJbQ8FI3XHp35yMS2EY5flnLreD0NBc5mAfj9I8AW5PcUfZKufFOtKBbm+Dy+jXIDq/Ay3Q87K0/1UyftTDlP9KyFGSogel3t1fSxbkMIkwUuzuD5uk9ziWJGNHkFjgpP0xr2YtTXK4obO1ET219aayHId/cn2GOGkgGi0kTMlnfRZOFJBwZPgtSOpIK6z9W3cjXWDKhTBlUDT/eWIV6iN/3VldNqL6Z+fWXbLszS1WgETF6L3eEQgydQq2HCgt8jAgfgEtWKxuzuExyJ1YHLXJ8nYlTbJveTk3mlKStkTxekNNvsNL49iGtxS4Vb9A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAVP189MB2617.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:17:15 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] p11-kit: upgrade 0.26.5 -> 0.26.6
Date: Mon, 16 Nov 2026 12:16:57 +0100
Message-ID: <20261116111658.7745-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAVP189MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7af940-e5d1-4fd3-deeb-08df43d32b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: xd8GdDMsAt8QbJQ93GK/Tj29WHDV8Q4N4K/1E4j/Ij50bAKkNYtXEt3COIYWyvBwHFuPZ7B0Gc7cD57awd12MbTGGZN1v+2KCDTgkBigWGwUAEb4urvOL79CsnZpsiwEHBjvBcZPiQcgDrADMnNhvbhr9CoRzVK9JqWzwrYBE4iTdTOo7zYRO0pWLPUAO2FY4g+fhIFGVRGDmipKjr7NR4xRLqE6Y2D5mwTe9pKUCV/fVGYZ6NKzX3BnAvcVV7p0KEpHU5jzHd8yAXmPrEwhPCI7l0nnnDu54YqTv6dMWeISnVsEFyIrod7O+TsKF5B4qxMNpjDsRiUsh6xGFvlPr0PIqE7P9F6aiTgjuIbT5U16V3f2O5LhIcXXXIMQ+ugwnjGaYu/9RygDI0G1tGtwMPpPy3OcmFFwjwBhsoPeRVHGeca1J99sCc2HDji6rWt1/rUjR/n8wuFYMdb6TwzJXyOv9diTBotaq35M1gmX5AcNdW5Q513vlfCYbWCBAUTChjDEZ1LOr0FpTXX9o4j/TJy4UBY9AWptawKh3gRYCPaoyzLuGk9SKUSbDVnrG8lEiBRx5UxS5BnO64zDZDPxfdJ1OeHlX4hXczfq+WGPVoP4oKk2/kMUksc2RshpCYaqrGeTYXpEJFsu59F8g6sjXiyR76fjIGoTogv+IC52uNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f9ZA7emWZMk1Fss5TwIK8ltBms7KhP2mVLAd/Z7cVlhg9eVGAaDLm4r06AnY?=
 =?us-ascii?Q?nrR3u0V/iufJxXIVTgvMMTL5KTQdeHW5SEdmXmCuUizaW2G9B2F0o+uHGUPW?=
 =?us-ascii?Q?Yu6DED7mCLER7K1nRh3FXB/TJ4s2nd+oSjiYDcefZ5cwbiBaYvWkcuX8A8Lj?=
 =?us-ascii?Q?hpuu3mHNphaF61De8jbHX6GgxEMq8Hu6+P/1bZJ3mXYScPnT4HI1/zjEiWhp?=
 =?us-ascii?Q?pxTaKET74vbqAyEME9X9+Kj2yRSH1dAqHWv6lFmXAyhNzo5ueeiIWiGk2yxC?=
 =?us-ascii?Q?mSso3H5fegsIrDINV1nsVbq3jbYUZjFvI2XsfPD11JAIp2hKoWeHn9rWbE39?=
 =?us-ascii?Q?hXzWqZOWioBBKDKtKy5v/Lk8n0rkvfbuCDy+P3M4MqufbxMI8LeJFg1Hqq1V?=
 =?us-ascii?Q?BKLI+zdyElRdhtlv06YnmHHgehpAKY3leRKWkcStT5rE1cci/DO24JgBqYnN?=
 =?us-ascii?Q?T41KVuLtzmnzBSQIbfK0KUU5cdm6A6wC8jFaokfjtqhIIyHQJtRph0P4JeKf?=
 =?us-ascii?Q?98DGOxuwk/pUOnSuoZ1SWU30iCB0Xos7HIC7MqyEGKSRC6CtlAObKBmFP+uq?=
 =?us-ascii?Q?yxL4W5k6Tlwrbn3QZ29I/MNDgvcIrYyQRYu1lfIxfoTmNNlLje/nL7hqQA+j?=
 =?us-ascii?Q?42x1I30qdKdBsMA6cjzyE38CpxfDcCzYEqC3J5ICpoNuDUO70gI4PvrNQIbB?=
 =?us-ascii?Q?ggvV3E2oR0GTf058ls4mbbmOUWNz0UqK2atrppSHr1xiqtl2jpbV85Eu9qLC?=
 =?us-ascii?Q?9gcKgAW0qA4GZICdlz7CNODymuKBW2SiGuCy8VN7j8kLUbuxVdq3UgJSsHps?=
 =?us-ascii?Q?A/Ao4WSAwg5WYrfgqdAI1nVsXuYmLbffjgcYxM5ccxQb7uKy/nfChyrRIANe?=
 =?us-ascii?Q?H3vtcBOpn1afv84QID+nTyDQAcu6LGnTqFWowZZU/Dj/ZqTTeT3y4YFF3NBZ?=
 =?us-ascii?Q?pVQ/JMzeFUsGMyl2bsjT40suBH4LUGUC5xgEHznR1Z6jqzyg08c1pVjGiggq?=
 =?us-ascii?Q?gnhJTVQXKAATwYI4kInLMnxSRWBhzyQhSWj4WyxfMWTWgFjJiMZfoGe51jjI?=
 =?us-ascii?Q?eT7YUsQydt/aYP+X71tCqN/VOzOrAHXWiYeDIX8dKmnkqYxmIC45gCoPBBzO?=
 =?us-ascii?Q?NmnAJnE3882YQQ7Wy3BBtMLyDoffXZivI3zllphEITAD9yOC0tJA/vpbb4ae?=
 =?us-ascii?Q?0ntXkKFqBJyoMAcA2x4QNoNWx1bpL6ycoG4+ATXHFbZrH5hcV5aP9ZDXVqZ3?=
 =?us-ascii?Q?BtFqdPBeREyIyB0rzfGpx+KVY52WgEagHGOrLRohW5W7thM4YKeVyBHZKfdK?=
 =?us-ascii?Q?LACwidS5eDgzIT2s339bYaF+t7ommgwFFXfWRESxsggBPggiN4G8II2ek5wl?=
 =?us-ascii?Q?Vrc9LlAqPCthhDDDAsAMtjkl9AWdXjAG3RCV2qseKc55t0ly+ReJTou4D9xA?=
 =?us-ascii?Q?00HUj6NGE31KKaxxjacAUo7QCS37xnkLsV9jAPpAaQ2uURYVi9vxo9+YIf6D?=
 =?us-ascii?Q?vUR49DdgSA9owpsTpQEpDVgxtAFwS9EW8pYEwmaZmsyLcKUBj8KzrHlxJjyg?=
 =?us-ascii?Q?jz8FF3nXJS8pARjZYfjDie0jTPF0zxfRqiR36jJpt37x0PCeMXeeSp0HhasL?=
 =?us-ascii?Q?1TF3yBAFejDadwJWTsH68v5sWwWAZ7Q4WGJixO46iFr0WTmwFhuD1Qr63PNZ?=
 =?us-ascii?Q?enG/zK/vTO25BYNEeTD46IBEyBOil5IFpg84EjdsYuM8+GRhdxToHmQPbHn2?=
 =?us-ascii?Q?VBPOkf3odg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7af940-e5d1-4fd3-deeb-08df43d32b34
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:15.3555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukV5LHxDEoxF2Wd5flcf1m+3NbAOL/hhlZItf8vNgz/oJiKGdRExfA/dkgKVZgzlMf7Tq52IHUrd8ZRTxT8XIX48wmilPaGCdbObByvWCT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250337
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/p11-glue/p11-kit/releases/tag/0.26.6

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../p11-kit/{p11-kit_0.26.5.bb =3D> p11-kit_0.26.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.5.bb =3D> p11-kit_0.26.6=
.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb b/meta/recipes-=
support/p11-kit/p11-kit_0.26.6.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
index 722f2d876e..18430f0a74 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "libffi"
 DEPENDS:append =3D "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') =3D=3D 'T=
rue' else ''}"
=20
 SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=
=3Dhttps;tag=3D${PV}"
-SRCREV =3D "120050e353e8f43d7c40bbcc047f667f903f4de5"
+SRCREV =3D "f9813f90a51761dc75b5dcd8d9766466b8904f5c"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} =
trust"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,syste=
md"
