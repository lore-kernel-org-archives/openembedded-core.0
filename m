Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39750.1793010720897209480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ahR56zrK;
 spf=pass (domain: est.tech, ip: 52.101.65.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfNq4bVu8FPEW92aYluWUl3JUufAZ22NCtx0TbxezkXoBCT9fbHkcrA3ZVaCOhSYt10+JZjutUJWnUM/oGRa1E0j4MBAlcJHzDWddxMdYfy9aUKj/uZ6QbL2U4KK0LXB4Qa3eW71QbP/JnNbwCu8HD0GmVpaEuH97Ic+6EAq2IqxdQyL5qW6I/pwVgZox6MSCMe1Y3daPL4cZ8ztXoSMnK4UrPTS6893G3VqVpVhRctZteh6djPMpQxDTcOcdIHmSn/OBgsgTFAsSIgoqPcdNj2eV/MkHRD4LPbI71yHYOoaG4J/iWPo9ZrsTuMcBnwCUw/zSQ9QQuppRrp1Tfk69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJs3TFO6YMRKiLHRvAKJShDbiWMiRl9EJETKO3ssL5c=;
 b=DPZCnmDmOglw0ktekPhNCDHwIKo3TeE2Z9MhsQlnVeT+rACeRyXkuUGJ1PMLiXLQR9++IqbOtR+d2bQxPzDY4TGp/0jEau32kWOAvtM/ogMfJZNHfsA8ar7xNVx/76yc65Gvi4DP/HY1HJM4UgAiqwzc0aBEQHCde8qFQU3okLo654Ug6K7/Ycs8Hg8uCKpb+jRMfqrII8hKZryot1Bvz662ZvvsteZftn2kVRQQ3CMfSc5QcNF6jqbWW3bZudF6QlXnhUq6FlrFTzR7srrmMqT0O8Nv4AhAN+46geS3AfZOTudmVpzgEuV9UrugxxQ8Q4rGu4RmGp1C0yAPeZ7gJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJs3TFO6YMRKiLHRvAKJShDbiWMiRl9EJETKO3ssL5c=;
 b=ahR56zrK+TMXIWYGRytoUJ3ydCVDvNrfhjVF/d7PNrClCPabtzQqChzzggqe9StXRN8vxqqzptGihoX0St9ra6DfbVXaZZtgez63rCauFI8Fd7Zbg7mkdNLeIyOGMVjyFs1xOEre/95cMUyaIS7eSYcHbRWgwyVSy/xWQSa28BLdkH3kdtEaRh2QB8N25zWOSMznrneFvxFzdvb3ksFS/R/1cxLBQkdjJOeUycOalsiCZn/sbQqmVh7zInWqrkvVYKurXTHFaBq4kr8J2ewD0iJo26PcCKCfgApWdlMvu9caEYyS/uwxuj1zCj7X6Q4ZDjT8aNHtS76ov20adhlC3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:32:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:32:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/12] python3-wcwidth: upgrade 0.9.1 -> 0.9.4
