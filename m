Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1RVPs5-000801-BZ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 16:45:26 +0100
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RVPAB-0001Sm-TH by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Tue, 29 Nov 2011 16:00:10 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1RVPAi-0002Xg-LB; Tue, 29 Nov 2011 16:00:36 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:00:33 +0100
Message-Id: <1322578833-9741-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.7.3
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH] logrotate: Add dependency on popt lib.
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
X-List-Received-Date: Tue, 29 Nov 2011 15:45:26 -0000

Without this logrotate may fail like this:
 compilation terminated.
| config.c:9:18: fatal error: popt.h: No such file or directory

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
index b736593..8dc0504 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
-DEPENDS="coreutils"
+DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-- 
1.7.7.3



