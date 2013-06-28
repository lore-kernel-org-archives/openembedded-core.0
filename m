Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 55B006ADC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:19:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 09:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="357336978"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2013 09:20:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:19:04 +0100
Message-Id: <93b91a94348945431a05a492c0a847b9e8503244.1372436217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] python-gitdb: add recipe
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
X-List-Received-Date: Fri, 28 Jun 2013 16:19:13 -0000

This is required by python-git.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/python/python-gitdb_0.5.4.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-gitdb_0.5.4.bb

diff --git a/meta/recipes-devtools/python/python-gitdb_0.5.4.bb b/meta/recipes-devtools/python/python-gitdb_0.5.4.bb
new file mode 100644
index 0000000..9e96152
--- /dev/null
+++ b/meta/recipes-devtools/python/python-gitdb_0.5.4.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A pure-Python git object database"
+HOMEPAGE = "http://github.com/gitpython-developers/gitdb"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
+DEPENDS = "python-async python-smmap"
+
+SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
+SRC_URI[md5sum] = "25353bb8d3ea527ba443dd88cd4e8a1c"
+SRC_URI[sha256sum] = "de5d2dac0daec4a9cd7bb1ae1cd42d53510dcf597397c608c12a154b69ad3783"
+
+S = "${WORKDIR}/gitdb-${PV}"
+
+inherit distutils
+
+RDEPENDS_${PN} += "python-smmap python-async python-mmap python-lang python-zlib python-io python-shell"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.1.2


