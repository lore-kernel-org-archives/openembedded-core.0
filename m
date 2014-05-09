Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 951 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 06:39:45 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.145])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8E660559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 06:39:45 +0000 (UTC)
Received: from CH1PR03CA001.namprd03.prod.outlook.com (10.255.156.146) by
	BY2PR03MB393.namprd03.prod.outlook.com (10.141.141.12) with Microsoft
	SMTP Server (TLS) id 15.0.939.12; Fri, 9 May 2014 06:23:54 +0000
Received: from BN1BFFO11FD047.protection.gbl (10.255.156.132) by
	CH1PR03CA001.outlook.office365.com (10.255.156.146) with Microsoft SMTP
	Server (TLS) id 15.0.939.12 via Frontend Transport;
	Fri, 9 May 2014 06:23:53 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD047.mail.protection.outlook.com (10.58.145.2) with Microsoft
	SMTP Server (TLS) id 15.0.929.8 via Frontend Transport;
	Fri, 9 May 2014 06:23:53 +0000
Received: from fly.ap.freescale.net (fly.ap.freescale.net [10.193.20.113])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s496No3E023518;
	Thu, 8 May 2014 23:23:51 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 May 2014 14:26:01 +0800
Message-ID: <1399616761-10229-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009001)(979002)(6009001)(199002)(189002)(15202345003)(575784001)(80022001)(97736001)(92566001)(20776003)(93916002)(47776003)(79102001)(50466002)(83072002)(64706001)(74502001)(74662001)(85852003)(92726001)(69596002)(81542001)(33646001)(86362001)(19580395003)(31966008)(68736004)(77982001)(62966002)(50986999)(4396001)(77096999)(99396002)(84676001)(46102001)(6806004)(83322001)(19580405001)(89996001)(76482001)(2009001)(44976005)(88136002)(15975445006)(50226001)(77156001)(48376002)(21056001)(36756003)(81156002)(87936001)(81342001)(87286001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB393;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Forefront-PRVS: 02065A9E77
Received-SPF: Fail (: domain of freescale.com does not designate
	192.88.158.2 as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=zhenhua.luo@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] nettle: add openssl-native in the DEPENDS of native build
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
X-List-Received-Date: Fri, 09 May 2014 06:39:50 -0000
Content-Type: text/plain

nettle-native build failed on Linux distro with old openssl installed,
add the dependency to ensure correct openssl is used by nettle.

Error logs:
| /home/yocto/poky/p1022ds/tmp/work/x86_64-linux/nettle-native/2.7.1-r0/nettle-2.7.1/examples/hogweed-benchmark.c:519: error: 'struct openssl_ctx' has no member named 'key'
| /home/yocto/poky/p1022ds/tmp/work/x86_64-linux/nettle-native/2.7.1-r0/nettle-2.7.1/examples/hogweed-benchmark.c:520: error: 'struct openssl_ctx' has no member named 'digest_length'
| /home/yocto/poky/p1022ds/tmp/work/x86_64-linux/nettle-native/2.7.1-r0/nettle-2.7.1/examples/hogweed-benchmark.c:521: error: 'struct openssl_ctx' has no member named 'digest'

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-support/nettle/nettle_2.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index 87f1639..efb8661 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
 
 DEPENDS += "gmp"
+DEPENDS_class-native = "openssl-native"
 
 SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
 
-- 
1.9.1


