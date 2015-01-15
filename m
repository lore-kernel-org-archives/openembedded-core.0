Return-Path: <ting.liu@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0117.outbound.protection.outlook.com [65.55.169.117])
	by mail.openembedded.org (Postfix) with ESMTP id 75B457226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 04:04:00 +0000 (UTC)
Received: from CO2PR03CA0028.namprd03.prod.outlook.com (10.141.194.155) by
	BY2PR0301MB0712.namprd03.prod.outlook.com (25.160.63.154) with
	Microsoft SMTP
	Server (TLS) id 15.1.53.17; Thu, 15 Jan 2015 04:03:59 +0000
Received: from BN1AFFO11FD007.protection.gbl (2a01:111:f400:7c10::175) by
	CO2PR03CA0028.outlook.office365.com (2a01:111:e400:1414::27) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Thu, 15 Jan 2015
	04:03:58 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD007.mail.protection.outlook.com (10.58.52.67) with Microsoft
	SMTP Server (TLS) id 15.1.59.14 via Frontend Transport;
	Thu, 15 Jan 2015 04:03:57 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0F43rQs001389;
	Wed, 14 Jan 2015 21:03:55 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 12:03:50 +0800
Message-ID: <1421294632-31110-2-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1421294632-31110-1-git-send-email-ting.liu@freescale.com>
References: <1421294632-31110-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(48376002)(50466002)(64706001)(50986999)(76176999)(450100001)(92566002)(33646002)(68736005)(77096005)(62966003)(77156002)(47776003)(2950100001)(36756003)(104016003)(69596002)(97736003)(86152002)(19580405001)(19580395003)(6806004)(81156004)(106466001)(85426001)(2351001)(87936001)(105606002)(229853001)(50226001)(86362001)(575784001)(110136001)(46102003)(211663006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0712;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BY2PR0301MB0712;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2PR0301MB0712; 
X-Forefront-PRVS: 0457F11EAF
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB0712; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2015 04:03:57.3669 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0712
Subject: [oe-core dizzy][PATCH 1/3] libunwind: Fix test case link failure on PowerPC with Altivec
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

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 ...k-failure-on-PowerPC-systems-with-Altivec.patch | 28 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  4 ++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch b/meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
new file mode 100644
index 0000000..dc0f5c1
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
@@ -0,0 +1,28 @@
+Fix test case link failure on PowerPC systems with Altivec
+
+Upstream-Status:backport
+
+On systems where the system compiler supports Altivec by default,
+the libunwind Makefile will attempt to build an extra test case
+ppc64-test-altivec.  Unfortunately, the link step will fail since
+the Makefile does not actually link against the libunwind library.
+
+Fixed by adding the appropriate LDADD macro.
+
+Signed-off-by: Ulrich Weigand <address@hidden>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0e30536..9c76628 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD = $(LIBUNWIND_local)
+ Lia64_test_readonly_LDADD = $(LIBUNWIND_local)
+ ia64_test_dyn1_LDADD = $(LIBUNWIND)
+ ia64_test_sig_LDADD = $(LIBUNWIND)
++ppc64_test_altivec_LDADD = $(LIBUNWIND)
+-- 
+1.8.5
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index bc38e36..20db132 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -1,4 +1,8 @@
 require libunwind.inc
 
+SRC_URI += "\
+    file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
+"
+
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
 SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.8.3.2


