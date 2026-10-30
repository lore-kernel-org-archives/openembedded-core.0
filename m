Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8651.1793357095846489218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FXLRftFP;
 spf=pass (domain: est.tech, ip: 52.101.84.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSGAPmN/FLHrrXbTDREQu9hgao+U3t0MLgN1ZSHy0223O7QA5mtet8Xtn1oyuU48XQ5g5iWbuoD6qXAEHJNG05T2riEgylJLgVixoVlRZjiS1HQVAVPKjU1MUxDVSt3u12G+zdTzBGnS0WvGst7oKI6lJGsbXVmzybl3wdU/oJR25JeH5qRtNkDrpTTHp/pJsNOqBdzmLW/Es8IG6t89xKUCl3F7qTAVF+MXOuxUR5gibEWcC9f6pwt8RjIfNC6j9oqyW0xzpvQxUiiGSWhz9NZO0QiKSRuyf63/vJtjCeUHzJyzRULgHla9S76FwW4Rh1ElxdNgcfyTGXzluerJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ8AoROXZahwN35OUEHeJqn0zi6IX0PtIWpZKLLzRdM=;
 b=Ghq1Oo7at2lugDstywnln6rG+IjGelRJedXCPsJ1bdkddtJDEV41QXUq5pBjB5r8v2R1ymLDT2iaIaXrGaUfOA8ztpgxpoT+/Joxtw2QvFE7W5WiDs4yp4WeWyLD06s4crxG9b7gffC4drHffQ9Owbb5swygK65KBnj34qq8NgL07BVa/gysM2S2hwUvYYpsVVuPBe3GF1FNmFVPCUBUBl3V0xM7eNED35eivhKnCM8xUjsVOZOuprcXXyjqRwrVmr//ykbUw+d5GRWk375/QMl9uZh0Jhsrb4rt3bP7hbtNWGqyNO+68I7oskTbAUJe1fwzd2ehfK+OW3YeyWww4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZ8AoROXZahwN35OUEHeJqn0zi6IX0PtIWpZKLLzRdM=;
 b=FXLRftFPYxPe4wlchLciyzUH0olEfnIL34r/DMEDyXniKGD635PJR7O5KKVzrw7MNhrwN05lutcbEWQB6DZ69s9bxciSn9IpYpRYTFe5L7gjemsxshjO560JRqjydA4jsciPZCSUHyzTsUOHiiOmqxH2dVC3zLiee7acteJoFuFN9TalGI3kxYVO20ooqafqM6LvzGuPZJIviAjOD0jLxeAb1qMrs7caUtV01ufXMtVth1kqNBNZZDUC2aaMNg2vPuUo27yym40npFsyQYGBD0bG2z4XuLOdajMjKh9QbDJPMY+okpY8y5gFo781vJ0a78FOUeRu2WxT/pofZt2kUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] libxpm: Upgrade 3.5.19 -> 3.5.20
