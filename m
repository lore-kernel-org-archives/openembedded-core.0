Received: from smtpi3.ngi.it ([88.149.128.33])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sbabic@denx.de>) id 1SenlK-0006S0-9A
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 15:37:30 +0200
Received: from paperina.lan (unknown [88.149.182.160])
	by smtpi3.ngi.it (Postfix) with ESMTP id 3C0963183C9;
	Wed, 13 Jun 2012 15:19:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by paperina.lan (Postfix) with ESMTP id 184CF140A121;
	Wed, 13 Jun 2012 15:23:13 +0200 (CEST)
Received: from paperina.lan ([127.0.0.1])
	by localhost (paperina.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIYEF1PJKMw2; Wed, 13 Jun 2012 15:23:06 +0200 (CEST)
Received: from papero.lan (papero.lan [192.168.2.247])
	by paperina.lan (Postfix) with ESMTP id 13003140A0B9;
	Wed, 13 Jun 2012 15:23:06 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2012 15:19:05 +0200
Message-Id: <1339593545-14046-1-git-send-email-sbabic@denx.de>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Added recipe for libconfig
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
X-List-Received-Date: Wed, 13 Jun 2012 13:37:30 -0000

libconfig can be used to parse a configuration file
in a structured language, but still compact and more
suitable for embedded devices compared to XML.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 meta/recipes-support/libconfig/libconfig_1.4.8.bb |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-support/libconfig/libconfig_1.4.8.bb

diff --git a/meta/recipes-support/libconfig/libconfig_1.4.8.bb b/meta/recipes-support/libconfig/libconfig_1.4.8.bb
new file mode 100644
index 0000000..5b347b3
--- /dev/null
+++ b/meta/recipes-support/libconfig/libconfig_1.4.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = "C/C++ Configuration File Library"
+DESCRIPTION = "processing of structured configuration files"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
+
+PR = "r0"
+
+SRC_URI = "http://www.hyperrealm.com/libconfig/libconfig-1.4.8.tar.gz \
+"
+
+SRC_URI[md5sum] = "36788da452e9fcfc8efb7661ef5d31ef"
+SRC_URI[sha256sum] = "18b1509fbf438a8c7f9b0af32284e458189b5f6dfd044f898926109f3c3c01ed"
+
+inherit autotools
-- 
1.7.9.5



