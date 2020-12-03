Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.51])
 by mx.groups.io with SMTP id smtpd.web09.6161.1607038262462363169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 15:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=q0vwIjTM;
 spf=pass (domain: xilinx.com, ip: 40.107.75.51, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGvwOrSkffHEeBZZi8dmA9pu7vMjXOpaWwL7l5yoR/VHlPt63pPkyOznKutE0C0P7AkLPVazrrXySgA09BeZP7gFcEA0iR5ONXx9zrTAnwZTJvCY/y8v8oEwJ6Dn4GOqKiyeExXka1xHmHn/lGc66zbxNsVNuVpWCc5m0P+R0wihbVLFb4uMvwBN4/qoC6rBn75fvS/lp+5oMDLIvb9xZG9gxVJCtoqOLf/fDn9phNXT5+PAnlwf6PHnPIXTVgBGahzmofL1U5reOh7HXgMhPXxjkqeSPShIpsz5EXHuW48hE56f55CXGWG+32bTzLWqaXiTIAA40jyupHXen0fiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ionrrbSDkQavO9ymLnXjBOCwmMN/yTT9qJs8fJGV6ZQ=;
 b=T/Bfg76umn9b3oUM01f91iMv43wAqxxV5zHka64cu49y/qFwCuR+ZDVBvIpHObho/TMTw05NVvKbXUWOskfnuSY8k1hj4pgjEY5CpLjpLOxJCmh7B+/dKJwM3IuPfU6vPo92PoPKQTV6XHRW7TQGcSMo3YWSlE0LxApe5WYWvgla6+tuY2Ys8R3r49HFQe8gY31Eu8IJ0tgJsbCJytQ7ePCLu1QcgIA58mdHrD4Jpo3P6Tq8WGBdfbI+KrYOdOTuEFLvniWRNZNLclFGBDyh2QLQjx7m5F24p5qPuCMuhiqp6mo1VFwyhSp8Qxzxdwb7QSgr7wQEt+AVkYP2aHCpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ionrrbSDkQavO9ymLnXjBOCwmMN/yTT9qJs8fJGV6ZQ=;
 b=q0vwIjTMYMKm/+k3UKg4rsJiG3le1H1SgN4od/MgK8+3n/Vs5Fe9m97B2aje6yoYloO0TJbToXvmUUiNarCo+s+RtCMzsZA/EnLDKX2OQvop1aenszfRCEOZASHa4ZOe3z04nrChtrGMKWyvlWNHs9UyWOXwIEB9RSK0Jl/CfVA=
Received: from MN2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:208:a8::34)
 by MW2PR02MB3674.namprd02.prod.outlook.com (2603:10b6:907:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 23:31:00 +0000
Received: from BL2NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:a8:cafe::c7) by MN2PR12CA0021.outlook.office365.com
 (2603:10b6:208:a8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 23:31:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT047.mail.protection.outlook.com (10.152.77.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.21 via Frontend Transport; Thu, 3 Dec 2020 23:31:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 3 Dec 2020 15:30:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 3 Dec 2020 15:30:59 -0800
Return-Path: ckalluri@xilinx.com
Envelope-to: chandana.kalluri@xilinx.com,
 openembedded-core@lists.openembedded.org
Received: from [172.19.2.12] (port=38506 helo=xsjckalluri50.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1kky3v-000785-EE; Thu, 03 Dec 2020 15:30:59 -0800
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [OE-Core][master][gatesgarth][PATCH v2] populate_sdk_ext: use SDK_CUSTOM_TEPLATECONF variable to enable custom templateconf.cfg
Date: Thu, 3 Dec 2020 15:30:58 -0800
Message-ID: <1607038258-14106-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ac4227-46b8-4e98-f117-08d897e37e3f
X-MS-TrafficTypeDiagnostic: MW2PR02MB3674:
X-Microsoft-Antispam-PRVS: 
	<MW2PR02MB3674B5D3D5CD93520CE7A355B0F20@MW2PR02MB3674.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dCzMHVBqVRSOFMt5mGNAHlAtuldxHzB7w2hcqyOSRPzcAcxvaTIFfH/n7/YmYOo8h7Q4wVPt/HOsYiZ+dCxC3SmKmf9hCG1DxffzU6PLYq5mbJBy+vxOTWVDuaW9LHbENE5Fpc1IpwZEr5U5hnsIBAN/nXCcANdWCV+q3QTGj7xDH2s4sGfxEhfISrqJa0tL4j83pW30D7XKgWJLKMQzM0RUo3YIMq3L8BuNbNe1wEGqgKPXxYZRXPB7XabAuDkrUuh0nrhyadd30qJbiHlJ//WJYYK0p9fsTw0MUpT5a6XpKGzquw+/RERNweiOePenL7a22olMU9D1XQyPuZYT4Z9c86i5dDDzLhkZS6iu8s7PDpMlZQJJi2AFVWqHH67n6j54CcnTEfMUfwMotTYb0z+DCQNfM5lEDjynFa8mCyA=
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(8676002)(82310400003)(7636003)(2906002)(107886003)(4326008)(6916009)(186003)(7696005)(8936002)(9786002)(2616005)(82740400003)(36756003)(26005)(426003)(356005)(47076004)(70206006)(316002)(83380400001)(70586007)(478600001)(5660300002)(336012)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 23:31:00.2925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ac4227-46b8-4e98-f117-08d897e37e3f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL2NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3674
Content-Type: text/plain

The current implementation will always pick an existing templateconf.cfg if
present else it will use the one from OE.  A user might not always want to pick
an existing tempalteconf.cfg even if its present.  Introduce
SDK_CUSTOM_TEMPLATECONF variable to provide an option for the user to specify if he
wants to use an existing custom templateconf.cfg or not

If SDK_CUSTOM_TEMPLATECONF=='1' then enable custom templateconf.cfg. By default
SDK_CUSTOM_TEMPLATECONF is set to '0'

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
changelog v2:
Prefix variable with SDK_ similar to other variables in the class
---
 meta/classes/populate_sdk_ext.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 6f35b61..e6bf27c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -24,6 +24,7 @@ SDK_INCLUDE_NATIVESDK ?= "0"
 SDK_INCLUDE_BUILDTOOLS ?= '1'
 
 SDK_RECRDEP_TASKS ?= ""
+SDK_CUSTOM_TEMPLATECONF ?= "0"
 
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
@@ -199,6 +200,9 @@ python copy_buildsystem () {
     buildsystem = oe.copy_buildsystem.BuildSystem('extensible SDK', d)
     baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
 
+    #check if custome templateconf path is set
+    use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
+
     # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
     derivative = (d.getVar('SDK_DERIVATIVE') or '') == '1'
     if derivative:
@@ -390,7 +394,7 @@ python copy_buildsystem () {
         shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
 
     # Use templateconf.cfg file from builddir if exists
-    if os.path.exists(builddir + '/conf/templateconf.cfg'):
+    if os.path.exists(builddir + '/conf/templateconf.cfg') and use_custom_templateconf == '1':
         shutil.copyfile(builddir + '/conf/templateconf.cfg', baseoutpath + '/conf/templateconf.cfg')
     else:
         # Write a templateconf.cfg
-- 
2.7.4

