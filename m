Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGExU-0007z0-19
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:08:48 +0200
Received: from mail47-db3-R.bigfish.com (10.3.81.241) by
	DB3EHSOBE010.bigfish.com (10.3.84.30) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 19:55:56 +0000
Received: from mail47-db3 (localhost [127.0.0.1])	by mail47-db3-R.bigfish.com
	(Postfix) with ESMTP id A7DC8A0094	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 19:55:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh1155h)
Received: from mail47-db3 (localhost.localdomain [127.0.0.1]) by mail47-db3
	(MessageSwitch) id 1348516555671316_5276;
	Mon, 24 Sep 2012 19:55:55 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.234])	by
	mail47-db3.bigfish.com (Postfix) with ESMTP id 948D22C0046	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 19:55:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 19:55:51 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Mon, 24 Sep 2012 14:55:49 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8OJtk7h017699 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 12:55:50 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Sep 2012 14:55:45 -0500
Message-ID: <1348516546-26005-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] libx11.inc: disable warnings that don't work on certain compilers
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
X-List-Received-Date: Mon, 24 Sep 2012 20:08:48 -0000
Content-Type: text/plain

Fixes these sorts of issues present on older gcc (CentOS 5.x in this case)

| cc1: error: unrecognized command line option "-Werror=implicit"
| cc1: error: unrecognized command line option "-Werror=nonnull"
| cc1: error: unrecognized command line option "-Werror=init-self"
| cc1: error: unrecognized command line option "-Werror=main"
| cc1: error: unrecognized command line option "-Werror=missing-braces"
| cc1: error: unrecognized command line option "-Werror=sequence-point"
| cc1: error: unrecognized command line option "-Werror=return-type"
| cc1: error: unrecognized command line option "-Werror=trigraphs"
| cc1: error: unrecognized command line option "-Werror=array-bounds"
| cc1: error: unrecognized command line option "-Werror=write-strings"
| cc1: error: unrecognized command line option "-Werror=address"
| cc1: error: unrecognized command line option "-Werror=int-to-pointer-cast"
| cc1: error: unrecognized command line option "-Werror=pointer-to-int-cast"

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 3ecd9e5..0e99442 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,7 @@ inherit siteinfo
 FILESPATH = "${FILE_DIRNAME}/libx11"
 
 PE = "1"
-INC_PR = "r8"
+INC_PR = "r9"
 
 PROVIDES = "virtual/libx11"
 
@@ -23,6 +23,7 @@ DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
 DEPENDS += "xproto-native"
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
+EXTRA_OEMAKE = '-e CWARNFLAGS=""'
 
 # Let people with incredibly archaic requirements enable Xcms and BigFont, but
 # disable them by default.
-- 
1.7.9.7




