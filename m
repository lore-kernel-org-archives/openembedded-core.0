Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BDD2565CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 04:49:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 08 Mar 2016 20:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,310,1455004800"; d="scan'208";a="929876783"
Received: from mlim-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.14])
	by orsmga002.jf.intel.com with ESMTP; 08 Mar 2016 20:49:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:48:50 +1300
Message-Id: <3185e35f04f243e7d42dc21e9cc96e553edd1636.1457498464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/8] recipetool: create: match *LICENSE* as a license file
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
X-List-Received-Date: Wed, 09 Mar 2016 04:49:51 -0000

For example, this picks up a file named MIT-LICENSE.txt.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index a77c191..def2eea 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -722,7 +722,7 @@ def guess_license(srctree):
     md5sums = get_license_md5sums(tinfoil.config_data)
 
     licenses = []
-    licspecs = ['LICENSE*', 'COPYING*', '*[Ll]icense*', 'LICENCE*', 'LEGAL*', '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*']
+    licspecs = ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*']
     licfiles = []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
-- 
2.5.0


