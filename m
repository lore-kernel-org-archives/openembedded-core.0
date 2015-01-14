Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 7240 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Jan 2015 08:00:59 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0132.outbound.protection.outlook.com [157.56.111.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCFD71634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:00:59 +0000 (UTC)
Received: from BN3PR0301CA0042.namprd03.prod.outlook.com (25.160.180.180) by
	BY1PR0301MB1189.namprd03.prod.outlook.com (25.160.195.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.53.17; Wed, 14 Jan 2015 05:26:18 +0000
Received: from BL2FFO11FD008.protection.gbl (2a01:111:f400:7c09::156) by
	BN3PR0301CA0042.outlook.office365.com (2a01:111:e400:4000::52) with
	Microsoft
	SMTP Server (TLS) id 15.1.53.17 via Frontend Transport; Wed, 14 Jan 2015
	05:26:17 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD008.mail.protection.outlook.com (10.173.161.4) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Wed, 14 Jan 2015 05:26:17 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0E5QElA000658;
	Tue, 13 Jan 2015 22:26:15 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 13:26:14 +0800
Message-ID: <1421213174-32146-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(33646002)(47776003)(64706001)(105606002)(48376002)(97736003)(81156004)(106466001)(92566002)(104016003)(50226001)(36756003)(50466002)(2351001)(50986999)(229853001)(69596002)(68736005)(19580405001)(6806004)(77096005)(86362001)(19580395003)(46102003)(110136001)(450100001)(77156002)(85426001)(62966003)(86152002)(575784001)(87936001)(211663006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1189;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:BY1PR0301MB1189;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY1PR0301MB1189; 
X-Forefront-PRVS: 04569283F9
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1189; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2015 05:26:17.4122 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1189
Subject: [PATCH] libunwind: Fix test case link failure on PowerPC with Altivec
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
X-List-Received-Date: Wed, 14 Jan 2015 08:01:06 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 ...k-failure-on-PowerPC-systems-with-Altivec.patch | 28 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
 2 files changed, 29 insertions(+)
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
index 2e52430..5b54dcb 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -3,6 +3,7 @@ require libunwind.inc
 SRC_URI += "\
     file://Support-building-with-older-compilers.patch \
     file://AArch64-port.patch \
+    file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
 "
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
1.8.3.2


