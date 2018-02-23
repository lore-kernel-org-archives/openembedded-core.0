Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B88E978845
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:03:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026631"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:03:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:16 +1300
Message-Id: <11b51393fb4df76c9789838c9a28f5e0cec61a86.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519354910.git.paul.eggleton@linux.intel.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/8] devtool: search: tweak help text
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
X-List-Received-Date: Fri, 23 Feb 2018 03:03:13 -0000

* We now match on more than just target recipes, so don't specify that
  only target recipes are searched.
* We're printing the SUMMARY value in addition to the name, so mention
  that so it's clear where that text is coming from.
* Remind users that they should use quotes around the keyword to avoid
  shell expansion when using regular expressions.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/search.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index b51a7b80207..b4f209b7e3a 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -112,7 +112,7 @@ def search(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_search = subparsers.add_parser('search', help='Search available recipes',
-                                            description='Searches for available target recipes. Matches on recipe name, package name, description and installed files, and prints the recipe name on match.',
+                                            description='Searches for available recipes. Matches on recipe name, package name, description and installed files, and prints the recipe name and summary on match.',
                                             group='info')
-    parser_search.add_argument('keyword', help='Keyword to search for (regular expression syntax allowed)')
+    parser_search.add_argument('keyword', help='Keyword to search for (regular expression syntax allowed, use quotes to avoid shell expansion)')
     parser_search.set_defaults(func=search, no_workspace=True, fixed_setup=context.fixed_setup)
-- 
2.14.3