Date: Mon, 26 Oct 2026 11:31:38 +0100
Message-ID: <20261026103138.3137-12-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 29671a8e-865a-47c7-4dad-08df334c5e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: iXHu6lqVqs0AmsguFKxZAcHGbP7bsMdinUfZG+vwBatc4Jp21te8VRHmypTS2X7D8eM2TPxVlFg8bBjA/bYRvxWiN4uS5zPMxPRaIBC6+vDcQEKY8m/1dVn1YEAcBrmbvGSUllFhEdyjVNqbXXUS2uPrrLkW+Y9Yli0bdFecH4kKRb1C8YFd5U82xBeBNfjlwKOT/8q91jiXxaY4wUnL+KY4VHHcavIENarBOpc9KXqO05k0dZhC1LClh5duUwE/+QxoYviJ3a7eEv7yk7XWUQsVaZep5cJZd8cDUfYPIlrXPo3Ss+yooKSpzIdJpGriagDGOgTZhQoiUZY6Avio7vAt+rtZA2EH1vGmFi5F9dWcnisfm7HMy6zdiDkvUUJZOy449+50FuelFDs1WjoEjNBUAEIVmnzorCjhHnehSxMsBxkpJykp6qWYVMnGepKYa2OEAj9nkR1Rda1qRAGn0VF1mJ+cx1VibTryUOYngypaC/27DqkYjZ1MR0/jya9mHpHVk17LWrAPbuPS9PfJDqcUmgJzNMx9VH0Tt2cJ+Icn74QpmZQCrjJWXWKSKcqTtQQ2wEa0GEEADCQzFX/iDWIxHVCrLWJrjnWa9mbtcIhzkiW735ByJqWeuEOIihn19gjIme2CvFF/EgdXaLq+6/KKGK88+u2jHix25EmsuRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vC1x5nxG3BtAqYvhkw/LPxdXmOKKDXWQyrnV02sWxagfTZ3ZaUR9qXQUPgCz?=
 =?us-ascii?Q?5bbSDqV8KkrFCNAU6T1XxuYOSVnZAvpofQ7gZIUYn6N68Q5y6ABQHxOFCaWB?=
 =?us-ascii?Q?qu2zoWzWhncuKQ8bBSQnqSwRyfW5JCkf60TEx8gYS0hohV/vSBUruYpzuDDH?=
 =?us-ascii?Q?hkkUGmG4XqkSlbzEN/zKFlTbt+CBihZ1sC4u+J7OpZ3f8lhZXwHq8sq4T7T2?=
 =?us-ascii?Q?F4o5ULZWC7Dzib+N0LCG8Ae+ssQ/u2Yj0++frEtBoC8rdisLHaRaHKdgw3Fw?=
 =?us-ascii?Q?tXjIUrUwk7v1hoC+AzTXiqZcAgMeIshCewwDWwexktfFbAu3lPrnlWNnQNag?=
 =?us-ascii?Q?pRRluDVz9L7s+n2OsqLvYrLHWlHhM0cIvUivE3DF8rZVo+m9ZE2GcPIahrTU?=
 =?us-ascii?Q?4i4We+KpvoUP2ip4r3ls4sJNBJiGoYix0loEgplHL36LQ3UqHPvrKuvekKQg?=
 =?us-ascii?Q?kgLENczDisk4jKO5P/jPhnaJfsPKaUHvQn1zSodiAWcnrMCGTvsKXBYaxy1W?=
 =?us-ascii?Q?cqBWqWvnra6yMGSqQDhl+6uU6ts1YlqPnIpCE9cGUEDOmjrYE8C2DqPM7XIB?=
 =?us-ascii?Q?CzThDcFl3fJ6yyOgP4sBlYb1UFQDaKmM6nfNnjB6nGjC5AQTm1Da7YOsGEFH?=
 =?us-ascii?Q?UiH8656/9lfhm2VP0iTA8OB3KgOvDq2IDLjptMNBHcEC6CwrcUoNVSwIRKMi?=
 =?us-ascii?Q?I/HmfYxit7MaqWm1eO0fajuIeVADpgcixy8o46mOmyiD3ArFWb1Cvb45LjLx?=
 =?us-ascii?Q?DTbWa2J3Ck6BfReZQKvc1a7W9aprxWUWhxuMvclrMKUPBQvno9VxAx/cF2R0?=
 =?us-ascii?Q?Tok5sDiqFf3QXAkDIWwokwCvpjXl7YvsMzPjsy7/X8KZRnca1FJoXvw5rgjm?=
 =?us-ascii?Q?fmQLcrYTDH2cHwBVzFCcel+kXE82tg8/8AKjIt1F4raN2uNvZ3NohK+gR0+h?=
 =?us-ascii?Q?j4OJOaISANxueqQj5VmVSsDW9J+/E+PNGQU1WlSK0WAOZvvw8KJPqfTTwnL7?=
 =?us-ascii?Q?aOZlEI004NCYkbeIXX0QQ1orl/miGbQafvzyMA5pkoLOidi1Qm+DuswW4qGK?=
 =?us-ascii?Q?hQFsSv/+wsJYXr/S7b0QWDg4V3eNcqXajcpZ8IvBV4Yse7rK31sL7V22ObbS?=
 =?us-ascii?Q?K2k16Fhtq1DvIcBJfg59Fhod2DPubBPhfI1DgowL6RKlhMuLihcxfDqZDQtR?=
 =?us-ascii?Q?rwtJj7XkIVet0fmg5avabOAWE4w48uHXNjGy6aST3CfaTK1oL+2aCP0N4iK5?=
 =?us-ascii?Q?6Xu5axVWCAdrmBUU+kdGQ8YDr9ZR1q2wonjBcP5S+s1E59MxOqU7gQwP3AKX?=
 =?us-ascii?Q?IdO9wDzgYNLOjyKdN8VUqTL6jHyihXwpdpFO8UY99TKx0ByZHF6ZxrYtTqhG?=
 =?us-ascii?Q?vvuzYskhSfy7VHy/pPS5K6a4gdmN3Utw+vR+hS5JLEsFGp0NMc0dS90XHLZE?=
 =?us-ascii?Q?nB1vgg4rglu/8eo5KPUhZ54nQpXDz6sGyDMvvxjs7q3gGMJngovHyxLD8XOL?=
 =?us-ascii?Q?RoJyugU0f160DWAhgbJi3E1P9bnVUA/CTtFv1q/I3O8s9ChXIM/IRThDwr1O?=
 =?us-ascii?Q?H0vGC5zEZRlhpDCGSBJcfpjsEGl+EQ950+jUBOoxpvx+2+7dOaWY0td6aVnP?=
 =?us-ascii?Q?pLqTEfLo8FVklX1G1WQD7BscUkC0Jg8KcahlZK/PLHjIjDj6mMrZ4w9QgObK?=
 =?us-ascii?Q?kQTPq8W9F4c7H0np9TnaOD1l83RSILH1HuGYuc8VdaC0KbDB6R1nKGDVUK/u?=
 =?us-ascii?Q?nPHPFyYZJw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 29671a8e-865a-47c7-4dad-08df334c5e14
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:32:00.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkDNPtOt3yAWSRX0mP0mtuKpwQ9dLZJb8F0bV0EjsJi4OECh2TwOMWpXdZvCAqH40xhk5030B6xwEckCOQowmsO4GGlb4lclxrtzR2+anKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248671
Content-Type: text/plain; charset="utf-8"

0.9.4 *2026-10-24* [1]
0.9.3 *2026-10-20* [2]
0.9.2 *2026-10-04* [3]

ReleaseNotes: [1]
CompareLog: https://github.com/jquast/wcwidth/compare/0.9.1...0.9.4

[1] https://github.com/jquast/wcwidth/releases/tag/0.9.4
[2] https://github.com/jquast/wcwidth/releases/tag/0.9.3
[3] https://github.com/jquast/wcwidth/releases/tag/0.9.2

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-wcwidth_0.9.1.bb =3D> python3-wcwidth_0.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.9.1.bb =3D> python3=
-wcwidth_0.9.4.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb b/meta/r=
ecipes-devtools/python/python3-wcwidth_0.9.4.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
index e7156a79eef..6deefa04677 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/jquast/wcwidth"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15979c39a2543892fca8cd86b4b52c=
b"
=20
-SRC_URI[sha256sum] =3D "5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be845=
9f27031bef0af5"
+SRC_URI[sha256sum] =3D "fd8d57d3cdfe570e3265c8fab1885c24e34ef40889c0759c0c=
304a19e9835954"
=20
 inherit pypi python_hatchling ptest-python-pytest
=20
