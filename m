Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.28227.1629138029703492540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 11:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e5q065mF;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3862dffb07=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17GDhgb5021413
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 11:20:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7VVb5IsPX2HDjyqxvbjeI8N5+xJWmguwLC1AV47v2f8=;
 b=e5q065mFMeL8EOd/9zJNxgiPOqLK3q+wY1caDYQQzqpRAVVRlHWtPiqp1OW+udSDmtZE
 lqQRI0HapkVa7dyS3p/6IZT/rEmBqdPgUUBO9lyx1cCLFoETKVaP9l278h6fHP10CIrm
 wZR9aTY8CwkbBqYWw1KV6K7E/KTbYx8y7XvRg9omwUF3OvLUDRuzLtv92/QxP0FQqn0Z
 I0d7bHB0SjCK4HroP+Moj5qyHbaszyMTM7AAwPMWVUGwpS2yzdgl0xQqOHWQ4gZnEZ6e
 /FBboGLYAmBSGmHPXtpcwSidCJL2KrCQui+mC3rKr9teFtDzAKgiVVF7JWBTNiTXe0HM YQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afajf0k8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 11:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4umh0iDPPTjKCD7cw+Z9hNLT1LhsJl2WokH7Vz4uTbAsKq0ko0TG6cPuQLoYn5sPft+VMzmKQm5ERU8W1ULZhvoSlr/bF7bFuZ8guRCBlXeKYIz0gQpC136D71dz5yoZOmNOYbG/weSZwefU3ZvPfrM5jN4nGzcg8vVNJdTSmSpo/X53mtubQQ7FHwMB6qXx52uhtj5BdDUQlrE5E1YwgphyCUl6bHq11TL9oexUKe3VhU7cOkYEjb3E/ZEi0E3eF3r2hqFnoPv/CYPfXCN7pc05XFTsdRGm2DtC3fErUK7ajRyzz7wmpK1uFA62Bu31jN88mwnqoottKVpjWzjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VVb5IsPX2HDjyqxvbjeI8N5+xJWmguwLC1AV47v2f8=;
 b=b4Vio+Q90VfGcBBl6/xlx/sBD340QPX6gAxwNu6YLP3pLRm2pSA1s76qYpWJBjPyyc5XbHqWyA1nE/0z8OHTiVnGGV/6oDkZMLN0tGD3f+JEd2d3NXnjSblW8H8SFaoxkLIayGdOp+72+3Niu8zgNTD6MJzbDFHGabji390U63+R9ErCrNa6lbtapkVqo+D1OXVUSMPXvGDHLL+wsgnIY5Lfj5hzH9ln7EPai1hOp2G25uZawPt+tagpVYPGczhKS2AokcJMV5h3QTAbmGaNpuR90yuMcV5W0s+z+qOTjpt+HZRxfRSzX7qw6mmhfn2um9zFyys+0oZaxx36flyd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2709.namprd11.prod.outlook.com (2603:10b6:a02:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 18:20:26 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 18:20:26 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] blktrace: change shebangs
