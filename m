Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 36011 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 16 Feb 2019 01:29:04 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800077.outbound.protection.outlook.com [40.107.80.77])
	by mail.openembedded.org (Postfix) with ESMTP id C20F67C7B1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 01:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=p7/K3pVALzsdnwYYsfuOfJDqo+fiRQkiSbgkrzzoaT4=;
	b=mQWFY1ml812Xn6PKrrQP6LQBdnCdMmOfiR43cWgvtwWKUSTZ6vPSxWJovTYn7BaRX4z5wwFvMtSbFHrSrbzspSvQgnpaCFeQfqtVTT5MWT+RSpFsGmVmUay6nIwUF+lX0MEMwfKpu5S4/If5RCRVGhuG+AbDJNa/b3PGY/PwYZI=
Received: from BN7PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:20::39)
	by BY2PR02MB2150.namprd02.prod.outlook.com (2a01:111:e400:c506::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16;
	Fri, 15 Feb 2019 00:45:31 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BN7PR02CA0026.outlook.office365.com
	(2603:10b6:408:20::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via
	Frontend Transport; Fri, 15 Feb 2019 00:45:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 15 Feb 2019 00:45:30 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:58066
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRdC-0007Aq-2A for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2019 16:45:30 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRd6-0003GF-U9 for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2019 16:45:24 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1F0jM0h012562; Thu, 14 Feb 2019 16:45:22 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRd4-0003EO-9B; Thu, 14 Feb 2019 16:45:22 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Feb 2019 16:45:18 -0800
Message-ID: <1550191518-6069-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(376002)(136003)(39860400002)(2980300002)(199004)(189003)(106002)(6916009)(54906003)(476003)(305945005)(36756003)(2616005)(126002)(426003)(77096007)(36386004)(486006)(26005)(9786002)(186003)(316002)(16586007)(336012)(47776003)(7696005)(8936002)(51416003)(63266004)(72206003)(478600001)(50226002)(106466001)(81156014)(2906002)(2351001)(50466002)(81166006)(14444005)(107886003)(48376002)(4326008)(356004)(6666004)(8676002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB2150; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT032;
	1:VlztZz1UFszZVBDJZATRvlS7kc/zOvGyYfhtDCcuK99w+zl9Mhdiap49NnZwI+ZBo+RBbwq5jhKBWqRIESbQ4U+WL6LwMD5Ro43ydNzIoVvPBLTL4ITwAbe0ZtnS14TqEUf6XK1R3SGvqyQxZE6LXdj27MUQbGpV9Lc8X8BcTew=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6451acc-2402-484d-24a5-08d692dee2e5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BY2PR02MB2150; 
X-MS-TrafficTypeDiagnostic: BY2PR02MB2150:|BY2PR02MB2150:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2150;
	20:vYmmapY03urxtYTCNHGRUZZ5ilbbxWr9ib0i+qsA38S2LwM6s7gQ9zC2agrdm3lU/ik0v9SYVH2m9RZtRIawUdcgMsXO53TEC2Wzvn8GFdyw38KW4YJbLV4wWsU/7gwqpsPvCEfkEhRQXh2ojIHXg6VPyMmJRqVHnYyNarwNnsA1W1dSa4Gjl0jMqSCCwNpNejdJRp1GA8h8UyHwPi1Qmp9ylAQMqOE+wUe6ivrOhe6sLpgyhglGU3lMPrf//WLi2zsZZB5K2+GeXN430CdbdIyK5jKhxdWZXsFrhCVtGU2LFXJStB6nR9PVjuqUScK4uikLVDcLRg78fomVb2tWDmlSLnjE/3gFPx8mU+oefE7u2rV5djQ7mji1OKrMlv0tp2dJFzT6DwadHTJsSehiVWIi3ib9F9g0xwGvs3jXy3zYsRG4uKgRabjyfau8UUzJxst9kYbn0kIktc+cSavmmwNw+e6DOzhGwWKLo5e8hphdRG+TDgHB5ae3A3ZqiAtu
X-Microsoft-Antispam-PRVS: <BY2PR02MB2150DAC7D1A0D1091119EDF4B9600@BY2PR02MB2150.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09497C15EB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB2150;
	23:b2vU6EubFIddFDb7K515ubZhtqDT8QKGtcvwfV96s?=
	=?us-ascii?Q?dm9I1u9M60LuSBtVNs7SwkK4dLTqsu3xPqsAaCjwpwSYd/KAWTm3OgHVLtM5?=
	=?us-ascii?Q?A6zdzjDUWLDRlIIy199lH1ztfmHFedf4kcOPg9n4EdWvnoihZCekmSGoqyK0?=
	=?us-ascii?Q?ofBZCasOmszq5tPsmTiGpWpTQuqJiGveSc+SEwVMY/S3XXUgtUZgMv5TeIvj?=
	=?us-ascii?Q?AUCj5yBGeWVmG2m/0iweOlTTcKCFAk3Lwpm/HcKaFdvwSE8KCvxfVx6Q3ZlM?=
	=?us-ascii?Q?zZKQUvsMIrQ6ge2eVZ2IBaZa0jMDLflS1ekgirPRUubtLMN/9IcdSS0Uh5fN?=
	=?us-ascii?Q?HxPFy2/o4/OU6zNPQCDjoENZyCRsEp0T3zXk0nK/P0rYHvYWWK3I6Qtfj3+j?=
	=?us-ascii?Q?OUrgBsNFxhFgXUg3xOIW7a2zm/uSxtSid+cHj4qeIqpy57QV/RQWp8qMiyMM?=
	=?us-ascii?Q?0JLGkNM+IRUZalzTfNVQJwpPhQaYn9MH9hOHuQ8vzaQM7/00RP3012UQweIU?=
	=?us-ascii?Q?hwMzAFClHFoGHxPLDyUgRWkzJU3bIaKjX+dQU5IkUFZDm5wfWX0EuVUBnMPS?=
	=?us-ascii?Q?aw7bswT/DodWlby83SAboPdZA/eq0rrux8o+omA0LiDRfMvdH6ntBw9/PYCR?=
	=?us-ascii?Q?BPx7DeUazx9/ufowJNFwwoC1uWpnXrv1GyzcptmT7diGUL7rz1mdpEjzjota?=
	=?us-ascii?Q?iPWjGgXdHY1UOWgLV/74hI7HZlgAfZ0S408Y9O9DOiW0nEX8HoG1u4gbz/nG?=
	=?us-ascii?Q?yJ1FglpYdtWoBlnJgwHuF9RYJvshLh62eQS6vaMQT7REoGCOsAQQkB28BHfP?=
	=?us-ascii?Q?cg6Go6Z75ko8fOSkaxc7LBRRaN96NufwX48l/YaSjM2LhF/35vsGLpf4Dbvk?=
	=?us-ascii?Q?lFV4gP2q0ulRdxghnTxFkiwHtnLqgf0QtSvEjAWaX3lxrrP2+d88LU7yx0p2?=
	=?us-ascii?Q?EwvHTPjiM9VdwII7GiQwADZ8uzKVTAcDUGIVy2qpJFvuF7LnoUoryxy/UDQ7?=
	=?us-ascii?Q?lGIQHWratfsRp/0IzaljECGMUUizfrY2N9aFuhYSVhMBa0v0ZSjaSxhnkBBP?=
	=?us-ascii?Q?RPfmwhm3jgPvNewmao0fO3x0NmBcxZPm+9IhdcF4bSi88L2tA=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jdM35AMcmCHVuefmh5akr6dsNcaIe/4vtKBdXgjORtzjtNcFgXCqWTaln8xcgvNYEADZBme2W+Hz3bxyLfFs62IuaBtq1eck+gwPGhBQ4K5CPwNaLKrdj8yPv9W9w52PpdMGW19jF0GE637O48nEr7IbUL2PWEL74EHL5FZ5dWMtaGbS/JzfS+rh0gIsdycffASWVxILCsJ2xV3oLP6l28rvGnff/oKtGMPGBsNGRjZWBa9LJUaxrIo2taaXehSmMtyZKJU3KU0kO5zfMcD3wPm0HoOYwAeGU9O5KYsX5gk2nzsxxjdw0/k6CQlQKKCV9vPDisDTGsqq7EYpWUi8heOhBVWHKazWbkFm9FP8BlXzvGL/0EV5jtrYXksQIzjRbIk0EvDAiJ/oE4DP1pAWhNSOBDoCKvEKQFVgogfXEPU=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2019 00:45:30.5295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6451acc-2402-484d-24a5-08d692dee2e5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB2150
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2150;
	23:8YrxEW6gseLV+mnIHQQI1vAPbx8I1Sic91UHa2v/lnDSYmEB/CczMb5+xsulLX1Aj9Y911YDrCu/ChEUAYdqFJKBXC0EfB3D5cxHrWrEj37ub7oO5aIOI5YsQ4gJnD4f0ZBwqglVHJ+seO/8dTrzOA==
X-OriginatorOrg: xilinx.com
Cc: Varalaxmi Bingi <varalaxm@xilinx.com>
Subject: [PATCH] kernel-fitimage.bbclass: Fix the dependency issue while generating fitimage_initramfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2019 01:29:05 -0000
Content-Type: text/plain

When building fitimage_initramfs, the correct depedency is to build
after do_bundle_initramfs. We can run into the following dependency
issue

DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function do_assemble_fitimage_initramfs
aarch64-xilinx-linux-objcopy: 'vmlinux': No such file

This happens because initramfs renames vmlinux to vmlinux.bak while
generating vmlinux.initramfs, there is a chance that fitimage_initramfs
can also start during this process and create the above issue.

This patch resolve the dependency issue by running fitimage_initramfs
task after do_bundle_initramfs

Signed-off-by: Varalaxmi Bingi<varalaxm@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 718162a..8ebd3dd 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -488,7 +488,7 @@ do_assemble_fitimage_initramfs() {
 	fi
 }
 
-addtask assemble_fitimage_initramfs before do_deploy after do_install
+addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
 
 
 kernel_do_deploy[vardepsexclude] = "DATETIME"
-- 
2.7.4


