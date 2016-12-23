Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5D52177730
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 00:07:40 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 22 Dec 2016 16:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,391,1477983600"; d="scan'208";a="45983274"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.117.99])
	by fmsmga005.fm.intel.com with ESMTP; 22 Dec 2016 16:07:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 22 Dec 2016 16:07:39 -0800
Message-Id: <1482451659-8896-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] nfs-utils: remove -f exports from nfsserver
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
X-List-Received-Date: Fri, 23 Dec 2016 00:07:40 -0000

The upstream project remove that option as it was quote:
    It is completely ineffective.

[YOCTO #10843]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 7ed93a5..d5e9c38 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -40,7 +40,7 @@ test "$NFS_SERVERS" != "" && test "$NFS_SERVERS" -gt 0 && test "$NFS_SERVERS" -l
 #mountd
 start_mountd(){
 	echo -n 'starting mountd: '
-	start-stop-daemon --start --exec "$NFS_MOUNTD" -- "-f /etc/exports $@"
+	start-stop-daemon --start --exec "$NFS_MOUNTD" -- "$@"
 	echo done
 }
 stop_mountd(){
-- 
2.7.4


