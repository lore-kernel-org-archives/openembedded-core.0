Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=VA3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Qoegi-0002Vb-6O
	for openembedded-core@openembedded.org; Wed, 03 Aug 2011 18:52:56 +0200
Received: from mail17-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Wed, 3 Aug 2011 16:33:29 +0000
Received: from mail17-va3 (localhost.localdomain [127.0.0.1])	by
	mail17-va3-R.bigfish.com (Postfix) with ESMTP id 227979B8081;
	Wed,  3 Aug 2011 16:33:29 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail17-va3 (localhost.localdomain [127.0.0.1]) by mail17-va3
	(MessageSwitch) id 131238920942380_24119;
	Wed,  3 Aug 2011 16:33:29 +0000 (UTC)
Received: from VA3EHSMHS010.bigfish.com (unknown [10.7.14.236])	by
	mail17-va3.bigfish.com (Postfix) with ESMTP id 059011B48011;
	Wed,  3 Aug 2011 16:33:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS010.bigfish.com
	(10.7.99.20) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 3 Aug 2011 16:33:29 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.289.8; Wed, 3 Aug 2011 11:33:28 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p73GXRqD002036; Wed, 3 Aug 2011 11:33:27 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <yocto@yoctoproject.org>, <openembedded-core@openembedded.org>
Date: Wed, 3 Aug 2011 11:33:26 -0500
Message-ID: <1312389206-15422-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Update intltool to set perl shebang correctly for installed tools
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
X-List-Received-Date: Wed, 03 Aug 2011 16:52:56 -0000
Content-Type: text/plain

Several installed scripts set the perl shebang that is too long
which can cause failures on certian older bash versions.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/intltool/intltool.inc       |    2 +-
 meta/recipes-devtools/intltool/intltool_0.40.6.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index c934654..d8917ad 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -12,5 +12,5 @@ RRECOMMENDS_${PN} = "perl-modules"
 
 inherit autotools pkgconfig perlnative
 
-export PERL_virtclass-native = "/usr/bin/env perl"
+export PERL = "/usr/bin/env perl"
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
index c7938e5..8b52cf8 100644
--- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r3"
+PR = "r4"
 
 SRC_URI_append = " file://intltool-nowarn-0.40.0.patch"
 
-- 
1.7.5




