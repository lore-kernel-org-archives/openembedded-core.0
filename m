Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DCEDC731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594400"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:49 +1300
Message-Id: <6736884ae5a1b04f51b2ddc50dcbdb251595c7d1.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/14] recipetool: create: lower case name when determining from filename
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:02 -0000

As a matter of general convention we expect recipe names to be lower
case; in fact some of the packaging backends insist upon it. Since in
this part of the code we're auto-determining the name, we should convert
the name to lowercase if it's not already so that we're following
convention and avoiding any validation issues later on.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 873b7dd..f342857 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -90,9 +90,9 @@ def determine_from_filename(srcfile):
     """Determine name and version from a filename"""
     part = ''
     if '.tar.' in srcfile:
-        namepart = srcfile.split('.tar.')[0]
+        namepart = srcfile.split('.tar.')[0].lower()
     else:
-        namepart = os.path.splitext(srcfile)[0]
+        namepart = os.path.splitext(srcfile)[0].lower()
     splitval = namepart.rsplit('_', 1)
     if len(splitval) == 1:
         splitval = namepart.rsplit('-', 1)
-- 
2.5.0


