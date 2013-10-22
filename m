Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D0CDB6D308
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 22 Oct 2013 07:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="415195678"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2013 07:24:09 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:23:58 -0500
Message-Id: <584c7c6b384feea4937b183f03075c95e615cb41.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 03/10] wic: Remove dependency on rpmmisc
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:10 -0000

rpmmisc imports rpm and contains misc rpm utilities related to
packaging and determining arches based on the packaging.  We should
never run across this in the initial version of wic, so remove the
dependency.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/creator.py       | 2 +-
 scripts/lib/mic/imager/livecd.py | 2 +-
 scripts/lib/mic/utils/misc.py    | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/mic/creator.py b/scripts/lib/mic/creator.py
index b36bbf0..267928f 100644
--- a/scripts/lib/mic/creator.py
+++ b/scripts/lib/mic/creator.py
@@ -19,7 +19,7 @@ import os, sys, re
 from optparse import SUPPRESS_HELP
 
 from mic import msger
-from mic.utils import cmdln, errors, rpmmisc
+from mic.utils import cmdln, errors
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
 
diff --git a/scripts/lib/mic/imager/livecd.py b/scripts/lib/mic/imager/livecd.py
index a992ee0..0711552 100644
--- a/scripts/lib/mic/imager/livecd.py
+++ b/scripts/lib/mic/imager/livecd.py
@@ -20,7 +20,7 @@ import glob
 import shutil
 
 from mic import kickstart, msger
-from mic.utils import fs_related, rpmmisc, runner, misc
+from mic.utils import fs_related, runner, misc
 from mic.utils.errors import CreatorError
 from mic.imager.loop import LoopImageCreator
 
diff --git a/scripts/lib/mic/utils/misc.py b/scripts/lib/mic/utils/misc.py
index 67ddef2..2c4a3ac 100644
--- a/scripts/lib/mic/utils/misc.py
+++ b/scripts/lib/mic/utils/misc.py
@@ -45,7 +45,6 @@ from mic.utils.fs_related import find_binary_path, makedirs
 from mic.utils.grabber import myurlgrab
 from mic.utils.proxy import get_proxy_for
 from mic.utils import runner
-from mic.utils import rpmmisc
 
 
 RPM_RE  = re.compile("(.*)\.(.*) (.*)-(.*)")
-- 
1.8.3.1


