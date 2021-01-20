Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.25345.1611132264404706631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 00:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CjLuz6jG;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhyyzQbyCXCSZNIGaORHwkpRYeaglriz8O7ThTTZjYTXXWvdnvzLYhoDqOIroqVPoAbm6lbdw1Hw954i4JBK2zvIEjiI9jMAruUn+A/V6gQvCVpP9kyJcSI7op69Py+ZPOq/acFOxJknBItODvCi2nXAboQfZo6pFpywjc7Iy6DNKck0f1cqz7H42YK1npjGSS7C+6LF+2YTRu+rpq+NT0kUtH3fAmWKSpLBG58RqV3VFy3317E9qfHRRftLYsBXnov8QoDG+bLoYJ/LNVXdmShJ/F6fS+KCEHsnxtWrpEgZ7hJh+BhRYKEbN4GKhBjfaCXlePpcECdtfMbA9N2FmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ8uJXNZ/F/E+AWY8mrdtioVB9erTTbOPhDP+kgfNM4=;
 b=BCccNo7yvN46XLejT9swwxKp2DA0PbsEqhnDmYdj9Laxh/xMvbiHHpjq0YAbYjcsZRujsmffuQFj86nCF/QxoWWy6eytNUZUG7CUDvdbMdbwVzPMJpjOAH+feJ3XFi+0sJK2v1AOSK5xCrFmHqdLrsWavWt7jOI5b1S1mPIU+pQM8Cw6KgJvDbIkYUCC63ICFvBuvG36Wr31+CflGTtJxwcNCvPhvjJgVIyquZCXJng5dJMHYZorRCmtBXUh+g/MFjI34Bmk1JodiDaN8gAgXVOUIA23BRdfLOs96MUIxRx1u86+pVQMrUEnYX/yorBn0v/wobZyQqJam2nQr/xR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ8uJXNZ/F/E+AWY8mrdtioVB9erTTbOPhDP+kgfNM4=;
 b=CjLuz6jGD8PvmtJ6aa8Y7nxepTFu+xtv5KM2QEF+/ZxXfopTWVNJJrqk3qVrTiPya+Nzq1ZMFUKsNMU8s3OjmHTK+od2jEixAY+TMoFtBEJhzPP5/Xy3/j1LHq2IiR9miq8k3eJVXI1BE1kaF6sqePYurxh99FRWq6xhmwF1z6w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 08:44:22 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 08:44:22 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] oeqa/selftest: binutils-cross-x86_64 -> libgcc-initial
