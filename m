Return-Path: <alejandro@enedino.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD0361081
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:14:00 +0000 (UTC)
Received: from BL0PR02CA0143.namprd02.prod.outlook.com (2603:10b6:208:35::48)
	by BY5PR02MB7010.namprd02.prod.outlook.com (2603:10b6:a03:23b::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23;
	Fri, 14 Feb 2020 18:14:00 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by BL0PR02CA0143.outlook.office365.com
	(2603:10b6:208:35::48) with Microsoft SMTP Server (version=TLS1_2,
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
	SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
	via Frontend Transport; Fri, 14 Feb 2020 18:14:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1j2fTS-00031S-RW; Fri, 14 Feb 2020 10:13:58 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1j2fTN-0005Qp-Ms; Fri, 14 Feb 2020 10:13:53 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	01EIDqIV000637; Fri, 14 Feb 2020 10:13:53 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1j2fTM-0005Qh-Ob; Fri, 14 Feb 2020 10:13:52 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 10:13:49 -0800
Message-Id: <1581704029-1573-2-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581704029-1573-1-git-send-email-alejandro@enedino.org>
References: <1581704029-1573-1-git-send-email-alejandro@enedino.org>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No-0.502-7.0-31-1
X-imss-scan-details: No-0.502-7.0-31-1;No-0.502-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132261776404283696;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(376002)(396003)(346002)(428003)(199004)(189003)(81166006)(81156014)(8676002)(8936002)(36756003)(316002)(70206006)(70586007)(2906002)(426003)(356004)(6666004)(9786002)(5660300002)(2616005)(498600001)(86362001)(336012)(107886003)(26005)(6916009)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR02MB7010; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 494eeca3-4afb-4629-2cb2-08d7b179aa60
X-MS-TrafficTypeDiagnostic: BY5PR02MB7010:
X-Microsoft-Antispam-PRVS: <BY5PR02MB7010E0C7A30BE8427D23B191B8150@BY5PR02MB7010.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 03137AC81E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IB7AC+TA5h6blsQ8nTbe5fPOaVBlNWlbLSTGjK6O1GTrrGQyiJzr1/li5C/+oLkE9/fUqaKVi77J2cfAu3JjlwXHagN+mnJTiO3hwY9KK2v90csS94LwPCc4QOCydniDvSggKDj7n/aVCHAQiHBHIyy7pOUTVweWZ8m3QPlkYCwgC0bzOZkjOEGtKVNLbvqIlMv+7jN9KeG8dnpsjMIgqnQKQnvzpe9512tnpLdSODp3Fds+kRMw25Zl1G02VQ72hzZUfOwjP68NxDlfeN/hrdSTHmlqG19plBa7HuweWICS4OJiregnUijAEJyPViYDXg9HxNG6Gy6sjIPGHmH9VFRlIGD9oJiv+12At6sepjg9+g/VC38gvQoLjz/WjJpbOJs82Dw9gGu4AxNSR1qFHGvNQrNtwD8dl+SApAJk+njYd6xw1TtKBIJ0wdeQnSVg
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 18:14:00.2672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 494eeca3-4afb-4629-2cb2-08d7b179aa60
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7010
Subject: [PATCH 2/2] tclibc-newlib: Include qemu on the SDK
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
built inside the newlib based SDK.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta/conf/distro/include/tclibc-newlib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
index 8338003..bf89b11 100644
--- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -38,7 +38,7 @@ BASE_DEFAULT_DEPS_append_class-target = " ${NEWLIB_EXTENDED}"
 TARGET_OS = "elf"
 TARGET_OS_arm = "eabi"
 
-TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE} nativesdk-qemu"
 TOOLCHAIN_TARGET_TASK ?= "${LIBC_DEPENDENCIES}"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "zlib ncurses"
 
-- 
2.7.4


