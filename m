Return-Path: <Yue.Tao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D30B26FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 06:59:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5H6xdII023172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 23:59:39 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Mon, 16 Jun 2014 23:59:38 -0700
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <yue.tao@windriver.com>
Date: Tue, 17 Jun 2014 15:02:51 +0800
Message-ID: <1402988571-6730-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.151]
Subject: [PATCH] tzcode: Update to 2014e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jun 2014 06:59:42 -0000
Content-Type: text/plain

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../recipes-extended/tzcode/tzcode-native_2014d.bb |   11 -----------
 .../recipes-extended/tzcode/tzcode-native_2014e.bb |   11 +++++++++++
 meta/recipes-extended/tzdata/tzdata_2014d.bb       |    6 ------
 meta/recipes-extended/tzdata/tzdata_2014e.bb       |    6 ++++++
 4 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014d.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014e.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014d.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014e.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014d.bb b/meta/recipes-extended/tzcode/tzcode-native_2014d.bb
deleted file mode 100644
index 8d20158..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014d.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014d.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "4a0f5f259ba8a2b826fffb1fa26d0134"
-SRC_URI[tzcode.sha256sum] = "e9c775bb76c9700521ada77776277c25f8650a22b56d46c9f00f4147970ef13e"
-SRC_URI[tzdata.md5sum] = "299b86c0368ecfb321f15d5c408a1d9b"
-SRC_URI[tzdata.sha256sum] = "4b4966912f5d4a299b0bdf47e6f3103d82dc6a0b5a6b321e2b9d5662597a62f0"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014e.bb b/meta/recipes-extended/tzcode/tzcode-native_2014e.bb
new file mode 100644
index 0000000..405ed60
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014e.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014e.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "552251600ee3571c244d33c7196ec2ed"
+SRC_URI[tzcode.sha256sum] = "43ebc426ab4911e222a4487f24289adfd2bc5eb09363a5e77cdabf56374a8c1c"
+SRC_URI[tzdata.md5sum] = "8a49fdedd4e832da8e85f7f9bcaedc33"
+SRC_URI[tzdata.sha256sum] = "08e243a79051f838d86ac1311a78b74047951302d448024e823b5b7aa71f86c5"
+
+require tzcode-native.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014d.bb b/meta/recipes-extended/tzdata/tzdata_2014d.bb
deleted file mode 100644
index 984c665..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014d.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "299b86c0368ecfb321f15d5c408a1d9b"
-SRC_URI[tzdata.sha256sum] = "4b4966912f5d4a299b0bdf47e6f3103d82dc6a0b5a6b321e2b9d5662597a62f0"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014e.bb b/meta/recipes-extended/tzdata/tzdata_2014e.bb
new file mode 100644
index 0000000..b53d323
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014e.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "8a49fdedd4e832da8e85f7f9bcaedc33"
+SRC_URI[tzdata.sha256sum] = "08e243a79051f838d86ac1311a78b74047951302d448024e823b5b7aa71f86c5"
+
+require tzdata.inc
-- 
1.7.5.4


