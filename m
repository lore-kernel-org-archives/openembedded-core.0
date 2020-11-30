Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.50])
 by mx.groups.io with SMTP id smtpd.web12.919.1606774051987390884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 14:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=gCwo41Xt;
 spf=pass (domain: xilinx.com, ip: 40.107.243.50, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LA678PJ4Kkv7Y1wDno/+hX2xM9MADGv8adjHJQW2oh8aH7biHxzRbdG3x9wUg81RdnoGibIFaTD7zMt8dokFSQOzcccEeF7QD7Ka5w2jFmNOURULa0f/ktecGZN2pdiBi44wXtKpVcK2bIhE5N0KbgkWasWa3DNU3kf4o9N+b/RG+u7a95pnoR8pZIz/RG6MWXVVFwoCExff5HLc5Z7r9qoahALjPMg4xegWUdaaMhoSH5+72Mc5N0N5f1fKomBsoAPcK2mHyIjSvFSzX29FdZUhKvDXbCBdZ2QoS5RGchNn1VVi2nyf1W4swT1F4wyyVUMa5uAWwaN3nzno5LF0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jt92UZHQ/edny+s3hOSWAZ5k+pLaDBQKeAZnoFPLfV8=;
 b=MByCB+fDU4w2KublbR10AGq8ASnlcsmrw3Dz2DzoUom+6ykeJixh+KpE/pmXr8o84r8EI0KYy2PNv0gYTOTOUFS1YUvJycCoYh7BWudiXZ/c2Ki9VzPhRLvlGzs2Xcz5sZPQeIu1IoZHQevjnYSnlEQ5vtODu3Ce1QXUjdJ2EATD8ubWsj+dm2ZYxLrukao+/xz+hjCosqQmN8XOrk4FAYXpX7wvcok4MYw544sL8JoOhRNY2DHWZX3XVA39iY/boaFsuhj7a2UyCsSNo5m/gEdPZt71JDj8jNHjBcQ3j8p7VCpxAwvrzGsfvVkgV95kagCiP/Icoa8AJcEBq843fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jt92UZHQ/edny+s3hOSWAZ5k+pLaDBQKeAZnoFPLfV8=;
 b=gCwo41XtgxsD3+zmm8wrdOFC0miFtMmlTmgB6+EhTotwQeKRBlHvsN1tejHGAishWlqdik5jiEm2TYK85ZBOi+F/+TbawAgHFnEFMwBY+P5XuwZeTEZV8d6hV8z3gv0hVKRma3DsIXckUdHw77LcIMpDW+4MTY+imMc58eagMeo=
Received: from DM6PR02CA0166.namprd02.prod.outlook.com (2603:10b6:5:332::33)
 by CH2PR02MB6182.namprd02.prod.outlook.com (2603:10b6:610:d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Mon, 30 Nov
 2020 22:07:30 +0000
Received: from CY1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::c2) by DM6PR02CA0166.outlook.office365.com
 (2603:10b6:5:332::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 22:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT009.mail.protection.outlook.com (10.152.75.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 22:07:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 30 Nov 2020 14:07:28 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 30 Nov 2020 14:07:28 -0800
Return-Path: ckalluri@xilinx.com
Envelope-to: chandana.kalluri@xilinx.com,
 openembedded-core@lists.openembedded.org
Received: from [172.19.2.12] (port=49574 helo=xsjckalluri50.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1kjrKS-0004Qq-Ge; Mon, 30 Nov 2020 14:07:28 -0800
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [OE-Core][master][gatesgarth][PATCH] populate_sdk_ext: use CUSTOM_TEPLATECONF variable to enable custom templateconf.cfg
Date: Mon, 30 Nov 2020 14:07:27 -0800
Message-ID: <1606774047-25380-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 333bf657-1ee9-4efc-5aa9-08d8957c5480
X-MS-TrafficTypeDiagnostic: CH2PR02MB6182:
X-Microsoft-Antispam-PRVS: 
	<CH2PR02MB61822E9A55754D4CD419C3DCB0F50@CH2PR02MB6182.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4g9mQqtUizRtWqZ/oLt8VoudaD9+kT55pqrMZ69kv9sl/qECRxXX2xn5JvAjLgUJ0eIPxQKvZu3WyqjONtbu+RD31NQDvj3y+PqroqmvZsJPNZRTeguSeSSSMK2cnUXbdsaMZf9tbsC8L/2kZlS/g65Dr2hIrdSiEZ2Nb2eGNDxpuaK2XhF0B1P1j3qQfypzIm4lNSGoY9J2v3+v2jhu7ekkfhC7PzUtKR2AmseGmSzVTn9OYuwfoOFJaYn34Q6N0LQPSaU87hmPPLswYt7qvSPluPp8JTSNonysIScsK+lCdPm8f91QBJqquNP7fGEuV0ZguAbKmw7A/Y45XKtBo1gxLNSiavuK9R1VonnPKEMbzKWuR+Xre/thVfGNnauNTJ1Qcv4VxGoJ5HIncVrAB7VlfClGnv3136ZRaS1iMUg=
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(36906005)(83380400001)(316002)(336012)(7696005)(26005)(6916009)(82310400003)(186003)(2616005)(426003)(107886003)(356005)(9786002)(7636003)(2906002)(36756003)(4326008)(8676002)(8936002)(70586007)(47076004)(70206006)(5660300002)(82740400003)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 22:07:29.7923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333bf657-1ee9-4efc-5aa9-08d8957c5480
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY1NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6182
Content-Type: text/plain

The current implementation will always pick an existing templateconf.cfg if
present else it will use the one from OE.  A user might not always want to pick
an existing tempalteconf.cfg even if its present.  Introduce
CUSTOM_TEMPLATECONF variable to provide an option for the user to specify if he
wants to use an existing custom templateconf.cfg or not

If CUSTOM_TEMPLATECONF=='1' then enable custom templateconf.cfg. By default
CUSTOM_TEMPLATECONF is set to '0'

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 6f35b61..d1f61d5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -24,6 +24,7 @@ SDK_INCLUDE_NATIVESDK ?= "0"
 SDK_INCLUDE_BUILDTOOLS ?= '1'
 
 SDK_RECRDEP_TASKS ?= ""
+CUSTOM_TEMPLATECONF ?= "0"
 
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
@@ -199,6 +200,9 @@ python copy_buildsystem () {
     buildsystem = oe.copy_buildsystem.BuildSystem('extensible SDK', d)
     baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
 
+    #check if custome templateconf path is set
+    use_custom_templateconf = d.getVar('CUSTOM_TEMPLATECONF')
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

