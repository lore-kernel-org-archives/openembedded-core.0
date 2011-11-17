Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RQygL-0007PL-JF
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:54:57 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9A5B41100182;
	Thu, 17 Nov 2011 10:48:34 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A53F2110018B;
	Thu, 17 Nov 2011 10:48:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225005235.adsl.alicedsl.de
	[92.225.5.235]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Thu, 17 Nov 2011 10:48:32 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 2D0353C498; Thu, 17 Nov 2011 10:48:32 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 10:48:30 +0100
Message-Id: <1321523310-29625-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] useradd.bbclass: do not let depend native packages on base-passwd from target
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
X-List-Received-Date: Thu, 17 Nov 2011 09:54:57 -0000


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/classes/useradd.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 928f619..245588b 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,6 +3,7 @@
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = "${USERADDDEPENDS}"
 USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
+USERADDDEPENDS_virtclass-native = ""
 USERADDDEPENDS_virtclass-nativesdk = ""
 
 # This preinstall function will be run in two contexts: once for the
-- 
1.7.7.3


