Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.84])
 by mx.groups.io with SMTP id smtpd.web09.80775.1629439941176682423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=mM7qQiA0;
 spf=pass (domain: synaptics.com, ip: 40.107.92.84, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTKH5UazjEmxGhiDLDlfgiXlUrEkjJWnuc5k1tHp7rWu5PJ0qNwBSI/CwtAJGgDYArDVYEYCytjOtyCTLUP+l4Br3qHZbZpEG8HLznEtS3JG+dFMHzd7qDqcjIg6+/m0/hcHOeE0nYo4NubamwKlxSCqfA3NiIaXaLDEQm3MxwAAMkoyw5Fs4SPQV5Je41Mj2a1z5Jh/lQf52fihHy6XpzSDpJ8nweC70Up72cMndxsEx4UNkBuS8Qd389sH5Ze09eO1G8Ntzqyt5kjqnFBK3OMKfZAfLGEn9fGqJr03D2J4pib8p83EzVbzJpgT1sURZSQbtDvsaMV9TP+jsN7lcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR404LZLIcXlKt4fas6XZHSIWIC5C5iVzLIf6E0Xay4=;
 b=nFoXb1olg3kLCbJoHIeJYSd3lAMjnNL+L5SluLzhwc3rA56rgJfg5pAbRAn24dgwmlOGuyO/Rmr26Pj2fasnxrksOEQHZ8AX8ylbhAl7HYCWVkRi7aS/mFeOARaLjbIyTunxcvCr9bR1j9oqQuHOTKr3tc/wg6xoJjN1nnUhsEd5gFrp5/jBbIC7icIzp8cgMhCgyduy1qzawvWfZHMvc1+ndZhtCFbUYHaPukYKgsR5zAnqHqBg9EQm5ZQxHopfRst3npK8xsH5MipE4aN2xL98DXr6zbY+tqn4BF5ONSMFyvP3nqQWecX1IwlEz8M1ascSM8Uryd5g6qze/w8WrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR404LZLIcXlKt4fas6XZHSIWIC5C5iVzLIf6E0Xay4=;
 b=mM7qQiA0mlj0DuzHP/C2/aCEycBikjCERPxbwnf5XUF2h+/M8BIIyPn9c56yxUS3U1L/kOK6/sT6eIrgTqd81U7ElNgfY69ElRqm6pur36phQgEzfWEGOG6uZe5gHft6NIjltsLsVitGeBe4KaWziFSeYZ/33Bh8JYlqq+16soo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB3468.namprd03.prod.outlook.com (2603:10b6:5:a9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 06:12:20 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::f093:dd49:947a:f1f7]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::f093:dd49:947a:f1f7%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 06:12:20 +0000
From: "Hsia-Jun Li" <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: Hsia-Jun Li <randy.li@synaptics.com>
Subject: [PATCH 2/2] machine_dict: Add Android OS to it
Date: Fri, 20 Aug 2021 14:11:50 +0800
Message-ID: <20210820061150.146518-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820061150.146518-1-randy.li@synaptics.com>
References: <20210820061150.146518-1-randy.li@synaptics.com>
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: randy.li@synaptics.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from randy-t14s.synaptics.com (192.147.44.15) by SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend Transport; Fri, 20 Aug 2021 06:12:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 968f5caa-c74e-4d36-04d9-08d963a177d9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB3468BDDFC9DD878EA3CCE68986C19@DM6PR03MB3468.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1EIs0461OyQjVu93cU92FtY51HLT528fEs0wEPT8HbfPMMZkgjJCmn05qS74CExhbtXSlkvMcrzJ8B3m/9f3upsP90irOKvWURJPngfotk7AlLrva8y0P0fs7Xyh1URu6RzoJ+Vup5rcSBCFtECiEhmaTBSLyecIUuM0jw4F1Tgeb9jQIpJUK62O3fqVFInoIKXUFihL6d9goKwEkRqojQybnCuhb2GetLh+cgAgFTsZbQHenPuMAZT5pBx4YcDZQ87VRE6/06v7TbY5VxQ0XLZMqB4ELKUJfxAfTzk42ppDnokxnHSE94iTqskpkZlP3JiHE6NdC1mCzwJmd+l9iZnlCH0vporMH5AMADluiwFeveIEgHpPIG41Mh8qGjpjABtG7yToMN6hotIArXPEzcdxX7kzOKgh/ZZHPgbvTuDiXRzcmE3pmrxz04sT3DLJoccu9UIxiOIYmziQFSmsCVIcwQTpm4YmqHUDdZ1o3e3mvLEOOvQnS8U53fnBLv9E8OnfFeCWwTYIUZNv7RSHl8Yqes/p83BR74T0lw7UgBM4p9NVJo+2Tk195ajjeZgYmoTkO36KuRmUTjST/MW6Xdo5UFIOK+mZ6p5I3Vo55PV4z37E/348g7QdccXaWwK3k1xVL9L8L92LGv5BcpxqWOp7yfMf02ahC2LxdcpQbxUQnR2ZjqDphrUSpHBdKgbvKBNEroKs8DR4Ks+V4mnrmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(346002)(136003)(396003)(366004)(8676002)(6916009)(956004)(316002)(26005)(2616005)(36756003)(2906002)(6486002)(38100700002)(1076003)(66556008)(66476007)(66946007)(4326008)(38350700002)(478600001)(6666004)(107886003)(52116002)(7696005)(8936002)(186003)(4744005)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NaQTuuexDZeO+8IbYYuFn72njaZK4Rat6yeGgRJnZCd1Zn8NQ+wTzem6jyWY?=
 =?us-ascii?Q?ekcQWI+IQqvWTVRvXd7ADBS5jV9Ndw3w49FiZyuwb8GPZdKVrAv1jb37w0Vi?=
 =?us-ascii?Q?GpJMP6d6Q63FQzjnjNX5gWqUp2XWh0zi7qY3f/9GR4j9cTVY10tOCKG/laY6?=
 =?us-ascii?Q?tL9FPBQ9cFyV4tFe6O6bxGvfhRytoOwwAbuz+pokdNTlvbC7/YLlZNVQddUU?=
 =?us-ascii?Q?PtFfCI/nkg8k5PS5zqmerYpDySZdcyZGdqKxbfABYUWj9Ee6vF6HUYa7xqCi?=
 =?us-ascii?Q?gIeZKmis1tZomkL/UiRaQmxmOQ1Ms5ACqUn5I+IFA+XHYX3uks6uH8eCbE73?=
 =?us-ascii?Q?h//xTPJPBh9vYlHP/P/Qh05fDtDGDsfDdZSTyI0DI81g8iFHNC1BplaG1LG3?=
 =?us-ascii?Q?6QvKksGl5AzZigJLvAjxVVTWqUgKTKy/dHaS5uO0jnzWBeG6YH96UE6m2vG2?=
 =?us-ascii?Q?pMOwZ0uxpJ/hZSykjnknWb57HxADX81SFi/zlzmUCwfPY2FNwEFsA09bPMvx?=
 =?us-ascii?Q?e8cINk/KKCRTUSBfMvq7JlP0Hr8wypBYJ9l2Qc4KlfgLAdZPH1q7/dWGIBuW?=
 =?us-ascii?Q?go6Roqc0tkEuAOs+c+WEHkTSG7SnsWDxoHOKkxEJF0LOfwPapCsmceCvJAXE?=
 =?us-ascii?Q?kMwYa8bUZ5gkUmrQfc0B1NbHxZykLG5ZoUeAKlSJZPWpmy/nCvxRQp4a1wiN?=
 =?us-ascii?Q?6nSIkyfkAzD1bylBPJe56Ng29aV6Xh+EnUclHH36a6blv8jgOcJlN4s3Syde?=
 =?us-ascii?Q?tKEZgYtbcXvEYjl//DMvrRcd9P6wzDMhs7daCh4xmhDLtaUoite2Mt51ViwR?=
 =?us-ascii?Q?SHomGw2YumbnddIfQsOGqXGnR9MPrM+Tu3HRjCfCAesIthk6pKHfBeTshex6?=
 =?us-ascii?Q?6O6AzYuVK5pYqctSzxanJSniuxuX4DiG+14IJ3NlUWA43H7b2qf9aTk5dpjH?=
 =?us-ascii?Q?NuAk9jNg1xasrCiFYBK03VmWi7m4ZrKVLQJ/Y0f/dBsLN/KJDpio80oSHmye?=
 =?us-ascii?Q?AXSuMBGKYE9e0a2gKOkmuDhzutCA1BUwUkU/w/p6cSfcPXHctd3SwGlstYui?=
 =?us-ascii?Q?2Bb++j4wGdaDoWq30pKU+1xIAMad1NcEYO3FQXzFeKFG9Him8mdYDjx9N2/C?=
 =?us-ascii?Q?zB17gCHlmpNBptXw54MYYwYA7ldGxRj0TW+giva83FSbLF0hrsK6D5QSApKj?=
 =?us-ascii?Q?8SR+Pun7aZmkBbnNcWowclbMQdR+h1ZAKymoQOsksnqr4IwCGDLJFmx8MEig?=
 =?us-ascii?Q?sYenp2vjdpsyHIS2RHb2wLXYE3TUPeAXYQSkZgA5CElminwC0xY7gfjGxK3j?=
 =?us-ascii?Q?iVwTyqQAvcwFb0UQiLL1u+uP?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968f5caa-c74e-4d36-04d9-08d963a177d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:12:20.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUStiFGKbtX4GXsqAyhA2NudF96JppiAMFkt9pvPeXl9qejT1WsR8L8a2jLbjVpfC/Ujv/NYjqIIVAO2c3XJ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3468
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Hsia-Jun Li <randy.li@synaptics.com>
---
 meta/lib/oe/elf.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index df0a459..46c884a 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -61,6 +61,14 @@ def machine_dict(d):
                         "microblaze":  (189,   0,    0,          False,   =
      32),
                         "microblazeel":(189,   0,    0,          True,    =
      32),
                       },
+            "linux-android" : {
+                        "aarch64" :   (183,    0,    0,          True,    =
      64),
+                        "i686":       ( 3,     0,    0,          True,    =
      32),
+                        "x86_64":     (62,     0,    0,          True,    =
      64),
+                      },
+            "linux-androideabi" : {
+                        "arm" :       (40,    97,    0,          True,    =
      32),
+                      },
             "linux-musl" : {=20
                         "aarch64" :   (183,    0,    0,            True,  =
        64),
                         "aarch64_be" :(183,    0,    0,            False, =
        64),
--=20
2.7.4

