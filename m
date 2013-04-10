Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPokX-0005sO-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 08:43:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Apr 2013 23:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,444,1363158000"; d="scan'208";a="225391109"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.7])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2013 23:25:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 23:25:53 -0700
Message-Id: <1365575154-25919-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 1/2] udev-extraconf: Add -o silent to auto mount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 06:43:31 -0000

This will silence some of the noisy output from mount and the kernel
when trying to automount filesystems or devices

[YOCTO #3935]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 99c76b2..7b58361 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -22,7 +22,7 @@ automount() {
 
 	! test -d "/media/$name" && mkdir -p "/media/$name"
 	
-	if ! $MOUNT -t auto $DEVNAME "/media/$name"
+	if ! $MOUNT -o silent -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
 		rm_dir "/media/$name"
-- 
1.8.0.2