Date: Mon, 16 Aug 2021 11:20:12 -0700
Message-Id: <20210816182012.26458-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY3PR04CA0013.namprd04.prod.outlook.com (2603:10b6:a03:217::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend Transport; Mon, 16 Aug 2021 18:20:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b897580-a501-4b9b-a7fd-08d960e284f7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2709F7CE4493B845FD0D3AF988FD9@BYAPR11MB2709.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S6XlRFQNAIg59Voyjaj2X3y2bjIfr8EDEdVGzlg8NVlG/PBGSbtFaVwZfnSJayxDAyMfB5DRnJw6kG0gStObsQCjPWiCI7X/7AL//jhkAQ987j095h1PCvB/8HViNY8qEPDOiIeXe/qPwjYd/CMH8r1MlLdNbSRAoFNRvaJwTBRrgvH8cI7AqNG/W6a15t8M9n2f8VbKZvqa6f+uAioop0SLXIs89P0qakNb3YXbhzZFVPNF5l0ia+c0VdX8FpAxhMfQ3qq0rHswk1Zr5IFAbneUROAYLdu4rjYs9RJCUyhlJd1Q8tg6iB1EFldV7qeXNQHm4TnsFv02yZeU2crvgJjxGAXBqwMTNFTtcGNSTD/w3ObGEUMSG1xJ7qmVWEycyUNUQ3+gxAH96iUkxNvum/RuTEpLT8uCUPf1Q14VBuuZFL5dlO2KwVLrpylTwpndiIf61oVgBZq37B3Od5MPqSBCCir/9u1FdbLZXESdi2VLO2reyucj4bLvcNtrgGuFbib0EpR29E4PR8slB0H7pEeT/dcuf4Ba7GVJRwnNfRYczN91wg0F+D99werKykzfo4feezUs+1BLJKX2I/5nccekkgMHDBsbsClOVsfq3kWtAyrV8kX76SWcTXHyx58w1wwYXOnfMGMmn9QiyC2SsGRvLKWT+5YIs2flxvNuhpgeCjlCQUUI9Mq5dEv7RgQP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(366004)(396003)(5660300002)(26005)(107886003)(478600001)(66946007)(6486002)(66556008)(186003)(66476007)(956004)(86362001)(316002)(38100700002)(83380400001)(38350700002)(8936002)(6512007)(6916009)(4326008)(2616005)(36756003)(6506007)(6666004)(52116002)(2906002)(1076003)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t2/UmDrpzf4TynZb6EAHLZHamOPlvzCHS1RQUWUDpva4/sW2qooPr1Z9R9Vz?=
 =?us-ascii?Q?9n72W1uOur8iJGLkSJsOccoJP04HYlcg6dZq3PsxlaLgHE7UUomck+K4Dtw4?=
 =?us-ascii?Q?2/T0o+aDZy9WLojR7OO+YjQzNGauamDJ0OE6cwzERNP1F2GptnsqIYNkm6KG?=
 =?us-ascii?Q?TNTDuTDhdrWAEpr4rY0DcYoARyajGPS0ELLp8pATjSnNdM9Kd3uNimtR3lFc?=
 =?us-ascii?Q?nUC1siyHGHN8Nx4WVBuu9yjmMX687nf4AQKOCJGQFdhB+wDbOxL/F0i0I6W6?=
 =?us-ascii?Q?Zt/wHeHSUUZ4l1+0nrmFzdlMsvISLOOuvsgm7o0NynnSK7kMrn61XMZNbUEX?=
 =?us-ascii?Q?GvohdNVHp7ALA/B67AfErb30vAMqEu+uZY8+m3j5brqQKBzYB3J5Wy8AxFa6?=
 =?us-ascii?Q?QN2DIngoJspZRL0F5yNTPtpB7ZgNcGkzggwWxj6JCc1//hZE35nWs7unNJ/4?=
 =?us-ascii?Q?o4M+GUQi1wRC+8PJ5hgdLM5yP9EoNMXygFkETbShkPWltgiHa3HfOwVuvOYs?=
 =?us-ascii?Q?ZHQuE04JxPcf5v0oi7cydhgaum/ika4/RTO3hP47mSHhXvzml0uGKGmDWYg4?=
 =?us-ascii?Q?fKAzlDLzDy8135kvhBqMOkQewrl5mXxInYutHxHHxUtfdXocuOl/tgWumlv8?=
 =?us-ascii?Q?6vPbeuYdj489zUrJ+lCdmAG3J9t06HeAfArOB2wQMVq2TCPu6vxFUT+9koVX?=
 =?us-ascii?Q?4ZjK4zhZIpux1vJuWA2SUq/dSAbVZYXJsHaLWvJGQmQ3OThncichsAO6bB+T?=
 =?us-ascii?Q?LV0bjD/ECmIyWYPWChlM91W2SQ9w3islros5Zt68/nnRbRWTJI4bMtU0N5CP?=
 =?us-ascii?Q?zUSt8Vkg3aNm2KPSYHuxMK4eVnVKf6k9JfPbF2osBlu0QscZOoSFYlbtN7iW?=
 =?us-ascii?Q?ZvOv9WDBeF0wg6QZVdQw1K2RtDdlW6gRfNRDVK7TaDirY5M953wQxJkCUEm7?=
 =?us-ascii?Q?ojlfQ4aRyhH++NmW60DgjQxcGub+iO3429aMfdp2wEy9ryRmzWdhJ/5n7Pbd?=
 =?us-ascii?Q?zv/l30jGtjzIxYxT0c/ouPO2lVtMzwQbHLKVBB13bioTKBGHRpK4fKxInJ2U?=
 =?us-ascii?Q?C7AypUjPaBfSf2UMd+t7yHo0yudd8AmU2UttvwoV7KT3G0rEUR7J/XItHR7f?=
 =?us-ascii?Q?n/MkeGG43GkwR2/dW8PmTs+VhrQ+dhNx7HUzADUbZIi04kJnUOHH1O3/FDpr?=
 =?us-ascii?Q?sIVECkyvd9eLSxKcL5Oy0tKWG1L/SHTnoIoygmZRBDCrIl2YEGAXmcKzeXD7?=
 =?us-ascii?Q?ZG53IxafovsMCNSQX7+pQH4BK5Hqoz8N8x4/OZGEan+0Dw7HnLZYTAiMK8Er?=
 =?us-ascii?Q?9syKAmIVmVMtmAtDg6HC8lc0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b897580-a501-4b9b-a7fd-08d960e284f7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:20:26.0783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UccxhmcBnyU6XHgec76dxLMlOv4//S/AokjdilfMQShojKmq5s3miFmN9HFn4vjwvorEDARFFs7RIEkg90SxlZXrNfaVWOtScveEr0W1d0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2709
X-Proofpoint-ORIG-GUID: PHy_m3n2r4Xm8xx4oUjLKKjHagPGq5I_
X-Proofpoint-GUID: PHy_m3n2r4Xm8xx4oUjLKKjHagPGq5I_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-16_07,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=412 bulkscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160116
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Change shebangs to python3 because we do not support python2.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
 .../blktrace/files/python3-shebangs.patch     | 30 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/files/python3-shebangs.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index d00b1bd0be..2f2695cef0 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git"
+SRC_URI = "git://git.kernel.dk/blktrace.git \
+           file://python3-shebangs.patch \
+          "
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/blktrace/files/python3-shebangs.patch b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
new file mode 100644
index 0000000000..70a35c2c3a
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
@@ -0,0 +1,30 @@
+blktrace: Use python3 shebangs
+
+blktrace can use either python2 or python3, but we really want
+python3, so modify the shebangs.
+
+Upstream-Status: pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com.
+
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
-- 
2.25.1

