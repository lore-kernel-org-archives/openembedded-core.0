Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SkCcn-000353-Oc
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 13:11:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5S8Ei9V025142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 01:14:44 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 28 Jun 2012 01:14:44 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2012 16:14:38 +0800
Message-ID: <1340871279-23335-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] ruby: Add yaml for ruby
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
X-List-Received-Date: Thu, 28 Jun 2012 11:11:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

ruby 1.9.3 depends on yaml.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/yaml/yaml_0.1.4.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/yaml/yaml_0.1.4.bb

diff --git a/meta/recipes-support/yaml/yaml_0.1.4.bb b/meta/recipes-support/yaml/yaml_0.1.4.bb
new file mode 100644
index 0000000..be2c506
--- /dev/null
+++ b/meta/recipes-support/yaml/yaml_0.1.4.bb
@@ -0,0 +1,19 @@
+SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
+DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
+a human-readable data serialization format. "
+HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
+SECTION = "libs/devel"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+
+PR = "r1"
+
+SRC_URI = "\
+  http://pyyaml.org/download/libyaml/${PN}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "36c852831d02cf90508c29852361d01b"
+SRC_URI[sha256sum] = "7bf81554ae5ab2d9b6977da398ea789722e0db75b86bffdaeb4e66d961de6a37"
+
+inherit autotools
-- 
1.7.4



