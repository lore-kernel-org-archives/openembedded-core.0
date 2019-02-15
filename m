Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 14528 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Feb 2019 08:31:24 UTC
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
	by mail.openembedded.org (Postfix) with ESMTP id 36E617C70D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QQn8tQHpen+eKhaztguMK8HTUOmvj+o5XR+VDeiLzTE=;
	b=Kdjm2ZipN1TPRTqMLoJ9Gt6WCtmMeYcqrfe6/9zgjXNSGNNtx+XxJaW6rQhG1KofYUICN6OVqh6Ec+0XxVYcnMAXVvSYvIOt6yGWWaLO5ISvPnR787G0RreWDMmoEijq4a/wl1aN6I2tnQD5isyqx4jn5GgpajBG8BUsyK4w0Fg=
Received: from DM6PR02CA0010.namprd02.prod.outlook.com (2603:10b6:5:1c::23) by
	CY4PR02MB2646.namprd02.prod.outlook.com (2603:10b6:903:72::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Fri, 15 Feb 2019 00:56:46 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by DM6PR02CA0010.outlook.office365.com
	(2603:10b6:5:1c::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1622.16 via
	Frontend Transport; Fri, 15 Feb 2019 00:56:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; balister.org; dkim=none (message not signed)
	header.d=none;balister.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 15 Feb 2019 00:56:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRo5-0004DH-85; Thu, 14 Feb 2019 16:56:45 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRo0-0006K3-4I; Thu, 14 Feb 2019 16:56:40 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1F0uUeu015889; Thu, 14 Feb 2019 16:56:30 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRnq-0006J6-1O; Thu, 14 Feb 2019 16:56:30 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <philip@balister.org>
Date: Thu, 14 Feb 2019 16:56:24 -0800
Message-ID: <1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(189003)(199004)(107886003)(8676002)(26005)(63266004)(126002)(305945005)(426003)(486006)(336012)(2616005)(11346002)(476003)(446003)(106466001)(110136005)(4326008)(106002)(72206003)(81156014)(81166006)(478600001)(76176011)(47776003)(50226002)(186003)(8936002)(77096007)(16586007)(316002)(51416003)(7696005)(6666004)(14444005)(356004)(50466002)(36386004)(36756003)(9786002)(48376002)(2906002)(43043002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2646; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT024;
	1:iOwWOW6TJv7MoGS/gaCfdS3GLGcOSOBKh5TkEhMlVMUS/fIaU+lUYe7Qj/S7JuvnWxXrGa0H0TIFLZiCGXcH26vkEVtixIWhixnUK57m8bHeQQVMqoqu4qXkdgN1zRIurdKnJCVUZsOhBRBrZmGrxpthJNyUMhdNmI1Ud+9qWDs=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd313be0-ea6f-4530-7947-08d692e07568
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:CY4PR02MB2646; 
X-MS-TrafficTypeDiagnostic: CY4PR02MB2646:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2646;
	20:73McEvlFTGyuwDQNYLEGhh4rPdfWzEMT9KT4IoJVMlc6GEHSv17cQowdAV4nIpFcAyRI/BmW1jNAOcWz3BqtDUwFsKSBtLYy6TLHpyLxV5EDjIqk5byoohfBy+fbRAUPtMrWkDHqySybccY6N9DwXAhi3hgWuCucyKf2b0Be1f6ZbSPY5IlwFEhLbXQO57bMS9aHpLNV83TwcIeS6mEhAtODRop6IoFzoQmZ49jW96ml/tIQXrawSm9rbjKxRXIsvqza+Mr5b2Ua06fW5SXPMDGCogtxCkgiN1JcKsjft0alUnWcX+KQ1Xcxo0d3hCFL8ZTpxRFGzdFVXMyC7AqjYrF6D9b39QyC5vLm5ETpSN4v4HdVTrYpTKVRNH5Zmfj6n2cgJ6/6cYvs3jIWzhwhza1eQyCnFCTL866tF7n0t8EtGZ+24zrcOL41ksZ5aEHy/M/Tbr/DzQn+g1J2+5g3wElN5ZrF+hy/CLKYjKaxRNhmkpb0KztvEywnjmufGbQ2
X-Microsoft-Antispam-PRVS: <CY4PR02MB264687E3E0AF25BB7C04FE16B9600@CY4PR02MB2646.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09497C15EB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2646;
	23:PA2KOIVquKwrYxZPD4WZNsBhAxikb8Re7g59OX6Gi?=
	=?us-ascii?Q?2kvFNIgxdfNnkn27/j7YqbEk6UBh/abZ9Xmy3B2uZb+YMGKF/ionGb/Hvtvt?=
	=?us-ascii?Q?Zoum8piGEEcAMm4SjJWL/PHUUKixLOd3UNXNxH9U/dLSweJt2P+0byDntQ4/?=
	=?us-ascii?Q?IfLWwHZ3lK2WmqBbSVZdxnMaQdXPQy6bH6AtSiXaMLMlqLOJ6spfrItVXjkJ?=
	=?us-ascii?Q?X3clsGD61QvqnkVeJO2BohLzo5CMswv4bimaeT05VKxPQT/+CwLV9QrpnrQz?=
	=?us-ascii?Q?5cpgrdUh6Hi5+IScjp8XnzLurj0gRWWpvBI3nHdoY7Wd9j/DgHSOey150fgH?=
	=?us-ascii?Q?z11rfsjyRU0NOWWWC7k3pQtcGcpNTN50xnv4kWJ7BvXqN1IsWhic0O6jMq1J?=
	=?us-ascii?Q?ZtVcPJD3JbEOf0ohd1sdZ9pj9+HWTY+7i4IgFRLDghNLnyTaFyrc9z0gyfYL?=
	=?us-ascii?Q?ec9hCQkfDcmmemCSPtZwZXz39VFsDYEOuH1P+4CYrxnZHHvLZjC85znypjzJ?=
	=?us-ascii?Q?Ynfp2i0DYT57WQiMnNdbIv167ihq/m1kXkF9gvP6QIbM3J4HX4d/i+AP3htj?=
	=?us-ascii?Q?5OrTUX/azKX40WiqYr49T6/C5Nla/Tjh2CYO2vUI7qxHxsYvzj0+dmffiUtt?=
	=?us-ascii?Q?yPEEHCr0RmD4qUkbIomPKj+IfmdzT03jW8aXzC7xUDqDhl7+uxvnxUYfRBD4?=
	=?us-ascii?Q?K8EgnbBwcKOLLLi28+XbILDxUNa6aJ3twPaO91IiccQrbr4F3l1ekVl8c1xG?=
	=?us-ascii?Q?Oiv11Ra2T/ORT/LnAwyoE/KjE8QLVd8rpMNgqjKuhSytJ0ViMXW7CAc8/4pj?=
	=?us-ascii?Q?GhcgtY4dIZaSxyvuigl8RTq3WlcPWWJUd/6mg50JbZQA4QZIsrFTiTSqUhhG?=
	=?us-ascii?Q?l21oHZt4bqQ3lGWs1urr8jX21q1CoIJa5VfCy2Bgr3PBz4DfwcspiT1bVUCe?=
	=?us-ascii?Q?lRp1uBJPngOrOTIzR4meA1MGUwO8nfBy8xxYxReNlffHvG79P8foXd2kq/Ro?=
	=?us-ascii?Q?XNf3p7Ku8y4UgpTm66DEGUMJ56VUE+elv4/RXwHOWszV0K2LLbZ1L6p7rel7?=
	=?us-ascii?Q?WJHav348tAiBKbdRRRy+mkoyGz3g4aGNfOEDxSsxq/F3LnfcQ=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: niE5jyiIGmFqWwqFgdtCKEQ3+s2BnXYuL+aTWLpszJhrAF/6QcGFYUczNh7pZnExwC5bDjQlvlbtKagfv4c0Z8r496fBT7NFCgaRCKbE5I8u4h20ZYfrtag7np26SN4MnXm1uuJ8h0HyN4WBYCGqwyhyxjPxyMUU84/oVA5s5N99saxi1gRi9RE+lE+cuGUsFVynpdj5DF6lnelx/xFIh+kPrYkhUOg2LrRjZ2XLzXpmFOBIz9Xqvqe+nPf3CiTHuXdeIHSf5wShy9TyJXxB+7zmLIRYGTGtSa4UUav+/W8Ul9wQqbPy/dkyB540r8prj9llHxbLQgB1dolIdfq3lbzteNtG8tbhmhak2PGzpSxOnqLb7zykV+T9qubbGltJ0ynqDiNW0R7e9caMF0mrtABpBhI0QeVH+MrlXDj7YuM=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2019 00:56:45.7873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd313be0-ea6f-4530-7947-08d692e07568
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2646
Subject: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
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
X-List-Received-Date: Fri, 15 Feb 2019 08:31:25 -0000
Content-Type: text/plain

Currently kernel-fitimage gets the dtb from KERNEL_DEVICETREE, however
there are instances when the DTB file can be generated using other
recipes, provide a way to include the DTB instead of inkernel device
tree.

Add support for external device tree during the creation of fitimage.
If virtual/dtb is set then use the path provided in
EXTERNAL_KERNEL_DEVICETREE else use KERNEL_DEVICETREE during fitimage
process

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernel-fitimage.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8ebd3dd..3adb1c9 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -30,6 +30,13 @@ python __anonymous () {
         if image:
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
+	#check if there are any dtb providers
+        providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
+        if providerdtb:
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
+            d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
+
         # Verified boot will sign the fitImage and append the public key to
         # U-Boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
@@ -373,7 +380,8 @@ fitimage_assemble() {
 	#
 	# Step 2: Prepare a DTB image section
 	#
-	if [ -n "${KERNEL_DEVICETREE}" ]; then
+
+	if [ -z "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -n "${KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
 		for DTB in ${KERNEL_DEVICETREE}; do
 			if echo ${DTB} | grep -q '/dts/'; then
@@ -391,6 +399,16 @@ fitimage_assemble() {
 		done
 	fi
 
+	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
+		dtbcount=1
+		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb; do
+			DTB=`basename ${DTBFILE}`
+			DTB=$(echo "${DTB}" | tr '/' '_')
+			DTBS="${DTBS} ${DTB}"
+			fitimage_emit_section_dtb ${1} ${DTB} ${DTBFILE}
+		done
+	fi
+
 	#
 	# Step 3: Prepare a setup section. (For x86)
 	#
-- 
2.7.4


