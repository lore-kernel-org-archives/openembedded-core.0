Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8659.1793357114826988987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=l5LsF7NE;
 spf=pass (domain: est.tech, ip: 52.101.65.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpToo2DqyIQVTdTaYULSYsF+0A5ByfPH+6CEiM4WL4c0cYJkBLAuyhvL3/R6T+1fxp3ZPMlK6Dh21QZbYpAlSo2LrIZlDdOUWAVyx1dWnQVSVYhQZk9t6ZtVcczYSCv7Tnvb0ln9YyvRs+db91dSovs3btcEQxjRMI2SWZ0TEqiO1Dbw2qPRVn9wvxqhEXR/b8KD2691GvsWvUgv/ZYKWJZLLhtTyeXNpfiqlyaVyn2HDG4rHRWz/IEPhnI1nZAJvXulVuZzh1LkEJuDBQJaYqoJGxhscktjb13xgfAOUM3vDlgrE/C4/oLpKUA9aeznILIO5Aq4TkyCPu1McwjOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaVgLq+xDAyBE+L2KXcfqajNJugzVFdMmZ0eiUrog+w=;
 b=pxyuMXdkE6bFUlvjGtgeUVy8yUzMzKf+q+/1E7IrC+CEJ7RRZ1skyoEeNwLBPZ4HlnXkmjIVuV7LP3gKdS7nvugMKtnUnkSfsl1Sl+0GcbhKjZipbeLSGk4F5QWzR0QTQvkgEDFXsDHOi4mSZ0QVM+rTuKbDJ3KdwPMGUI57/cPonwP4awTsX4j+ZqTUnXwFZFfaIY1IlCK6eiaI/JtXW4MxTpF1ouV9yGqpeLXdsl+5oKRD0SzT0kdms/MLmQAEK/cw/IX2B6SFDMekZDn1FgJhveHYLIEgTz9xsjrwhwkj762k5SE+9swa5/cM24uf8SIuZD1nditwSzfKEJ7lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaVgLq+xDAyBE+L2KXcfqajNJugzVFdMmZ0eiUrog+w=;
 b=l5LsF7NE42Uva9acXTISz4w0UunK3CCd9GYAvWuCIPJYyB4ewy3l6X4QCXiD+10vH5z+zPL/t0P8FQghYDOjaZH+mDr6BudEujC1I7SJs+ff4r0/JO4r2LulohbqW/eiStMCPD/0ywVuECrI3HUZgwtC873y4TJWGzN18jsx6F42ZCBv1cTZKrzDuKB358gUFVmRE4nJQSpPO+Py7fkjuX0Egf0hDTTSUvehtyOnSaCv57KLs1i+lWi6VhAVl96GJhY75L3n0tlQe5Oc2lXasq+LLxkn+A9vmX1C550V3R2WAXtW1jTpSUcuAOhnJOUNDUmCyzSVO2dxMc4H1B5hnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0699.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:44:57 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] libxtst: Upgrade 1.2.5 -> 1.2.6
