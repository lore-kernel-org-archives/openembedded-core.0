Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56BB76AE12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:19:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 09:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="357336979"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2013 09:20:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:19:05 +0100
Message-Id: <dfa4e63f696c29f7b8e1d8736e4dec9f60391425.1372436217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] python-git: add recipe
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

This is used by buildhistory-diff and the OE layer index, and thus will
be useful in the context of the build appliance and buildtools-tarball.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-git_0.3.2.RC1.bb                 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-git_0.3.2.RC1.bb

diff --git a/meta/recipes-devtools/python/python-git_0.3.2.RC1.bb b/meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
new file mode 100644
index 0000000..02a0eac
--- /dev/null
+++ b/meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Python library used to interact with Git repositories"
+DESCRIPTION = "GitPython provides object model read and write access to \
+a git repository. Access repository information conveniently, alter the \
+index directly, handle remotes, or go down to low-level object database \
+access with big-files support."
+HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
+DEPENDS = "python-gitdb"
+
+SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
+SRC_URI[md5sum] = "849082fe29adc653a3621465213cab96"
+SRC_URI[sha256sum] = "fd6786684a0d0dd7ebb961da754e3312fafe0c8e88f55ceb09858aa0af6094e0"
+
+S = "${WORKDIR}/GitPython-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.1.2


