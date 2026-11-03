Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7216.1793698094554339183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Daj+kUL4;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESW849Oz+1p/Of0peZPvoZ3Okb7vweWWDSbEuXpQSxv/Z1HKL5nB0T9Bqnq5oOiuEujxaoqXhEUCeWCbd5f7IJeWbiBMjsbEOfVmKjGXof93aagzkIn8ku8oLQ1vfIbGemcMA4n4zJwhEsWohLTPqp2S2EcOAVlIMI4I23gHiVQeWcy6LwMcXcAalYaI6WA+aUptthc5De1r7qgljRjExdDo696Gf5jlvm8wFKUqHfGP8/0Iqx+y+BalV+oNT2Od1zlR2uRAuRCpu1SABdeScvaWDhtYBk1tuObMKeTWOitknyMayy36zGFffJpZ5V1oBSItnyRcayruTTlQpidTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzSTUVZfRatW6Rx9IRq9xw9p2oFWaeGwUB1MJLVunQ0=;
 b=NDxzTXytqv8tbXYaBlXapvfcWdKZmo3fhIjTPu/OeXPWEXlQWv4tFfMoNNMdR2Yof6pd95X27e1GP7bJ6PSKr8G9waFHa2tlCg3X3Sz8fHWqglvwvgwnLgJcPDz9UbJ4vQpUnoI5khBe+FQbrCEKOMn+UAsBq35thIiBJzj3Lod1JK3TLu+9RdmnCa6lxYAONHYgKpoNXfBkeNmesJu9/3sMhYM30XH/3hv9aP5OLZYTetfVeCwAZhHSEEuyh5URRGbSRQg+grleIcQzEGSESpB44ncrcD+ZEM/rUHLsYfHTHf8kFSQ/iu9JU3qr6C1DT0JLMK5d8KHQrWrJOGoBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzSTUVZfRatW6Rx9IRq9xw9p2oFWaeGwUB1MJLVunQ0=;
 b=Daj+kUL4m5NPekfPYOxm3dejNCkAJ8HXxmg1ypRwD0AfLACxXyJwPKZ4kt12o+qNLAzpKLje5UlQm2bWUOzCLwXXEE3qKod86VREktXtglPcGUOB+N3+fXrLjJWs52q/+gsgs1268Yjz2d9dHK6foOPPwbCRTK5JOO6HjQAAC9pFpC5lqL5vNp51+W7euAN9Sk6HADLOHGGnqHE/dLlWGVjuU5p8lYpmCmJCRED+oC2uCovwa2QXH4Jt+kX91Og6MCt3VRh63W7NLVhtaC689xtS8IuvqA0NF0HZsPrkaEcKo8UZK/ti4YCAQL+3Gy6h3iRA77STY953d0Xq68kJLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:10 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] python3-jsonpointer: upgrade 3.5 -> 3.8
