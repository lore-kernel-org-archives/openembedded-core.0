Return-Path: <nathan.rossi@xilinx.com>
X-Greylist: delayed 1101 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Feb 2015 02:10:00 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0090.outbound.protection.outlook.com [157.56.110.90])
	by mail.openembedded.org (Postfix) with ESMTP id D837E6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 02:10:00 +0000 (UTC)
Received: from BN1AFFO11FD036.protection.gbl (10.58.52.31) by
	BN1AFFO11HUB018.protection.gbl (10.58.52.128) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Thu, 12 Feb 2015 01:37:08 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD036.mail.protection.outlook.com (10.58.52.240) with
	Microsoft SMTP Server (TLS) id 15.1.87.10 via Frontend Transport;
	Thu, 12 Feb 2015 01:37:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YLieh-0000f0-4A
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Feb 2015 17:33:23 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 11:37:01 +1000
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21324.000
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <9abe7bcea3ac41b6bb1981b4b4e89e07@BN1AFFO11FD036.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(438002)(104016003)(19580395003)(108616004)(50986999)(53416004)(6806004)(48376002)(74316001)(50466002)(77156002)(2351001)(19580405001)(47776003)(86362001)(46102003)(50226001)(92726002)(106466001)(110136001)(33646002)(87936001)(229853001)(450100001)(62966003)(92566002)(107986001)(24736002)(23106004)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB018;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:ovrnspm;
	PTR:unknown-60-83.xilinx.com; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB018;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1AFFO11HUB018; 
X-Forefront-PRVS: 0485417665
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB018; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2015 01:37:08.1039 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB018
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH] openssl: Add mapping for microblaze architecture
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
X-List-Received-Date: Thu, 12 Feb 2015 02:10:08 -0000
Content-Type: text/plain

Map the microblaze architecture to the linux-generic32 target.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 31dfd8f..78ba5c8 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -114,6 +114,9 @@ do_configure () {
         linux-*-mips64)
                target=linux-mips
                 ;;
+	linux-microblaze*)
+		target=linux-generic32
+		;;
 	linux-powerpc)
 		target=linux-ppc
 		;;
-- 
2.1.1


