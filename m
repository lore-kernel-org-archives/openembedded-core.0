Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.1444.1614284648021450902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 12:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=Gu3MYR0Y;
 spf=temperror, err=parse error for token &{10 18 spf.infomaniak.ch}: parse error for token &{10 18 relay.mail.infomaniak.ch}: temporary DNS error (domain: spinetix.com, ip: <nil>, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c12Raf4qrYbFcPPEWzfH9sm3TNOjAhZ2Yw9+qqPnpx4A8WgMgs0eOqhs0D0LuDYpNdHYNxylDtD2qtDoV5mOCdnOCxpADVDTnz0JZ74kfU3e9m8yH9uZZ8vR6uClFYroCFRaeiJv/sxlyAT89hR8sNuSILzlkMd+7JMbhf+5ykd5hJs6pDnsFppS/cRXG9jWkeeDBlOX5tHQ5QwXI8kovetcjVEIjCF3zOpzvqM9Swpz1lYlSzpSmkaoBfUEL0qdgWrPqUUKliv6CUS24st34Hx12Uz0nDxQ/fgeL+96OxeWE3MQmwXRsF/InFYP7ss7sIwXNFl3IvWgm0xA0fRoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvI1Fg9C/jt2nn1w0DgKd+ltBuNIPJWovvqhublvzNA=;
 b=SUEI0agJLb0gyEVwGeN2Yt3ub7BdGYY0MBAXm2WZ1Te210lh7pG+aXMCak3dv5UloYcoqdA5oAxSyGLhEsHjqWhrUhmhSE0u9jG1JTL38x+VAEN/a0VQlx4XTJ8KzysHm1Lebr/g+15EG6aclHHmstKzkWfHAqL7OTvyCSfsmUIi0/wZOpTf+y3S5GcaQNwzVG4mClRF4dHTWoM2XykE2rFdHyDo6uNnnqtoHSb3skApQnaucg8jz6CBh4Erxu44ayW+dbLHAk19s0JsfQyecuyCJojh2PRCE6/0JS0wLzn57veN6Of4VlHsfr7XAA2vzWjcE00ifN0co0DbZ/Yzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvI1Fg9C/jt2nn1w0DgKd+ltBuNIPJWovvqhublvzNA=;
 b=Gu3MYR0YUriSemeATqabZ09PcYoygldSRysRxAAQgeQOwlnVPvKtwFCEoDpJ3cmV7SgAMzM6GK/Roc1OoTZfW9OUOOyIQp3GBt9gwMgx2QPj3eVrWTmyhIKqoAsw4O4mcTFPXtbdJJUpJF2Wf6JGmxOd037a34GEW7l+5g8YBWw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB4950.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:5c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 25 Feb
 2021 20:24:07 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 20:24:07 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [PATCH 2/2] packagegroup-base: do not force hdparm and e2fsprogs
Date: Thu, 25 Feb 2021 21:23:27 +0100
Message-Id: <20210225202327.29608-2-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210225202327.29608-1-Diego.SantaCruz@spinetix.com>
References: <20210225202327.29608-1-Diego.SantaCruz@spinetix.com>
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 20:24:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a5c9ac6-412a-48e2-b533-08d8d9cb4d1b
X-MS-TrafficTypeDiagnostic: DB7PR01MB4950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR01MB4950C10CFB4505A48EE63279889E9@DB7PR01MB4950.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ku1Ba1LhBh8XNC3EdcBzZ1fDqLMQVBXD8bmagfGbzX5jJp1mv3Hut/Px9sJPitiDMSy7cub9HYW1k4dH9ySY0SAnpSJvWSR8PnWZLiz4kPk/ueZbm7kmu+i4z78anmdN4eYbUaYst3osapmp8hk6jOXViDY1/13XkyKLl8y7RRjnajo8AWmuNmtEawROE+5iTN15z08lVwtDaHqJYZccmAb44COBlHfknqHmkYCYtVC6UWZAbxMyW9bKkWrY4JfK3GwugZo6GJvUMRdl8mpT2W4ChR5VNga3r7DT+pi+vSBFb0Z7FP4VcX/o8c2mQC8kBDNyh8bJvYI+2oI0ePVSFWvUIJZbLCsn8MG3U52R+2UV0d1UExDjZq5w7J7WkcCJGvlb72KgdxivTuMkjbbjIgp2NVexPvXBgLHHxo+LXnElhRMe31rdouovJ5k7WSKRFVb4bvNMABsEb5kUOwwqSgGxMwNSlPEW+GPHwkfolu7Yutwxjggy5/AQ03dhrPWqqOd10W4+Nfye79mdbpWAxg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39830400003)(346002)(366004)(136003)(376002)(66556008)(8676002)(66946007)(83380400001)(36756003)(6486002)(66476007)(107886003)(8936002)(6512007)(2906002)(86362001)(316002)(26005)(478600001)(52116002)(4326008)(6506007)(956004)(2616005)(5660300002)(186003)(16526019)(1076003)(6916009)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?eAkorIZ+acdIwfdfjPsG3n6fuCCWdT714Vn8OBiTudS/OAr3uOeCrPXT238i?=
 =?us-ascii?Q?rgZNUl4bFIP7p+T91+a2uswDGV8AE9mLGkrpk1XjV0HwJ/Ts1ZSoWQaT3EX6?=
 =?us-ascii?Q?UxvU7QCDzUf9HMUYvi284UeLm3ENpRv/NXI0LLSbT0erdgfw1FLU+DoAZ8T5?=
 =?us-ascii?Q?pAjSNgmzS3LRlQYm9QLcd5i8RHiAuCuaVtRoQvEr6hyAnN80uBHoBbSqH9oc?=
 =?us-ascii?Q?nXKt9rcbKC4n30IwjsgcVtthUxGTUU/4zQJYGC13KJf3WbmgFSz3p2R6xOV3?=
 =?us-ascii?Q?VzWUKfP3rwMrH3T37IBc2KItMerw67iVhntcRyIDpkYjqj1hDo1v/7HcTAe0?=
 =?us-ascii?Q?GgUENRTVB9GL3CsqV9yLCtaVTo8kI3QmyLZ+tsiAp6DCQYlFSn1yC3VE14T5?=
 =?us-ascii?Q?YLSi5N71F3mGo5RBwUEnwLOZ9OWaAirfZJqlaJ+ygyV0yxRmkysFkCqpTJU9?=
 =?us-ascii?Q?zvQhcNpjx69oWiCjhHGTmmsNy1nvQWqbseKl5YDlj2TS8k64nWJ2wo+AANHf?=
 =?us-ascii?Q?MOUjC450UGbbU8XMm9JcCcnKoNCzNUqiRGe6bADB+N33qilDaOGoSPCMyx1H?=
 =?us-ascii?Q?qft4H8+Sr+ng6PQyA6BEsIk7b2haraxNkA7AXF7u6R0XNFnG96n4SfhO1oa9?=
 =?us-ascii?Q?xsFy+B616lQaEE0vnxbRhvYF1OsyBiF5Y+OuvpXQQx7JzwV3k+rnQL4EVUfs?=
 =?us-ascii?Q?951SiAkFxUYaJjFv6g2l7iQI1LfMb+EPQpzjHQsBVUfJfpyEkPOhF9xEwbdZ?=
 =?us-ascii?Q?Vap+LjTBeGn4LvC/XViqwwelXdvvt+zG0SumEIazsl/fMvTn51Q2jSMZoxzg?=
 =?us-ascii?Q?GPciWkftVRHfUr4isFTHVLpWfXInPLaoK1b25wYkPyZwvT6oQDRsE3yQP9+n?=
 =?us-ascii?Q?+4sAVBNRgTFLbvWFtOBtekz08yyxQEUADRiBfFyOCcfgOoCUOhM5QRf5MiTa?=
 =?us-ascii?Q?EXI2kB50rIDTP/pQy0veQV4K8qwtJR2IS5AyhqJgyFh9HD/y2u5ld1VEqQRT?=
 =?us-ascii?Q?wwXsCTPEtFjHOtR04q3TGorQCCjFUkeP13Gy+/WjmiXJSyMiM3dOWg1jpNCP?=
 =?us-ascii?Q?+iSax8y+iftbRarjQvx4PfywUEAgcdvaLrAuQsFMZrm6ZMTS0klzoZhoe1K4?=
 =?us-ascii?Q?a2Lwg1KG7ilE4wtt6fn9IrHMgPVCi9SQIZcX8ebKyVZUVW69X6SSvIqNrsCa?=
 =?us-ascii?Q?o6GvSe4sMR831kLSaFbzg4xf5NOQPWLCZcmjrWeDZo5UkJH+eUg57jGJUp+1?=
 =?us-ascii?Q?+cJOLyLoQfAmeTuu/RrEpGzPIiGJX8fA0CeYqMw/OlZeU0bB53hBaSEBHhL1?=
 =?us-ascii?Q?qMT7ejk/jEANziv5C8MzwT9g?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5c9ac6-412a-48e2-b533-08d8d9cb4d1b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 20:24:07.0613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4iTArNrsFSELMACQtuHaoHn7dyvICOP2GncaPqvxc/v8OuSjGe2tVNj4qWknHHlAEYAzdNMrlnYcqnIinLZ4nOm/+hl7yOFvf8+DvKlWQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4950
Content-Type: text/plain

The hdparm and (base) e2fsprogs are not always useful in all machines
having ext2 in MACHINE_FEATURES, so do not force them to b installed,
make them recommendations instead.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 6c8c978253..c882e15266 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -157,11 +157,13 @@ RDEPENDS_packagegroup-base-apm = "\
 
 SUMMARY_packagegroup-base-ext2 = "ext2 filesystem support"
 RDEPENDS_packagegroup-base-ext2 = "\
-    hdparm \
-    e2fsprogs \
     e2fsprogs-e2fsck \
     e2fsprogs-mke2fs"
 
+RRECOMMENDS_packagegroup-base-ext2 = "\
+    hdparm \
+    e2fsprogs"
+
 SUMMARY_packagegroup-base-vfat = "FAT filesystem support"
 RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-msdos \
-- 
2.18.4

