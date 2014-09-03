Return-Path: <B50113@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0185.outbound.protection.outlook.com [207.46.163.185])
	by mail.openembedded.org (Postfix) with ESMTP id B5A04713CC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 09:50:29 +0000 (UTC)
Received: from BN3PR0301CA0039.namprd03.prod.outlook.com (25.160.180.177) by
	BLUPR03MB280.namprd03.prod.outlook.com (10.255.213.24) with Microsoft
	SMTP Server (TLS) id 15.0.1015.19; Wed, 3 Sep 2014 09:50:29 +0000
Received: from BN1BFFO11FD035.protection.gbl (2a01:111:f400:7c10::1:175) by
	BN3PR0301CA0039.outlook.office365.com (2a01:111:e400:4000::49) with
	Microsoft SMTP Server (TLS) id 15.0.1019.16 via Frontend Transport;
	Wed, 3 Sep 2014 09:50:29 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD035.mail.protection.outlook.com (10.58.144.98) with
	Microsoft SMTP Server (TLS) id 15.0.1010.11 via Frontend Transport;
	Wed, 3 Sep 2014 09:50:28 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241089.ap.freescale.net
	[10.192.241.89])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s839oQT4014529; Wed, 3 Sep 2014 02:50:27 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 17:50:54 +0800
Message-ID: <1409737854-29513-1-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199003)(189002)(68736004)(90102001)(229853001)(6806004)(19580405001)(19580395003)(86362001)(93916002)(44976005)(2351001)(92726001)(74502001)(107046002)(31966008)(83322001)(85852003)(89996001)(88136002)(83072002)(36756003)(77156001)(92566001)(110136001)(95666004)(97736001)(48376002)(87936001)(104166001)(106466001)(4396001)(21056001)(74662001)(26826002)(99396002)(105606002)(81542001)(102836001)(50986999)(50226001)(85306004)(76482001)(64706001)(20776003)(47776003)(50466002)(81342001)(62966002)(80022001)(104016003)(33646002)(87286001)(46102001)(84676001)(77982001)(79102001)(42262002);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB280;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;
X-Forefront-PRVS: 032334F434
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B50113@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] alsa-lib: libasound should runtime depends on alsa-conf
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
X-List-Received-Date: Wed, 03 Sep 2014 09:50:31 -0000
Content-Type: text/plain

Make libasound runtime depends on alsa-conf to install alsa-conf to rootfs.

Signed-off-by: Zidan Wang <b50113@freescale.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
index d509da2..9a4aab4 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
@@ -47,7 +47,7 @@ ${datadir}/alsa/pcm/default.conf \
 ${datadir}/alsa/pcm/dmix.conf \
 ${datadir}/alsa/pcm/dsnoop.conf"
 
-RDEPENDS_libasound = "alsa-conf-base"
+RDEPENDS_libasound = "alsa-conf-base alsa-conf"
 # upgrade path
 RPROVIDES_${PN}-dev = "alsa-dev"
 RREPLACES_${PN}-dev = "alsa-dev"
-- 
1.7.9.5


