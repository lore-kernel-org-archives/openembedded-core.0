Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 117069 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 18 May 2019 15:37:44 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
	by mail.openembedded.org (Postfix) with ESMTP id ED7A37CDAC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=go4DwnzJzXqNyN3KJd1DdB28yCn6Zpk7IjIhH8FJANo=;
	b=wqZu6W6D5o6HlGyFGLZ06ovoKRNpXer9qo6o6WK4BsMucrG1xgFZkQK+HhwdtcznznN0eXuLM00H1G9ZXLsSz3j2yxMroOUDY7A31EyK8I/467G9XJe4z7w+olqD15QSM1TOT/xXLiJlOL40nDuF2+whkwYSCcY12rOoPZ3NsbI=
Received: from BYAPR02CA0004.namprd02.prod.outlook.com (2603:10b6:a02:ee::17)
	by BL0PR02MB4929.namprd02.prod.outlook.com (2603:10b6:208:53::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17;
	Fri, 17 May 2019 23:04:33 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by BYAPR02CA0004.outlook.office365.com
	(2603:10b6:a02:ee::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.17 via
	Frontend Transport; Fri, 17 May 2019 23:04:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1900.16
	via Frontend Transport; Fri, 17 May 2019 23:04:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hRltw-0005Cl-2g for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2019 16:04:32 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hRltq-0006WX-V8 for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2019 16:04:27 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hRltj-0006Vf-A7; Fri, 17 May 2019 16:04:19 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 16:04:18 -0700
Message-Id: <1558134258-9359-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(189003)(199004)(51416003)(63266004)(2351001)(36386004)(2361001)(316002)(26005)(186003)(36756003)(77096007)(50466002)(48376002)(486006)(16586007)(6916009)(336012)(426003)(126002)(476003)(2616005)(106002)(7696005)(107886003)(5660300002)(4326008)(478600001)(305945005)(2906002)(9786002)(47776003)(81166006)(8936002)(356004)(70206006)(50226002)(8676002)(70586007)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4929; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79a31019-e8e7-4641-29dc-08d6db1c060a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:BL0PR02MB4929; 
X-MS-TrafficTypeDiagnostic: BL0PR02MB4929:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB492990D84CD2BD6134B74DFBAC0B0@BL0PR02MB4929.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0040126723
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: e3fUfz4zeSWV7PcrgSWTlY7yCeDuinzO63mxG+Y8yvlj2oZIr7ELX8loQaoasXtGkLQv6KlwiYKSJSUt9F3fpD2JkEKtoRmcXnM7QpqxmTTLKJFzS9/v2FAcOO16Tf5PqcqRqWzh6PuUAPxOmYX6N/gxG6f/P2rs5tyyMA1CGNwljk1xUfUuMkS2RVA1Fwp6LSblrhjoh6tlQDOOtEiWaAYk8luIUTvei/CXl1/tvKcqLGJ2dj3aR5jHiuGG8mY5xZzSnsQXWHwIRsbNoX6NZSDmxK37wyNgWnVgSegQ6jY2OoWJCtjLo0x5lHba3FByjlBdc68ipNoND9th7uOvoLhDRGKSvX0+AJfyEZ66na/d9EBBsAIFw8DCX4zezWjtcx63/iOdP/W4UvK4clDkNJYu+gUZ+BPGXRauyk6B+Mw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2019 23:04:32.5139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a31019-e8e7-4641-29dc-08d6db1c060a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4929
Subject: [PATCH] python-numpy: Avoid installing copy of f2py script
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
X-List-Received-Date: Sat, 18 May 2019 15:37:45 -0000
Content-Type: text/plain

Both python-numpy and python3-numpy try to install the file:

${D}/${bindir}/f2py

which causes an error during do_rootfs since the package manager complains about that.

The numpy packages create basically copies of f2py script with the following names:
f2py (on both)
f2py2 (on python 2)
f2py2.7 (on python 2)
f2py3 (on python 3)
f2py3.7 (on python 3)

Remove the copy of f2py from python-numpy in favor of using the one from python3
to avoid installation issues at do_rootfs().

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
index 5013789..a1133da 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
@@ -4,3 +4,7 @@ require python-numpy.inc
 RDEPENDS_${PN}_class-target_append = " \
     ${PYTHON_PN}-subprocess \
 "
+
+do_install_append(){
+        rm ${D}/${bindir}/f2py
+}
-- 
2.7.4


