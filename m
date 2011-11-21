Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSYSZ-0004jH-38
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 19:19:15 +0100
Received: by wwp14 with SMTP id 14so8727400wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 10:12:44 -0800 (PST)
Received: by 10.216.221.21 with SMTP id q21mr2294703wep.104.1321899164329;
	Mon, 21 Nov 2011 10:12:44 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y3sm5462646wiy.3.2011.11.21.10.12.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 10:12:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2011 19:12:34 +0100
Message-Id: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH 1/2] libjson: add 0.9
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
X-List-Received-Date: Mon, 21 Nov 2011 18:19:15 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/libjson/libjson_0.9.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb

diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb b/meta/recipes-devtools/libjson/libjson_0.9.bb
new file mode 100644
index 0000000..4d609a6
--- /dev/null
+++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "JSON-C - A JSON implementation in C"
+
+LICENSE = "MIT/X11"
+LIC_FILES_CHKSUM = "file://COPYING;md5=30a276a476b02c2dcd0849bde417fb17"
+
+SRC_URI = "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
+SRC_URI[md5sum] = "3a13d264528dcbaf3931b0cede24abae"
+SRC_URI[sha256sum] = "702a486c9bf8e19137d484ab5c49b4ad314eb5e1fe37062a72c0a0fa39439475"
+
+S = "${WORKDIR}/json-c-${PV}"
+
+
+inherit autotools
-- 
1.7.2.5



