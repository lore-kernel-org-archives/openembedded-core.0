Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJGLY-0004BK-70
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 05:09:36 +0200
Received: from mail37-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Oct 2011 03:03:29 +0000
Received: from mail37-tx2 (localhost.localdomain [127.0.0.1])	by
	mail37-tx2-R.bigfish.com (Postfix) with ESMTP id 35C2A48022E	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 03:03:32 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h63h)
X-Spam-TCS-SCL: 2:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail37-tx2 (localhost.localdomain [127.0.0.1]) by mail37-tx2
	(MessageSwitch) id 131968461265464_28609;
	Thu, 27 Oct 2011 03:03:32 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.246])	by
	mail37-tx2.bigfish.com (Postfix) with ESMTP id 0ADD15B804C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 03:03:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 27 Oct 2011 03:03:27 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Wed, 26 Oct 2011 22:03:33 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p9R33Wsj011584	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 22:03:33 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2011 22:03:32 -0500
Message-ID: <1319684612-24265-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Add readline as dependecy for gdb-cross-canadian
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 03:09:36 -0000
Content-Type: text/plain

Got errors that we were unable to find -lreadline, this fixed the
issue

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    2 +-
 .../gdb/gdb-cross-canadian_7.3a.bb                 |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 90a20e2..ec0748e 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -4,4 +4,4 @@ DESCRIPTION = "cross-canadian gdb for ${TARGET_ARCH} target - GNU debugger"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "ncurses-nativesdk expat-nativesdk gettext-nativesdk"
+DEPENDS = "ncurses-nativesdk expat-nativesdk gettext-nativesdk readline-nativesdk"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
index 7e8ad04..555bef1 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.6.1




