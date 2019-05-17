Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 63211 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 May 2019 08:05:57 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
	by mail.openembedded.org (Postfix) with ESMTP id EFE826D545
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=go4DwnzJzXqNyN3KJd1DdB28yCn6Zpk7IjIhH8FJANo=;
	b=wLIKpKbqMqwrrWiyWNL+DLTHLdQRXGkSMPcOFNbIXalkYBKsidr6TVeu3oHNrpxDoH6bBe2ZKpZ/3QdlilHexEe7TayVz+cFmAk51JmgFelSyLmJFPffvfNJuk5Dp8wYIG34FJ8uklZgqbU+cZnx70NsHu/webgs5BXKor0/UPU=
Received: from SN6PR02CA0020.namprd02.prod.outlook.com (2603:10b6:805:a2::33)
	by BN6PR02MB2675.namprd02.prod.outlook.com (2603:10b6:404:fc::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.25;
	Fri, 17 May 2019 05:33:44 +0000
Received: from BL2NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by SN6PR02CA0020.outlook.office365.com
	(2603:10b6:805:a2::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17 via
	Frontend Transport; Fri, 17 May 2019 05:33:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT012.mail.protection.outlook.com (10.152.77.27) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1900.16
	via Frontend Transport; Fri, 17 May 2019 05:33:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hRVV0-0002pj-SS for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2019 22:33:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hRVUv-0001uW-Nv for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2019 22:33:37 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1hRVUn-0001t4-Us; Thu, 16 May 2019 22:33:30 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 22:33:07 -0700
Message-Id: <1558071187-22524-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(199004)(189003)(316002)(2351001)(2906002)(36756003)(9786002)(2361001)(7696005)(51416003)(478600001)(16586007)(50466002)(8676002)(8936002)(36386004)(336012)(186003)(26005)(77096007)(48376002)(81156014)(47776003)(126002)(486006)(4326008)(106002)(426003)(2616005)(476003)(50226002)(107886003)(6666004)(81166006)(356004)(70586007)(70206006)(5660300002)(6916009)(305945005)(63266004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2675; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c26ee712-a9dc-46fc-2e3c-08d6da8939e1
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:BN6PR02MB2675; 
X-MS-TrafficTypeDiagnostic: BN6PR02MB2675:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB2675F4D7FAB774BDAA9C6A72AC0B0@BN6PR02MB2675.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0040126723
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: B3V8EjPhBwOouMDef/J5PlDVKlXsSCsBUhPy9X2rM5PBvdX5t4dtKomSy0w6gu6NlzMPGvIlDtxIksZ3/inbrn/p6CpLfXPSlBHQM83QjsMIlT5S2VTQXx/wSUfYrqPMmrKhBh5i+Jml30gpYFpX2M39LRHdTss4WnAdmgIEGlmrFlAY/lluzDwjcvJPj8GThVOo48798nBCpsCbBge7MtMaO2a84lxiXnLIN0pQeRjsMVItjyLfqaabe/4TDt2Pg28FsZc+Ionz71fvDvG+5aVz6Fne7zbOy5/XU03XVsWXLSXtwkOtRlxLuV1M4dZztOz4jXLF4VblsU49TdJzF5Q5UiAp5k9K5Qog76ln4laziv5c0w7Lr0xad84WeEHfYLOyZ+V8uuBsnnwXnpoBF8MyXc8nfZF6SlXexRLkVFw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2019 05:33:43.4225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26ee712-a9dc-46fc-2e3c-08d6da8939e1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2675
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
X-List-Received-Date: Fri, 17 May 2019 08:05:58 -0000
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


