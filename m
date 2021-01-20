Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.76])
 by mx.groups.io with SMTP id smtpd.web10.23769.1611119020421835635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 21:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ifUVddgm;
 spf=pass (domain: windriver.com, ip: 40.107.93.76, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5+XyZZ7o/EV+3gxX37DTogJuwlUecVAa7ChPg05+UO27j+Eqm67+rgB7916om/+jtr6DGIcWyzcrb2vXZtLRmD5Iw2IQqgFrm+2zoI+O+Qy3o/MmdtT8fYh8eugjT47K1jMAZvA5hnOSrLjx0lV7/e8jpTXJiKCEyJN17GJNY4IZoDuV78wqpPDrCi1pSuE4uxFYGNgaDgOaLqJJcrHHNHxCtr1OiMrguBkQlY1mKE/4bLpfysvjtJLSCFpZ3AuZaEZzZEB67j8/vywlzh1xteyMS8XXHL7q1sa5mTSsiCkHxyLz/tf4Kd5/XTBFL7RQWFRYcFKo3GwwrmkP6QGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjhrwk0X71bVzr9UNcmpQL3b2JoGbL3+Y5d+nCVkGso=;
 b=Ff6PDemWPQld/UkJvfpF7krf1a9+55ufWCAO7iVJu6tLIOqDFUYfUNJo9r+MWO5S5xj+Oe6gZ8LTmreP6vrEqHRd8dd93jjCHyA5HMW8jCugFUGsokVNw7YC7KhfLhypxbuiZUlyvCcN5epEiMWbZv3gv/WcrKzpDyLBlem1r6EaMMBrAbJPIHBI1J7yLCftnHz5U99dATuTNFxWlfZFAX2l46o+DrNqVUqOxqgGfmPa9ufFrtZH9dP6EgcZtNFCbieuBgCKGzy1MZVSxvGIF3NioRuOBMaWX2DVn+aHWhPaL98xmKjG08SxsUQQQAhzjZnDXmQTDMiG5gbkEG6uoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjhrwk0X71bVzr9UNcmpQL3b2JoGbL3+Y5d+nCVkGso=;
 b=ifUVddgm4pR+nd6/WE++jFJPZK9qGjD5pvZdLb8vh/8MDcs+qW3x/Fxd4vcUK0cUNzCOk1HMfPal+TgrXJBC2/B+dT1qiwvtnQuEhae6edzrxGC6IgQUBwtgbFJAGCA4xRrDMdug5uAR5E0TeCCsRMNz8nfeOzZqxdKTQEdJ/nc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 05:03:39 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 05:03:39 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
Date: Wed, 20 Jan 2021 13:03:18 +0800
Message-Id: <20210120050318.10376-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0075.apcprd04.prod.outlook.com
 (2603:1096:202:15::19) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR04CA0075.apcprd04.prod.outlook.com (2603:1096:202:15::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 05:03:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54eba72c-fcc2-4a75-00e4-08d8bd00bfc2
X-MS-TrafficTypeDiagnostic: MN2PR11MB4678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4678F4E2FBAC54EB74AA97D0EDA20@MN2PR11MB4678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OOio16zZFQlb7/pU+sd0ZU433FrZ50l8TcHZMBFJJbP79oOsKWgONwVb4Q3PMCobzTyGcN1TyPWFGf1HVRcqdflc/S9xjI7IcJLtfpClUxNQr6OAL6IpLgVjwQja1cHH4GoKEirkV8zVXxLWejrlMLpUiBPZ0mi61AQ9Psnyfs4nrIj2v0dn0QyEiMlYxSbe+1QIHBIYeQTbwFn0uFGD+SjSQq+zGeDgDBOvslI+kOuQiw4MQpQGWoxRZzJqgFyj1Cui3AVgRCQQimj1MX8xibGS9IeMUCHD0jWxhBToRESCpYHrmiiEAWS2WZjdxAD+SFEHnzIs4CIQRq8js0VfZdpjtjeoOwoSbe8y7Iyf3X+XbFfn/cNKO2zoYValVun/dEAOCLr8+jnAgoUk9cKGjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(376002)(346002)(396003)(6916009)(36756003)(26005)(186003)(1076003)(16526019)(66946007)(478600001)(66556008)(956004)(83380400001)(2616005)(66476007)(52116002)(6666004)(6512007)(5660300002)(6486002)(8676002)(86362001)(6506007)(316002)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9k+beo2Y0nau+7N0MR4g6E3RT7/ODs6uFb2DHmVGMqHC55joS/vVhoM7hOJX?=
 =?us-ascii?Q?9CvWgruC2IYwqx8PdptQnUkZPfeCvlvkJxxf54E+wJ3gnJXnizi5/wwguvja?=
 =?us-ascii?Q?3d5MczPjUvoJ7QJ6mIman3gvCYaw7BlLXL8HDTSPVQLfms5DXcKwlQTYUPCk?=
 =?us-ascii?Q?+4lYpsV0fvAXeEmG6DpJhX5A8SjNaGj3cYSvBHHkQ9ipB6ytzaIyMrFfulH7?=
 =?us-ascii?Q?IxmoLCpkIF0+CHbovrqgBZ0LNyeBilANRbVQXKXecMMznrVaz6jshBHiEPDa?=
 =?us-ascii?Q?68Nl9kv5griMNRxqjxIkQsAxK7I78vWq/xSfg8Wj7FI9pVI4woef6lWRuTm7?=
 =?us-ascii?Q?3wDz3VXAnSPqhYURTVU+5VbR23t8v9M8jOMOW/tvIXIygFfcpOV3dis6o05D?=
 =?us-ascii?Q?5Nj9T81n4HMClgRVm9epcVpYyUfZxDhNB7taPLhpBKnETdTABUK2Q4fX2KrS?=
 =?us-ascii?Q?l5IkwETtHEwk8jseP8AmRVFlV1eIdsIZBb+iXs9KtFpsfPGLIOUl4CvukX4A?=
 =?us-ascii?Q?KYrl0dD5S0jPvh6b2UbHOQpxHa7e+O/otE9yZQokQBE0sRbVXRhjHSTW3hm0?=
 =?us-ascii?Q?yIvrKO/jrGKRpzHuS71d5KkRcgEhaOvIhkp8UyEOPmxBHHyu14p2SnrBcFDW?=
 =?us-ascii?Q?1LqmNhX/hrs3Ml0BP7aWZeFmFUKD/0xP+8iDfcpaGdkrdTXZrsfY1PyXblfr?=
 =?us-ascii?Q?bFM3o2zUPY9eUnInJjWmBB1WWtQs6onGZqnhwGouXCmJqYTshcZY0Po9P3xO?=
 =?us-ascii?Q?lMvZOgN65yn/KyJ0pl3HSWlQyTP46lvtuudAhkrV8sEHuGTxaxetzHCX26qA?=
 =?us-ascii?Q?30d9tR+PXZP3YfcJBtJOuXGpSHrKP7guZPxrfGt1637sAtBJjn+e7nuUvq7p?=
 =?us-ascii?Q?LzxviwjzQM3uD8t/aza39D3shhia1KHjV9pVPUbcSDwoG3PzykcxvT4Doa74?=
 =?us-ascii?Q?l9RxFyW5A9hKg/IEAa9of0CcBI/04aXLr5Ww/5H2Br0rBKV5HRs8hG2aqu9o?=
 =?us-ascii?Q?gmHA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54eba72c-fcc2-4a75-00e4-08d8bd00bfc2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 05:03:39.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03eUtFXxoXSUwl2v318KRwgvUMIVNPXBM6FzZkoITJSYVZa/5kp4gWDuwCFNyshTKk24TTYWorWuK8nOiajolA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
Content-Type: text/plain

Build error occurs as below:

  ERROR: igt-gpu-tools-1.25+gitAUTOINC+d16ad07e7f-r0 do_package_qa:
         QA Issue: /usr/lib/libigt.so.0 contained in package igt-gpu-tools
	 requires libprocps.so.8(LIBPROCPS_0)(64bit), but no providers
	 found in RDEPENDS_igt-gpu-tools? [file-rdeps]

Add procps-lib to RDEPENDS to solve this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 89480d79d2..b012dbf58e 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
 S = "${WORKDIR}/git"
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
-RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN} += "bash procps-lib"
 RDEPENDS_${PN}-tests += "bash"
 
 PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
-- 
2.17.1

