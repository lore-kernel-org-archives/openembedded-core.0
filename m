Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 12F8B70271
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 15:38:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2014 08:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,514,1400050800"; d="scan'208";a="447997190"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2014 08:38:42 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jun 2014 18:42:19 +0300
Message-Id: <177fbfb9c3466ddf63716d959b33fc18b71ae195.1403277454.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
Subject: [PATCH 4/5] init-install-testfs: create signature file for master image
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
X-List-Received-Date: Fri, 20 Jun 2014 15:38:58 -0000

Also small cosmetic changes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-testfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index cf290a5..618a53d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -154,8 +154,12 @@ mkdir -p /boot
 # Handling of the target root partition
 mount $rootfs /tgt_root
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
+
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
+
+touch /tgt_root/etc/masterimage
+
 if [ -d /tgt_root/etc/ ] ; then
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
-- 
1.9.1


