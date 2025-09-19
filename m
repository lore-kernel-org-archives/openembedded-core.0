Return-Path: <thomas.witte@liebherr.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E6ECAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:05:46 +0000 (UTC)
Subject: [PATCH] runqemu: add erofs filesystem types
To: openembedded-core@lists.openembedded.org
From: thomas.witte@liebherr.com
X-Originating-Location: Ochsenhausen, Baden-Wurttemberg, DE (193.27.220.234)
X-Originating-Platform: Linux Firefox 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 03:05:34 -0700
Message-ID: <EO41.1758276334990613454.zGhU@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 10:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223734

runqemu does not recognize erofs, erofs-lz4, and erofs-lz4hc as filesystem =
types. Add them to start from an erofs filesystem without needing the full =
path.

Signed-off-by: Thomas Witte <thomas.witte@liebherr.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c24528eac8..32c7a2aab3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -202,7 +202,8 @@ class BaseConfig(object):
                         'jffs2', 'nfs', 'btrfs', 'cpio.gz', 'cpio', 'ramfs=
',
                         'tar.bz2', 'tar.gz', 'tar.zst',
                         'squashfs', 'squashfs-xz', 'squashfs-lzo',
-                        'squashfs-lz4', 'squashfs-zst')
+                        'squashfs-lz4', 'squashfs-zst',
+                        'erofs', 'erofs-lz4', 'erofs-lz4hc')
         self.vmtypes =3D ('hddimg', 'iso')
         self.fsinfo =3D {}
         self.network_device =3D "-device e1000,netdev=3Dnet0,mac=3D@MAC@"

