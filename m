Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C47FF7CDAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:20:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2L3Kvhv007284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:20:57 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:20:54 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:11 -0400
Message-ID: <1553138356-85237-4-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] udev-extraconf: move md* and dm* from mount blacklist
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
X-List-Received-Date: Thu, 21 Mar 2019 03:20:59 -0000
Content-Type: text/plain

When use rootfs.img as rootfs, root=/dev/ram0 was set, init will
search rootfs.img from all automount point, if deploy it to MD or DM
device, rootfs.img will not be found, then boot failed.

Do not black MD and DM device to allow boot from raid disk or raid
LVM volume.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.blacklist | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.blacklist b/meta/recipes-core/udev/udev-extraconf/mount.blacklist
index e49349428bd3..d3ebb17176b1 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.blacklist
+++ b/meta/recipes-core/udev/udev-extraconf/mount.blacklist
@@ -1,5 +1,3 @@
 /dev/loop
 /dev/ram
 /dev/mtdblock
-/dev/md
-/dev/dm-*
-- 
2.7.4


