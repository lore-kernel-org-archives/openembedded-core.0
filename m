Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1559D77C2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 22:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490393188; x=1521929188;
	h=from:to:cc:subject:date:message-id;
	bh=u6RyQHgtelK+6ZSy6E63RLiA+VUC0zj439lRl2rwZgE=;
	b=aGsRWHmEw8gV3PqSrYDKQaJAnC29NTuxeQ6idNxZIJ45nQvloHWpPhjM
	MLLWIopHKPesdosfU7WaH2gMZg91Xw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 15:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,216,1486454400"; d="scan'208";a="1111907762"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2017 15:06:18 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org,
	juro.bystricky@intel.com
Date: Fri, 24 Mar 2017 15:06:14 -0700
Message-Id: <359684cb5b25c6310e3df733e5f2da02b218abe7.1490392540.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1490392540.git.mariano.lopez@linux.intel.com>
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1490392540.git.mariano.lopez@linux.intel.com>
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/3] oeqa: Remove __init__.py files.
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
X-List-Received-Date: Fri, 24 Mar 2017 22:06:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

From python 3.3 and above, if a module path contains an __init__.py file, just
that path will be checked for module imports; this behavior makes impossible
to extend core functionality using other layers with the current __init__.py
files. You can check a more detailed explanation on:
http://python-notes.curiousefficiency.org/en/latest/python_concepts/import_traps.html

This patch removes the __init__.py files from just from the new framework.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/__init__.py                        | 0
 meta/lib/oeqa/core/cases/__init__.py                  | 0
 meta/lib/oeqa/core/decorator/{__init__.py => base.py} | 0
 meta/lib/oeqa/core/decorator/data.py                  | 3 +--
 meta/lib/oeqa/core/decorator/depends.py               | 4 +---
 meta/lib/oeqa/core/decorator/oeid.py                  | 2 +-
 meta/lib/oeqa/core/decorator/oetag.py                 | 2 +-
 meta/lib/oeqa/core/decorator/oetimeout.py             | 2 +-
 meta/lib/oeqa/core/loader.py                          | 2 +-
 meta/lib/oeqa/core/target/{__init__.py => base.py}    | 0
 meta/lib/oeqa/core/target/qemu.py                     | 2 +-
 meta/lib/oeqa/core/target/ssh.py                      | 2 +-
 meta/lib/oeqa/core/tests/__init__.py                  | 0
 meta/lib/oeqa/core/utils/__init__.py                  | 0
 meta/lib/oeqa/runtime/decorator/package.py            | 2 +-
 meta/lib/oeqa/runtime/utils/__init__.py               | 0
 meta/lib/oeqa/sdk/__init__.py                         | 0
 meta/lib/oeqa/sdk/utils/__init__.py                   | 0
 meta/lib/oeqa/sdkext/__init__.py                      | 0
 19 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/__init__.py
 delete mode 100644 meta/lib/oeqa/core/cases/__init__.py
 rename meta/lib/oeqa/core/decorator/{__init__.py => base.py} (100%)
 rename meta/lib/oeqa/core/target/{__init__.py => base.py} (100%)
 delete mode 100644 meta/lib/oeqa/core/tests/__init__.py
 delete mode 100644 meta/lib/oeqa/core/utils/__init__.py
 delete mode 100644 meta/lib/oeqa/runtime/utils/__init__.py
 delete mode 100644 meta/lib/oeqa/sdk/__init__.py
 delete mode 100644 meta/lib/oeqa/sdk/utils/__init__.py
 delete mode 100644 meta/lib/oeqa/sdkext/__init__.py

