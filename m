Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rse3V-00049i-K5
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 18:33:13 +0100
Received: by ghbf19 with SMTP id f19so689983ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 09:25:18 -0800 (PST)
Received: by 10.50.154.200 with SMTP id vq8mr27738299igb.14.1328117117316;
	Wed, 01 Feb 2012 09:25:17 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id h9sm27529504ibh.11.2012.02.01.09.25.15
	(version=SSLv3 cipher=OTHER); Wed, 01 Feb 2012 09:25:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 09:24:48 -0800
Message-Id: <1328117088-4547-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v2] shadow-securetty: allow root logins on usb serial gadget device
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
X-List-Received-Date: Wed, 01 Feb 2012 17:33:13 -0000

Existing tty list does not include ttyGS0, add it

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
Changes in this version:
 - set PR to r1
 
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
 
+PR = "r1"
+
 SRC_URI = "file://securetty"
 
 # Since we deduce our arch from ${SERIAL_CONSOLE}
-- 
1.7.1



