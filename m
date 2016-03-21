Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DEF947317D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122202"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:07 +1300
Message-Id: <45ca8f7c14e181c830ca59281812c0d13300888b.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/9] oe-publish-sdk: improve help output slightly
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:41 -0000

This was just copy-and-pasted from devtool - set a reasonable
description and tweak the sdk parameter help text.

Also add a copyright statement and drop the opening comment describing
the command-line syntax that duplicated the help output (with at least
one mistake in it).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-publish-sdk | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index e91888f..5dbd1e5 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -2,13 +2,20 @@
 
 # OpenEmbedded SDK publishing tool
 
-# oe-publish-sdk publish <ext-sdk> <destination>
-# <ext-sdk>: extensible SDK to publish (path to the installer shell script)
-# <destination>: local or remote location which servers as an SDK update server
-# e.g.
-# oe-publish-sdk /path/to/sdk-ext.sh /mnt/poky/sdk-ext
-# oe-publish-sdk /path/to/sdk-ext.sh user@host:/opt/poky/sdk-ext
+# Copyright (C) 2015-2016 Intel Corporation
 #
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
@@ -118,13 +125,12 @@ def publish(args):
 
 
 def main():
-    parser = argparse_oe.ArgumentParser(description="OpenEmbedded development tool",
-                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded extensible SDK publishing tool - writes server-side data to support the extensible SDK update process to a specified location")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
 
-    parser.add_argument('sdk', help='Extensible SDK to publish')
-    parser.add_argument('dest', help='Destination to publish SDK to')
+    parser.add_argument('sdk', help='Extensible SDK to publish (path to .sh installer file)')
+    parser.add_argument('dest', help='Destination to publish SDK to; can be local path or remote in the form of user@host:/path (in the latter case ssh/scp will be used).')
 
     parser.set_defaults(func=publish)
 
-- 
2.5.5


