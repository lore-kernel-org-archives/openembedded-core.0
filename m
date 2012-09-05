Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9AIK-0007I3-2W
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 09:45:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q857WdLx017174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 00:32:40 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 00:32:39 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 5 Sep 2012 15:32:40 +0800
Message-ID: <54d4ef1444e4f00ea85844ab297668e029d112cd.1346829716.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346829716.git.kai.kang@windriver.com>
References: <cover.1346829716.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] meta-lsb: add layer meta-lsb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 07:45:04 -0000
Content-Type: text/plain

Create layer meta-lsb and put extra packages that required by lsb test
here.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta-lsb/README          |    4 ++++
 meta-lsb/conf/layer.conf |   10 ++++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-lsb/README
 create mode 100644 meta-lsb/conf/layer.conf

diff --git a/meta-lsb/README b/meta-lsb/README
new file mode 100644
index 0000000..70acaf2
--- /dev/null
+++ b/meta-lsb/README
@@ -0,0 +1,4 @@
+meta-lsb
+==========
+
+This is the location for packages that required by LSB test suit.
diff --git a/meta-lsb/conf/layer.conf b/meta-lsb/conf/layer.conf
new file mode 100644
index 0000000..1008075
--- /dev/null
+++ b/meta-lsb/conf/layer.conf
@@ -0,0 +1,10 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH := "${BBPATH}:${LAYERDIR}"
+
+# We have a packages directory, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "lsb"
+BBFILE_PATTERN_lsb := "^${LAYERDIR}/"
+BBFILE_PRIORITY_lsb = "5"
-- 
1.7.5.4



