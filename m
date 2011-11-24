Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTVY5-0008Sn-9x
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 10:24:53 +0100
Received: by vbbfc21 with SMTP id fc21so920661vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 01:18:20 -0800 (PST)
Received: by 10.52.65.1 with SMTP id t1mr28937311vds.121.1322126299877;
	Thu, 24 Nov 2011 01:18:19 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ey9sm28112143vdc.19.2011.11.24.01.18.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 01:18:19 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 10:18:11 +0100
Message-Id: <1322126292-25928-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv2 1/2] libjson: add 0.9
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
X-List-Received-Date: Thu, 24 Nov 2011 09:24:53 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Changes since v1:
	* fix LICENSE

 meta/recipes-devtools/libjson/libjson_0.9.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb

diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb b/meta/recipes-devtools/libjson/libjson_0.9.bb
new file mode 100644
index 0000000..e4951a8
--- /dev/null
+++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "JSON-C - A JSON implementation in C"
+HOMEPAGE = "http://oss.metaparadigm.com/json-c/"
+
+LICENSE = "MIT"
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



