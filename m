Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Slyzq-0007Lw-3t
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 11:02:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q638p6NR012623
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jul 2012 01:51:06 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 3 Jul 2012 01:51:06 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jul 2012 16:49:28 +0800
Message-ID: <1341305368-30561-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] udev: don't mount with -o sync
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
X-List-Received-Date: Tue, 03 Jul 2012 09:02:10 -0000
Content-Type: text/plain

mount.sh mounts all partitions with -o sync, which is bad for system
performance.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-core/udev/udev/mount.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/mount.sh b/meta/recipes-core/udev/udev/mount.sh
index 53fefa3..c13b8bb 100644
--- a/meta/recipes-core/udev/udev/mount.sh
+++ b/meta/recipes-core/udev/udev/mount.sh
@@ -23,7 +23,7 @@ automount() {
 
 	! test -d "/media/$name" && mkdir -p "/media/$name"
 	
-	if ! $MOUNT -t auto -o sync $DEVNAME "/media/$name"
+	if ! $MOUNT -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
 		rm_dir "/media/$name"
-- 
1.7.10.4



