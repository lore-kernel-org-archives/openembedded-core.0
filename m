Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 914FA73E3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:23:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 10:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,634,1427785200"; d="scan'208";a="729357410"
Received: from apulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.212])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 10:23:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 18:23:23 +0100
Message-Id: <cffc9a8527591cf6a47973075e3097f23d92fb52.1434559829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] recipetool: appendfile: clarify help text
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
X-List-Received-Date: Wed, 17 Jun 2015 17:23:41 -0000

Add a long description and tweak some of the argument descriptions so
that it's clearer what the appendfile subcommand does and how it works.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/append.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 39117c1..28015c6 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -349,12 +349,12 @@ def appendfile(args):
 
 def register_command(subparsers):
     parser_appendfile = subparsers.add_parser('appendfile',
-                                                    help='Create a bbappend to replace a file',
-                                                    description='')
-    parser_appendfile.add_argument('destlayer', help='Destination layer to write the bbappend to')
-    parser_appendfile.add_argument('targetpath', help='Path within the image to the file to be replaced')
-    parser_appendfile.add_argument('newfile', help='Custom file to replace it with')
-    parser_appendfile.add_argument('-r', '--recipe', help='Override recipe to apply to (default is to find which recipe already packages it)')
+                                                help='Create/update a bbappend to replace a file',
+                                                description='Creates a bbappend (or updates an existing one) to replace the specified file that appears in the target system, determining the recipe that packages the file and the required path and name for the bbappend automatically. Note that the ability to determine the recipe packaging a particular file depends upon the recipe\'s do_packagedata task having already run prior to running this command (which it will have when the recipe has been built successfully, which in turn will have happened if one or more of the recipe\'s packages is included in an image that has been built successfully).')
+    parser_appendfile.add_argument('destlayer', help='Base directory of the destination layer to write the bbappend to')
+    parser_appendfile.add_argument('targetpath', help='Path to the file to be replaced (as it would appear within the target image, e.g. /etc/motd)')
+    parser_appendfile.add_argument('newfile', help='Custom file to replace the target file with')
+    parser_appendfile.add_argument('-r', '--recipe', help='Override recipe to apply to (default is to find which recipe already packages the file)')
     parser_appendfile.add_argument('-m', '--machine', help='Make bbappend changes specific to a machine only', metavar='MACHINE')
     parser_appendfile.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
     parser_appendfile.set_defaults(func=appendfile, parserecipes=True)
-- 
2.1.0


