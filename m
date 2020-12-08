Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web12.5618.1607414652888920132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 00:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IviTPsSM;
 spf=pass (domain: windriver.com, ip: 40.107.93.77, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXMxICBBOR3+PoZM3Jcxlegaq1afBsTX50Oay2hQiCUzU3BRKbifU0Z9VSJucCXGULuYc80Bv12hGsIMLxlDapfVrh61O9NlsV7Yo7IYDVO5D0E/jsIY1JOBm4vb2ONuhhuCVQN+Nup8HUrdNlmTKiyvBJe9uQxb9wCkP6jqIiNkGfmcK7rGq/k8aaBL5AamO123UFM2VMBurQeodFqP4VwCNzwbtw0aS5yHPhXLIlO2jVjeuPMxspUtaS/qt1hSHYzPp7A/0HlUforDZMIUWD44GLSVTaUsP1jsLTrpxaFXgCE0CBegijrx1l9GRc9MMnsUUn6OUHl9cKnVxY1LZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHmnNEooxf2OJvlEFxsVaYwwV9ag6Bw0avUIALUuze0=;
 b=mJxYzU4Cm5OuJdjjQLp5ryHPGKgfsIz7wAlbDY+u9Zsd1z3KpnDAEuvjjclHMC2Iyb5P6moOjpo/ndhSRVvap5AUTyCMru9jduuMDSB6AbrXi40na2cXR1o5U1Nlp6I8MASO2vzOr1MmFwHgBTMavXyRdbDbrP5OSDw0GhGKMZ51Pqm7rBKxmhiYY/F9y9sEM9bvxrC6KMNxYeC7lX4U88PIcoRwYfC+X6LkCuDpdxbI2pe9fwSHi6H8y5B2EH5Z4WF3ONiybKHrBCt+Slfn4AeSrssg5WCcizl2P35wxZr31yLfkWmvjZ7lagDr7x/jzYUDbHiaoR8tfq0I6k/Hyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHmnNEooxf2OJvlEFxsVaYwwV9ag6Bw0avUIALUuze0=;
 b=IviTPsSMNDyHypFEwRPxb2NrqzR7g5V7EUV/uU6tFNrdkYDNNfXUSSAdkCoj4nJQZN3aMx2y/QE4iuiTfUxahzVMWihWlJPGROE08krE5za5EudRdP/w22xScvT2vAvRNK9Pi/6QB07aK/ieLMvQU5c8OYKltTPJ5mc4h+lkBJc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 08:04:12 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3632.018; Tue, 8 Dec 2020
 08:04:12 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] minicom: RDEPENDS on ncurses-terminfo-base
