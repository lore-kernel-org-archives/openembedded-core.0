Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7219.1793698101544969562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ibEb+CLs;
 spf=pass (domain: est.tech, ip: 52.101.72.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODm6668XSspULn3cRYJ5xNp74K+k46ZcdRWqDPR1aCoD7EH8LCp4BpBY8CSiEWvC3aVr5avIlvfTWJABLoWLaRS0amK+wyHypcdWWLsxApNbRLIjsJYl+cJKFusXntVT5FnUBPE4fHfJWZZ0/h8TJzQX2+NVBsbXWdhwpRbyM3pLiS/UcEosGB/U2U3EjV5+u1hC/tnXEr5s4hW6LsmSJRB+1rYCTL+tMUFAUKNITbk9iEEcc98PzC+dHLnxV88tZVuAtiPXSUGpc8iIzp7H7pBp0Y4j8NqTHkQp7inqWlFeM20E+vFsLYM4yOGpUuEv4zZOIyJAYjj21ehqdnfRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOyIWd5CqVwnn9AJTmmeY1z6ZBXQlnEMGJQP2D/qm9k=;
 b=Mrn09cB852K6nrqrAB+5ix9Zmh3zAMzt32lfoycO62PChHXrxvxFPdTHGDtpR+ecWFJuwOi+kyL6KeWFMFCIlL4CFUC82I95zfjFYTm6Llinhxym9wVYBbNBt325o0K3xYcdpoRycOMXUyx7SpOL5Ir8H+L65RBRbH0hfih1sxip0qq/KmZUYwmnROeLPOz1GnXOmjyTRscbom+smxyDqAPGeS/v6+jYgUX0+qZSu3N9ixltVT78pl5KVnLc9ZSMvI+E/WJGUwRmZuH7DyBd2TjiJNEJuTOjdMnu6F312dd6GuIGSLdZcv0flPUTjUyOgigQiqcM5OUUrtWAdNM2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOyIWd5CqVwnn9AJTmmeY1z6ZBXQlnEMGJQP2D/qm9k=;
 b=ibEb+CLsSBDRQ9RnwdmwoHrU27ib18d9rJJP33fMGKU3zhkjavWENz+ubPcpONpw8eM48nGs+Clgk7I0TDG8YtNaj6Ljc/lmLkFNSIG6E0+hxuaZAxzsdNdDemUJflSlLvyUVWE0oNVwFEGIkQewCU6KsxJiTgH3bpmNmVzupyI0yZtSE2m0yChmV1sfEHnQDPcBo+GaH6yJ86raYkBqRLXYg/Cqwob2WcYjeCV0lIzf2h85YtioctnZUfoRAt8FGPEXmyWLZU130bHRsBsgoO67BGHJv67PnA7TnX4r1gvLNudoirDer5NX6R9Dp2fpD4ftYPaEYw2RCBtZacoeQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:19 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:19 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] hwdata: upgrade 0.411 -> 0.412
