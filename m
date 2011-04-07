Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wvf-0008MC-5V
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Apr 2011 14:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="730527473"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by orsmga001.jf.intel.com with ESMTP; 07 Apr 2011 14:37:44 -0700
Message-Id: <da790aa512ebbd4d6406b7ee54e71f478af82e87.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 10:43:18 -0700
Date: Thu, 07 Apr 2011 14:37:44 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 09/11] lsb: fix lic_files_chksum
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2011 21:39:51 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbsetup_0.9.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup_0.9.bb b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
index 08e1d99..8cbaf1e 100644
--- a/meta/recipes-extended/lsb/lsbsetup_0.9.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
@@ -4,7 +4,7 @@ PRIORITY = "required"
 LICENSE = "GPLv2"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://LSB_Setup.sh;md5=9cc166e6ee4b327fb94d6da63af9556c"
+LIC_FILES_CHKSUM = "file://LSB_Setup.sh;md5=7391be3e70a02d44e1b183fa103b0585"
 
 SRC_URI = "file://LSB_Setup.sh"
 
-- 
1.7.1



