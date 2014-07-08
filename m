Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 511B570420
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:52:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2014 07:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="558871538"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.3])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2014 07:52:00 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 09:51:53 -0500
Message-Id: <dc30586ac2011d6a57f72843d1e2b134168678c2.1404830754.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
References: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1404830754.git.tom.zanussi@linux.intel.com>
References: <cover.1404830754.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/5] wic: Add help text for 'wic list source-plugins'
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
X-List-Received-Date: Tue, 08 Jul 2014 14:52:14 -0000

Add both short and long text for the new 'wic list source-plugins'
command.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index cb3112c..6de7ab0 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -199,6 +199,7 @@ wic_list_usage = """
 
  usage: wic list images
         wic list <image> help
+        wic list source-plugins
         wic list properties
         wic list properties <wks file>
         wic list property <property>
@@ -214,11 +215,14 @@ wic_list_usage = """
  The second form lists the detailed help information for a specific
  'canned' image.
 
- The third form enumerates all the possible values that exist and can
+ The third form enumerates all the available --sources (source
+ plugins).
+
+ The fourth form enumerates all the possible values that exist and can
  be specified in an OE kickstart (wks) file.
 
- The fourth form enumerates all the possible options that exist for
- the set of properties specified in a given OE kickstart (ks) file.
+ The fifth form enumerates all the possible options that exist for the
+ set of properties specified in a given OE kickstart (ks) file.
 
  The final form enumerates all the possible values that exist and can
  be specified for any given OE kickstart (wks) property.
@@ -234,6 +238,7 @@ NAME
 SYNOPSIS
     wic list images
     wic list <image> help
+    wic list source-plugins
     wic list properties
     wic list properties <wks file>
     wic list property <property>
@@ -255,6 +260,15 @@ DESCRIPTION
     The second form lists the detailed help information for a specific
     'canned' image.
 
+    The third form enumerates all the available --sources (source
+    plugins).  The contents of a given partition are driven by code
+    defined in 'source plugins'.  Users specify a specific plugin via
+    the --source parameter of the partition .wks command.  Normally
+    this is the 'rootfs' plugin but can be any of the more specialized
+    sources listed by the 'list source-plugins' command.  Users can
+    also add their own source plugins - see 'wic help plugins' for
+    details.
+
     The third form enumerates all the possible values that exist and
     can be specified in a OE kickstart (wks) file.  The output of this
     can be used by the third form to print the description and
-- 
1.8.3.1