Date: Tue,  8 Dec 2020 00:03:56 -0800
Message-Id: <e72b952d036eec8d78dc106f876fc5b97999fd07.1607414579.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607414579.git.liezhi.yang@windriver.com>
References: <cover.1607414579.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 08:04:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98cf2e1d-eb88-400f-6df9-08d89b4fd931
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB457458E566BAA34F39B6719AFFCD0@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ee1Hq+4RXepzCuGBEzQiKV8XEJEKmcsSG8W8rVAhPgT31TSIIFtP42/3I5JsWPeNMDrGFKXamXitle1w9JqHMlZfjt2bnzURqWJHmq9mcJ/ZzRM+xlXgbt09L9laIjsEjkd+NKBm0YdPcyQG7JtATgR8xjkS/qa/T1YrEKzha0gBM5LA77ErhBeZ9o0ftSOnMTerjew2bGa/nlc9NjhZ+JQuTMqkAHOhRVe0Hq3KhwQYxuXYLZqo/4AInC+SALopdv5mXNHp+gbE6+crS/vVjVufI8TvtEjS74as9tantOmu4l8yP1uGMl/J0JmkUVKc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(5660300002)(6666004)(86362001)(2616005)(6486002)(66556008)(316002)(66476007)(4744005)(36756003)(16526019)(8936002)(26005)(956004)(66946007)(6916009)(6506007)(8676002)(186003)(6512007)(2906002)(478600001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bjydoYU8GIpOGaTXH2KExeKSINUD5LALzYyB5g8s5ke+7alSi+DJMC6eD6QJ?=
 =?us-ascii?Q?UYWelp64IVw3hh6BaPQVQNdlmCKzTw+3QFtprjR3NWmj/gqQm1q7jGbeDgSd?=
 =?us-ascii?Q?MYaBqYPhHa2wLWamVB6rVPhSm3ZJKFcVt3ebe6FiXWU/geuXU9T7YJKvcJ/N?=
 =?us-ascii?Q?Ru7mX0pj7KiHuj3rW5Id3lDR3cLAODvF1XEtYOo8jSS5Rwt+HYiY7EZX1iu6?=
 =?us-ascii?Q?LNig73jqALGoauvB40Xtbj1cPHHp6mG52ZZjFoYsAI5/dNsTCdzqWCfokQVP?=
 =?us-ascii?Q?DW5mL2VbYn3vcoF8YyuKmNc4iVTMEMc2GTUjRQNmVRhie1jqyYtIQIJwsTJt?=
 =?us-ascii?Q?Io4S4ckurDcc9IxGiKas1wGTuoPmnbSaJQ+zEHxJOtJ9ls1CDGb73DeyjhXd?=
 =?us-ascii?Q?oIHz3kv1OZvRmialnVQE8wrlkXx1OzOi5zSNYqcD9Fp3F9BM5MBi+tI4CVUn?=
 =?us-ascii?Q?JFYwycLcelT7aBA6io+6Cx+9UVUE2dy9H25O+ykbTJSuc6tYgJavfEw5d3de?=
 =?us-ascii?Q?mk+wvXXDTKiTd1n3ovRSKlSmvKBgM1KwsjXd9uMauvUYviBjPC0GDEJrTW10?=
 =?us-ascii?Q?M7ImsDdvX4fdlURC1dSsAQ6YBZDRfKEEdJBrJg6AXwVG6jHCHqBpMSPBCN67?=
 =?us-ascii?Q?tGw4TW5REbY1GxBjMBvIEII03LBjRVIIzFCP97VHxExJ5fN22NTwmxlWSTTq?=
 =?us-ascii?Q?UjeR8dfQ8wRPGPUoR7MAl6/qO99blYNH/Ok1rkKRPantIA1g04fklCpmDPas?=
 =?us-ascii?Q?czlOP5QnwC3l+iazkKSWdu1jA/JPTbwFAep8xKf40DZDXiCT956mDxGsb2pE?=
 =?us-ascii?Q?rfPa+xEFWu7lzTqhusf7wxAUzuwit6dNZ8VK8D+Kx7mzqhE+fmHeL4Rv9htu?=
 =?us-ascii?Q?jFX5IzlslVufvBo681YV+4k6+kZYoJ5ayYLus+gjKcVNhBsQQ9BZyc1IYyfm?=
 =?us-ascii?Q?y6b19lcTux0ex3DgmoxEy/i1eZvjyHi52LRonnIWcTXmbFwEj+qECODDmOe0?=
 =?us-ascii?Q?orwo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 08:04:12.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cf2e1d-eb88-400f-6df9-08d89b4fd931
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXRFcIgju+G8Q37ZkIaUvZQY3pVkAbYTkfmAY/mdlajZkPsk70XrH8f+2Cdo9xVUGK3BsqXukq5K1VctK/nm+eRSsh/ro19y/4NTw+GlV/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: text/plain

Fixed when ncurses-terminfo-base is not installed:
$ minicom
No termcap database present!

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index c584b7589e2..12003ff49eb 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -29,3 +29,5 @@ do_install() {
 }
 
 RRECOMMENDS_${PN} += "lrzsz"
+
+RDEPENDS_${PN} += "ncurses-terminfo-base"
-- 
2.17.1

