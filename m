Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 21568 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 18 May 2019 11:23:58 UTC
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680054.outbound.protection.outlook.com [40.107.68.54])
	by mail.openembedded.org (Postfix) with ESMTP id A2B597C4F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 11:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=go4DwnzJzXqNyN3KJd1DdB28yCn6Zpk7IjIhH8FJANo=;
	b=16YsmrSrmFhAh3GWgaNw/aL80NCqYKTnJaMG4V+gdVQal9wFZckYQu4aNZ+rHmv3tS3p9AOVqKD3agZoTKFm0WmNbGHO/A9WwvMq/KdDUcj5w21cMdQvRx0/55l5OM9U0AyTGPkF27VYA7YU7Lz6LTS574funuq2U0PlEDFsexY=
Received: from CY4PR02CA0026.namprd02.prod.outlook.com (2603:10b6:903:117::12)
	by MWHPR02MB2688.namprd02.prod.outlook.com (2603:10b6:300:106::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16;
	Fri, 17 May 2019 23:49:22 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by CY4PR02CA0026.outlook.office365.com
	(2603:10b6:903:117::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16 via
	Frontend Transport; Fri, 17 May 2019 23:49:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1900.16
	via Frontend Transport; Fri, 17 May 2019 23:49:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hRmbJ-0005rW-Nb for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2019 16:49:21 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hRmbE-0003IE-KP for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2019 16:49:16 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x4HNnD8N000582; Fri, 17 May 2019 16:49:13 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1hRmbB-0003HW-3L; Fri, 17 May 2019 16:49:13 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 16:49:12 -0700
Message-Id: <1558136952-13094-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(346002)(136003)(376002)(2980300002)(189003)(199004)(50226002)(7696005)(8936002)(77096007)(26005)(70206006)(356004)(36756003)(51416003)(81156014)(486006)(8676002)(81166006)(16586007)(316002)(106002)(5660300002)(336012)(63266004)(50466002)(48376002)(9786002)(476003)(2351001)(426003)(186003)(2361001)(2906002)(126002)(2616005)(36386004)(305945005)(70586007)(6916009)(107886003)(47776003)(4326008)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2688; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a72d5b45-1184-4ee2-a578-08d6db224930
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:MWHPR02MB2688; 
X-MS-TrafficTypeDiagnostic: MWHPR02MB2688:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB268805B47504F6FADCFB7F8DAC0B0@MWHPR02MB2688.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0040126723
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: M3wwCkaEDspyQj8VZww8wOxcBS3dEE5A3MY+s+NDij6PgHpv1oMO4V+5UlMsYVJ/5FxyVSmeaqIWh97YNopP7quyf+VfSyW4/dqhtDJu6nFJCX1Pp0XMd9eEHRmfJ+E263CoMNsp7RedS1qaH0bkF4N/aKpADqx3hsf7L2z07ImUsh2hOza5IJ+LVp/J1A9V/YnQWJAS1kisvYnUD4mT6gfGwDSTf307GgyGqthd9+0xCeEPBWJR0tQ8IOBlteFnZH2wSLjiTobH3V4n3HH1MRbCYdj6qqA1tMVZbRNSddnj5nSkoWm2aHRrPKLFacL8fFVIDiIGz7YpD3s2CSNp1FkcZPFj0TPAqK/1svkPcponWot2jAWoPTlBgzeTN1nE/7oueg99ip5FyScvTzUNSErrz7e4rRnUh1mvjMx3R24=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2019 23:49:22.1538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a72d5b45-1184-4ee2-a578-08d6db224930
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2688
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
X-List-Received-Date: Sat, 18 May 2019 11:23:59 -0000
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


