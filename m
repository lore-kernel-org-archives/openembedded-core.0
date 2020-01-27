Return-Path: <alejandro@enedino.org>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
	by mail.openembedded.org (Postfix) with ESMTP id 50C957FD61
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 10:00:42 +0000 (UTC)
Received: from BYAPR02CA0001.namprd02.prod.outlook.com (2603:10b6:a02:ee::14)
	by CH2PR02MB6647.namprd02.prod.outlook.com (2603:10b6:610:78::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22;
	Mon, 27 Jan 2020 10:00:42 +0000
Received: from SN1NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by BYAPR02CA0001.outlook.office365.com
	(2603:10b6:a02:ee::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.12 via
	Frontend Transport; Mon, 27 Jan 2020 10:00:42 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT032.mail.protection.outlook.com (10.152.72.126) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2665.18
	via Frontend Transport; Mon, 27 Jan 2020 10:00:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1iw1CE-0000Hm-0x; Mon, 27 Jan 2020 02:00:42 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1iw1C3-00087W-RR; Mon, 27 Jan 2020 02:00:31 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1iw1C3-00087C-EH; Mon, 27 Jan 2020 02:00:31 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 02:00:30 -0800
Message-Id: <1580119230-10978-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--2.810-7.0-31-1
X-imss-scan-details: No--2.810-7.0-31-1;No--2.810-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132245928425640337;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(428003)(199004)(189003)(6916009)(498600001)(36756003)(70586007)(336012)(70206006)(86362001)(2616005)(26005)(356004)(426003)(81156014)(5660300002)(9786002)(8936002)(107886003)(4326008)(316002)(8676002)(81166006)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR02MB6647; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d8e4877-b79e-4722-3946-08d7a30fc53d
X-MS-TrafficTypeDiagnostic: CH2PR02MB6647:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6647A3EB24FB4AD4CB62ED8AB80B0@CH2PR02MB6647.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 02951C14DC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cox6eGzX7egJ9iM3td7DFB6oqWzDHhYav/sfHmW/QJp0VGkB3Qm3f1rdy7cYS/7R+PHctdzNDY/0vP3PMRg5EywXXrgKycHTQ07hSaO78ZC+Xo6BvljnJmzIeIcosQotB1pDG/FPZX5ljm45bwETKCDwyXRhaIh3GdPfo1MFq/e+VZ6SOQ6fU9d2SUMzDmqltoTb+9Q5jXqWGKaEyPTbompnOBvbXl5mD1IHqJ0GA//3+/+uKI9ROW5JWHJ7Vgn/WG4ROLJnk+RgToTyaNoQh07BVdWR9cVfJS+9tPgxxeoCCeULTjxNHjF22L3aNtQuGRb8nPn6hBQG/kv/85cqRIWbIjdMgJqZ5EPb+vpWnE4yGSm3Bbw4aLOaP0NGzOhPYkmE36Aqq5qfeCGUYk2UMcm8grQBX4lgMYa03eDRnG1yo3gYH4Vbb1y3EBQsMmJc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2020 10:00:42.4047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8e4877-b79e-4722-3946-08d7a30fc53d
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6647
Subject: [PATCH 2/2] maintainers.inc: Add maintainer for baremetal-helloworld recipe
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
X-List-Received-Date: Mon, 27 Jan 2020 10:00:42 -0000
Content-Type: text/plain

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 01afc25..f2126bf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -59,6 +59,7 @@ RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-baremetal-helloworld = "Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>"
 RECIPE_MAINTAINER_pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
-- 
2.7.4


