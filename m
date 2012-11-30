Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TeM6w-0000xQ-Pk
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 09:38:16 +0100
Received: from mail269-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE015.bigfish.com (10.9.40.35) with Microsoft SMTP Server id
	14.1.225.23; Fri, 30 Nov 2012 08:08:50 +0000
Received: from mail269-tx2 (localhost [127.0.0.1])	by
	mail269-tx2-R.bigfish.com (Postfix) with ESMTP id AE2137C007F	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:08:50 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1155h)
Received: from mail269-tx2 (localhost.localdomain [127.0.0.1]) by mail269-tx2
	(MessageSwitch) id 1354262928600527_19952;
	Fri, 30 Nov 2012 08:08:48 +0000 (UTC)
Received: from TX2EHSMHS017.bigfish.com (unknown [10.9.14.243])	by
	mail269-tx2.bigfish.com (Postfix) with ESMTP id 90346C006D	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:08:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS017.bigfish.com
	(10.9.99.117) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 30 Nov 2012 08:08:48 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 30 Nov 2012 08:08:48 +0000
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id qAU88icR020201;
	Fri, 30 Nov 2012 01:08:45 -0700
From: Zhenhua Luo <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 16:31:57 +0800
Message-ID: <1354264317-20895-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com
Subject: [oe-core v2] libxml2: add --with-fexceptions in configure flags to support exception handling in C++ programs
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
X-List-Received-Date: Fri, 30 Nov 2012 08:38:16 -0000
Content-Type: text/plain

Without this flag, the library has a problem with C++ programs using exception handling.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-core/libxml/libxml2.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 9ec507b..615c89e 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
+INC_PR = "r1"
+
 DEPENDS_class-native = "python-native"
 DEPENDS =+ "zlib"
 
@@ -24,7 +26,7 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
 EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n --without-lzma"
-- 
1.7.9.5




