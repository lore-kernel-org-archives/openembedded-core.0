Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AFF1C6FC92
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:02:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jun 2014 09:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,990,1392192000"; d="scan'208";a="543643807"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2014 09:02:10 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id B3E246A408D;
	Fri,  6 Jun 2014 09:01:42 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 21:06:17 +0300
Message-Id: <1402077980-9548-4-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 3/6] core-image-testmaster.bb: add bzip2 to image
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
X-List-Received-Date: Fri, 06 Jun 2014 16:02:41 -0000

YB: #6375

Some test image fstypes require bzip2 decompression.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/recipes-extended/images/core-image-testmaster.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-testmaster.bb b/meta/recipes-extended/images/core-image-testmaster.bb
index ac2fdbe..78295c5 100644
--- a/meta/recipes-extended/images/core-image-testmaster.bb
+++ b/meta/recipes-extended/images/core-image-testmaster.bb
@@ -7,7 +7,7 @@ inherit core-image
 # the deploy code requires bash and
 # normal linux utilities not busybox ones
 IMAGE_INSTALL += "\
-    bash coreutils util-linux tar gzip kmod \
+    bash coreutils util-linux tar gzip bzip2 kmod \
     python-modules python-misc \
     e2fsprogs e2fsprogs-mke2fs parted \
     "
-- 
1.8.3.2


