Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 68148 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Feb 2019 07:03:46 UTC
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720066.outbound.protection.outlook.com [40.107.72.66])
	by mail.openembedded.org (Postfix) with ESMTP id C4C607CB03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=p3dGR4c2oD4meQLZin+LwxzW5WsZ5eEASMnEvVW4Jqo=;
	b=YFth9VDxs4fywHahNrL+Vsvyo7vNSPyIc1UWSmxnpJnmuBZQXQzqAWxliZ7OH6zgvlPljf6ef7LYduHPadDXFWGc1gYxTRikRuCwejSyIo0emoiLRjx4qGzPG0olaAFt3gtefzUcy0utFOHobB6xdVTO1/yGHgdmjo8+vYqhnfc=
Received: from SN6PR02CA0026.namprd02.prod.outlook.com (2603:10b6:805:a2::39)
	by BYAPR02MB4631.namprd02.prod.outlook.com (2603:10b6:a03:5f::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.19;
	Wed, 20 Feb 2019 18:29:18 +0000
Received: from BL2NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by SN6PR02CA0026.outlook.office365.com
	(2603:10b6:805:a2::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1622.16 via
	Frontend Transport; Wed, 20 Feb 2019 18:29:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; balister.org; dkim=none (message not signed)
	header.d=none;balister.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT044.mail.protection.outlook.com (10.152.77.35) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Wed, 20 Feb 2019 18:29:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwWcO-00022x-4Z; Wed, 20 Feb 2019 10:29:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwWcJ-0006KA-0K; Wed, 20 Feb 2019 10:29:11 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1KIT7d2003097; Wed, 20 Feb 2019 10:29:07 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwWcF-0006JQ-5D; Wed, 20 Feb 2019 10:29:07 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <philip@balister.org>
Date: Wed, 20 Feb 2019 10:29:06 -0800
Message-ID: <1550687346-2348-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550687346-2348-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1550687346-2348-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(189003)(199004)(54534003)(11346002)(486006)(47776003)(2616005)(50466002)(336012)(316002)(16586007)(126002)(476003)(446003)(106002)(51416003)(110136005)(106466001)(7696005)(76176011)(5660300002)(426003)(48376002)(356004)(36386004)(2906002)(36756003)(4326008)(63266004)(72206003)(107886003)(478600001)(50226002)(305945005)(9786002)(77096007)(26005)(14444005)(81156014)(81166006)(186003)(8936002)(8676002)(107986001)(43043002)(42866002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4631; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26246a6f-c4b7-4b28-adfa-08d69761526a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
	SRVR:BYAPR02MB4631; 
X-MS-TrafficTypeDiagnostic: BYAPR02MB4631:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4631;
	20:p0fgYgNz7ec+QE8D3GqN2ezioiX9NOyk0rQNNn+YnwBhQYUTFnctzTV8JmSwB9w5Hm3ZAonYvKypiUIsgCCG+q8UMu9I408qpftL1BIMocz5OdPCP49+VYVSFRb6Yr6/IHvPuL+UWOwWeCRHR3SOh20blU1R92HbLAhRCSc+KFFk/iDL2lDScA0OusLBGbDnYIfzDxRqGQe7aN0ycX54Hx7lIta1YhtLRY8cflKodIcTnSunCCIq1Im2pSH53raIOrnoBmD3vmNXNEmnVDiHDgz9JveBs7/yAdLa2fhKiEOZlNW78cyC/6Up0RrDxoDlcV+i90Mv0ZTpqK7KflEjg7RKxF54KVgDZYgHqUip0fKsH0sNGsy24ZY6OawHtfresOiIO9UL+BsJS8BI5hnXh7SKFVKa2SW/TZMbcof5AoPixRqUk/o9FgOmjEqPGy/BZah+bM5FDGLa3csZzV/hkMSBKSSep7wUV5xsqk7Uj46jPwqDMVKiV1LNJXhZ9vwg
X-Microsoft-Antispam-PRVS: <BYAPR02MB4631ED3DE69E236F3E9B1973B97D0@BYAPR02MB4631.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0954EE4910
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4631;
	23:kr2+RCvDs8umNf6KoXFhbh2dD41LU9jqcZQU7uFy8?=
	=?us-ascii?Q?nKw/xBiMUJJ3tzi6BFTathV/Hir/b6eJtQiJcRM9o+wK2SidxpGMsy0FWYjU?=
	=?us-ascii?Q?RlUH7oJkjp76nfXh8936hDrVHKi8P2vCELAUPfQJBDxTX7sw0DHugYQOC/Uw?=
	=?us-ascii?Q?B9mckgq9rCVm9xwPe0DIVOxybYilMQhay/OBxV29Rc7tfEjWl9cQMA3KNHf8?=
	=?us-ascii?Q?gmaa7tVl/5IbcGm7EWKp9jxxg0h2J3vPw0BcOVstMASUgnjLEZEWqjVydVBK?=
	=?us-ascii?Q?fgVn7PYxLvBfIeSpKXzFzebwzOfRUZUWFJXK1t3foIQz+4NKavz4rgtj6Xls?=
	=?us-ascii?Q?T/UGUYGl3aFVc71yCRyJUF/NmloBN/gLOgnht6AzFBGEgkRNOwYGvv9LKSPg?=
	=?us-ascii?Q?KRZBv032DE47X0t2ORFyw3vSYuJ7W+lnnGjcayz8XCue5sMjhccoq0MaMj+1?=
	=?us-ascii?Q?8FoDwHQu7nk35w7iV4nzWjvMztDralbzb9iaXXAQQ6WBvChncHWeTz/PoTVb?=
	=?us-ascii?Q?xGqg6tzfEHgjtYYj++1pGyaNt2oyPAyBNX9RK9CxVgVaD29P4wJuHH6wKDkl?=
	=?us-ascii?Q?K9TDteGJilsSos4arLpI6zgq83NhGky2gRnx5jvMtfDLu1tY0bGYnyG3GK93?=
	=?us-ascii?Q?iy7GLClwNOeHJJKyb0VeWo1ciBLl1Fgs4amOfH/5pvMPl5fmbx49hf5HcCCI?=
	=?us-ascii?Q?Fx5XU8qKKezLyKF5Ebusw1Hb/jdA8u9KyVjnKORBXOGHYvNuhHVx8MfIHiZN?=
	=?us-ascii?Q?GFzrHgUrq+pS7vFTyo0k1DY9/nK3hsg9hkcM0AWylYBhGYoI0a9V9adaydRs?=
	=?us-ascii?Q?rWPHkXIeccA37W7/E0qmwRXRTk/ALm8eKSZSNz5eEDekdq0QhiPfL4mw1t2V?=
	=?us-ascii?Q?NUjD+EMRARWQpA9ziiqEQkLZ1JDRuFzv4Wrcgr4zheg35VSBI6f3Jc8mXCZC?=
	=?us-ascii?Q?1FC7paBB9hZLaCbXrqNu8jowqfFzmFArex/9gyn4OTZgNxt0M3X1dCAADLFC?=
	=?us-ascii?Q?ygf4iG2YBDE6yJPwwV1Vzi3FRmku80aTxrHNB+4ia5jRgLvhRsHJLLttsBL5?=
	=?us-ascii?Q?7loNuK0YQ6jUGDL14qb2DPAIEDpTLqPRr07lzmfGnLi1bSpT78toUBxS0ATg?=
	=?us-ascii?Q?JR1AxdKZVaEW1C2FrlQT3LIhmih9FQyzgM9s4DLzDhwQTcwVDKO+w=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FYKQc/h4q9cc1FB5gLW1fuwifb9d2gALaXf8SB5PhR5y//Y7K5+Qrb0LECdjv6Glq+XWQFD6izLPN3cVRQBp89DHWMimp7r1M5SWPOWr/zKNEXUxlY4WCy2CcI7B6v9KcItMoH/WzLjyo87bjkYqbHwD1I8ZsF97YhyP6wwsOhPjlOiw5jCtOw+1Bba0h17Xv9i2D7D176B48X2HICd3PllIuciq1Zv54y+TUVJ+seNTYED9dpEBOAocXxf1WxWikeup4mKHMtAgzEjkBCZ6PbUEjpbRUrf/tjQyDKoJWFV4t1hcHGfQVOTMbHAF5vNvakyGS3krVnmm6o4OMWbm3Pg1FlXcRPKu3C2Z39H4KWCCY9k7pMqULpKxd23JygpSVUazvacHEiu0QSljmAd4JErtTvg43tA7hwSPIgwHnnE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2019 18:29:16.8087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26246a6f-c4b7-4b28-adfa-08d69761526a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4631
Subject: [PATCH v2 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
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
X-List-Received-Date: Fri, 22 Feb 2019 07:03:47 -0000
Content-Type: text/plain

Currently kernel-fitimage gets the dtb from KERNEL_DEVICETREE, however
there are instances when the DTB file can be generated using other
recipes, provide a way to include the DTB instead of inkernel device
tree.

Add support for external device tree during the creation of fitimage.  If
virtual/dtb is set using PREFERRED_PROVIDER_virtual/dtb = "devicetree", which
inherits the devicetree.bbclass then use the path provided in
EXTERNAL_KERNEL_DEVICETREE else use KERNEL_DEVICETREE during fitimage process

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
Changelog v2:
Update commit message to indicate PREFERRED_PROVIDER_virtual/dtb = "devicetree"
to set external devicetree recipe

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


