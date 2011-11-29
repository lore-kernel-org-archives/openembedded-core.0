Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVJMt-0007A2-PK
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:48:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAT8g8Fb015747
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:42:08 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 Nov 2011 00:42:08 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 16:38:59 +0800
Message-ID: <ba86babf9425bb34f62c879e2c44febf7308a543.1322554339.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322554339.git.wenzong.fan@windriver.com>
References: <cover.1322554339.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] m4: Add m4-nativesdk recipes
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
X-List-Received-Date: Tue, 29 Nov 2011 08:48:48 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

[YOCTO #1603]

m4-nativesdk is required by autoconf-nativesdk.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/m4/m4-nativesdk_1.4.16.bb |   12 ++++++++++++
 meta/recipes-devtools/m4/m4-nativesdk_1.4.9.bb  |   12 ++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/m4/m4-nativesdk_1.4.16.bb
 create mode 100644 meta/recipes-devtools/m4/m4-nativesdk_1.4.9.bb

diff --git a/meta/recipes-devtools/m4/m4-nativesdk_1.4.16.bb b/meta/recipes-devtools/m4/m4-nativesdk_1.4.16.bb
new file mode 100644
index 0000000..f1be0c8
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4-nativesdk_1.4.16.bb
@@ -0,0 +1,12 @@
+require m4_${PV}.bb
+inherit nativesdk
+
+INHIBIT_AUTOTOOLS_DEPS = "1"
+DEPENDS += "gnu-config-nativesdk"
+
+do_configure()  {
+	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.sub .
+	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.guess .
+	oe_runconf
+}
+
diff --git a/meta/recipes-devtools/m4/m4-nativesdk_1.4.9.bb b/meta/recipes-devtools/m4/m4-nativesdk_1.4.9.bb
new file mode 100644
index 0000000..f1be0c8
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4-nativesdk_1.4.9.bb
@@ -0,0 +1,12 @@
+require m4_${PV}.bb
+inherit nativesdk
+
+INHIBIT_AUTOTOOLS_DEPS = "1"
+DEPENDS += "gnu-config-nativesdk"
+
+do_configure()  {
+	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.sub .
+	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.guess .
+	oe_runconf
+}
+
-- 
1.7.0.4



