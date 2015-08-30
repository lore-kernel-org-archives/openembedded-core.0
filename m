Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2D72D76E9D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 09:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758326771"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 09:08:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 761846A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:37 +0300
Message-Id: <0aa7b2b2518a97b624f30fc6f1c5a8501a9a6d8f.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/11] devtool: build-image: rename LOG -> logger
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
X-List-Received-Date: Sun, 30 Aug 2015 16:08:55 -0000

Used logger variable name instead of LOG as it is used in the rest
of devtool code.
Although Pylint complains about 'logger' being invalid constant name,
but it's better to be consistent in naming than make Pylint happy.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index ebd9c59..d875715 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -23,7 +23,7 @@ import logging
 from bb.process import ExecutionError
 from devtool import exec_build_env_command
 
-LOG = logging.getLogger('devtool')
+logger = logging.getLogger('devtool')
 
 def plugin_init(pluginlist):
     """Plugin initialization"""
@@ -44,7 +44,7 @@ def build_image(args, config, basepath, workspace):
     except ExecutionError as err:
         return err.exitcode
 
-    LOG.info('Successfully built %s', image)
+    logger.info('Successfully built %s', image)
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from the build-image plugin"""
-- 
2.1.4


