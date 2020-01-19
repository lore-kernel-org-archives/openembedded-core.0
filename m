Return-Path: <alejandro@enedino.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	by mail.openembedded.org (Postfix) with ESMTP id CE7247FC3A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 03:01:57 +0000 (UTC)
Received: from BN6PR02CA0048.namprd02.prod.outlook.com (2603:10b6:404:5f::34)
	by MWHPR02MB2287.namprd02.prod.outlook.com (2603:10b6:300:5a::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20;
	Sun, 19 Jan 2020 03:01:58 +0000
Received: from SN1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by BN6PR02CA0048.outlook.office365.com
	(2603:10b6:404:5f::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via
	Frontend Transport; Sun, 19 Jan 2020 03:01:57 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT030.mail.protection.outlook.com (10.152.72.114) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
	via Frontend Transport; Sun, 19 Jan 2020 03:01:57 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1it0qb-0005ju-4q; Sat, 18 Jan 2020 19:01:57 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1it0qV-0001NT-WC; Sat, 18 Jan 2020 19:01:52 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1it0qV-0001NQ-H4; Sat, 18 Jan 2020 19:01:51 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 19:01:47 -0800
Message-Id: <1579402907-13849-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--0.300-7.0-31-1
X-imss-scan-details: No--0.300-7.0-31-1;No--0.300-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132238765176653435;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(428003)(199004)(189003)(70586007)(356004)(26005)(9786002)(6916009)(6666004)(5660300002)(2906002)(4326008)(8936002)(81156014)(107886003)(81166006)(8676002)(86362001)(498600001)(70206006)(426003)(336012)(316002)(2616005)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2287; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7566d47f-f9b4-4715-b1f4-08d79c8bf253
X-MS-TrafficTypeDiagnostic: MWHPR02MB2287:
X-Microsoft-Antispam-PRVS: <MWHPR02MB228737A4C67F14DE46DF608FB8330@MWHPR02MB2287.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0287BBA78D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1emyULNDllyJjxlMPBapyshQrHScNzA4zx6ud9bpAIwFTKMUGOUoG0IB1YIuNoemAUAm2sx7xu554PEa0YmKIdQkNX4SYgUbxL6RPMvtvtBq2Ex14mOKUwMeFPlpJG7pZFOwj4Kl3BLmLGeP6tQVJ2F9bmejdWkjRDAAerWzQSuvscM6zrsfJ7IY5p7JQRTCnlaB1Zzi/vfTNK4bpU+VPKPuAhTbyfr9vgAy3iNdIgP3N1T5JD29H9wY4LiNQkadrMmE79ZNoB06KmY9TZP4GkMRFG5CdZho9OrR7mBugaAkL2JTFllZ9EZ1EBS8ch8pG/S+7/1CFE+FTqloS605WyTGQYs2TIjkdvPC+uCB911lzBAq6LSGy7icgrNqfU7PK3xK81CFn0nIH4lS9mtDShiDfaIwQRUQHNhhn9eh4Eo56xGwwNsvoGvQwkZsbRw
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2020 03:01:57.5052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7566d47f-f9b4-4715-b1f4-08d79c8bf253
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2287
Subject: [PATCH] gcc-configure: Enable the use of different symbol versioning
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
X-List-Received-Date: Sun, 19 Jan 2020 03:01:58 -0000
Content-Type: text/plain

While the gnu style for symbol versioning is the most usual,
--enable-symvers[=style] can be provided several values,
gnu, gnu-versioned-namespace, darwin, darwin-export, and sun,
depending on users needs.

Introduce the SYMVERS_CONF variable to allow the user to
configure the symbol versioning in shared libraries.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 24ba8ce..bb4f692 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -17,6 +17,8 @@ GCCTHREADS ?= "posix"
 
 GCCPIE ??= ""
 
+SYMVERS_CONF ?= "--enable-symvers=gnu"
+
 EXTRA_OECONF = "\
     ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') != 'no']} \
     --with-gnu-ld \
@@ -27,7 +29,7 @@ EXTRA_OECONF = "\
     ${GCCPIE} \
     --enable-c99 \
     --enable-long-long \
-    --enable-symvers=gnu \
+    ${SYMVERS_CONF} \
     --enable-libstdcxx-pch \
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
-- 
2.7.4


