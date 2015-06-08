Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 337007404A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 20:57:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jun 2015 13:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,575,1427785200"; d="scan'208";a="723384657"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2015 13:57:15 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 13:56:07 +0000
Message-Id: <c677cd4c037f5eea0ecc49300baac9731c41b1c0.1433771147.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
References: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
References: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/2][dizzy] python-nose: backport it to dizzy
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
X-List-Received-Date: Mon, 08 Jun 2015 20:57:16 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-nose_1.3.6.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-nose_1.3.6.bb

diff --git a/meta/recipes-devtools/python/python-nose_1.3.6.bb b/meta/recipes-devtools/python/python-nose_1.3.6.bb
new file mode 100644
index 0000000..d6e8fc1
--- /dev/null
+++ b/meta/recipes-devtools/python/python-nose_1.3.6.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "nose extends the test loading and running features of unittest, \
+making it easier to write, find and run tests."
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
+SRC_URI[sha256sum] = "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
+
+S = "${WORKDIR}/nose-${PV}"
+
+inherit setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.4.5


