Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CC66F7872E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:45:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306950"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:45:56 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:19 -0800
Message-Id: <6ba3318954d782ad645c59e2d342abe65bc77a8c.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 07/19] python2 create_manifest.py: fix trailing whitespace in json
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
X-List-Received-Date: Fri, 08 Dec 2017 22:45:55 -0000

The json.dumps function adds trailing whitespace when using
indent, because the default separator is not ','.

The workaround [1] is to set the separators to be ',' and ': ',
e.g. separators=(',', ': ')

[1] https://hg.python.org/cpython/rev/78bad589f205

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python/create_manifest2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/create_manifest2.py b/meta/recipes-devtools/python/python/create_manifest2.py
index bd64ec3ee74..e7450452ba5 100644
--- a/meta/recipes-devtools/python/python/create_manifest2.py
+++ b/meta/recipes-devtools/python/python/create_manifest2.py
@@ -274,4 +274,4 @@ for key in new_manifest:
 
 # Create the manifest from the data structure that was built
 with open('python2-manifest.json.new','w') as outfile:
-    json.dump(new_manifest,outfile,sort_keys=True, indent=4)
+    json.dump(new_manifest,outfile,sort_keys=True, indent=4, separators=(',', ': '))
-- 
2.13.6