Date: Tue,  3 Nov 2026 10:27:53 +0100
Message-ID: <20261103092800.39286-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 274eb296-a060-4595-ea7c-08df398cc67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: TLOQXLxAqzhVxy5SlRImJ7xz4q1b8IPaRn8fp7c/0AzMl2ciuakbdsBrzF781W/dO2Xh51NpKHJMtDtPv7DZXKEgolYu6Iui2c3YODIc5MObe9rindDVrbBohZ7Ig/aL7qbNV68dxghwepbZjmXtGQ/s9fhJq/DvFAUi7NcxU1milpPqKlNaBe0u56H237PDUfOrKOB8kyRe/xWT4pUMTnvQVjC0UkpECryCfVnWmA1O/LpANitTpZvbFFaACbehCWQ5jCNS6tWqNonbc3iqhNkUjlmL972rSYl/WQTwjzPyzbblWveDl3dg+0gknobEAfQ+f+TWfvmq7SWXOKwQoyqOZMHX9YP4H6kht4LrwImoFXtom+Ozm/pMtcptJe/Mn6y2bxfpGEnU/tGyo/w3aVloLpJ/oSZolG17xDMjqSsiS1JlY3AeOYOKv4pz9CZgRO7L/psWeVzaryDklIOjbkdJ1VvQVdDNZz+HcqDWZDRtqlM5H95uu9hCXOiEt/axTm+ej6jZKdzal2L/bna+JikDL8zp8c8ULbENTlHInOWkxEey778l0YkXrolrai0U1sWmnv+Vwz6Jt0qWH8anNlALGHFdGR5ccEXIr0NjhG+Ad05Be4jQ3rp4HEkgzGVE3dkLqS/yaGcqAHHXsXTuAWUYSbaUw4/fN4fBdW6zrp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?298YnMZUuiiDrqrQPt3EBJs4DBf4QB3/YYY8S0DXQSgwHweIYSqUx5fH4+X9?=
 =?us-ascii?Q?cv6ygkizgM+ngU1a0rPr81nWcwFt0Wj4mXni31eIY38a0bDGsw8t53tzVnJ8?=
 =?us-ascii?Q?s126Ek9+g1wYdNAKoGielYN/DO1xPZwNBahuAalMTK4KR3H8ZN556WvdQi6z?=
 =?us-ascii?Q?geVgj+atuXYDqfaG8ZCKO0qyH4Gcvzajh6L8I72bSgq2b6HST+/Pkbrg6xfp?=
 =?us-ascii?Q?/23+6MbjoSfm8/H6nCGNGURff5c1huJBc070SHiNq/mcPy9qr/SKbMtP0IDm?=
 =?us-ascii?Q?rMyLrKbDe3tbpgBvlIL5qpdLJq/A2T5iofFZSFDqS6icxHV0MDbvR8map0fz?=
 =?us-ascii?Q?+Akgz3VybeQeUvy8p8a+1HnTYWHguCdf4yQhLfs+cM/tZ0IJ/VHrd+oaFZJu?=
 =?us-ascii?Q?Sy9BTQ0Z+xtvd/S6/Dz/agxinjWXDfVMd1I86MN04YjupTHq3pz6Xu1Ecslm?=
 =?us-ascii?Q?4bjRa0zRxSDLat7NK2u3lrKjXyNg8up+xDjAD60UF/N94qnaQz2cLJ9AjNzT?=
 =?us-ascii?Q?2Qo+gZEWZDuBTBalUT6uRLc7BM8KS/sky2wDPgbxmOUfsypqUc8Hy8cRJ0h7?=
 =?us-ascii?Q?9U48WjVu0uAfOQm3iD5tNmVt+u+sUS1l+uUcVt1oZ1pWfBI4KUFpRLJqLHFN?=
 =?us-ascii?Q?1d/uoHjVexTtOyE7olchs6GgtY4j7OicOSqGFxAViSBQMBk7Y1iJA7jBXjdF?=
 =?us-ascii?Q?Yw4NvxqSkWsAjaIimWvrJdSPE5ypAie6Xz5Xt+dwAIsaS82Y6Mw90HIg3KX0?=
 =?us-ascii?Q?eOveu+aOenmT5YBk7Y8Y1TnHrMqavkLdJS2pVCa8UJYzjfvGzrQ104r2T2ay?=
 =?us-ascii?Q?4hy1l15cG1yZQudhz8MPlsnbrSYHO2at6aaliNY+c9kMkKYonzIIkKU1HzAp?=
 =?us-ascii?Q?oC4Xt4hyEAHPMzc3mKikl4rEWeg0OfxM+3XSC9L1b1VeSb4XoMvgbi9gpUbS?=
 =?us-ascii?Q?sVBTWMwXyQ/vgEUlo/yrmzOkbJgsIRUAXDqEbnST4qSUFojEch9IxgPu/n+2?=
 =?us-ascii?Q?Y/izIxReY/bl/lmUHeG0667Z56Sgq4rRcAlkfJsC4u5B01G9IamOaM9rVSci?=
 =?us-ascii?Q?dX4iz4B/okPx0o+ilGn2askDvh0i8HtFOCGEuQGCRWrMf2HOOhmzjcTE/eUc?=
 =?us-ascii?Q?vZB4FrYRwXdHnvO1YSSGCRAry7q2QCKv2KaZNPyxdDElov0PTbJk+BCKqLBI?=
 =?us-ascii?Q?Vex1zMt2cImBqN1m9EjtqE/xcpzmDJ5dkT3GHaRuUUvd3CGzyj/w/y55dh0L?=
 =?us-ascii?Q?bOJpMtzyTwVMSjPbgT26FjQzL2GyDkMCUbA0T7WjGJ0x4C8vdwtNPrCEiu9f?=
 =?us-ascii?Q?lKiy/dX3jJAsWB35QztgfxROHGyKqmmiPB4rB6tAI9ajzIGQouX7bDXzgKhL?=
 =?us-ascii?Q?36ZbFytUcsRzmpkpH32N19vbUOscCmD3WZXhteUWQEXaObAb6twDRgYejRnR?=
 =?us-ascii?Q?JjupOldnZz0dMQOJ1AmX1rkYPTtuvF14SmhEE/6GR4dWAEWL0vyBr2yeHPkX?=
 =?us-ascii?Q?78jj6xJr7/qOiBSG0H1OpuCnUgwJid6PenYy1kuyfDjFFpz9V7ksYuSqcuPb?=
 =?us-ascii?Q?2+ImXrmAqu0sh5sn/SkfiGQ2LSjZ8Y5CVvy98VTj/Ci8raLd2z/rDDdUcRxr?=
 =?us-ascii?Q?Tqj48GUI/UpBe1g1xe19F5F5YGWcN0mS36kTSgctLmvIYYYchWKgYYxZV5TG?=
 =?us-ascii?Q?ZMKY160WvmD1ZuuYuQoB1nDbT1c1drJFHl9q0FhTS5NvWXzQ+MALM0/P9xa+?=
 =?us-ascii?Q?2+YlJc9KYg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 274eb296-a060-4595-ea7c-08df398cc67c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:09.9263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMTmpAxh1NwRwTfNNNy8DU9etyHE5E6M/tRdZNAUPZtI0vBNSnbQcW9I+lU+r6LcohD3IEMGZtL58kHQV79rmfIQTRva616jsDMnJUUhJY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249257
Content-Type: text/plain; charset="utf-8"

CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3.5=
...v3.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-jsonpointer_3.5.bb =3D> python3-jsonpointer_3.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.5.bb =3D> pytho=
n3-jsonpointer_3.8.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb b/meta=
/recipes-devtools/python/python3-jsonpointer_3.8.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
index dc39b0ea38..bc63f8a4cb 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b7a=
329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI[sha256sum] =3D "81f28618a019cf1b011a6cf757439737972de1ccbeca2e1f86=
dfb4d661800792"
+SRC_URI[sha256sum] =3D "a627a255641390bfb4d51d4cfbb90648078ae855b45804ef7e=
19ea13a4cca355"
=20
 SRC_URI +=3D " \
 	file://run-ptest \