Date: Tue,  3 Nov 2026 10:27:58 +0100
Message-ID: <20261103092800.39286-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CWLP123CA0215.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:19d::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b7877d-cd83-4ed7-12c7-08df398ccb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: SlS+GYPyQAZaZIYPvKQniRHLv9XROJMVxv2D6QUZo0h+3cEzU5ObMdu8g3T7OWKe6bFpK8Rn619nTzvwSeM5DCouQQ5e2elFj0LPwmaZoet1Hb4HpBWqIvWTnwFG2ACgWJRsByX934ZTcWeuglWVkbGZPGxHz55IKHzHwzGiixl4vHZJwVasrPBwiE0IPoHFNLfXwcfNepdcCh+UarOkfCIZwGKnYG5Hv3c5EMv4ryMSZ9ex3uxRs7QrOfh9DlRyhrF3Dqs8SMCRKuk5DbkBl4LWgTBWARSZAb9NB+t6xvdB2Iva+0DzhSGAEfqzOIL5NyWj0e2P3WkxAeYFGmLeZwM9cZg1d/0RgeawpST8USFYoISfSRnRiMO907oLx8pZm86AcBNg5XHeaw+iE3DE3MehtrlFDBnUrp25q5aAplu5kJiYFvuZekLDRg/h7CBvQQRLOBNwAq9Jjfpam6wBPK4roF+EjDcF+A2TXjUTfwn4WW0yb4dyZol80+iXUks/gGdF+1ohUUsQvkT6TFbuDSoFN2ZvEptPMnsba5PwoLwjrI85axdOGUj04Xz/MjIhip93XB+JdUU0jyNJGaZgYQu2WWakdzwbZRJ4g8vKeJUQjGc+vy1PoJUrArWLw6udp+/QLZsva8ejtyWMv5XLtfHuBnra/wmj9vdqPaDRhLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dVGNcIOeGCeA7UeBE9SkV8BwVST0k/iHeKacLdwQrHph6+FYbillinCRxQyL?=
 =?us-ascii?Q?USwiR/jTE/7HCnmaxWYNFQeV8aA2eF1rE4xLn+S6hXPdo2d62/dJQ/Cnovdj?=
 =?us-ascii?Q?FfBz4jYrK8hkeNAIevyCunoP5PSFJiCgzxmP83gsjc8Y4nwFPXpA/ltb5k9I?=
 =?us-ascii?Q?mEBu1PMoPVR0bY7Mnzy+4pCwurK5aP2pfwwb6thjs2n0tfNsb7yMXWjFV8gd?=
 =?us-ascii?Q?0t3vtzwLXHKbIVKAj+fLChhL5Y0omr3Gxetx00hYI8vtN6sbbc3re5GXGqsV?=
 =?us-ascii?Q?qSWy5y2N76vYS4cmwWIsGFKlanMGNzVG9YMzorL48+8K17qRo2IY/aO4uAKr?=
 =?us-ascii?Q?lZUht6u2g/O/1ABVaRYjO3CA5gqhgt8gEGAn7tWHSpRXwOLGR2ltpKBQP/GU?=
 =?us-ascii?Q?Ub5pLZtgJyNGCBqLbA8wXh9G3s/Y0O39jdRW3sqTcZu/TVj6sOdVth6smVJH?=
 =?us-ascii?Q?o/tiigSvleP689s55G76B1zljqec7+dsgZnWqh8ixgvzhK02I38c9ACQokDJ?=
 =?us-ascii?Q?Xu4Jh2sfJ0qmPlg0LLM46cZbz+nXG+XoQI0h12sXHm/ekQW8DHJGtRVvhuV/?=
 =?us-ascii?Q?8f84MvM8E9EPIyOUBBrANKfuMzGD6n+QagxTpm/PLwASt2MA7rKkyWoC+CLU?=
 =?us-ascii?Q?euQUvmbzaCusDCmxWJOkco9ddO/Hw6Y9I35zENd6G7CeKYzfciNl4t6AqmOH?=
 =?us-ascii?Q?g74laSQv0xh7SoGw94QpeyYWzrkGmTn95UtjUn3efigiP0emHaprE08y5OIo?=
 =?us-ascii?Q?mVawgau79lvIWztm+XE/iSqMLmr4l0TauICabRi08TFGlSRpLVHeARFbDggM?=
 =?us-ascii?Q?fSr8/CQyKv9gO6JukuB7QNFBQ3H6YV43+IUDA5tAqi6qsR4TaIZEHFScMhsC?=
 =?us-ascii?Q?FrdAQglJhpmPW5o/GkPAoIYHBHmPAHHNBEl0o2sjaInHsHKLoPCoaNmtUQBS?=
 =?us-ascii?Q?aZHBVSlhs37m/Wp3XlzzZaA/P1VHX4fqtK/Zjq9OVr19B/gO+NiN3AeXqSuW?=
 =?us-ascii?Q?eWlA9Pgt8mitr9FIItTC6GKZnp80nyJjiPPEObG29Cz5IOoVPcXkiMV7HIGE?=
 =?us-ascii?Q?wI9koZ5uBVkcrd3EFdJ89w2DsVHO8a/dBfdeaGQHZjcF7xh1fMFYqGIL8Gm9?=
 =?us-ascii?Q?+doyQFZx5YWbAiB5dVKQ9tUchZ2NL/UKts/zufwbSV5pMDWKHTTF0vRc/GP1?=
 =?us-ascii?Q?6h20lvLd1kRKqYnpqqUW1WlctjaO6N+kRoyVFH84oySIGZl+hNY4WA8QlQw6?=
 =?us-ascii?Q?ryYjHj89R7mfF3f2QgAEEXctdxXT7W2WF/UY76Bw6mE73ejqHhvIk0qs+1TL?=
 =?us-ascii?Q?yYfHJlTyxst9bsw6ZrEf5T51VtSe3qwCyxw2P0Zz+oNgDpRH6yxbFDUGw2mg?=
 =?us-ascii?Q?VWmRDFrk6cxss83hy7eKmC1Set9FPM5Y3U31qUGn2DkValUV9GQH9hhl9ehS?=
 =?us-ascii?Q?Rty8Wmcwk6YEOY6bNh/XF1GNNk5lqt7R3o4R7fWuJE9jHH2N0+lqppMe2QZL?=
 =?us-ascii?Q?lVGJAzv0uyoTRUK/6Hb7dRNhZGYbOrv3pLyHRvMfWvRiQu2K3dtSmyUfsTM5?=
 =?us-ascii?Q?+sLKnP0MY+4Q8VaYkPf08MkG+qQr5itxrTaeb/joDrrX4JPzauQo3wQPtaCL?=
 =?us-ascii?Q?j86uSKEoZrXWFCfM9DBP5vaw9O/QwOZUnmhB+x8gUDERPN9LR6IZP27uZQ3y?=
 =?us-ascii?Q?mbpCAMakpkTNFQ5nOkbsj12vYtWkcam44DJVXh0mbchxXnrX4KVyh0Y0/FUI?=
 =?us-ascii?Q?8xmIgewAGQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b7877d-cd83-4ed7-12c7-08df398ccb7d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:18.2845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpRTugkDSGaZPVkzWfpCdUNxaRjCe1DjvlyvIJSxgoIc4WDJvA96xMTW394UJLuhGPJbVJuGqXb7A7aHdm1/9LRc4Dth659theaXyH0XbSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249263
Content-Type: text/plain; charset="utf-8"

Update pci

Release: https://github.com/vcrhonek/hwdata/releases/tag/v0.412

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../recipes-support/hwdata/{hwdata_0.411.bb =3D> hwdata_0.412.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.411.bb =3D> hwdata_0.412.bb} =
(93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.411.bb b/meta/recipes-sup=
port/hwdata/hwdata_0.412.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.411.bb
rename to meta/recipes-support/hwdata/hwdata_0.412.bb
index b83c11f09d..c59654e138 100644
--- a/meta/recipes-support/hwdata/hwdata_0.411.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.412.bb
@@ -8,7 +8,7 @@ LICENSE =3D "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd9445a5=
7"
=20
 SRC_URI =3D "git://github.com/vcrhonek/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
-SRCREV =3D "7fc63d411377e40aab66bfbf77dce6a439c3fe87"
+SRCREV =3D "816a9490ffcdad1929e0e53f79c500e1aeadd492"
=20
 inherit allarch
=20
