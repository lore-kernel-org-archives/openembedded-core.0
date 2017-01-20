Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 253387722B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567484"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:52 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:08 -0600
Message-Id: <57d1afca63f436246879e36b09c1104bbfbed268.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 37/55] oeqa/runtime/files: Move runtime files from old directory
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:52 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

As part of the refactor we require to move the files used
in runtime testing to the new directory. This also adds
the path to the runtime test context.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/context.py                                 | 2 ++
 meta/lib/oeqa/{runtime_cases => runtime}/files/hellomod.c        | 0
 meta/lib/oeqa/{runtime_cases => runtime}/files/hellomod_makefile | 0
 meta/lib/oeqa/{runtime_cases => runtime}/files/testmakefile      | 0
 4 files changed, 2 insertions(+)
 rename meta/lib/oeqa/{runtime_cases => runtime}/files/hellomod.c (100%)
 rename meta/lib/oeqa/{runtime_cases => runtime}/files/hellomod_makefile (100%)
 rename meta/lib/oeqa/{runtime_cases => runtime}/files/testmakefile (100%)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 496730d..10a8872 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -9,6 +9,8 @@ from oeqa.runtime.loader import OERuntimeTestLoader
 
 class OERuntimeTestContext(OETestContext):
     loaderClass = OERuntimeTestLoader
+    runtime_files_dir = os.path.join(
+                        os.path.dirname(os.path.abspath(__file__)), "files")
 
     def __init__(self, td, logger, target, packages_manifest):
         super(OERuntimeTestContext, self).__init__(td, logger)
diff --git a/meta/lib/oeqa/runtime_cases/files/hellomod.c b/meta/lib/oeqa/runtime/files/hellomod.c
similarity index 100%
rename from meta/lib/oeqa/runtime_cases/files/hellomod.c
rename to meta/lib/oeqa/runtime/files/hellomod.c
diff --git a/meta/lib/oeqa/runtime_cases/files/hellomod_makefile b/meta/lib/oeqa/runtime/files/hellomod_makefile
similarity index 100%
rename from meta/lib/oeqa/runtime_cases/files/hellomod_makefile
rename to meta/lib/oeqa/runtime/files/hellomod_makefile
diff --git a/meta/lib/oeqa/runtime_cases/files/testmakefile b/meta/lib/oeqa/runtime/files/testmakefile
similarity index 100%
rename from meta/lib/oeqa/runtime_cases/files/testmakefile
rename to meta/lib/oeqa/runtime/files/testmakefile
-- 
2.1.4


