Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7219.1793698101544969562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ToRGVXPZ;
 spf=pass (domain: est.tech, ip: 52.101.72.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaT4/3DQ9nlOW21ngUWXGxfc+faaFNBScJP00NVs0ZJtIn0fhk4/P5AfKiRHF5nlMfWtYtEhrDyRixr8Q5rbOiijmBBrT0BXOTz6HdDjwJaDjnzso3qNo1cuCDHdOyg+4n11+aMBuTFhymytiQDRsQUl7cmcn5uRE88y3HxOGMxfFWeTvZn/T4ebIejghc28iZzcjolsUmzcFI3IhpdqWAUpjTHOeAH6jFGJ1ioTfsyS0HLBth1uEzVzPkoqNr+yyYW1+VN0nw76t+bEQvEU3KbD9zFc+iP3gbJFXGxJAUrSxMUnLLFsSAAkN5J9VGe5wwUqSEGDxMXkcqpdq1rHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv0p5bmaPcCgmmTWidoR4Rva57joo1ECv1SwOuhHoFc=;
 b=dAYguTGqg1FuyrxTH8ix7XyDorOWDF70dUaAbSR+MV7e5NtsRuWrQ12qLjAxSJp5IWP+HEhmlIIb/TWNi80JqQBYIG+yece0yW5QCfcM0OiUy/76wDGBPhv9XpzYFsCBJQsr/83O/6JVR5d7NAOlkYtuFSSybe1TJ8xOMt4u9d0IIlKdo8lQbReGfALUHrz9prFHjhvnxVTY/hC3kU6153UO6oGUVMh8n42B1k6CFGBuWdWeBn2RTDrOKYWqG1vB7B5wPjM7zg0fAhNJnOzHrad36/8A0l/7e9HB74f23vicRz+QccNwapp0NZkDF9GjyRgGuOq+NI1UDiTFd/WqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv0p5bmaPcCgmmTWidoR4Rva57joo1ECv1SwOuhHoFc=;
 b=ToRGVXPZk0M/QHkQmmVhlLlmPGwm0hcFsdE+GWOhQg/y5IEi5ilL559uFSvft38SJaD5dJp1IdVJRPwCLAeNkpN5qjeHeAXY6Q3lX00s2JMNVOFZJlKPmHGK141SI8C7lMUnd1gIGYI89tEJnbw1Py6n+mm1wFtqaiev/BppzarByyGLfuRSyUBfd68GP6GyC5d/sauFAADGMVHCwt36+RJW/F529EUIoOKue2tRbOxyN+yNp8tBqjdaTgIq+vKRtxbxWbvyty569uir3XEUxKzfdbMKgTMnbZseZJdgyrj/TVTsZCbLuAXWxwKntY1iUTh2XqvdczHY4DTlt9p+RQ==
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
Subject: [PATCH 11/12] hwdata: upgrade 0.412 -> 0.413
Date: Tue,  3 Nov 2026 10:27:59 +0100
Message-ID: <20261103092800.39286-12-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 962a43df-0983-4961-ec08-08df398ccc68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: UUsat0DVyBl6JRGQ8yPzBHXMl1b6zEaOOdo5fsNe3fQtnwKshXYQBZ/SNAryr4yOZ+mzdYYY1w/YsO8ZTp3TU/Wam3MrgHGY97zJIvDr+4P5IdmisKPpTU738CLiER1Ef0g/NVOP7/O+35PX5EcNUNG/0TidntGSXyCKotLRik2TAOOeMKCdT3w31J34TgpOAFEES6VmFB5wG/dkE+YlJg3lfO3kC0LCaAGqFeuCL4cfV7vyzMANQ/+aGm72Qq4+YB8GSoUmgkc6/UAQu/khoD2xaP4YIQ+rHKOv7HLoE0+KKEzMXxfsphTuhGK6ZtxJPuyQK9jPIdSWnhHKVzCk4CB2FgebZxRHovS/nUUNi5HeRTgwq51i0p5U2+fQxx6M6mgch9RMTV6KAZzWqKWsKCNXu5vruktzCdTj+oPwoHoFhKkRMUUUfWDdpvqH7S4RPIGeiYMGR/VYbkncOWEeCN0Oyz1we+zX97QEUW9Blyoiu/RZ5hyLVKh2B05rZ1mgWzXbmJQKP1R+s7drnMszUul++nCTs7BeZIPEA9rVpLAw7k3v22ypVvZ9eUPqMIKhbT5Hj/ZoskdSZkRGGBy7iFhAU9th63PbBSkKuEBiJhsnPsovFvJdU2hTYgQPbAGLJVwFQEzouuVMkaha9pbAVnZbHMJ8TudvAxOZ+gzJzsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iFzIRmOsqkVecd373YiDUqjZE1Jf4fWBMxOTBHHYo+5IVjCmVSTlbLXtUNmk?=
 =?us-ascii?Q?57j9CHOEcZ/FhFxwdVFpX8JzRK2OTl0xADId2oqA8ZmflI2Z1w4m1eRxITYX?=
 =?us-ascii?Q?5/8MOfIG043/skTrPxglMKH6qdJX20zFP4h0xFWZtt9HogQMBp2PDQ00jv98?=
 =?us-ascii?Q?0XmiURiDZ+Vgw9I1feKwB1S7MpxAA/DnX4uP+tmvAuI+hpaA0ElqeB9emoPj?=
 =?us-ascii?Q?I0SCZ3MGZ78QphJnSSGUEDHXSmGd3qgFBkz7LaCTs47zDm+0xrr8QUYqc6vr?=
 =?us-ascii?Q?OnpYGIxNf77C/EsQFjpyWskO5bX3d23yqhOeqR4M0AN3X5oCnnZ4/JUwlmQV?=
 =?us-ascii?Q?lHQT8AtuCbeh2c7d9+jfAb+tvJQTa4laYjSF2KsTAPijmxaOVzcDpsZBzyXm?=
 =?us-ascii?Q?+9rthhu38nULBSMbhZ8PUkhEZ4GrSGpGo7dTmZNOIjxJtuBQNpBxsLQq5HQQ?=
 =?us-ascii?Q?B9P8ZLP6bD8pt2BltBAcrJXcY3O91ttxEVKDlZQGoXMPhm8MLnXF3Dss/azn?=
 =?us-ascii?Q?t10C8DzKCl+J/vvWLjJxFwQoTS+hi4TJX87eFqNDHpOYYFHD5YV7bUJVOoON?=
 =?us-ascii?Q?SPonwJHtAN3BDkA8DOcexCRDER7Sw2rUBylj1cTeKK0mFmu9cSrOdGPTQuUO?=
 =?us-ascii?Q?L9KKkIB8Q7GuRFBPWAT0msxk46g8lAxdDdOQaQUwjwBqG/2Fdcl763QH0H+T?=
 =?us-ascii?Q?ZEQ6OYuce5k7LvL4E4oWn2ngCipVUjHjznhBLhMmMK2BrpDdH93JByG9bwuv?=
 =?us-ascii?Q?HZxVweop0yHIKt4IlqegcVl69a34ZFGKQhjgaGvMqb9ONlSb1E6xv8Igo+Cx?=
 =?us-ascii?Q?UWeOoh2XzOLnxQNvucSj2CkZDyv1tJ09Jo9WoiYrTscp2qt1oTkh4GaEv9B5?=
 =?us-ascii?Q?1FIVDXI51l2X5bQE5jcnBI+tFvYE1DUuugvMhS9l+Eb8amdIVts4JZYggJvR?=
 =?us-ascii?Q?vIRo7nzPExbwVwdRhSQuiR/WGqXwV9z68hKsRo6Eg+iqco2D2sQtMdFzdJJf?=
 =?us-ascii?Q?R41rgiZ3mCaHE7/n2QJZyhq15WIorQRe9d7Y25MYwNFGkOkM7YTfPQm61Beg?=
 =?us-ascii?Q?kp1yZYcTcjda6CtKITAW9k0oPgKlLp6hbgmQiNIjU4Enf7ydoOByFW/zWgO8?=
 =?us-ascii?Q?uhBR/VoW0DANRR8WOIJ4AH/AwxjvSRkzgRmOov87ccW8FTOhXrV+sSgv0xic?=
 =?us-ascii?Q?XASrFidj/PqQZlX+xJB2lHa8Qe36XrarBmDxdUw7CA0sj8p3KWdd6euaLnAJ?=
 =?us-ascii?Q?U0fQ9+jN9lgj6SI5b7fbmjfa4XwmfdCw4edP/p39CveD4q0iE+85IPmcF+HS?=
 =?us-ascii?Q?ePBfqRvoEpxmkoh1xHdsAE6oBaqVciSlmdB99slm9ZJ8ejeiDsqaMdXeVLTI?=
 =?us-ascii?Q?EKnRtvVMxuAS8fMqPS2xQAlIox1KgxuyrueUyDYrK/RznCGxx83phSj4e/nH?=
 =?us-ascii?Q?GfziNWf5P2Ah3XWebS5Saq8eUIGDb9cV3qiY4MebQSBiIyzg1DrR/2E159sE?=
 =?us-ascii?Q?E51h6hsZueThJ643WZkDC8Hvtm085kd1hQE2dO+mFugL1kYXt1Ect13G8YBx?=
 =?us-ascii?Q?KkcF1dBux1SC2q3JEkjyGbMfX31CXOH/hnFpyD/YWfgIKVkBPKNdhSeClTSh?=
 =?us-ascii?Q?qKUm1+LgZuBVGFnOkvZPdvzaGFoXwRbaIUdAesuMufCAa1FjEtOv0cIsz9sD?=
 =?us-ascii?Q?1fbJ3gwLhBjX4H4JOJvFNVkcE7vqf6QY7FvElJmOrZPFRrgYAbghAeqqSljn?=
 =?us-ascii?Q?8NvMjVicxg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 962a43df-0983-4961-ec08-08df398ccc68
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:19.8695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vkt0jIhNnm9KPytPLOEt1RvxDY9kUQ+W/sMRCLUyZH/ppdW5WDzFBYCO9Q86mQwXukiHs4bb+k5Hbnk1UNpCJwIWDTPFFmYaVgWvfy97WE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249264
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/vcrhonek/hwdata/releases/tag/v0.413

Update pci and vendor ids

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../recipes-support/hwdata/{hwdata_0.412.bb =3D> hwdata_0.413.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.412.bb =3D> hwdata_0.413.bb} =
(93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.412.bb b/meta/recipes-sup=
port/hwdata/hwdata_0.413.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.412.bb
rename to meta/recipes-support/hwdata/hwdata_0.413.bb
index c59654e138..cbda8816dd 100644
--- a/meta/recipes-support/hwdata/hwdata_0.412.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.413.bb
@@ -8,7 +8,7 @@ LICENSE =3D "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd9445a5=
7"
=20
 SRC_URI =3D "git://github.com/vcrhonek/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
-SRCREV =3D "816a9490ffcdad1929e0e53f79c500e1aeadd492"
+SRCREV =3D "1cf7032160ad57e2eaad36c4f23eede1edd8203b"
=20
 inherit allarch
=20
