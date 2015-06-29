Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC9E607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 01:58:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T1wUBp029859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 18:58:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 28 Jun 2015 18:58:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 09:58:17 +0800
Message-ID: <1435543097-20281-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: Reexport all directories when start
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
X-List-Received-Date: Mon, 29 Jun 2015 01:58:30 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

call "exportfs -r" to reexport all directories when start the nfsserver.
This change does follow debian and nfs-utils stardard.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 6e0df7e..7ed93a5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -107,6 +107,7 @@ stop_nfsd(){
 #FIXME: need to create the /var/lib/nfs/... directories
 case "$1" in
   start)
+	exportfs -r
 	start_nfsd "$NFS_SERVERS"
 	start_mountd
 	test -r /etc/exports && exportfs -a;;
-- 
1.9.1