diff --git a/meta/lib/oeqa/core/__init__.py b/meta/lib/oeqa/core/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/core/cases/__init__.py b/meta/lib/oeqa/core/cases/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/base.py
similarity index 100%
rename from meta/lib/oeqa/core/decorator/__init__.py
rename to meta/lib/oeqa/core/decorator/base.py
diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index ff7bdd9..658e8a2 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -2,8 +2,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 from oeqa.core.exception import OEQAMissingVariable
-
-from . import OETestDecorator, registerDecorator
+from oeqa.core.decorator.base import OETestDecorator, registerDecorator
 
 def has_feature(td, feature):
     """
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 195711c..608b06a 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -2,10 +2,8 @@
 # Released under the MIT license (see COPYING.MIT)
 
 from unittest import SkipTest
-
 from oeqa.core.exception import OEQADependency
-
-from . import OETestDiscover, registerDecorator
+from oeqa.core.decorator.base import OETestDiscover, registerDecorator
 
 def _add_depends(registry, case, depends):
     module_name = case.__module__
diff --git a/meta/lib/oeqa/core/decorator/oeid.py b/meta/lib/oeqa/core/decorator/oeid.py
index ea8017a..a5bee52 100644
--- a/meta/lib/oeqa/core/decorator/oeid.py
+++ b/meta/lib/oeqa/core/decorator/oeid.py
@@ -1,8 +1,8 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
-from . import OETestFilter, registerDecorator
 from oeqa.core.utils.misc import intToList
+from oeqa.core.decorator.base import OETestFilter, registerDecorator
 
 def _idFilter(oeid, filters):
      return False if oeid in filters else True
diff --git a/meta/lib/oeqa/core/decorator/oetag.py b/meta/lib/oeqa/core/decorator/oetag.py
index ad38ab7..6a36428 100644
--- a/meta/lib/oeqa/core/decorator/oetag.py
+++ b/meta/lib/oeqa/core/decorator/oetag.py
@@ -1,8 +1,8 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
-from . import OETestFilter, registerDecorator
 from oeqa.core.utils.misc import strToList
+from oeqa.core.decorator.base import OETestFilter, registerDecorator
 
 def _tagFilter(tags, filters):
     return False if set(tags) & set(filters) else True
diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index a247583..749e8a1 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -2,8 +2,8 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import signal
-from . import OETestDecorator, registerDecorator
 from oeqa.core.exception import OEQATimeoutError
+from oeqa.core.decorator.base import OETestDecorator, registerDecorator
 
 @registerDecorator
 class OETimeout(OETestDecorator):
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 74f1117..2e7d0d0 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -9,7 +9,7 @@ from oeqa.core.utils.path import findFile
 from oeqa.core.utils.test import getSuiteModules, getCaseID
 
 from oeqa.core.case import OETestCase
-from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
+from oeqa.core.decorator.base import decoratorClasses, OETestDecorator, \
         OETestFilter, OETestDiscover
 
 def _make_failed_test(classname, methodname, exception, suiteClass):
diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/base.py
similarity index 100%
rename from meta/lib/oeqa/core/target/__init__.py
rename to meta/lib/oeqa/core/target/base.py
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 2dc521c..261c466 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -6,7 +6,7 @@ import sys
 import signal
 import time
 
-from .ssh import OESSHTarget
+from oeqa.core.target.ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
 
 supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic', 'elf']
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index b80939c..035965a 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -7,7 +7,7 @@ import select
 import logging
 import subprocess
 
-from . import OETarget
+from oeqa.core.target.base import OETarget
 
 class OESSHTarget(OETarget):
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
diff --git a/meta/lib/oeqa/core/tests/__init__.py b/meta/lib/oeqa/core/tests/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/core/utils/__init__.py b/meta/lib/oeqa/core/utils/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index aa6ecb6..0d3224f 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -1,8 +1,8 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
-from oeqa.core.decorator import OETestDecorator, registerDecorator
 from oeqa.core.utils.misc import strToSet
+from oeqa.core.decorator.base import OETestDecorator, registerDecorator
 
 @registerDecorator
 class OEHasPackage(OETestDecorator):
diff --git a/meta/lib/oeqa/runtime/utils/__init__.py b/meta/lib/oeqa/runtime/utils/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/sdk/__init__.py b/meta/lib/oeqa/sdk/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/sdk/utils/__init__.py b/meta/lib/oeqa/sdk/utils/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/sdkext/__init__.py b/meta/lib/oeqa/sdkext/__init__.py
deleted file mode 100644
index e69de29..0000000
-- 
2.10.2


