Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SS9Y8-0003Sp-LI
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:15:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49G5dPD024820
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 09:05:39 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 9 May 2012 09:05:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 11:08:42 -0500
Message-ID: <2fda0d691f53c8613a1510e16bcb81b999d12331.1336579481.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1336579481.git.mark.hatle@windriver.com>
References: <cover.1336579481.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] blacklist: fix typo in name
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
X-List-Received-Date: Wed, 09 May 2012 16:15:37 -0000
Content-Type: text/plain

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Import directly from meta-openembedded commit: 	a63c374cdc785ade69d2998978d08280e671dc1f

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/blacklist.bbclass |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/blacklist.bbclass

diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
new file mode 100644
index 0000000..7bf4a73
--- /dev/null
+++ b/meta/classes/blacklist.bbclass
@@ -0,0 +1,20 @@
+# anonymous support class from angstrom
+# 
+# Features:
+#
+# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah = "message"
+#
+
+python () {
+    import bb
+
+    blacklist = bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
+    pkgnm = bb.data.getVar("PN", d, 1)
+    distro = bb.data.getVar("DISTRO", d, 1)
+
+    if blacklist:
+	bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
+        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
+
+}
+
-- 
1.7.3.4



