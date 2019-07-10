Return-Path: <ckalluri@xilinx.com>
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6657EDB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 11:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iJgdXFUf5YegiQcKbuUKPmdTYnwb3YxL0krgYCOtTJRuYMRzuRcf336Fo7LLmTSQxLt3bkMStpP9mr6jro1ILZ+lk+x5nxPvs8ZXcNaE61sjjI8I7Qi4zoJwlfBhRpmAFG3xyMQ0XaGGGGBSVPzONNeEPkQLbWGrs4ukb3G+dn6GSzDvAQWe/CBmJcYvofETcwFgfqbCl6EbPoeMIHL0N2zdtHzSgZX2Ba1nyF+gfk+AatNou8gw1CBy9HQ4IGtUsfSDFtzON7b09b6I8f+w68+IxBGJW44fk3PTC/VW7sgBSn00jkx+VV/TLwyFX6nX4R2Eaa3gYf7AY1ml/hN15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ijGQuFmEyKUVUhLiHinIazTqMVc+at/P6AIzqLgp400=;
	b=avJMlKMmf6F9HieIcz6sUxc0/6Q4vb+O+eu1VZ0i4sIRNFzpbw0NHJ2nR7SQ3YpIkW8G9dFSd+RsmYPlboRG03WOewjBkBoRvTZuWqDlHDXldeYzJkl3FjmrbiFdMp8PldvjpfHD3MTcF4hdirTy4IGf5CbJkr9OZNJzZ7jQ6wyZ877abLIT4S663ewFe2JJflxMadxutJFBF68T08C5FxzDv+EWCcmPQZiKNn7F3SHdw3OvwxC/iz/XxRsz8KCicxRnBOEitxjXD+TytDcItieuJ5zTw40uT3TfY1rHix15Jx/2hTcRkuHAUDg6aZ3c93LRxPVNpUO0qTzYM/6QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
	149.199.60.100) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com;dmarc=bestguesspass action=none
	header.from=xilinx.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ijGQuFmEyKUVUhLiHinIazTqMVc+at/P6AIzqLgp400=;
	b=E9fQg/7VOZy35mEQXCp7lNRxmLoLCPq0X/btWUSHEirmQ2Axh+3LQwYvXrk+hLsfKhEbee4uKDprDRwxW2xTOaeMG2AykjosmWvjjx78BcejzWODULBIfQSeSg0FiaLthuPnIDHN2lKg9b8VYikkPYO43kcH/xIS4bp7vbNwY9c=
Received: from CY4PR02CA0029.namprd02.prod.outlook.com (2603:10b6:903:117::15)
	by MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10;
	Wed, 10 Jul 2019 18:27:50 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by CY4PR02CA0029.outlook.office365.com
	(2603:10b6:903:117::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19 via
	Frontend Transport; Wed, 10 Jul 2019 18:27:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
	via Frontend Transport; Wed, 10 Jul 2019 18:27:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50504
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJk-0004WY-Ra
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:48 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJf-00053w-Nu
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:43 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x6AIRZPH005420; Wed, 10 Jul 2019 11:27:35 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hlHJX-00053K-6q; Wed, 10 Jul 2019 11:27:35 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 11:27:31 -0700
Message-Id: <1562783254-14818-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(4636009)(39850400004)(396003)(346002)(376002)(136003)(2980300002)(189003)(199004)(54534003)(63266004)(47776003)(48376002)(5660300002)(476003)(2351001)(26005)(14444005)(70586007)(8936002)(126002)(36756003)(50466002)(478600001)(70206006)(81166006)(106002)(356004)(16586007)(2906002)(6666004)(9786002)(4326008)(51416003)(316002)(7696005)(6916009)(426003)(186003)(2616005)(2361001)(305945005)(486006)(107886003)(8676002)(50226002)(336012)(81156014)(36386004)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3723; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba398ee2-b383-478c-cae8-08d705645044
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:MW2PR02MB3723; 
X-MS-TrafficTypeDiagnostic: MW2PR02MB3723:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3723335CAF514CC90F7F5FBFB0F00@MW2PR02MB3723.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CFTG7PxvxUuJWI++hOE7u6n9j4EkWo6PNX4oRczRLWLwZtv7icTpGIelUdEQY0LV+KxXhj3+BPkcKb4yQyQPbXyl0OiMS8N0LMFFh19lwJxX7L+hLLv0E5UIClZ18iieoFP9O1W8PP0QJWZ5x6U0mlLi+0B7HI4MtmsMOYA03Y/32M1CQNlk9X3ZCHOtOOa/WT6Ef97mh/89mFyke5SuNUU/1B7KM5x1DLZf/XF1Cfs7faPwUDnSNDwLMTh/kUN/141Xl9wy5ZBge1gz796rlq2dAmdwWHw+zl5mDvauQCj8b+YMqlQVUmUGYGS3Gi+s7yOnCMrlYnG12wx8eKxaGgLoVm4C/N8lenwjveNeU1yAzQwEKdpMwL0plbuSR6P16NIbXmrEGhUvWGPB64SpSOncw5kXmTc8C1Z7KKdpXF4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 18:27:49.5166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba398ee2-b383-478c-cae8-08d705645044
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3723
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v5 0/3] Devtool: provide easy means of reconfiguring
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
X-List-Received-Date: Thu, 11 Jul 2019 11:01:22 -0000
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

changelog v5
1. test against devtool oe-selftests and add missing function imports
2. rename function name from symblink_oelocal_files_srctree to symlink_oelocal_files_srctree
3. fix indendation

Sai Hari Chandana Kalluri (3):
  devtool/standard.py: Update devtool modify to copy source from
    work-shared if its already downloaded
  devtool/standard.py: Create a copy of kernel source within work-shared
    if not present
  devtool: provide support for devtool menuconfig command

 scripts/lib/devtool/menuconfig.py |  79 ++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 147 +++++++++++++++++++++++++++++++-------
 2 files changed, 202 insertions(+), 24 deletions(-)
 create mode 100644 scripts/lib/devtool/menuconfig.py

-- 
2.7.4


