Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RYJrY-0001Ej-Fx
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 16:56:52 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 35283CE86
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 16:50:04 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlRHAGOK305T4zgTPGdsb2JhbABDqlMZAQEBATcygXIBXCMwH0sKLYgJBrZGiByDGASUa5Ik
X-IronPort-AV: E=Sophos;i="4.71,314,1320620400"; 
   d="scan'208";a="9628522"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	hexagon.atmel.com) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 07 Dec 2011 16:50:03 +0100
From: ulf@emagii.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 16:50:01 +0100
Message-Id: <1323273001-9824-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] connman-gnome: Change git server until kernel.org is OK
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
X-List-Received-Date: Wed, 07 Dec 2011 15:56:52 -0000

From: Ulf Samuelsson <ulf@emagii.com>

The normal git for connman-gnome at kernel.org is empty.
A copy exists at
http://autobuilder.yoctoproject.org/pub/sources/git2_git.kernel.org.pub.scm.network.connman.connman-gnome.git.tar.gz
but will require a manual download before the build can complete.

The above package has been downloaded and put on github to
allow a smooth building process, if the tarball is not available.

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .../connman/connman-gnome_0.5.bb                   |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index 9c78186..20dd5ab 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -8,10 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "gtk+ dbus"
 
-PR = "r7"
+PR = "r8"
 
 SRCREV = "78d3c39db6f3f7977b466305110faa8ca5f74ec8"
-SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git \
+#SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git \
+
+# kernel.org repo is down (empty)
+# Use a git tree created from
+# http://autobuilder.yoctoproject.org/pub/sources/git2_git.kernel.org.pub.scm.network.connman.connman-gnome.git.tar.gz
+SRC_URI = "git://github.com/emagii/connman-gnome.git;protocol=git \
            file://3g.patch \
            file://security-type.patch"
 
-- 
1.7.4.1



