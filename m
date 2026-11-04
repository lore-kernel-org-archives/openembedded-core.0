Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7205.1793792314298488007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cgeoUWLM;
 spf=pass (domain: est.tech, ip: 40.107.162.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqRAXWStIvGPHS66rxT7zQ3gbO7coFGY7Z+ykM/29QlgrbN/KKGKd2h6D3+UKNtxLxBZDFWiUtbT7dEqYznk/wE3PXah9sMNYUXbGQBrDpbvna4lbvgTIACkhjf8WBV62iYkFGYZFKtfmYQ/Ptv4DWuUlvh23pNN7Do6LG1R1jRu1dXk8ts8wscykfAuDj4+Kr4eYjiSMOG+K+RcJLCZkDqYxi1aj9yXvmDzeuz4iy2UJER2oDgsVaj1Luq/9nwgAqoK0tZnZbDtZWwHiQtJhLaSv9cfxBFl5NO3W80dyUEk+wekkvZzLwn3xyvyRn5UP/hfNkpcF2u9enRd7NfkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFIytUSPHIoQmkDzpP9N7yJDsdWC5urUqIH19VQKQ4c=;
 b=MmG+neC2zaX0eZKDis7HHMHuoNSowp04LzdLk6CmZOq7G72/7IRomJ6gLG28V4CkPO3blKL6egUYfVNRwV8DROLBNodWW0JYV1uw0b/dDmgQSxDtG1mrh2s4i+sIin4AF/hAym8jV2bjNLrf6a8VlPbY0mSpsr+d7PIztACOaDbrR5Z504O9/PWdQtCcrJrvzhtzd0SdRCq7FtJUmX6MVtsb1PbL37/P/RIoM3yalN/0qLW8kFuFRvyPdxJ39JtMO/5ynEi0qknWPFizm0q8NPRQYnneEXfN5obihvZynGpLI8foT/JZLI+xoLOKgEsMGXPakGye+aeOYTloHJ4O6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFIytUSPHIoQmkDzpP9N7yJDsdWC5urUqIH19VQKQ4c=;
 b=cgeoUWLMIaN1sSuBQ8VcSkeLRxGU8fi9SiF2Qf4NvG3CfKJyjBVdzwOsSXUGZzEAN0eCY1jCUtz1VRn2PmY8IpyFf8KrMI9SJsEUyIRNslSq+Scw+TOeL5FhoH4Be5K2hKtkv0aQG8huGn00PBjfsLJgesk/QiUrnv7ZH0LtDevPf0U/AzGaSW9djFYveuREtgohrvG2Ml52Q6v5evvgM388+h+sKqVADyiDuHLsVbcZHihdolgkm/DUz6w7uuLzV+NeMg1RVcWGWtTMb3iJaX19TKy4zFJT0jpTMEj66nki4rq/Ul+R6Ov1f9CLGfDwBwvX8qKEXJFCODtHZtCEuQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2084.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:57::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:38:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:38:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] xorgproto: upgrade 2025.1 -> 2026.1
