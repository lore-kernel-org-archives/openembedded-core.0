Return-Path: <alejandro@enedino.org>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690073.outbound.protection.outlook.com [40.107.69.73])
	by mail.openembedded.org (Postfix) with ESMTP id F004F7F971
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:12:15 +0000 (UTC)
Received: from SN4PR0201CA0017.namprd02.prod.outlook.com (10.161.238.155) by
	BYAPR02MB5304.namprd02.prod.outlook.com (20.177.124.85) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.13; Wed, 15 Jan 2020 17:12:16 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by SN4PR0201CA0017.outlook.office365.com
	(2603:10b6:803:2b::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via
	Frontend Transport; Wed, 15 Jan 2020 17:11:54 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
	via Frontend Transport; Wed, 15 Jan 2020 17:11:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1irmCv-0001L3-8b; Wed, 15 Jan 2020 09:11:53 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1irmCq-0002TK-3i; Wed, 15 Jan 2020 09:11:48 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1irmCp-0002TH-Ny; Wed, 15 Jan 2020 09:11:47 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 09:11:46 -0800
Message-Id: <1579108306-3292-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--5.898-7.0-31-1
X-imss-scan-details: No--5.898-7.0-31-1;No--5.898-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132235819146689348;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(428003)(189003)(199004)(2906002)(4326008)(2616005)(8936002)(26005)(356004)(70206006)(426003)(107886003)(81156014)(6916009)(9786002)(316002)(336012)(86362001)(498600001)(81166006)(5660300002)(8676002)(70586007)(36756003)(2004002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5304; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a1f0405-0e41-4255-d4f7-08d799de0540
X-MS-TrafficTypeDiagnostic: BYAPR02MB5304:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5304F323738FB2E386BA2C82B8370@BYAPR02MB5304.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 02830F0362
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFnGIJPMSPL4dZTPH87QKaU/JtWrOg2Niv0bfoi6b1gJS2kX5z0SBbcXyiFVA3wmK8ForeGt20hBGizVaDJq8fw1kDPa812i5OvVCgFCGBPzA0Urvw82UKIqF1sJ2aTwCfVkm6IyeS8CcCun96Qs4ypSUdEwsZUBA3/BfwGxZLWP/iXtgDqbzLYXps92O5KKmp3LJmvyneIAt+QrEPEsZmNJmE7VoW48QRz8BgoHsDR/oRFM3wMDFpXxl2dMtPlGlSGz0PeGj7ZaN9QGDmj4zF9vchpEyAUWBfs1cC6t9F2syEaLhS5OR41NT9Q7kz5xqLb6/p3T//84zdQSOhDLdXhv87LAZLpxKITx6TnapkMQqJJgofQja5OsviG64lBkYBJgnoPsiyJyYTNi3+FgcxpOLZERanKCP2EsRkMcgLLD+321ijffxwsLlvXlY3rVHvmyc4bC9/4HFUH6fKjOikTjOUTn/NcJqRCRw5KseTsbD2scMmTD7KnIu/60jGg7bILvFinKIDAEm7FHxbqhew==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2020 17:11:54.4827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1f0405-0e41-4255-d4f7-08d799de0540
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5304
Subject: [PATCH] newlib: Upgrade newlib and libgloss to the yearly release 3.2.0
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
X-List-Received-Date: Wed, 15 Jan 2020 17:12:16 -0000
Content-Type: text/plain

A new yearly snapshot was taken on January 2nd of 2020, this bumps
newlib to 3.2.0.

 - Mentor Graphics added tcl license (amdgcn-* targets)
 - BSD-Clause-2 was added as well by Dinux (pru-* targets)

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../newlib/{libgloss_3.1.0.bb => libgloss_3.2.0.bb}            |  0
 meta/recipes-core/newlib/newlib.inc                            | 10 +++++-----
 meta/recipes-core/newlib/{newlib_3.1.0.bb => newlib_3.2.0.bb}  |  0
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/newlib/{libgloss_3.1.0.bb => libgloss_3.2.0.bb} (100%)
 rename meta/recipes-core/newlib/{newlib_3.1.0.bb => newlib_3.2.0.bb} (100%)

diff --git a/meta/recipes-core/newlib/libgloss_3.1.0.bb b/meta/recipes-core/newlib/libgloss_3.2.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/libgloss_3.1.0.bb
rename to meta/recipes-core/newlib/libgloss_3.2.0.bb
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 2f0553b..d7ac8bf 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -3,21 +3,21 @@ HOMEPAGE = "https://sourceware.org/newlib/"
 DESCRIPTION = "C library intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products."
 SECTION = "libs"
 
-LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause"
+LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause & tcl"
 LIC_FILES_CHKSUM = " \
 		file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		file://COPYING.LIBGLOSS;md5=73f5c98779aea7dba4a6c94a74ab0ae2 \
+		file://COPYING.LIBGLOSS;md5=54b778d585443cd7fbfa1b47cbd63a89 \
 		file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=100d470af54e2d1d79fbd8498a32ff26 \
+		file://COPYING.NEWLIB;md5=ac17c68751aad7a5298ce3f249121070 \
 		file://newlib/libc/posix/COPYRIGHT;md5=103468ff1982be840fdf4ee9f8b51bbf \
 		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0 \
 		"
 
 SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
-SRC_URI[md5sum] = "f84263b7d524df92a9c9fb30b79e0134"
-SRC_URI[sha256sum] = "fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a"
+SRC_URI[md5sum] = "afb3a01c8c82b6717ea55659a4de30ec"
+SRC_URI[sha256sum] = "f7b2322964a1e3b37bec0768da20f50dfb62247d729110974dd95756a53bb6d4"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc"
diff --git a/meta/recipes-core/newlib/newlib_3.1.0.bb b/meta/recipes-core/newlib/newlib_3.2.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/newlib_3.1.0.bb
rename to meta/recipes-core/newlib/newlib_3.2.0.bb
-- 
2.7.4