Date: Wed, 20 Jan 2021 00:44:08 -0800
Message-Id: <cover.1611132189.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 08:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4c02ff6-ce0f-4bdc-a5e0-08d8bd1f953d
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB457403CF1A6CF87AA5BA8324FFA29@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KEMDOHt9wMYYujAIIggoSJfLDhiFMnqYpbG/0VsLGeK7hvKCaplEBIf4QbULz+4OQAiCJkOha15Ef62aTli56FtvXP1e8o8IO7MxMupAnZdF00vbm2Mjuf1kEBM+C4MQPpV4kdO5sUyvAZDWAE3N9h1Hv7zGo3PPk4g81UB+Al4/Ne99Wj8GaLlJXjE3TUA+a7K8IljBsepMeWcqcm/6pvGVU3c4SEIaS+5J2xRFq1FHC/p/H/hlZwW5xuGnAMLCyTbEbNwm3kv2+w0ZEJMnDgLezVH5a8WZtWKQlnWf6/sob4qasmRLsp9aLa9/NzFpW8/bfAmaYfcCpqNQSF5IOROv8iL1NUbcb/2o0rH4Jtj2/SS1643CRPUYKXwX8P3py6QgVW3AfgDFsF/7+9IgLLbvRK1oeOWUjp/HXNC2mVAxPKMwWtMIx2yLOHQXBRxptoBAq4cCCBOBnjZi8WWIFg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(376002)(366004)(346002)(136003)(4744005)(316002)(6506007)(6916009)(186003)(26005)(66476007)(66556008)(52116002)(956004)(2616005)(478600001)(6512007)(66946007)(8936002)(5660300002)(36756003)(16526019)(2906002)(8676002)(6486002)(6666004)(83380400001)(966005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?w7OvnbeRWDneZ/Qhtoza6Kfo6F0KzzMVR3qmHWvAavO/sHrjr2VBjDU5QM5g?=
 =?us-ascii?Q?ZhqB8Cqi7CdOIzgmkh24Rz0SPt+VFCu2AczxzN7Y8Uv5KXBMXCIwEFJRLeOh?=
 =?us-ascii?Q?BpwyDYIUOJ5NbAQLvwLu68whaQADglcf9VXo3pJpqlEo3jSe/p4RMhKgdG5T?=
 =?us-ascii?Q?vS7j1YihjYC1Ao0mUWtVkk6pvh1yWHoHeBQ/N5lGVnItahCT3EW/iMjTaMMI?=
 =?us-ascii?Q?pImWzV7GpbqjFfLXd64gnd9B1VSOH+KCksKArYJsPQqeytiRPZ2sIrDrK1l4?=
 =?us-ascii?Q?m1BlQ+Ka/mWxPDDox3I+BamoXYAdoMqVJ3rOKzWKCL06so1oa75oMwhnON2/?=
 =?us-ascii?Q?CBUhZHniyiUf0HFlVNw0tLMJL5CIPw5rAQ1O3MvhERAc1dkDLlLcukIS53NG?=
 =?us-ascii?Q?i7iBOK6JoXjkT5VDZyhuQo6FdAjKIWeE77K0TQzGZztixA/vFyVr9OmWS0NF?=
 =?us-ascii?Q?iC1/GKh5Tv477OY4exGTzqzGfH8mqphmQIUXi/uc0UL36M9Nzy9v9WBhxsXc?=
 =?us-ascii?Q?czZk6v8OrTNYuXlAUtbUuyyR6kUMWItUrpPitOtb18f9zxN3CRzHm3VfcNMd?=
 =?us-ascii?Q?Ec9sKbmur1d6XPWlWw9VARGbA8vfwe5dNPrnqhtyCb4XFXBWWKh2hUxO89Mh?=
 =?us-ascii?Q?CoOtYKntVUEKBOnbQZO/4lslzYVyW2UfTBfRmPXlNrIRrSdUvxEuJO6cDuYX?=
 =?us-ascii?Q?MOjenrEXim1RUZ5+Z8W6+oehal5DerEMMKMFeGHevG9i2CW5h6a5RLyqxucq?=
 =?us-ascii?Q?m6TqWx4oUZyYWnwPL281MIX8G5bPwRcK5Y454uKleb1ZrGbRuHRTtVht5ieG?=
 =?us-ascii?Q?tYVwWsMDHg56Fv0hVjQtUl4QGNAIkVulvtLvDTH9AtHIG3pfz8Cpr5lzEYf9?=
 =?us-ascii?Q?tUsPFN1YH/DRVuue1fW187pY5Eo8DUpfeQAlTYJSs5CpEkOvBmq5X16VELaz?=
 =?us-ascii?Q?ryAdCWvLU6EbrBszQRosxywDCZkyY0oAFAqIkMj4uvsptK++h856a6QmQbXz?=
 =?us-ascii?Q?zyAy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c02ff6-ce0f-4bdc-a5e0-08d8bd1f953d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 08:44:22.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC1RgpmFJ3Hm/hUF6Ku2n/sTjZtp7y7OOkIy8z3zBfJEmkXbHX8i6m9ZuEx+Y+UL+dqdqMkFVsVGzZJV7W8SDkK94eCf25zHu/H6vfDdwKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: text/plain

The following changes since commit 1119d577756b386507f33669fe29dafb5579a1a7:

  oeqa/selftest/imagefeatures: adding fitImage initramfs bundle testcase (2021-01-20 00:41:39 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/oeqa
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/oeqa

Robert Yang (1):
  oeqa/selftest: binutils-cross-x86_64 -> libgcc-initial

 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

