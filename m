Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 35994 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Mar 2019 07:28:11 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
	by mail.openembedded.org (Postfix) with ESMTP id C8B2F7CFF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4IXr3ZhPmRW0ygOFp93ix5EgSwkFUCJ7BUDoV34XuGE=;
	b=zWfEhOGUqVkLCNz/ZcHrRaEFXI2PBeun5eiyBlEOLyX/RusXGHNaW7n2eaASzn5RuGJZfiwKgksu72yypss4jlHE6Feb2J5jPQU/T02Qx7wsfTuyFnwn8bCy5p4m6oUUYOqWlyRmMDESD8xZLX3BXwiWLthRThP4VdYKOE75NZU=
Received: from SN4PR0201CA0037.namprd02.prod.outlook.com (10.162.76.23) by
	MWHPR0201MB3404.namprd02.prod.outlook.com (10.167.161.141) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.15; Thu, 28 Mar 2019 18:55:37 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by SN4PR0201CA0037.outlook.office365.com
	(2603:10b6:803:2e::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.15 via
	Frontend Transport; Thu, 28 Mar 2019 18:55:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
	via Frontend Transport; Thu, 28 Mar 2019 18:55:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBa-0004Fm-UM
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBV-0007Ob-RF
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:29 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x2SItSfS030844; Thu, 28 Mar 2019 11:55:28 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1h9aBU-0007OK-Ha; Thu, 28 Mar 2019 11:55:28 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 11:55:18 -0700
Message-ID: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(136003)(346002)(396003)(39850400004)(2980300002)(54534003)(199004)(189003)(6666004)(356004)(2906002)(36756003)(50226002)(478600001)(8936002)(36386004)(2351001)(6916009)(107886003)(5660300002)(476003)(106466001)(50466002)(4326008)(63266004)(7696005)(2616005)(486006)(16586007)(81156014)(8676002)(305945005)(186003)(51416003)(48376002)(316002)(77096007)(14444005)(126002)(9786002)(426003)(26005)(106002)(336012)(81166006)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3404;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3db39b63-6633-4ff1-2aac-08d6b3aef624
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4709054)(2017052603328)(7153060);
	SRVR:MWHPR0201MB3404; 
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3404:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3404474BB6CD38F8879C2728B0590@MWHPR0201MB3404.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0990C54589
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b2Z7z3g17/xAzVWMSwudugQvEdUv+F1QdD1gydXSQede7/qIcE1QJhNyHO1HA/wj1RknM0dCJG4SiI4d3nUcK847CR4pTGCD5EPZvz6g7QNAzIUBpnQ+easWv2tZVN7Nw7/9kKdd0MeeFqL1EC7gIDNpkAEZ1gQoXBpMZBLaG05NApjWE2h3AwWcouHnhwfgHnnPTGtzqU2iV6sDTIKTE59iersbEclAAdORiUKoooOqk+Jh4Jo+rqzbrUND8SWZeghwXJYkDafrEWP34hHMC0/mkxaGuXwXgUder9su4AJ+xXikvq2IjrjrbjuXJZv8QgUUdeHcfzBhM/B7BhvrMHc7XJ9G9ynYxDqUoLn//jfyzzwwFSN+V9gnYKsxwRJlLDFSyI8AteGWFhAxt3CVv4oG3e2hDZrR45v4nlWhNu0=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2019 18:55:35.3139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db39b63-6633-4ff1-2aac-08d6b3aef624
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3404
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v3 0/3] Devtool: provide easy means of
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
X-List-Received-Date: Fri, 29 Mar 2019 07:28:12 -0000
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
Sai Hari Chandana Kalluri (3):
  devtool modify: Update devtool modify to copy source from work-shared
    if     its already downloaded.
  devtool modify: Create a copy of kernel source within work-shared if
    not     present
  devtool: provide support for devtool menuconfig command.

changelog v3
1. Use oe.path.copyhardlinktree() to create copy of source from work-shared to
devtool workspace.
2. Split all the changes into appropriate patches. Move all
menuconfig command specific changes under devtool menuconfig command patch
(3/3).

Sai Hari Chandana Kalluri (3):
  devtool/standard.py: Update devtool modify to copy source from
    work-shared if its already downloaded
  devtool/standard.py: Create a copy of kernel source within work-shared
    if not present
  devtool: provide support for devtool menuconfig command

 scripts/lib/devtool/menuconfig.py |  80 ++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 114 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/devtool/menuconfig.py

-- 
2.7.4


