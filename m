Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Qa3CD-0005aO-Oa
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 12:01:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5O9vQaD015328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 02:57:26 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 24 Jun 2011 02:57:26 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 17:53:11 +0800
Message-ID: <629e95cdaa0288b65a87f857f2291ca862bf0a0a.1308902512.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308902512.git.wenzong.fan@windriver.com>
References: <cover.1308902512.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/4] ccache: Integrate ccache-native to poky
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
X-List-Received-Date: Fri, 24 Jun 2011 10:01:06 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add ccache as a native tool and put its recipe files to:
'meta/recipes-devtools/ccache'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/ccache/ccache.inc      |   16 ++++++++++++++++
 meta/recipes-devtools/ccache/ccache_3.1.5.bb |    8 ++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/ccache/ccache.inc
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.1.5.bb

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
new file mode 100644
index 0000000..e9f7344
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -0,0 +1,16 @@
+SUMMARY = "a fast C/C++ compiler cache"
+DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
+by caching the result of previous compilations and detecting when the \
+same compilation is being done again. Supported languages are C, C\+\+, \
+Objective-C and Objective-C++."
+HOMEPAGE = "http://ccache.samba.org"
+SECTION = "devel"
+LICENSE = "GPLv3+"
+
+SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.gz"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta/recipes-devtools/ccache/ccache_3.1.5.bb b/meta/recipes-devtools/ccache/ccache_3.1.5.bb
new file mode 100644
index 0000000..9a967b2
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.1.5.bb
@@ -0,0 +1,8 @@
+require ccache.inc
+
+PR = "r0"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
+
+SRC_URI[md5sum] = "b1a9684828eae68382d6afc98ce80d24"
+SRC_URI[sha256sum] = "54afc35c672ce451e04a478cfc0eb74c1ba184e27ef24881206602aa0eb94d63"
-- 
1.7.0.4



