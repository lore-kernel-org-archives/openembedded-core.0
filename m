Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2FD71F49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 21:54:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2014 14:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="629256861"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.109])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2014 14:54:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 14:54:48 -0700
Message-Id: <1414792488-4932-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1414792488-4932-1-git-send-email-sgw@linux.intel.com>
References: <1414792488-4932-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/3] ltp: Added zip-native as a DEPENDS
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
X-List-Received-Date: Fri, 31 Oct 2014 21:54:49 -0000

From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

The Makefile checks for zip during installation

[YOCTO #6699]

(From OE-Core rev: a6e8ced3fa8e8e2aa3df0798b80eb26e5ebc4b15)

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-extended/ltp/ltp_20140115.bb
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index c2ee9fb..42bd3cf 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "\
     file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
 "
 
-DEPENDS = "attr libaio libcap acl openssl"
+DEPENDS = "attr libaio libcap acl openssl zip-native"
 SRCREV = "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-- 
1.8.3.1


