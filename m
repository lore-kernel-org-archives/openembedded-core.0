Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 45F256A543
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:19:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 09:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="357336976"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2013 09:19:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:19:03 +0100
Message-Id: <eb991c3b51bb09cdc4674715cd5604a7c670a583.1372436217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] python-smmap: add recipe
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

This is required by python-gitdb.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/python/python-smmap_0.8.2.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smmap_0.8.2.bb

diff --git a/meta/recipes-devtools/python/python-smmap_0.8.2.bb b/meta/recipes-devtools/python/python-smmap_0.8.2.bb
new file mode 100644
index 0000000..64f812d
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smmap_0.8.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Python implementation of a sliding window memory map manager"
+DESCRIPTION = "A pure Python implementation of a sliding memory map to \
+help unifying memory mapped access on 32 and 64 bit systems and to help \
+managing resources more efficiently."
+HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI = "http://pypi.python.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
+SRC_URI[md5sum] = "f5426b7626ddcf5e447253fae0396b0c"
+SRC_URI[sha256sum] = "dea2955cc045ec5527da6b762f7e95a5be7f645c683b54ccce52d56b4d7e2d6f"
+
+S = "${WORKDIR}/smmap-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-codecs python-mmap python-lang"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.1.2


