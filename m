Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 15C4A6E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 19:26:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 May 2017 12:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,284,1491289200"; d="scan'208";a="852557279"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 03 May 2017 12:26:31 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 12:26:03 -0700
Message-Id: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] package_ipk.bbclass: Include a space followed by a dot for empty description lines
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
X-List-Received-Date: Wed, 03 May 2017 19:26:37 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

As described in [1], "Empty lines in field values are usually escaped by representing
them by a space followed by a dot." so default to the latter.

[1] https://www.debian.org/doc/debian-policy/ch-controlfields.html

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c7cec9d63d1..168511cc16b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -148,7 +148,7 @@ python do_package_ipk () {
                         line = textwrap.fill(t.strip(),
                                              width=100000,
                                              initial_indent=' ',
-                                             subsequent_indent=' ') or '.'
+                                             subsequent_indent=' ') or ' .'
                         ctrlfile.write('%s\n' % line)
                 else:
                     # Auto indent
-- 
2.12.0


