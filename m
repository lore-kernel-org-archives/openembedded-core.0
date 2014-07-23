Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0190.outbound.protection.outlook.com [207.46.163.190])
	by mail.openembedded.org (Postfix) with ESMTP id 99CF3707F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 04:01:59 +0000 (UTC)
Received: from BY2PR03CA034.namprd03.prod.outlook.com (10.242.234.155) by
	BL2PR03MB148.namprd03.prod.outlook.com (10.255.230.27) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Wed, 23 Jul 2014 04:01:59 +0000
Received: from BN1AFFO11FD047.protection.gbl (2a01:111:f400:7c10::158) by
	BY2PR03CA034.outlook.office365.com (2a01:111:e400:2c2c::27) with
	Microsoft
	SMTP Server (TLS) id 15.0.990.7 via Frontend Transport; Wed, 23 Jul 2014
	04:01:58 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD047.mail.protection.outlook.com (10.58.53.62) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 23 Jul 2014 04:01:58 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6N41r3U017726;
	Tue, 22 Jul 2014 21:01:56 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 11:58:57 +0800
Message-ID: <1406087937-32112-2-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406087937-32112-1-git-send-email-ting.liu@freescale.com>
References: <1406087937-32112-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(20776003)(104016003)(46102001)(33646002)(87286001)(50226001)(106466001)(85306003)(19580395003)(48376002)(19580405001)(50466002)(80022001)(229853001)(77156001)(83322001)(86362001)(93916002)(68736004)(87936001)(4396001)(44976005)(64706001)(97736001)(31966008)(107046002)(47776003)(74662001)(2351001)(74502001)(84676001)(81156004)(89996001)(81342001)(102836001)(62966002)(86152002)(77982001)(6806004)(83072002)(76176999)(95666004)(79102001)(26826002)(99396002)(69596002)(88136002)(85852003)(76482001)(92566001)(36756003)(104166001)(92726001)(110136001)(21056001)(50986999)(81542001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB148;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 028166BF91
Received-SPF: TempError (: error in processing during lookup of freescale.com:
	DNS Timeout)
Authentication-Results: spf=temperror (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] serf: specify LIBDIR to avoid install issue
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
X-List-Received-Date: Wed, 23 Jul 2014 04:02:02 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

LIBDIR defaults to ${prefix}/lib, use ${libdir} to avoid issue on
64bit platforms.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta/recipes-support/serf/serf_1.3.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/serf/serf_1.3.6.bb b/meta/recipes-support/serf/serf_1.3.6.bb
index 9893cb7..08b04d3 100644
--- a/meta/recipes-support/serf/serf_1.3.6.bb
+++ b/meta/recipes-support/serf/serf_1.3.6.bb
@@ -21,7 +21,7 @@ do_compile() {
 }
 
 do_install() {
-	${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} install
+	${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} LIBDIR=${D}${libdir} install
 }
 
-BBCLASSEXTEND = "native"
\ No newline at end of file
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


