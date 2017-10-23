Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9143E71984
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 23:59:24 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2017 16:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,424,1503385200"; d="scan'208";a="166669660"
Received: from swold-mobl2.jf.intel.com ([10.24.11.5])
	by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2017 16:59:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 23 Oct 2017 16:59:25 -0700
Message-Id: <20171023235925.26745-2-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023235925.26745-1-sgw@linux.intel.com>
References: <20171023235925.26745-1-sgw@linux.intel.com>
Subject: [PATCH 2/2] wic: misc.py: Use mmd from mtools instead of syslinux
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
X-List-Received-Date: Mon, 23 Oct 2017 23:59:24 -0000

mtools already provides a suite of msdos utilities, switch to this
one also.  This could allow for future changes to reduce wic's
dependecies.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/lib/wic/misc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index cc28c95fda5..ee888b478cc 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -55,7 +55,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "mkfs.vfat": "dosfstools",
                   "mksquashfs": "squashfs-tools",
                   "mkswap": "util-linux",
-                  "mmd": "syslinux",
+                  "mmd": "mtools",
                   "parted": "parted",
                   "sfdisk": "util-linux",
                   "sgdisk": "gptfdisk",
-- 
2.13.5


