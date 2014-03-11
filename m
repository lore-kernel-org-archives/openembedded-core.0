Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 686D46F8B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 23:40:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2014 16:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,634,1389772800"; d="scan'208";a="470563206"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.212])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2014 16:40:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 16:40:24 -0700
Message-Id: <1394581224-4752-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] oe-setup-builddir: de-bash use . instead of source
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
X-List-Received-Date: Tue, 11 Mar 2014 23:40:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/oe-setup-builddir | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index e4356f1..ccaae9b 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -41,7 +41,7 @@ if (test -f "$BUILDDIR/conf/templateconf.cfg") then
     TEMPLATECONF=$(cat $BUILDDIR/conf/templateconf.cfg)
 fi
 
-source $OEROOT/.templateconf
+. $OEROOT/.templateconf
 
 if ! (test -f "$BUILDDIR/conf/templateconf.cfg") then
     echo "$TEMPLATECONF" >$BUILDDIR/conf/templateconf.cfg
-- 
1.8.3.1