Date: Fri, 30 Oct 2026 11:44:39 +0100
Message-ID: <20261030104439.18901-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0699:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfb354b-b22f-4fe7-eca8-08df3672d714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026140227099003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 9q9EvxeoraUDAtBrSGDqZqbVXVr4A966/WM4jwcPnw+x/WrJ4NKXXXmSPLErDTXgvkl+/U4C8ZatrEK5ioPQE9c/hb2kitAWx2mt2WPAJi8dlwzAkuPQ6FFcUdwZnjYwWa7HmbWqD3hY5YzvAAheAwC5RH4K/iOpYOS0YLhbuBddl0e0/5Uv+GFVRkUVuwYDsjyvnCHk2MKTn8v2GYamgrTfd3bqasGi1dv+12w+SyrQOPYZL52XY1NPOMOlDM+ViwFeddw9zwCd5dLFVdNA37AGSC0Ftre79CYUG4RvE3Qre7SRbxwhPieEGXtRnVbXu1O8pbxitsw3nou9x1F2Jc4QB3jxGrTkzjF25Xx/zLRlCBUz723xA5oW6pn5GFKh8ihgHxpxgjHISzdp/E7yBxklwwgv5GBBHt+F+qCPVCiauDmIHi4T3S1AT0bQPonuCfvKzEJm8OPurcK/4Mu7y5EQRZiQxT+w4dqZrtBfUUSy06t44WTneRgNdKAxlIFnMyX0nhIEAC+90qfT818jSfjholLyX7VenW1Nr5YTUGSxhK6/tcnIWeiAJ+XQWOylnoMA3+oUbFQY1UWA9uDeGKS3qQy2kJpZ3s8F03JuhqNFN4LCK3HpBx3Hg/zFoFPv/cYIZIDHjcBfvXC5fK7uxm968/lgSKitdGZDMUOygSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mRTIdKhgR5aNlaf2eyKbMfKhi0zN1btQ0mTqmOL3dTmCPvycip6TXg4m0EYi?=
 =?us-ascii?Q?gUPr2oUXnkw323a0hNyIqc/a7tjiw5+cjp0uxiJHSTACQzkxqjO1FzB95RPp?=
 =?us-ascii?Q?Xadvtfvw6C/UQhEkrm7iGXAhrfJ030ygFvUlRwUcBUEzyjAj1vuZu1DUZ6mV?=
 =?us-ascii?Q?ECAqNS7DA4257q1ohMaGOuIPU3srQcNkmxAvxr1dN1UIC1hkGzekOSFx+t46?=
 =?us-ascii?Q?E883aE/A7SaLsVKAYwWXNb5XnR46/BD1fq112wg11ei5SdjLB6Emhxy1PtnY?=
 =?us-ascii?Q?wmlvvBVOMQYF8hu/wI5mySsZy6ZM7nQIMbWyE4FQN7QbV3MvL1kU7X9suv5J?=
 =?us-ascii?Q?PF/tZWBIX4WaREkMLtSvZHCWFFyHAX/WZcL9DptV46mgS7ijqK+2DiX4OvJX?=
 =?us-ascii?Q?22sK92n5U+AfeqfuolqMpEtDKp98NKmLlqePdqiAPrTU4FFZhZvsOwckMHlz?=
 =?us-ascii?Q?5A+46zCpQiJS8JuJyHERxdB4FwqnPxdGICgh+wnaG9goh0vT++OC4lfyQz+7?=
 =?us-ascii?Q?H+m7nkmbK0Lbvz5RigOsmimBHyrO6bK37G3eaCgIv6z+coRcaa9FiprTnD4N?=
 =?us-ascii?Q?KKmV7bFehdvGOji3O0UzVPW3uDRVU4VNmlsadhfWwhVwVe/Y71xr+fz0sPJw?=
 =?us-ascii?Q?84VTYsuS150znInqCM+fB9mLiKJpE7fgomFr4fewEVSMyfxOYFJXvgo+NEej?=
 =?us-ascii?Q?N+OMJmF60zfufU1o5yRmmopuIpZlAdFlfmSG+4JU6dNafAGCtYYB1SgfLL+s?=
 =?us-ascii?Q?ujmDiZtkHb5zhEhR1KdC9+ZVZ9OOLk6KFixf7DFMUdDNfj0q2hry8UIDIl0g?=
 =?us-ascii?Q?ZafVR4ocJ/tDwCJa3LPMlKgNDTm8qoZKBTPpd2wf/DKxHBrFatu2O39cUOjy?=
 =?us-ascii?Q?tJunPruSG+83basVyW3jLWKQz8aHugEsxMP9llz6COKDUuZy7UqekPUroBEO?=
 =?us-ascii?Q?gk7Lwov4UPAmnjFoYgRcey92PiioTMWwXJn0kMipKUJlUjdLbVz3cb3V0S6q?=
 =?us-ascii?Q?1Gei2ajjkyrmyema2w1pH0YUXTcoGh21bMD/Db8PZ1FNWDIft3kFrhwOtAIE?=
 =?us-ascii?Q?FfDVa97ZwsKkLjvOCNthqpWyQYJbSzxuPiw3lQ3niR53Yxl4sWCwUoTciUaX?=
 =?us-ascii?Q?miMDj2Z1wDCGcpHnQyYpF4tbixHem2w7dOeH3+UxK5AiGH7mKg7XjRMHHt5k?=
 =?us-ascii?Q?ab7ablYapZ0XG4/q4tq5B/JNjknATs3xG50T3XgLLAbmQ+an7ltiMJa621wm?=
 =?us-ascii?Q?n8CZYVk0UeBHJ3YCU8iOJ6H0zy44W3RFgWPezbpd3vBYGptG2QUUGI1iYFlp?=
 =?us-ascii?Q?GmMVpouhUYmiK1vQzMIjFLrDk9C6Bb/UpE2in2GTkAMVUFWbY+suuej7GOgW?=
 =?us-ascii?Q?+xEnXcJp19/CrVthJ1zslzBONSIP1yydc9Ue5+4+sfltf/Aw1sNEx5zgd6/k?=
 =?us-ascii?Q?S6VzkbqcRC+ePWMku7CTlB6C0sZjt5nIzs9bmD35fUJkk3xlAS93fBa/rNBK?=
 =?us-ascii?Q?yOoYG4mqbtZ1EAfHRqQsybh5YFfydbUMYh/mpTDCCiCkttlhxJOwoQE78HwP?=
 =?us-ascii?Q?czTkcxLXeWZ/SOssM7fcvS3NYV/KRNReQr/AwGOM11Em9aahpeignCIl0RlJ?=
 =?us-ascii?Q?MIlz5jAlh4UXDvX+IvCUtpgS67j78mzlDu5n1FSMwlaIwRUFZ9meNElqKw9p?=
 =?us-ascii?Q?E3UV5ldOm5DHff+buaRoibDxgnamOrkBHp+7yGD7MKrjKmK5BBleGYVLP9SN?=
 =?us-ascii?Q?yPTS+24rfw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfb354b-b22f-4fe7-eca8-08df3672d714
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:57.3887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y08d1trQskUANp4vmpwAM9R8Wo3GmLImRxO3FLXcI4vPCctv/EmS9N5csYPK345KWVX/a5ohSMa9OrYm4h6kr8YeO3waDr95QBb2ZBO5hYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0699
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249026
Content-Type: text/plain; charset="utf-8"

libXtst 1.2.6
parse_reply_call_callback: reject zero-progress RECORD reply elements
parse_reply_call_callback: check element size against remaining reply buffe=
r
gitlab CI: drop the ci-fairy check-mr job

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../xorg-lib/{libxtst_1.2.5.bb =3D> libxtst_1.2.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.5.bb =3D> libxtst_1.2.6=
.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb b/meta/recipes=
-graphics/xorg-lib/libxtst_1.2.6.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
index df381b7d655..a59c5c69963 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
@@ -15,6 +15,6 @@ PROVIDES =3D "xtst"
 PE =3D "1"
=20
 XORG_PN =3D "libXtst"
-SRC_URI[sha256sum] =3D "b50d4c25b97009a744706c1039c598f4d8e64910c9fde38199=
4e1cae235d9242"
+SRC_URI[sha256sum] =3D "f94f0b37c07d80d877f3eda2c2405cc7e62aa9842f6310354a=
a349e3d66a4fe5"
=20
 BBCLASSEXTEND =3D "native nativesdk"
