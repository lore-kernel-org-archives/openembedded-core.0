Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0144.outbound.protection.outlook.com [207.46.100.144])
	by mail.openembedded.org (Postfix) with ESMTP id 4E22C716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 08:36:31 +0000 (UTC)
Received: from CH1PR03CA011.namprd03.prod.outlook.com (10.255.156.156) by
	CY1PR03MB1376.namprd03.prod.outlook.com (25.163.16.30) with Microsoft
	SMTP Server (TLS) id 15.1.148.16; Tue, 28 Apr 2015 08:36:30 +0000
Received: from BL2FFO11OLC008.protection.gbl (10.255.156.132) by
	CH1PR03CA011.outlook.office365.com (10.255.156.156) with Microsoft SMTP
	Server (TLS) id 15.1.130.23 via Frontend Transport;
	Tue, 28 Apr 2015 08:36:30 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC008.mail.protection.outlook.com (10.173.160.143) with
	Microsoft SMTP Server (TLS) id 15.1.154.14 via Frontend Transport;
	Tue, 28 Apr 2015 08:36:30 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3S8aQj6025172;
	Tue, 28 Apr 2015 01:36:27 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 16:36:24 +0800
Message-ID: <1430210184-2629-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(86362001)(50986999)(46102003)(87936001)(85426001)(48376002)(19580405001)(575784001)(19580395003)(47776003)(104016003)(450100001)(110136001)(92566002)(36756003)(77096005)(106466001)(50226001)(77156002)(105606002)(229853001)(50466002)(6806004)(62966003)(2351001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR03MB1376;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR03MB1376;
X-Microsoft-Antispam-PRVS: <CY1PR03MB13769605A2C9C8110FE2B27384E80@CY1PR03MB1376.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006)(3002001); SRVR:CY1PR03MB1376;
	BCL:0; PCL:0; RULEID:; SRVR:CY1PR03MB1376; 
X-Forefront-PRVS: 0560A2214D
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2015 08:36:30.5070 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB1376
Subject: [fido][PATCH] groff: add runtime dependency on sed
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
X-List-Received-Date: Tue, 28 Apr 2015 08:36:32 -0000
Content-Type: text/plain

  This is to suppress the following QA warning:
  groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-extended/groff/groff_1.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 6e84587..dd345b7 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -17,6 +17,7 @@ SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a1
 
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
+RDEPENDS_${PN} += "sed"
 
 inherit autotools texinfo
 
-- 
1.9.2


