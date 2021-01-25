Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.43])
 by mx.groups.io with SMTP id smtpd.web10.34118.1611564462593267462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 00:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mqOM5L7O;
 spf=pass (domain: windriver.com, ip: 40.107.92.43, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjAz1JGaZtrIEUbb+XGTnnN+xiyj35q1ucGiXsrS3tvQ9RPxa0sA76ckkumTb0ORH6DcecXCb8Cbbldw5OavQRM0rVZ08v7DD1QwRJsimPhhc4tBZf+W5qDzMkwKyR7hznS15g9mA7zNbKS9NDbsyRxeTFY/hFJaNW6GSWOBCg39uEMt7gMNuJdBNBulor19c1gxGLARZYLN9dCrtXd36MeboTzqMynAvhY83tZ92sIin/zVqsorWnjJWKpCF7bqxa2lRduSl3f4R6bJVKutpTBgRm0Q66uqtdEt+0+lhQxP2mmrs/tAHGTi3QK2J9bLJEWvOwGFlqSJYTIm181FUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePS2acAMy05PYWIwfZToHp9OGIL6phMgZ/dViGjSfnQ=;
 b=AqrkfcrF1ItAYLlb2v8weAhTtO4roIiTj16QWF23V2Kuc55NMbzml6bcikJtDYSokClsY0JGCeUIx1Yrbo/hM1Ite1uu4m0wvxrpEyGxee3s6wQwsgZZF5Qs4St69WjCctA+Osjtlt7QEXhHI6QxLtoIhxLg7X4bmerZId/45ozCr58/BrSV1P/aLQ3BUQcpqfvJ657bppGjeMrt44Feg1aEtShqovHFBOM302NvsFw4aNCZNAy5LzM9w5xhcDTeLlczZZ099C96SYsH/MsOGCOSsRFXIHTz9BTkhYTbe65GXaHmmz1lNwGJJ2OpyEthpjKYKYOeTtwH1ecenb7rgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePS2acAMy05PYWIwfZToHp9OGIL6phMgZ/dViGjSfnQ=;
 b=mqOM5L7OLQYlKxfEJAkd+RwICq+ZLDuJ2/i8FbWXZfvZu7uXzCPY9Pk5ZTCphbxPjFy1W955/MnKkgWqTmV/tNa45/AW0jGrg274YGv05WeTFvIGE1OqmC5/AMFC3AS6Q9C0r++QvVp+hQ/qAbz69NU5xjaDJpFn6Ix9ORtUbo0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by BL0PR11MB3105.namprd11.prod.outlook.com (2603:10b6:208:33::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 25 Jan
 2021 08:47:40 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%5]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 08:47:40 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] timezone: upgrade to 2021a
