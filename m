Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 30687 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Dec 2018 19:21:53 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770042.outbound.protection.outlook.com [40.107.77.42])
	by mail.openembedded.org (Postfix) with ESMTP id 738E16BA22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=beU+2JpANdZOHUwrT8mKg1OF25vOgKd/NYVA7Fxy4ao=;
	b=FoeRuLQCroObFXC1NrcPGXwicA8yGY3JsavHD/51fqWF2WxGTKoXe2j7lTH+aCFAp/eVGHVB7jerR6g5gcObHaCUqw1tzBFzA7PT3kjijXhu/EjPMHxG8CWbE82gtZZ7/8VebjRIWWzNTAnohVRQG02lYOrhlyyLmoFRFv+PB5o=
Received: from MWHPR02CA0060.namprd02.prod.outlook.com (2603:10b6:301:60::49)
	by BY2PR0201MB1896.namprd02.prod.outlook.com
	(2a01:111:e400:58b6::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1404.22;
	Thu, 13 Dec 2018 22:18:10 +0000
Received: from SN1NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by MWHPR02CA0060.outlook.office365.com
	(2603:10b6:301:60::49) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.19 via
	Frontend Transport; Thu, 13 Dec 2018 22:18:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT024.mail.protection.outlook.com (10.152.72.127) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1425.16
	via Frontend Transport; Thu, 13 Dec 2018 22:18:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1gXZJ3-0008Ra-MB; Thu, 13 Dec 2018 14:18:09 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1gXZIy-00075i-Im; Thu, 13 Dec 2018 14:18:04 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wBDMI1LF018725; Thu, 13 Dec 2018 14:18:01 -0800
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1gXZIv-00073h-GO; Thu, 13 Dec 2018 14:18:01 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <nathan@nathanrossi.com>,
	<manjukum@xilinx.com>, <alejandr@xilinx.com>
Date: Thu, 13 Dec 2018 14:17:43 -0800
Message-ID: <1544739463-14029-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.5
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(189003)(199004)(478600001)(8676002)(47776003)(81156014)(107886003)(81166006)(14444005)(126002)(2906002)(8936002)(476003)(9786002)(486006)(26005)(5660300001)(77096007)(2616005)(336012)(44832011)(2201001)(6636002)(50226002)(426003)(6666004)(316002)(51416003)(36756003)(63266004)(54906003)(7696005)(36386004)(106002)(110136005)(48376002)(50466002)(356004)(4326008)(106466001)(72206003)(186003)(16586007)(305945005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB1896;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT024;
	1:7P60apNX3CFzPecoX7jVzfcpT+J3Mx3r6b61YI/+/wYlAH/xnhnMEuvI2CvWWDDE3H9RXzOHvh3D4pcbfg952bpf4msyrokmWvlev2XjZFBpLyN+zACqpMVy9NSkULw2
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02b31e3b-25dc-421b-5ebf-08d66148dd86
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BY2PR0201MB1896; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1896;
	3:HL7GZuxnexKQK75mzpUWaw0kN3b8kpNPG7jdTSRlDVZncDQn/ukfPhE37bjRLpBKteUEG7XZMxbE2NM8F1Xa7xAf9rGbCQ9oJCh+1+T+SqgfJx85BUDuk4SKLR6eptjR83gH2ONdopcQV4wiK7FzK+0L7hRIe9vPfcLS8YkMHyqS4f8bpvpyr6D+L/9p2V4DCVgBQlQ1MhXZjAMVu7SjgiGbSOjELsbrGTKmMcTBfWkJLS93ymY4b/AUSHqLcySa0ZhNjsIRlGXA04qosnxxibhgxuO6fmOWYUTUVGPb9nBFbCICDce9/tqibG5rpxQ4HVzFaz0sNl815Ul6mZkZA96ooHu+/EwbvHfM+IGpzLo=;
	25:Kl6Eip7xds14AtlCfwNrRZfS8jTu8YsPjduKNnTA3uS0KUE1W4JZI4SuB6U59Du9+UN3fZZ6YaJCBSqSFrb9+8gFfUhHwSymoH72EF90fntEXwS9HQbCtaLJr/GvP9tpFG+k/lWi6qPHjOVKZGD9XmlqHW7adpcWuVnFwjJ59MDHDRB/axeXgGpJs0RO6wfdmVkBSppj4sa5dSLC9O9BhUvXlBm4JK1eCSyEduEk6Dy4Z1xSn+70HYRNZeCeF18lvPaPXDTTdb3MfjmA60ptI9ZNTqvxCvaEVIJYl8jK/qbEkPn3bvR42NmM1fIvlBTFGN/+4O4KDwbM63t+1nN3maEWFd6Hq8f+xZsmM4+Um3g=
X-MS-TrafficTypeDiagnostic: BY2PR0201MB1896:|BY2PR0201MB1896:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1896;
	31:qjBmmD7yX+i3dV7t13SKInQJWTC8EZvcWFGOTaYa2/1ZYwuAGD4NX7Ec252fYvMtYXcoyiNQyUIgkanbn3hg0q2429xPJKXqFxhvPCu27EKCrQ39Pt3u/2cywViBj9uaIB6wLmuM8xXksMcIjjp3Fk0l99pHT/BClZYa45sDy70k6MXKQMl4rcni5P347aqR+IgVvQ0Rr0qnKp64CzIwaQLzGBmH8w3E2wqTTQ0oTzA=;
	20:P+BjKjEoRI4vOcYjcurvVHROeTk9ao9okVGuDwW9zLZlgzoSiltMX9LZvEOCZERGSsXxYXBdFyry2opdaQKFMItzbT+etHDu1NoGL/5PFgPqf6OeRdFELgYCKhLMlHAFAUG36mIIlstNScR/qE2nePIqpZVuY3YjKi2ldodsydZGczWxvccwVAgnKDh+ioLsjT91SWy9PQauJcjF01MFd1gUSLIdw+fogJi14eb2iA24fKbuoKbv0ApjCNbC3Nmz3nRslXsxQR2stvlJD8+zDFjQiOXxu8+PZ1+ELnUaKvws6xhn4NlFrlLPzv+aF+P8/BZ7t0xW1lC/xP1s3sVDYNeqrjAeDelOKL/NJHLERXhb0tHg46eNry1Z59UKFUSetlM/xmHfWSHwU+8ZgJZj5Q88z867hFq4MRIX7vYywTs1DLvzixToE5i45RzG5nH+b+kMIGtIvnG419kYsY4KJnp00u4fMEKBs/adntemvbpYl5SyuTu9tzEfSLLdpJyn
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR0201MB1896A35B5C4B0C6DF74C031DAFA00@BY2PR0201MB1896.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BY2PR0201MB1896; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0201MB1896; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1896;
	4:CXxgdjTk13P2kiZkqQgLQ/1mABqitRIkHzViVYHZrJ3aiHIEHVRM3xkBBWzC7DajcXiyV0CRPF8/mmkwjJlsBRt85q0Mj89WIMXg5YSOniZ5Qy/V5L1hVyAN1ouRSpCTNEckV62vnJVwnD5uCrGx1gZGBRgYbCYMuROtWstN69wRzFPFA2mUvgxfO3mB86jFRBg88qGG1G/h0Z5zUl0+kF7Rref5HZGKW+YBrWnGYWA5AqR+u+j2CxeHuD9yEhrY1P+ZmMrIvcv90y9JqQG4iQ==
X-Forefront-PRVS: 088552DE73
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB1896;
	23:8+r4Pi6FJy31TJeYdJAYb09Rx6/aEg2RrzK6KAW?=
	=?us-ascii?Q?P1iIXI/8XWc/9qswkaU4nZ4Ip+xtJCerkZnO3SdWR/G+c0n63AXWSypiGX3M?=
	=?us-ascii?Q?8T5dUiyZTsr8TR535P/kieRJ9yE2cacLrSCYKk4KCzMxD6ioK+2YTivjbRq+?=
	=?us-ascii?Q?ONsLs2ta4b0IHuLl868V+W7p+fpa8loa8srVhLhk23gDokptHQguQsgXEp/u?=
	=?us-ascii?Q?hw/TwH4W0duVs4kgCwz55a7tsj8qbWVGUfzzISsDcoHgMR9N3Ro5sKzoFaXK?=
	=?us-ascii?Q?UvENdns4RgQxsV7/7kihZoe3X8P4xSdnH9VS3Og/R0RrGcHaDcRuYirU7Pde?=
	=?us-ascii?Q?wsyyRfuYf0i6cQH8GALlOWBphxbNoaEQBAW9nU2sjJ6tYmFVfDzLsZca4pLo?=
	=?us-ascii?Q?/pW9vwmG/wkViV/wfF7AnqfNLovY6UBRdES+aVDh2Hx0naPbY4tRXYHh/d2g?=
	=?us-ascii?Q?PfSmt2cwMq6YlwTzcndGXrpdGewrC6fzoYtrZxvyXP+EaJ0JojIncX/ld77L?=
	=?us-ascii?Q?Au5JNZ2iUP7OZ6w4dJp6+yhzIaFzPf8BL4bbTFxtvRLVm8NuJ0MG1RPvwl5q?=
	=?us-ascii?Q?4njLaZxXe+rfLsNc90ndIWItlPv4qU5HmwxIZYw99F27HAnnhmLMDPZWS2N7?=
	=?us-ascii?Q?ZFXURilzKX2y2/vmxprn6mP/m4lfuK/kxzMR6eRTnFjCZ4WAerVQP6mlRw9x?=
	=?us-ascii?Q?R7ovhXnyFOIPzlq0zqY2zx3XcSk37p7QUqB9BwvBDwQVFitNw/P+3gtm96al?=
	=?us-ascii?Q?0Z0FvcaIC+LDnKf9pO7Wce+4x0OFnIojolX7JwbOWIgD1UzmemYOZk1e+eQJ?=
	=?us-ascii?Q?sP0KMcZoNYERtGK3tYJHqQ1ihwiLPJa3ZSnNuaa1/uvoQC82B5NqVmFjG3z1?=
	=?us-ascii?Q?vYOH1vhFpiq2j61g1dKIbT+x9lxfC/ZtXigCon5dXqv8fjTmGwid1nP9hI37?=
	=?us-ascii?Q?wGHKZLrCg/+1AzuyhV5VanD3ngGhrKECVGfx4MzKYMTMAf3Pq1u03fWThBsp?=
	=?us-ascii?Q?d8H4PelZL4dhK84Vcs9g9jAq3xSdXS5IjKID4kcrItTovO2fWZ5oktpytZX6?=
	=?us-ascii?Q?tToByLIKPLF1468kYA/14KeYeKVl5Z1y5IAendojjt+g+wqFX6BItr4ydYRh?=
	=?us-ascii?Q?1JhgGAKyhxLByMakVYV4MCSkQI2sM34yy?=
X-Microsoft-Antispam-Message-Info: fhtMkOmJuQ12uwu5ydVlThhmrZE97bFry5b0EZOPWXbmyzfngS3w5mW0/YLgEunrkR9f5zsHiVmVwAqc/TmmkKitu+UvSMJwtq9hgJQG2pVSEJVzBahORxxFWd4dZCL8Q5QI2bBPglmxtmVFM+b6oaz766ognVWzUFj9vTTgi3hYqcpnQf/isDVzRIJsz92oLQeMYhdtVgHNNMtlKvGUtcWZCmf3XApfG/HVzd0kzQbYXPfoOErGOUqUU8XQ0eALPh4fiJdzh+kdHuaWs7IhhXC+a0VBQ6CZDVqUd0qGBIQvi1RvLn9oulzgStyeFKSS
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1896;
	6:IjRGOECwn12Fnshuc1QLOWNnrKAayI5LkuXj+zlcnqfdxCUmfAouUYupKMUwfDKfpbEa/R/CBXD/ia4Ai23nhXb9Wv9Auismsg/nZIJb0loPvjtYHMZbZ6ONfp4mn+nOFPUxU9Hu12TG1MMWwtljSwxahVwFilg4CIabwzcBXZFJeUdIVvS0lqRMwW/qQ+6wPAI/oPAJu6zqdrP2Aehxdx+F04Ery4S+ehFXjNRxP0RrV9H6w+X4siiojyNi86fbIl2O3evAmDIt/+97JwIA9Ju4/+b7TfuFKXYwPvMLQATf4tDbJQoL9Ft5QWeIIwMSREBBhFNEUwH2ZnhrnQlfQcYpYkb2rZ/SnFSVbRYOCC7l0c9wkmz4xXnpvMwSQmFo3Gu8nZW28hKlh3EAyeQfMEL9g2esNnBmw10raA1zFOytxNsSdNU7CvO/MSgsA+yfmjHiLY7rKCfL2Lgrjx7zouMH0LtGp+/JPOD1XN6c0Uw=;
	5:B8BQCAibCF9SSwYz+LtvWaZscu8EUOHQFWDUF0jtc+3Kp4/duwEw6Ubp1u9DPsjoHObZVtt7kNu0j2oJHeOYVzpR7JC42cdNyc3nu4tkA61mUoFLhB5I5cKrhzZl6lumd4sJMrDpRwTQJliOmImY4RQPOXsb4Z24fvO6FuN5wsE=;
	7:o3A50eNPl58ZR8v9WSlnE3wEFawmR3zxCGrf5ACTyAWbGt4q4nT2WTbE+MXjRDJ24VRN5EkhB7oZr1BqNR4jGENtSvBeslxW2fB5OUAkjtYZM9C9poM9VRVsThb/t5pGBgLPjUuc+p6h3BBV9t2r4A==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2018 22:18:10.0364 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b31e3b-25dc-421b-5ebf-08d66148dd86
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB1896
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1896;
	23:ohQ1CVlJ85ugqZfhOeTTmdg8rERKECGTtMICpormGBgSrayf4gKv1j/DwZJE6Zntew9IQITf0uEMQRpV0pC2kuJ1B8VBzWNNxTBUX+7ncbHVO5upbbToShXEMUnk/1Xete1jxvJSEMWGYlCB/fJcmw==
X-OriginatorOrg: xilinx.com
Subject: [PATCH] device-tree.bbclass: Add support to compile overlays separately
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
X-List-Received-Date: Fri, 14 Dec 2018 19:21:53 -0000
Content-Type: text/plain

Currently only dts files are considered when looping through files to
compile. Modifying the loop to compile other files that are overlays.
Also surrounding this check with a try block as the function to find
overlays parses the file for a '/plugin/' tag, and there may be files in
the DT_FILES_PATH directory that are not parseable.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/devicetree.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 8fe5a5e..db10b86 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -120,9 +120,12 @@ python devicetree_do_compile() {
     includes = expand_includes("DT_INCLUDE", d)
     listpath = d.getVar("DT_FILES_PATH")
     for dts in os.listdir(listpath):
-        if not dts.endswith(".dts"):
-            continue # skip non-.dts files
         dtspath = os.path.join(listpath, dts)
+        try:
+            if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") or devicetree_source_is_overlay(dtspath)
+                continue # skip non-.dts files and non-overlay files
+        except:
+            continue # skip if can't determine if overlay
         devicetree_compile(dtspath, includes, d)
 }
 
-- 
2.7.5