Date: Fri, 30 Oct 2026 11:44:37 +0100
Message-ID: <20261030104439.18901-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccea7d7-5e0a-410f-2be0-08df3672d4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261022115727099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BBIdBVYXtY/NnFJXlrnYH7lq9W2C7ocZi8ai07sNgXBBvv036/Q+rMI2zJ+Zg4HsB9JIFMoNA1wz0c7GZOqKu19R5cGrMwRVqduJxYBgKyRcscCEqxnBF+Y4XnXE9+g6whtsGxRmD4d9Xx1bhdityf//cM7sQ7bJyM7WcyV490FSgzIfC7oLlwWOy1QP2W/ETUqj+jp719wT4hkSmgxwOu9+D928hhufnVMsHFvHU/zxs5wmnCHH9cJRDDtQdPta5O/N7zYYjUIdwoCJV2UcNxPUyifWzgWBTC+IFmip6uQ1RS/AjetUkLd73r6lkStrfYGK9CbEYrUMS2DC3GHfckv7TlKZuF9lR4gZqQgFKMULJ0tQ703V4tlF9D5SWlr4vvb3tA/LVOt65rlpZkzRcmID9+wo42LcDAW7Dx7aYWNPN0mzsSQogT8Lg7t+ZVoy/tfe0bIoWJAVbIy265BI4Py+o+L4osZs9J2LJ9sLFNnYn30W4Y9B0ubtGf9OP6Qgr+nnFxOitdOsuJ/K9MGlhXsSvcrS1MNWz4N8zkdRXIjs/flX3rK4S2O+/7nK419NGoeIG8dngyEPGaS0EZd41soghLBT+Jh2XO5ClujWSVvAvHlSoOsoTycYlCUpz5huIUV1Ng0nGePi9lPb63DfuAa8g5oo/r8vlb3kBfnFLPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261022115727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxwttv0QcTi5gJR11GwV+/+H3QYjfxbFxIyUaw05nRVd93Kju5RxO8hE8WGn?=
 =?us-ascii?Q?gCSHgoVKXQKXi1paxZX+t7iJM91Cg7B47zEerT4cXnmHTY1TpyyCrZ/ZEmCt?=
 =?us-ascii?Q?5+sdEaLYeGBCaZlTW5EWJZdT7ZPpeZREZNu8n2TlgUznTQPW26Qkc5QM3WLB?=
 =?us-ascii?Q?MQMnCD2khWHRfcwFkhfA0MLuyBzdn8giPlPxFJa09RqxIBYy1wQyUBkRH3fT?=
 =?us-ascii?Q?pt7DMGPiTfVk1FpdFcll6i0CmtZ0bdEVijijTHnWiH3Iyez7fpgr/gPT6SwZ?=
 =?us-ascii?Q?FU7RGU78975eadi20lGWcTK6OIIs71XA7OcSzfb4mX3Rg280ioh9tBNqj+Co?=
 =?us-ascii?Q?QYfmYQ+NrOsXcdy2Iv9hdzaD0RakLElyliUrbbIC+oUUbSI2hDsOprbE5jNF?=
 =?us-ascii?Q?0OoXsHTiNEcU19s2/+n1PYUO+DjDTNZkEACcAV9Zh++Fukitx7hZfSMSywHl?=
 =?us-ascii?Q?fsc3m4h+Nt6n9mwcQQjDQhK6olM7zOyJLHsVEOiXL43ahwZ56J1jgpET9dcf?=
 =?us-ascii?Q?ZcCRAeljtkZHWGHuG9OJY43LbmG6Yrb9J4xMMQ0FIFHdyHqm4chXnPXihwh9?=
 =?us-ascii?Q?am/1qbueBIWd3Y5O9jqVwMM/TJXw3iSrYjPOZ5PTC/1N1CaYba2yIJzLd9GV?=
 =?us-ascii?Q?y7fsn3/KXVY6Z5wFAozl2XExSpdbTv3YK4N71dPD34rf7758lSr4lCk35288?=
 =?us-ascii?Q?r3eTZRM2/NSc8MWhXpvhUDGCFBjXySqsxVExWtHQ/BG9vBgEOUOijf3uPNZU?=
 =?us-ascii?Q?L+lGCDeZC1FiIqbtHHLUqItFjW5l4RzDlxvxUPEFEnZsBMSioi2V/qpBb5Fp?=
 =?us-ascii?Q?RcWez4AGhqsFWDg2fHUqVQ10wJWY7MSuiIMEvMk0JQnTat/2uDJmUmS7eNZB?=
 =?us-ascii?Q?j8A9bo73TEOJAXInpbynildncntd+G8nvVVQZRq0lQzn3EJSto/d3d2CAd6s?=
 =?us-ascii?Q?lAi8NM3WBIirKupLmciQ9huGkTO12wlByUkzI3lXUlqQo3+PeB8xqETaPoL5?=
 =?us-ascii?Q?myEAQA68J1oxTCybmVtMHfrw5HRK+7/06DKlyg6bdqPWhD2dKP7c55lFsYWR?=
 =?us-ascii?Q?gw+dW4/uxNeCUK3pkx32q1GdgidShwlbZdlM7Bi0s48H1kx0IQd9jz4P0ZD/?=
 =?us-ascii?Q?vxXrm1YLnGqogxkvLcTgFmObfYXVJhiq5iVQrI7boOQ16xPP0lVb8HYn2cqu?=
 =?us-ascii?Q?ssJE7DA2QqF8yWvYKqLIdmoUJbNn9bONrWblsp2iDni73vX1Ew02k5i9EMEK?=
 =?us-ascii?Q?092bDBzBojv3FkO9GWCCnNoxaNun5qQt/MFXX6GeHrPAyMTh3V2Pf+Qk4fRe?=
 =?us-ascii?Q?MBYt65hk4otYMqUwvywgxUz/CGi9ncdOKQ/xUzcdKF11XFjmc0guqKjpih/p?=
 =?us-ascii?Q?pKgxdQxvjXG7VPsdzW4EB9tMCwnvTIEn8wmUmW/V9OVsos8IEIUsnSU/kc8X?=
 =?us-ascii?Q?DZNNBgNjspWHR6/UkBAoHm0qsp8+QmBC4JbswSsregEhFtfyMFZf5DEUxrDQ?=
 =?us-ascii?Q?/TN7Scg6SWvO+FVdqxEyrrKiQa94AHbfFySqHANx+b2Y510J4glU1nX6fIAb?=
 =?us-ascii?Q?IjFEZDAsGmj9/faqTFhVb2Orh5fb/8WW+OFqNCf8sItC+R/I0XTCQgBW+M3n?=
 =?us-ascii?Q?L71FfFcVqH72XSm1/MmE/sMvaYEdRWvNZDEnPmo2vsk/EItMjHw9WhA2RJCP?=
 =?us-ascii?Q?eIEf53zXh3f2J/UTNnOcipLux5fWvFd2sNthn7XbkVEDfNe3lldRJvhKydMz?=
 =?us-ascii?Q?zoMOJI552A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccea7d7-5e0a-410f-2be0-08df3672d4be
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:53.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aXTvuXVM9Dc1l2M5nrvN9m3BtngUq8ttjeAmBBNZaMp92XDUvtCi9kVEVrMMPDREL/kKSCLEV9CWaREROpJXOuWqtWyFCTyFWZSmhfAwWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249023
Content-Type: text/plain; charset="utf-8"

libXpm 3.5.20
ParsePixels: reject zero-dimension XPM images
Revert "ParsePixels: reject zero-dimension XPM images"
ParsePixels: reject zero-dimension XPM images

CVE fixes: CVE-2026-94287

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../xorg-lib/{libxpm_3.5.19.bb =3D> libxpm_3.5.20.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.19.bb =3D> libxpm_3.5.20=
.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb b/meta/recipes=
-graphics/xorg-lib/libxpm_3.5.20.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.20.bb
index fe465af4fe9..16854aa1f33 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.20.bb
@@ -22,6 +22,6 @@ PACKAGES =3D+ "sxpm cxpm"
 FILES:cxpm =3D "${bindir}/cxpm"
 FILES:sxpm =3D "${bindir}/sxpm"
=20
-SRC_URI[sha256sum] =3D "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1b=
fa1e9af83be900"
+SRC_URI[sha256sum] =3D "c064ead03e4dde78afdeb121fe0b644d25c550444cf903fbdc=
537f1a78f3ef74"
=20
 BBCLASSEXTEND =3D "native"
