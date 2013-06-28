Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5FAC60130
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:19:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 09:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="357336971"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2013 09:19:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:19:02 +0100
Message-Id: <9e82f93b9ec86e57228560543a550a7336064a8a.1372436217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] python-async: add recipe
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
 meta/recipes-devtools/python/python-async_0.6.1.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-async_0.6.1.bb

diff --git a/meta/recipes-devtools/python/python-async_0.6.1.bb b/meta/recipes-devtools/python/python-async_0.6.1.bb
new file mode 100644
index 0000000..1794820
--- /dev/null
+++ b/meta/recipes-devtools/python/python-async_0.6.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python framework to process interdependent tasks in a pool of workers"
+HOMEPAGE = "http://github.com/gitpython-developers/async"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
+
+SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
+SRC_URI[md5sum] = "6f0e2ced1fe85f8410b9bde11be08587"
+SRC_URI[sha256sum] = "41d14cc0456e03f34d13af284f65821d07d05c20e621bcaebd38f9ab5095d5d1"
+
+S = "${WORKDIR}/async-${PV}"
+
+inherit distutils
+
+RDEPENDS_${PN} += "python-threading python-lang"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.1.2


