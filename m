Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDAC60762
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 17:01:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2016 10:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,445,1459839600"; d="scan'208";a="984253539"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2016 10:01:03 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 17:00:06 +0000
Message-Id: <1465491606-49000-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] python: Several recipes needed SRC_URI updating
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
X-List-Received-Date: Thu, 09 Jun 2016 17:01:06 -0000

Most python recipes download its source from pypi.python.org,
but they changed the way theyre storing the source code, so
we need to use pythonhosted instead, see:
https://bitbucket.org/pypa/pypi/issues/438/backwards-compatible-un-hashed-package

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-async.inc      | 2 +-
 meta/recipes-devtools/python/python-gitdb.inc      | 2 +-
 meta/recipes-devtools/python/python-nose_1.3.7.bb  | 2 +-
 meta/recipes-devtools/python/python-smmap.inc      | 2 +-
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
index d80606a..2c5cb4d 100644
--- a/meta/recipes-devtools/python/python-async.inc
+++ b/meta/recipes-devtools/python/python-async.inc
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
 
-SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/a/async/async-${PV}.tar.gz"
 SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 6467bd2..08193fb 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
 
-SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
 SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
diff --git a/meta/recipes-devtools/python/python-nose_1.3.7.bb b/meta/recipes-devtools/python/python-nose_1.3.7.bb
index ec6158f..3757f3a 100644
--- a/meta/recipes-devtools/python/python-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.7.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/n/nose/nose-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
 SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
index 5b2ac74..d67e6b5 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-SRC_URI = "http://pypi.python.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
 SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
 SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
 
diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
index a45d2f2..99bba44 100644
--- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/n/nose/nose-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
 SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
-- 
2.6.6


