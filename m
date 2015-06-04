Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 614766AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:52:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96439418"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jun 2015 16:57:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t548pECV023946
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jun 2015 16:51:15 +0800
Received: from localhost.localdomain (10.167.226.47) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 4 Jun 2015 16:52:44 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jun 2015 16:52:36 +0800
Message-ID: <1433407956-1948-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.47]
Subject: [PATCH] base-files: Fix LSB NG Cases.
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
X-List-Received-Date: Thu, 04 Jun 2015 08:52:49 -0000
Content-Type: text/plain

-/tset/LSB.fhs/var/tmp/tmp-tc.

The LSB Core test requires the /var/tmp directory supports creation of files.
And the mount tmpfs on /var/volatile cause the /var/tmp directory can't be
writable for non-root users.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-core/base-files/base-files/fstab | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index d79a016..458ec70 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -4,7 +4,6 @@
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
-tmpfs                /var/volatile        tmpfs      defaults              0  0
 
 # uncomment this if your device has a SD/MMC/Transflash slot
 #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
-- 
1.8.4.2


