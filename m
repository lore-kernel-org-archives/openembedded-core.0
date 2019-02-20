Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 14262 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Feb 2019 06:02:54 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760075.outbound.protection.outlook.com [40.107.76.75])
	by mail.openembedded.org (Postfix) with ESMTP id CAF076C491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 06:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kwH3r6oReITy5IkmVTOu6PIdFY9GcAYziZkzG6OrYhA=;
	b=zc5UifWaIxBiLQExwFLTTTRGl5U6ggF6svNl+AJt1NMViqKEBZylX0iTOYN11q255cgSQoiq1Xf/3Rn8Mazhh2Ucv/fuZsSGNcCc7CMbsLL80Minir3OSrKt+w8Ep0FcBwPhohHtHzl1I//KGkBm/IRUOWxnkEjgts0nsCR61a8=
Received: from SN4PR0201CA0029.namprd02.prod.outlook.com
	(2603:10b6:803:2e::15) by BL0PR02MB4372.namprd02.prod.outlook.com
	(2603:10b6:208:42::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.18;
	Wed, 20 Feb 2019 18:29:18 +0000
Received: from BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by SN4PR0201CA0029.outlook.office365.com
	(2603:10b6:803:2e::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.15 via
	Frontend Transport; Wed, 20 Feb 2019 18:29:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; balister.org; dkim=none (message not signed)
	header.d=none;balister.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT003.mail.protection.outlook.com (10.152.76.204) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Wed, 20 Feb 2019 18:29:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53934
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwWcO-0006Rs-6P; Wed, 20 Feb 2019 10:29:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwWcJ-0006KA-1p; Wed, 20 Feb 2019 10:29:11 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1KIT7H9011541; Wed, 20 Feb 2019 10:29:07 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwWcF-0006JQ-3K; Wed, 20 Feb 2019 10:29:07 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <philip@balister.org>
Date: Wed, 20 Feb 2019 10:29:05 -0800
Message-ID: <1550687346-2348-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(54534003)(189003)(199004)(336012)(50466002)(356004)(4326008)(426003)(2616005)(476003)(126002)(106002)(81166006)(51416003)(16586007)(48376002)(110136005)(14444005)(81156014)(47776003)(316002)(8936002)(305945005)(7696005)(36756003)(107886003)(36386004)(9786002)(478600001)(72206003)(486006)(2906002)(77096007)(186003)(63266004)(5660300002)(50226002)(106466001)(8676002)(26005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4372; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99f7549f-9f6a-4db6-aac2-08d697615260
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
	SRVR:BL0PR02MB4372; 
X-MS-TrafficTypeDiagnostic: BL0PR02MB4372:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4372;
	20:hWSGEmsqxVLFRdyN8Wg7iQ/iqd1f3i1Uas1/JSdY+m9Wp8CK9Z9590UAZqJ83uQJhK65qRYYK4fc5nc67UV6T3rDhXq3DBqbFmFL23Ek2BQXHYBluYeNETfNyvhxBEBy0fRnrkRD8wnrQJluueZDk6xExd45hgHZEXZxeSvxpMRNtpIKHerOkAd0AaKVWKLlPsM7BNoFFpCsmxXianEqjMRAg2wh6bSnAsiObCSnsjhmC3EqpHjRbwEhzJbxIzCOoC/5f7epBLGDHhhAuhSft4r236vv3DYRsJKRQUNOxqM9zRL4X/6eMc58nutPxVC4DzQM6xRIEFq8UQdHrQvSu1saoCVuKq6PBeHZC/gjH8Phg1I8RnUr80Xk3++4W7tSz+16VsDUCORJelwjzwh0MoE+diFzoWuJkU87V17791xlwhywWCJtnVYRWFZolfxT/rNCdYc4/eCvdS1+Wc5EEkMaOL/DGPivbwxku1+wADTdfZIktwpYsRTHknt9SdK5
X-Microsoft-Antispam-PRVS: <BL0PR02MB4372EA14004254330A7D6EE5B97D0@BL0PR02MB4372.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0954EE4910
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4372;
	23:uKgFJWQflKhIyrerJ+gNe64uhpKNSI6D6G879t/Oa?=
	=?us-ascii?Q?pWqEqqrlNc8U0fejYIz9EQvCVDiYExAppWzoSbBOpYSvqDAMCDo7UEid00zD?=
	=?us-ascii?Q?sRlGZsSXYF8rQe2v3TAXDWdxLeAxk0xyKlitRFy+d04irV3RtMeji+kK75wA?=
	=?us-ascii?Q?WDEKoxcHU0Jvw6q7d19YIoOZU6eeuFhOSOjOrPNyA7C1xWQGPg8/CzfhfejK?=
	=?us-ascii?Q?eT0S/G7W2uoOF+CUlZxuEZ3zTNRQDf5p/sxz+Dj5OAYb+4YBfE5P6pPIxZ4U?=
	=?us-ascii?Q?t96sWzqE1mOVsQGie/ScIsTAiPeFrPgLQkUtvNAYIyT/j1xFUXdiuNjIr3UW?=
	=?us-ascii?Q?383VrXaGMe/QkEIgcCTwCfQxQvTFnTT83Uz8BQOvvcdjYObgCnDN9MdB8+Kh?=
	=?us-ascii?Q?J2Mn836YUu6EkKF3pem5zDZM+ZNHCiX98kWkGIh5B1kQ1We/+mCVwH9jEKG6?=
	=?us-ascii?Q?9Ere71BTxEtIpjCwoY2Sa5IbotS5Xt8fPO+r1F42uUOgkm8VUmI5HXm5hCFV?=
	=?us-ascii?Q?SDfKRa2O8PyS4TJmBVz6lw9mGK5KJxuhZQ6BxCY+vrWfqIsGdBTPyJ+hPKb4?=
	=?us-ascii?Q?+xflIMzbbvMEIJKLdtXP90j2m9mhF8PLtdusfHFkjURjvgqpZbVJdEPyfTh1?=
	=?us-ascii?Q?q1fIcaP2+9c7Ib3TY1zJA/atVBBNC0w9/1LQwAATMV5T1LMbSLyNMh2MLDAp?=
	=?us-ascii?Q?m3/lh75/6klGGUhAd5oisUSfNc3MSOd0f3vR+ZXxG2xDxHsUnYOjnbElvHK8?=
	=?us-ascii?Q?KTpEfIQnLHpB6WyXDKxhBUDq0qTvV+qoZcwKv/0oWAuccLS6kmPXylR0WQSX?=
	=?us-ascii?Q?QI/wc8j+RQ2nTEi9oyJl1gITf8oEpehRAUYIu9/eF5VTtgAI0KqqdJOO+N2W?=
	=?us-ascii?Q?26wNiGBpIc2pRlwHn1B/Ua6CvjUa1jF+b7PwQxfYdRmdmLSKrP3eVTjqFlfr?=
	=?us-ascii?Q?FhtcWq14wUrN31ibja88jI4Pxcx5LytylaSbrxe4bAEpix7c1jilBLIaROXi?=
	=?us-ascii?Q?U6inT7G2k1x8TDWzZlJfrwixhjRMTKSur1DpbWb2Z0mirVGYG9Lqwi7Sk8D/?=
	=?us-ascii?Q?GTRuIN2BhbHJF+og0wIS+75hjRQ?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: smKmA3iMzQPQ9YU1w8t88OPCo9ELrXDDhd2O6JoedylR38hIfNelPZ0MqJP7oF9hIDGCmI0kdQl+aGlnfoVDc2Sm9YLxEUyvkMFzA+elmrRqprKHLPOxjKTOK8B/CI5EOGiX5tsJ00u2zEFFIVX5QVW2QdJ9AQNDL+jpz4iglnguj4pWdc6hGJWIT4fumtvY95n6Qd1ongibAiVaXbIfuqPNPyl52iD6C1LxeiXIdLIbpcsV/a90BxVO/+ea1DagUiGvLBcYTg9QgGWJKSh+PVKmnDFDjEJ6g2WDRxoz5X77Eiltg3fQT4O9p6NxBrDG2Xw7SMs2rhZ6r96M53n+pJko202YkkwVU/5ALD0YZpBbbOuPexfnanjrxkb1Ve4XurYBUxMFvunv1j/DwrfvaznqiMEe3LVdAV6MApjs5P4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2019 18:29:16.7451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f7549f-9f6a-4db6-aac2-08d697615260
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4372
Subject: [PATCH v2 1/2] devicetree.bbclass: Add virtual provider for dtb
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
X-List-Received-Date: Thu, 21 Feb 2019 06:02:55 -0000
Content-Type: text/plain

Add virtual provider for dtb. This class can be used to generate dtb
from static devicetree, for reference see meta-xilinx layer
meta-xilinx/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb

By providing a virtual provider we can use it to differentiate between
in-kernel dtb or an external one. This can be set in local.conf as
PREFERRED_PROVIDER_virtual/dtb = "devicetree"

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
Changelog v2:
Update commit message to indicate PREFERRED_PROVIDER_virtual/dtb = "devicetree"
to set external devicetree recipe

 meta/classes/devicetree.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 8fe5a5e..e1f3779 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -27,6 +27,8 @@ inherit deploy kernel-arch
 
 COMPATIBLE_MACHINE ?= "^$"
 
+PROVIDES = "virtual/dtb"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SYSROOT_DIRS += "/boot/devicetree"
-- 
2.7.4


