Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 38A93705E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:40:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jul 2014 12:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,759,1400050800"; d="scan'208";a="577276587"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2014 12:40:14 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 14:40:08 -0500
Message-Id: <fb6a0829b1970aff4f3affc2693fd5af3cc37f37.1406662652.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1406662652.git.tom.zanussi@linux.intel.com>
References: <cover.1406662652.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/4] wic: Fix plugin help text
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
X-List-Received-Date: Tue, 29 Jul 2014 19:40:20 -0000

Fix various typoes and grammar problems noticed while transcribing for
the dev manual.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 848aa9a..913947c 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -389,9 +389,9 @@ DESCRIPTION
     class (see the SourcePlugin source for details):
 
       do_prepare_partition()
-          Called to do the actual content population for a partition
-          i.e. it 'prepares' the final partition image which will be
-          incorporated into the disk image.
+          Called to do the actual content population for a
+          partition. In other words, it 'prepares' the final partition
+          image which will be incorporated into the disk image.
 
       do_configure_partition()
           Called before do_prepare_partition(), typically used to
@@ -401,23 +401,26 @@ DESCRIPTION
       do_install_disk()
           Called after all partitions have been prepared and assembled
           into a disk image.  This provides a hook to allow
-          finalization of a disk image e.g. to write an MBR to it.
+          finalization of a disk image, for example to write an MBR to
+          it.
 
       do_stage_partition()
-          Special content staging hook called before
+          Special content-staging hook called before
           do_prepare_partition(), normally empty.
 
-          Typically, a partition will just use the passed-in parame
-          e.g straight bootimg_dir, etc, but in some cases, things
-          need to be more tailored e.g. to use a deploy dir + /boot,
-          etc.  This hook allows those files to be staged in a
-          customized fashion.  Not that get_bitbake_var() allows you
-          to acces non-standard variables that you might want to use
-          for this.
+          Typically, a partition will just use the passed-in
+          parameters, for example the unmodified value of bootimg_dir.
+          In some cases however, things may need to be more tailored.
+          As an example, certain files may additionally need to be
+          take from bootimg_dir + /boot.  This hook allows those files
+          to be staged in a customized fashion.  Note that
+          get_bitbake_var() allows you to access non-standard
+          variables that you might want to use for these types of
+          situations.
 
     This scheme is extensible - adding more hooks is a simple matter
     of adding more plugin methods to SourcePlugin and derived classes.
-    The code that then needs to call the plugin methods the uses
+    The code that then needs to call the plugin methods uses
     plugin.get_source_plugin_methods() to find the method(s) needed by
     the call; this is done by filling up a dict with keys containing
     the method names of interest - on success, these will be filled in
-- 
1.8.3.1


