Return-Path: <alejandro@enedino.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8276461111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:14:00 +0000 (UTC)
Received: from BL0PR02CA0091.namprd02.prod.outlook.com (2603:10b6:208:51::32)
	by DM6PR02MB4986.namprd02.prod.outlook.com (2603:10b6:5:4b::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25;
	Fri, 14 Feb 2020 18:14:00 +0000
Received: from SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by BL0PR02CA0091.outlook.office365.com
	(2603:10b6:208:51::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via
	Frontend Transport; Fri, 14 Feb 2020 18:14:00 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT025.mail.protection.outlook.com (10.152.72.87) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
	via Frontend Transport; Fri, 14 Feb 2020 18:14:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1j2fTS-00031T-S9; Fri, 14 Feb 2020 10:13:58 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1j2fTN-0005Qo-O3; Fri, 14 Feb 2020 10:13:53 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
	be forged))
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	01EIDq4x000635; Fri, 14 Feb 2020 10:13:52 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1j2fTM-0005Qh-Ms; Fri, 14 Feb 2020 10:13:52 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 10:13:48 -0800
Message-Id: <1581704029-1573-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No-0.987-7.0-31-1
X-imss-scan-details: No-0.987-7.0-31-1;No-0.987-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132261776406222963;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(346002)(396003)(136003)(428003)(199004)(189003)(356004)(498600001)(6666004)(70206006)(70586007)(2616005)(9786002)(86362001)(5660300002)(426003)(26005)(336012)(316002)(8676002)(8936002)(6916009)(81166006)(81156014)(36756003)(2906002)(107886003)(4326008)(42866002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4986; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30f14622-c818-4154-54fe-08d7b179aa84
X-MS-TrafficTypeDiagnostic: DM6PR02MB4986:
X-Microsoft-Antispam-PRVS: <DM6PR02MB498667B126BF9985392550D1B8150@DM6PR02MB4986.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 03137AC81E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlXrp8dp/N/n4U2ajhXPiiwIX7seL5VPU5+6yuSdMhgS2nxNayuesMNldUj0AWUQdgPhF6Uec0h65WCae80q2UVx1WNEYDOWgEbGyk077b4ZkyOegduPJTKUlWQpo6VYZ7TgyIuGoKDnPRRhmsAInCp/uyTwswp31IDas1t2Ox8ANjJITyJh1aKUendBueywGzAOv7B5PZXjfo49GG8SklDaSqzPgG/jXZcOY/a8i0dU3fsEbdAtRKkJs7+9DAADWbabi5rxAbtRju1cHq7JU+hgf91Xaag2o06trKkR9fRag5qTQvT6u/st/ndd1SXjbABEAc+mRInlBdHC+tRcrsA3Pdsc4rGXU6TBStOb3TIkPM8KL15u7Tz0S0L02E795S9SGN9lo4/8k4hVo/DHcUjo0M0qHIdp8gw32qA1y9A6onFKD2v1/RxJ7198UYZzy2rEhBnwtdJASyv3hOZYeZFG360e+xKBlJWpTB1iCs1KRoY23/YvyCll4yOWHKEE
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 18:14:00.5062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f14622-c818-4154-54fe-08d7b179aa84
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4986
Subject: [PATCH 1/2] tclibc-baremetal: Include qemu on the SDK
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
X-List-Received-Date: Fri, 14 Feb 2020 18:14:00 -0000
Content-Type: text/plain

Since we now have an example recipe on meta-skeleton to
build baremetal applications using OpenEmbedded, a user
produced SDK should be able to run such application.

Include nativesdk-qemu on TOOLCHAIN_HOST_TASK so its
built inside the baremetal based SDK.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index e04f8c8..31d132e 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -27,7 +27,7 @@ BASEDEPENDS_remove_class-target = "virtual/${TARGET_PREFIX}compilerlibs"
 TARGET_OS = "elf"
 TARGET_OS_arm = "eabi"
 
-TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE} nativesdk-qemu"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "libgcc-dev"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "virtual/${MLPREFIX}libc zlib ncurses"
-- 
2.7.4


