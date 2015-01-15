Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0120.outbound.protection.outlook.com [207.46.100.120])
	by mail.openembedded.org (Postfix) with ESMTP id 105CE71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 04:03:57 +0000 (UTC)
Received: from BY2PR03CA010.namprd03.prod.outlook.com (10.255.93.27) by
	BN1PR0301MB0706.namprd03.prod.outlook.com (25.160.78.13) with Microsoft
	SMTP Server (TLS) id 15.1.59.20; Thu, 15 Jan 2015 04:03:56 +0000
Received: from BY2FFO11FD038.protection.gbl (10.255.93.4) by
	BY2PR03CA010.outlook.office365.com (10.255.93.27) with Microsoft SMTP
	Server (TLS) id 15.1.53.17 via Frontend Transport;
	Thu, 15 Jan 2015 04:03:55 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD038.mail.protection.outlook.com (10.1.14.223) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Thu, 15 Jan 2015 04:03:55 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0F43rQr001389;
	Wed, 14 Jan 2015 21:03:53 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 12:03:49 +0800
Message-ID: <1421294632-31110-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(450100001)(47776003)(64706001)(68736005)(77156002)(229853001)(33646002)(104016003)(87936001)(97736003)(46102003)(36756003)(575784001)(77096005)(86362001)(62966003)(110136001)(86152002)(50466002)(48376002)(92566002)(69596002)(50226001)(6806004)(19580395003)(19580405001)(85426001)(50986999)(106466001)(2351001)(81156004)(105606002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0706;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN1PR0301MB0706;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1PR0301MB0706; 
X-Forefront-PRVS: 0457F11EAF
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1PR0301MB0706; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2015 04:03:55.6273 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0301MB0706
Subject: [oe-core dizzy][PATCH 0/3] fixes for dizzy
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
X-List-Received-Date: Thu, 15 Jan 2015 04:04:06 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

The following changes since commit e13f2681b75fd83aa3a1c823ad1c09faed0d6ae3
    rm_work: Fix RM_WORK_EXCLUDE for image/sdk recipes

Ting Liu (3):
  libunwind: Fix test case link failure on PowerPC with Altivec
  bitbake.conf: add PKGDATA_DIR to BB_HASHBASE_WHITELIST
  valgrind: build with altivec only if it supported

 meta/conf/bitbake.conf                             |  2 +-
 .../pass-maltivec-only-if-it-supported.patch       | 68 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  1 +
 ...k-failure-on-PowerPC-systems-with-Altivec.patch | 28 +++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  4 ++
 5 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch

-- 
1.8.3.2


