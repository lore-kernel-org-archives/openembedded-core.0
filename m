Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TsDe6-0006NY-PE
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 15:26:11 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 69690D22CD;
	Mon,  7 Jan 2013 15:10:38 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 15:10:34 +0100
Message-Id: <1357567834-28465-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] nspr: added gnu-configize for AArch64 support
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
X-List-Received-Date: Mon, 07 Jan 2013 14:26:14 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-support/nspr/nspr_4.9.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nspr/nspr_4.9.4.bb b/meta/recipes-support/nspr/nspr_4.9.4.bb
index 0c985e2..36f93e0 100644
--- a/meta/recipes-support/nspr/nspr_4.9.4.bb
+++ b/meta/recipes-support/nspr/nspr_4.9.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=f0babf9590d84
                     file://Makefile.in;beginline=4;endline=38;md5=beda1dbb98a515f557d3e58ef06bca99"
 SECTION = "libs/network"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
            file://remove-rpath-from-tests.patch \
@@ -140,6 +140,8 @@ TESTS = "runtests.pl \
 inherit autotools
 
 do_configure() {
+	gnu-configize --force
+	mv config.sub config.guess build/autoconf
 	oe_runconf
 }
 
-- 
1.8.0



