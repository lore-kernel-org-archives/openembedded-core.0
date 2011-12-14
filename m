Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Ranzc-0006TD-Om
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 13:31:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBECOV6T008741
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 04:24:31 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 14 Dec 2011 04:24:31 -0800
Message-ID: <006b4308dc652187daa0a84726b969a67eb6d6f0.1323864630.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323864630.git.xiaofeng.yan@windriver.com>
References: <cover.1323864630.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 14 Dec 2011 19:58:35 +0800
Date: Wed, 14 Dec 2011 20:18:27 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gtk-directfb: add bbclass gtk-directfb
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
X-List-Received-Date: Wed, 14 Dec 2011 12:31:29 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This file remind user to add "gtk-directfb" to DISTRO_FEATURES and remove "x11" \
when building core-image-gtk-directfb.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/gtk-directfb.bbclass |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/gtk-directfb.bbclass

diff --git a/meta/classes/gtk-directfb.bbclass b/meta/classes/gtk-directfb.bbclass
new file mode 100644
index 0000000..b65b787
--- /dev/null
+++ b/meta/classes/gtk-directfb.bbclass
@@ -0,0 +1,12 @@
+# gtk can only run a backend at a time (directfb or x11) for gtk-2.x. 
+# So if you want to get an image of gtk running directfb. 
+# Please remove x11 from DISTRO_FEATURES
+python () {
+	import sys
+	import logging
+	logger = logging.getLogger('BitBake.Event')
+	packages = d.getVar('DISTRO_FEATURES', 1).split()
+	for pkg in packages:
+		if pkg == "x11":
+			bb.fatal("FEATURE \"x11\" is in DISTRO_FEATURES, Please remove x11 from DISTRO_FEATURES, use \"gtk-directfb\" instead of it\n")
+}
-- 
1.7.0.4



