Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TeHmx-000757-4B
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 05:01:19 +0100
Received: from mail204-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE015.bigfish.com (10.9.40.35) with Microsoft SMTP Server id
	14.1.225.23; Fri, 30 Nov 2012 03:16:51 +0000
Received: from mail204-tx2 (localhost [127.0.0.1])	by
	mail204-tx2-R.bigfish.com (Postfix) with ESMTP id 073421801E6	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 03:16:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1155h)
Received: from mail204-tx2 (localhost.localdomain [127.0.0.1]) by mail204-tx2
	(MessageSwitch) id 1354245408833602_29973;
	Fri, 30 Nov 2012 03:16:48 +0000 (UTC)
Received: from TX2EHSMHS005.bigfish.com (unknown [10.9.14.239])	by
	mail204-tx2.bigfish.com (Postfix) with ESMTP id C889274004D	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 03:16:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS005.bigfish.com
	(10.9.99.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 30 Nov 2012 03:16:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 30 Nov 2012 03:16:46 +0000
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id qAU3Gh7t003429;
	Thu, 29 Nov 2012 20:16:44 -0700
From: Zhenhua Luo <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 11:39:55 +0800
Message-ID: <1354246795-17672-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com
Subject: libxml2: add --with-fexceptions in configure flags to support exception handling in C++ programs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 04:01:19 -0000
Content-Type: text/plain

Without this flag, the library has a problem with C++ programs using exception handling.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-core/libxml/libxml2.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 9ec507b..8794247 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -24,7 +24,7 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
 EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n --without-lzma"
-- 
1.7.9.5