Date: Wed,  4 Nov 2026 12:38:21 +0100
Message-ID: <20261104113822.45520-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
References: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2084:EE_
X-MS-Office365-Filtering-Correlation-Id: 30081ea9-0f2b-48c6-6e2b-08df3a682470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 36W1GVR7zZ0UM0jSd1PkYdwAQX5dzrbt/Ii66LSPYQvnLJDjuZQYzEtYen8s+c3WMfczH6uCV2oJ/pfjLdGhe8I35+8yTCpOayhoOHz5FF7m6jZcAzUgg/4rX43sSoK+/HGctJ8YA/OMI2Ufiu9hC6ZS4mHHtBBG6hVjdSvqBa30kwQOqqaHc7FlPWelbkiU6sjVcrdyEgWFLGz4bMqXl43/oTOctCp3IxxMK8qRRzLK2orxhEahWlmxZVDGWF230uZgFhrEHPBKUJ7oStEdmX5oJ6rHWh1KIeIZqrIEklzGtgrxoM+i+i9FAElPjgWfHIyIus6bILYp7Y4CnPK5Vl3GJeQ4d0hnsDOOlS2+eBya6FT5pP0IGzCf7XAmwl+sjY9hsSr+JiqDWb+2/SB96bAs2ohnyYeDpIdNc+m8u0bOexr1LVZWjiprY1fuuJX7xnSpe1hUamzssK4laQbirH+/MpLOf1ZGKQQ9fA2ujpVzJAFBM8BEl4GmerNgJW5i3dE4KN23uLVP5wzCKTscq2ZAdwSdGuo/89Co0lJ/QVCyXLfC3sKArf4HCHqEJbIiSNqfKrb6MEuiJYWHvHx7DA+yvsmXyAYh5wfDTCd+sQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1qXWKYoOgPmH4+O5+TJ0mWb1I9+5NuuVe03lz86WDruqAPMNPTOEntR3inAM?=
 =?us-ascii?Q?p2r21oIau/JJxlrpkOGL38uUWqjqtMj1VKBL++P31lAcldY3iLk+RdFEjKMz?=
 =?us-ascii?Q?y2hNk1vmaTXXksLm8DB57tofN+2D+xVy11CK5EhLfXiuu9NofEmzORRpLIxU?=
 =?us-ascii?Q?r6G63tZqW/P6z2R9/umqfLFKVJm6MBQbx5VZpLf3TfPoGGbaz2USrcApLXoc?=
 =?us-ascii?Q?CZYF6kKhHnq7EVM/onFqAh+P9W15jsOPiEKvO23f4/3HMU+19HVA5OXcUB+J?=
 =?us-ascii?Q?O65y3KGmW6y7627gFjMGQSmMlLjhDoAMViOqOoV3uCB2/nELQBN9EmiegQNC?=
 =?us-ascii?Q?KUkZJhacRin8BA82mUTaSlKoBCNDidS9THvYLvzSed2Q8/AqWPWwl04bk6qr?=
 =?us-ascii?Q?0yrdX9taR+dkE8njHBebxiJRzrT5H7zWC5FDp+1AQCwbiz6fYGM9gfjAtj4I?=
 =?us-ascii?Q?Fpkau0TkAjlzuPQeoEUgy7/qAj51JLZ4syigLgKhLAbWEqy2+lDBEWqk4VoR?=
 =?us-ascii?Q?2M4iox+9fguNoFfxXRCjLiNdkbrDGI5xamRDpPPGYp0u4hu1xqX4vdbzAIec?=
 =?us-ascii?Q?Py9MTGHRhvAQEbSORpKH5f2T9ZaAlk98Pkn4OSxrLUrPXnfFHUXAg0hmnLV7?=
 =?us-ascii?Q?Igp6p2VLxpOQGGSGQcKce3WRb82lW+9VRj2fY/yT5529mHvLdckWZAjUmKdU?=
 =?us-ascii?Q?tELiVCcmzIDN0TiWkZ9Wu858Pxz68h1c/82XM55iDsjcJjIlG2dYF+NYUeeV?=
 =?us-ascii?Q?UdeDeVLH/6yjmPx3MTaPvheXzmKNX8vUDbMZoymZneLA4jZVuGmI+pSq5yY5?=
 =?us-ascii?Q?CqQGXYX7sFLRcOzJLwp4ZDCYKWTEnThcWd6kHy6LNxh4vVMFEOAs2JPmW4jH?=
 =?us-ascii?Q?u1LeHM+kAXC7g7w8wgLlJimskGt/g99ovETT0DMKBFRWuZi1/tUkSlZgtlAv?=
 =?us-ascii?Q?CMU7d5TLFoWjZ3KZkog98AMuP/Pm8768vznnR4LvQJfmr9Lj2GNNyz1BoGWP?=
 =?us-ascii?Q?DTuReYgbYjQfzZvxPCHuAPbyvVJZY9HJdaA4ZwT9jrvYHF0NUBXP1g1kU3Eo?=
 =?us-ascii?Q?s5nivb8SREkMHdHu+n041wqhNT1rfVYKBQCcNLNkeBx4VB8ngasX+8BuqO5B?=
 =?us-ascii?Q?tr74iv4Q+qFmsXS0Lkewgi3K0wfnN9Blvs6dyTSnYlbCHDpW+BuZAWIR7cUy?=
 =?us-ascii?Q?MH9iE9wWvDxfnS18mk89DjqeVMBS9JTvl3eQUQiwAR3Q80R3mADjv4RmHoOu?=
 =?us-ascii?Q?U9A+aMiV+fGeUxtiCwqiVKgFUKqFwFiUl+gCDzBKHvFsoejiBZisOzhYsAtD?=
 =?us-ascii?Q?IPRy/vYJKAw44Ne+BdK7kNKn4RuEuOOiecSbVLGOauQwoPYbfTXY+1jQn1O5?=
 =?us-ascii?Q?bWVA0HavnUGDJoSwBTtaQYydsQzZomApfk6coBhaBriqyFxbppSkzQEZhRsb?=
 =?us-ascii?Q?Mg16CztKJOLT29xuEtknY9Qz1ZIg4KfE1+8NPleYKUG6+hUUiGdTDXLUKm5T?=
 =?us-ascii?Q?yZp/P15iyK+/nonuzeQLvm+DpkNCLHXETlneCGBomCTEdf/0J30eAJyxHy2F?=
 =?us-ascii?Q?IeRpcpROxTOz1Bf6PTxMrvWm1x/+8BJaCA9ixm9HPOZNk2hJBm8zaOc+R7RR?=
 =?us-ascii?Q?vzR0kiNOTzc3HM/BFVOwI4ESC41z/R7Sn+CerkKTiFY7DrxL8grNXFeWWunt?=
 =?us-ascii?Q?afaceSHVdMIBQNy01KAQgN6hKgNHsRMqixyYMlTwL0ytFl7KTpUso/qG2sp1?=
 =?us-ascii?Q?GCuA1hfhqw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 30081ea9-0f2b-48c6-6e2b-08df3a682470
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:38:27.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpWpd8v16f7ZypQj36tt1wlMi42uXvouFQges6ueUhzlVipHm0XjCpBwApfVdF7/hFEXtOlQt0AT5yzSU2BGmw+eSqR1nfzN79jutjzIGLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249370
Content-Type: text/plain; charset="utf-8"

CompareLog: https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/compare/x=
orgproto-2025.1...xorgproto-2026.1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../xorg-proto/{xorgproto_2025.1.bb =3D> xorgproto_2026.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2025.1.bb =3D> xorgprot=
o_2026.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb b/meta/re=
cipes-graphics/xorg-proto/xorgproto_2026.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb
index e187c56fbc..37327b2d06 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb
@@ -9,7 +9,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING-x11proto;md5=3D0b9fe3db4015bcbe920e7c=
67a39ee3f1"
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "56898c716c0578df8a2d828c9c3e5c528277705c0484381a81=
960fe1a67668e8"
+SRC_URI[sha256sum] =3D "f9bfe4a9ed8c8ab9d2a3b0d49797f046052dadd06b7a8b45db=
ffaffb137e8290"
=20
 inherit meson
=20
