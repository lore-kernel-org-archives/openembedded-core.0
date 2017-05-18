Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C11678096
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 22:29:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 15:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,360,1491289200"; d="scan'208";a="1150009284"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2017 15:29:03 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 17:28:46 -0500
Message-Id: <1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Thu, 18 May 2017 22:29:03 -0000

Some recipes build fail due to missing ed command.

This change includes ed to the hosttools required to
run builds with oe-core.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e4f4bb..64f1a54 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -459,7 +459,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 # Tools needed to run builds with OE-Core
 HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
-    cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
+    cpp cut date dd diff diffstat dirname du echo ed egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
-- 
2.7.4


