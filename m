Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TLTdq-0004P9-8O
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 08:50:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q996b2Ot001105
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 23:37:02 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 8 Oct 2012 23:37:02 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Oct 2012 14:36:55 +0800
Message-ID: <35cc119ef299904561220b558cf01976f9c4cbac.1349689653.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1349689653.git.jackie.huang@windriver.com>
References: <cover.1349689653.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [PATCH 2/4] libyaml: update to 0.1.4
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
X-List-Received-Date: Tue, 09 Oct 2012 06:50:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/libyaml/libyaml_0.1.3.bb |   14 --------------
 meta/recipes-support/libyaml/libyaml_0.1.4.bb |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-support/libyaml/libyaml_0.1.3.bb
 create mode 100644 meta/recipes-support/libyaml/libyaml_0.1.4.bb

diff --git a/meta/recipes-support/libyaml/libyaml_0.1.3.bb b/meta/recipes-support/libyaml/libyaml_0.1.3.bb
deleted file mode 100644
index 702ed55..0000000
--- a/meta/recipes-support/libyaml/libyaml_0.1.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "LibYAML is a YAML parser and emitter written in C."
-HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
-SECTION = "libs/devel"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
-PR="r0"
-
-SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz;name=libyaml"
-SRC_URI[libyaml.md5sum] = "b8ab9064e8e0330423fe640de76608cd"
-SRC_URI[libyaml.sha256sum] = "a8bbad7e5250b3735126b7e3bd9f6fce9db19d6be7cc13abad17a24b59ec144a"
-
-S = "${WORKDIR}/yaml-${PV}"
-
-inherit autotools
diff --git a/meta/recipes-support/libyaml/libyaml_0.1.4.bb b/meta/recipes-support/libyaml/libyaml_0.1.4.bb
new file mode 100644
index 0000000..cea224a
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml_0.1.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
+DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
+a human-readable data serialization format. "
+HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
+SECTION = "libs/devel"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "36c852831d02cf90508c29852361d01b"
+SRC_URI[sha256sum] = "7bf81554ae5ab2d9b6977da398ea789722e0db75b86bffdaeb4e66d961de6a37"
+
+S = "${WORKDIR}/yaml-${PV}"
+
+inherit autotools
-- 
1.7.4



