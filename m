Return-Path: <ckalluri@xilinx.com>
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
	by mail.openembedded.org (Postfix) with ESMTP id CF3466D6C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 00:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HKvfuCcw6/9Zz7vh+97y2xUiKQE2sdYAOysxOh3jsZA=;
	b=srKDE7/e6sx/3R3NMsWZ+s9+zbkShi5LhSH4FkJHIHKB1CGT7ieL72N2A+xQJCZhBqbYxGUqV80OtlwZtWMiKK7mTdFn+/7oDQ810f0W0N9Wg36ok0tI7zLqDej5ICjDucMW+vYvyNCsET70XNP/DSIlDZn+5jQxGWrcsKICZqY=
Received: from BL0PR02CA0037.namprd02.prod.outlook.com (2603:10b6:207:3d::14)
	by SN6SPR01MB0036.namprd02.prod.outlook.com (2603:10b6:805:10::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1813.12;
	Wed, 17 Apr 2019 22:43:10 +0000
Received: from SN1NAM02FT007.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BL0PR02CA0037.outlook.office365.com
	(2603:10b6:207:3d::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.11 via
	Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT007.mail.protection.outlook.com (10.152.72.88) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
	via Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46858
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGn-0008Gq-Nb
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGi-0003j6-K8
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:04 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hGtGe-0003h6-EA; Wed, 17 Apr 2019 15:43:00 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 15:42:56 -0700
Message-ID: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(54534003)(189003)(199004)(356004)(107886003)(6666004)(4326008)(2351001)(36386004)(5660300002)(2906002)(14444005)(63266004)(47776003)(9786002)(16586007)(478600001)(316002)(50226002)(50466002)(126002)(336012)(106002)(476003)(7696005)(51416003)(305945005)(6916009)(36756003)(8936002)(186003)(77096007)(486006)(48376002)(426003)(81156014)(2616005)(26005)(81166006)(8676002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6SPR01MB0036;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e41dafc-cc97-447b-0085-08d6c3861149
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:SN6SPR01MB0036; 
X-MS-TrafficTypeDiagnostic: SN6SPR01MB0036:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6SPR01MB0036A3AE82807958592FC197B0250@SN6SPR01MB0036.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0010D93EFE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cAGFuw/Q0A7hBJ30JIaQW44YaX32ZLpFH9utIJr9tTRSenQ2pih+/h1cmkBSK1HLzbm1IoR9znap4MozYssi2KBpXnzkhdFN3272Za3Z1GSG6kp4aGoWVRql9BmgaFE1KOFkl34LoijFncfgmCm59EWJYh3JiTW1UgxOzehQRfn4o85VT4PRPvouobmxSQw+lf4LFKok940DsN9W0ayHbUy5km4nRmNA37FLHrq5JXGSxN0HNTRMlWyk5nZo9z0yJmhLVsXBHcQGv4uBXnQlHe2pO0cke+8CxBhfZcZ+nfbJMQr3N4fxMI8feDXj4iluzehNz1EQvZ50yrsNgPwoheBNmovHVR5wWgrcYWsfsVRwxQv3uClbDEggVTsgsnStrATsB1svilrCUq3l8088l1aOEeHtknyQNf26mXmFvok=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2019 22:43:10.0853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e41dafc-cc97-447b-0085-08d6c3861149
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6SPR01MB0036
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v4 0/3] Devtool: provide easy means of
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
X-List-Received-Date: Thu, 18 Apr 2019 00:15:13 -0000
Content-Type: text/plain

This patch series provides support for the user to run menuconfig command in the
devtool flow. This would allow the user to modify the current configurations and
generate a config fragment to update the recipe using devtool finish. Devtool
menuconfig command will work on all packages that contain menuconfig as a task.

1. The implementation checks if devtool menuconfig command is called for a valid
package.
2. It checks for oe-local-files dir within source and creates one if
needed, this directory is needed to store the final generated config fragment so
that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes. After
saving the changes, diffconfig command is run to generate the fragment.

Currently, when the user runs devtool modify command, it checks out the entire
source tree which is a bit of an over head in time and space. This patch series
also provides a way to create a copy(hard links) of the kernel source, if
present, from work-shared to workspace to be more efficient .

Also, if the kernel source is not present in the staging kernel dir and the user
fetches the source tree in workspace using devtool modify, then this patch
series creates a copy of source from workspace to work-shared. This is
necessary for packages that may use the kernel source.

[YOCTO #10416]

---                                                                                                               
changelog v2
1. Add a check to verify the set kernel version by user and kernel version                                        
present in work-shared before creating hard links to workspace.
2. Add a check to verify the set kernel version by user and kernel version                                        
present in workspace do not match, when placing a copy of kernel-source
from workspace to work-shared.

changelog v3
1. Use oe.path.copyhardlinktree() to create copy of source from work-shared to
devtool workspace.
2. Split all the changes into appropriate patches. Move all
menuconfig command specific changes under devtool menuconfig command patch
(3/3).
 
changelog v4
1. create a new function that implements the creation of symbolic links for
oe-local-files to workspace within _extract_sourcei(). This avoids code duplication
and allows the function to be reused within devtool modify when copying source from
work-shared to devtool workspace.
2. use check_workspace_recipe() within menuconfig.py

Sai Hari Chandana Kalluri (3):
  devtool/standard.py: Update devtool modify to copy source from
    work-shared if its already downloaded
  devtool/standard.py: Create a copy of kernel source within work-shared
    if not present
  devtool: provide support for devtool menuconfig command

 scripts/lib/devtool/menuconfig.py |  80 +++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 141 +++++++++++++++++++++++++++++++-------
 2 files changed, 197 insertions(+), 24 deletions(-)
 create mode 100644 scripts/lib/devtool/menuconfig.py

-- 
2.7.4


