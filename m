Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B2220772B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:36 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 16 Feb 2017 07:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="66591323"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2017 07:56:37 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id ABA866A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:36 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:32 +0200
Message-Id: <c18849fe4a77524092c9771fe261893553b7abe6.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487257345.git.ed.bartosh@linux.intel.com>
References: <cover.1487257345.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/10] wic: pluginbase: use python 3 metaclass syntax
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:37 -0000

Used more readable syntax to specify metaclass for
the base plugin classes.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/pluginbase.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index aea9c02..07ccf62 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -32,10 +32,10 @@ class PluginMeta(type):
 
         return class_type
 
-class ImagerPlugin(PluginMeta("Plugin", (), {})):
+class ImagerPlugin(metaclass=PluginMeta):
     wic_plugin_type = "imager"
 
-class SourcePlugin(PluginMeta("Plugin", (), {})):
+class SourcePlugin(metaclass=PluginMeta):
     wic_plugin_type = "source"
     """
     The methods that can be implemented by --source plugins.
-- 
2.1.4


