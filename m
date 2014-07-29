Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0888270896
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:40:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2014 12:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,759,1400050800"; d="scan'208";a="550873520"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 29 Jul 2014 12:40:22 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 14:40:10 -0500
Message-Id: <ba51ddc6a355467a0b6f1e86b993a89034d585bf.1406662652.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <fb6a0829b1970aff4f3affc2693fd5af3cc37f37.1406662652.git.tom.zanussi@linux.intel.com>
References: <fb6a0829b1970aff4f3affc2693fd5af3cc37f37.1406662652.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1406662652.git.tom.zanussi@linux.intel.com>
References: <cover.1406662652.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/4] wic: Add squashfs to --fstypes documentation
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
X-List-Received-Date: Tue, 29 Jul 2014 19:40:24 -0000

squashfs support was recently added to wic, so document it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 6d613e2..b833459 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -719,6 +719,7 @@ DESCRIPTION
              ext3
              ext4
              btrfs
+             squashfs
              swap
 
          --fsoptions: Specifies a free-form string of options to be
-- 
1.8.3.1


