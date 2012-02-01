Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rsdo7-0006Oj-LX
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 18:17:19 +0100
Received: by iaby12 with SMTP id y12so1992825iab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 09:09:24 -0800 (PST)
Received: by 10.42.189.135 with SMTP id de7mr5972146icb.54.1328116163943;
	Wed, 01 Feb 2012 09:09:23 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id ba5sm15195127igb.6.2012.02.01.09.09.22
	(version=SSLv3 cipher=OTHER); Wed, 01 Feb 2012 09:09:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 09:09:12 -0800
Message-Id: <1328116152-4451-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] shadow-securetty: allow root logins on usb serial gadget device
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
X-List-Received-Date: Wed, 01 Feb 2012 17:17:19 -0000

Existing tty list does not include ttyGS0, add it

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/files/securetty       |    3 +++
 .../shadow/shadow-securetty_4.1.4.3.bb             |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index 28fa0af..a06dc44 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -25,6 +25,9 @@ ttyUSB0
 ttyUSB1
 ttyUSB2
 
+# USB serial gadget
+ttyGS0
+
 # PowerMac
 ttyPZ0
 ttyPZ1
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
index e391d24..c7a206e 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+PR = "1"
+
 SRC_URI = "file://securetty"
 
 # Since we deduce our arch from ${SERIAL_CONSOLE}
-- 
1.7.1