Date: Mon, 25 Jan 2021 10:45:52 +0200
Message-Id: <20210125084552.11823-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VE1PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:803:104::20) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VE1PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:803:104::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 08:47:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a91bdff-d681-4b94-1979-08d8c10ddf6c
X-MS-TrafficTypeDiagnostic: BL0PR11MB3105:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB31051F1B1C3FEA8F9287900AFEBD9@BL0PR11MB3105.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RdnXcmmnHb5Eaq6Jh2bJVXG1BcuMuiuPoYVqgSyq8cOrXrH54szQVcv0DrqXhAAG98JhVEZC+xEwweqWIb5MoU7+XdDUuZnySZ88Bsj3p6GJrgEe/MDgxjISwTK4kDAgsj8EfbVmdgY7ICME4v8BZxZkCCR98w9uRWGKURKa1A0pjRC+qacI0deYow+ctIdKNVIloQDiB6sSW7Mt/YPlrrXyEEAYCeMsB9QadCARD2BmoPSDEY658/QBnG5MikIXKDGlW44z6poT4AqF/8nDHSzfD1fEFpZS+R7676EfQ3qjDyMlroVwU5+NuX4qj1BacwU09A2zsSH3AqMD9ewjYIekNfqze0ykp/78bvKMOSRE3Di08hp3XzQhXYsiqkSwng6M1C+qlvoNu5eeaWrAVoyOVTdOuIh6CP/dwOIjLxET2ClJdNXRf5BCZ7VCpjeTdZlr1ddGd1EsYkMugd+hZGCTU9rYnuUq501VkAevoKtG3x8W6DHBTb0FaSA8Lq/pdiYBSwxJYYCogXZuPWM/QvrJGX8QQXkPSRVDf8eu5mo1vibR7WkYcJ5YBWP8Rp8O9o8K9OQBb7XxAgLLXxMkAXxM19x1dPfWRF+bdMQsgVE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39840400004)(396003)(478600001)(83380400001)(1076003)(2616005)(52116002)(6512007)(956004)(6666004)(66946007)(966005)(36756003)(2906002)(6486002)(66476007)(6916009)(8676002)(6506007)(66556008)(186003)(26005)(8936002)(16526019)(44832011)(86362001)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?e9qaGkgPtI258QcjeSYdYyanJov0lyMpVyK3G20kjoenQMv4mopiZqgj1IZ2?=
 =?us-ascii?Q?IhlfhM2QcOdbrjk5l+w2PyD9rgU0QwEJl3Ki7ckfzrHZ90nBIlBYUVpm5W8T?=
 =?us-ascii?Q?c8EiGGtaPxMiA2lO68CKofVeN+i3UOOa4/KNutgP47EzTLTAWDM8oBQ8pGxx?=
 =?us-ascii?Q?iFZx0xYV52V4+DowFVknBcIzHmBC/M80fsQUtca1iC93Tb04Ytwb2UOanbZu?=
 =?us-ascii?Q?AhM3jOKZSdEKVmmcrnRbQ4Zl7St1fy4DqJnAveazFhdUVJaY7Pv1mTGjfhRz?=
 =?us-ascii?Q?Zo11wqFBq7Y/0E/QrJ8rR4/Y0oD4oK3sVEyBQwdpqEybPCMKnfWOehQCXCln?=
 =?us-ascii?Q?wwcnJT+aUrBl4H4j/ODshwadsKnebWdIVpcHBnA+bCqWsvREfkJVeThFR+MF?=
 =?us-ascii?Q?1nqi4hNDV2t2MHOB4IsCJT6Bv6WVP5UKiJLNxr/0Dfvc+PwP/xm13AFNFAMW?=
 =?us-ascii?Q?dYTB+THHTmewzpXI99Di9UPogV+dlHKgDn2E3gi1zY2dGKqf5ZjnG7pZ+0Ko?=
 =?us-ascii?Q?5v7KTCjW4OOF3yI0MgwbIZhxPiHaPwsNCKCeIxMTX9sgb5k1PuCYCC9IM0QD?=
 =?us-ascii?Q?PCL58rPBZgcVGuYzncMErmwiWg9hQOx7jkWeeJxrRnKtxpaTn2aTC7GK1jtQ?=
 =?us-ascii?Q?VRxyZ/84iGNkvLL1kU2L0r1dSPrFHrZbvJevcB5dNxH2k0zRnkPrq3r+rbPG?=
 =?us-ascii?Q?AsNLCv3VxBxldwtXjmdD3D7FqTPTGT6leSqUtNXLYPhYYJqN2ti53vepytGA?=
 =?us-ascii?Q?7QWImSxMeKGJIaxJaeUoGuWTUGdV+tQNVRC++PX8uJsKL8rZfR2OehmwAPor?=
 =?us-ascii?Q?qNLRPHND9d5LyshxTixHN4Aplx2mosWh6OpqmaXToadZgTwn11OsqqAZ94/G?=
 =?us-ascii?Q?NGvV8eVtxZ7vOgbity1NTY97R8RFWQGENyVfe1ht+Cf5rFAq0Wcq4rsVya7x?=
 =?us-ascii?Q?aWvM8DBun1/VKbESko8XCvSKUVibMzokkaQfrQ2F3JB7y0DAiHdWMZn32sl+?=
 =?us-ascii?Q?ohDGy/fd+LeypY2oHneegCsnH9r00Vkti7fWMHGaLgpwW1wWJR3VAPL9Cgth?=
 =?us-ascii?Q?AD3gEhDT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a91bdff-d681-4b94-1979-08d8c10ddf6c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 08:47:40.2522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3F+yspwK8hOS5DYguTKma3eqyfBLB+3pTfcxofkdI1GyIGvZBOHQHRB0pm2V5hZUEqdly1b+/3FpgdGaucIEC2P3nFxdKHoMYZnuPhkgJNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3105
Content-Type: text/plain

Release 2021a - 2021-01-24 10:54:57 -0800

  Changes to future timestamps

    South Sudan changes from +03 to +02 on 2021-02-01 at 00:00.
    (Thanks to Steffen Thorsen.)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 9a19093e24..a89560b424 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020f"
+PV = "2021a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "cfeeea2a7745164f64bd9f6d76e47916f4ac820c4434493674adbbd4324329c5"
-SRC_URI[tzdata.sha256sum] = "121131918c3ae6dc5d40f0eb87563a2be920b71a76e2392c09519a5e4a666881"
+SRC_URI[tzcode.sha256sum] = "eb46bfa124b5b6bd13d61a609bfde8351bd192894708d33aa06e5c1e255802d0"
+SRC_URI[tzdata.sha256sum] = "39e7d2ba08c68cbaefc8de3227aab0dec2521be8042cf56855f7dc3a9fb14e08"
-- 
2.17.1

