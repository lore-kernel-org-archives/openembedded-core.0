Return-Path: <kec_temp_wr@comcast.net>
X-Greylist: delayed 492 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Jan 2016 21:25:52 UTC
Received: from resqmta-po-08v.sys.comcast.net (resqmta-po-08v.sys.comcast.net
	[96.114.154.167])
	by mail.openembedded.org (Postfix) with ESMTP id EDFDD73289
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:25:52 +0000 (UTC)
Received: from resomta-po-10v.sys.comcast.net ([96.114.154.234])
	by resqmta-po-08v.sys.comcast.net with comcast
	id 4MHh1s00253iAfU01MHhtQ; Sun, 10 Jan 2016 21:17:41 +0000
Received: from [192.168.212.63] ([68.83.90.217])
	by resomta-po-10v.sys.comcast.net with comcast
	id 4MHg1s0064hNHd801MHgBW; Sun, 10 Jan 2016 21:17:41 +0000
To: openembedded-core@lists.openembedded.org
From: Kevin Cribbs <kec_temp_wr@comcast.net>
Message-ID: <5692CA73.4080400@comcast.net>
Date: Sun, 10 Jan 2016 16:17:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1452460661;
	bh=IJ21jgL4tq0RDbS92YaUcIZszs1a0xPgbi9iIWE4T7Y=;
	h=Received:Received:To:From:Subject:Message-ID:Date:MIME-Version:
	Content-Type;
	b=pvK/qQkh+ZiAt0xKR4Z9eXT0FrucfVFjafei7huBw9rM8BAUkrcKdzLwW5ywRL+KG
	HBlQRqgKJnVSYaSbF9f84LRxPC0WGuQbbQyyLmMrjGNGC+3H3TBqHopquVguOyZuM+
	/DMJjmcrMvyMLyuqC1dKpcQCn9s+qDmFUtaIf/ai0BCFiMYMLGdbdO9C4VozmSbYoS
	y5r7o+Y24iEhgjtZEF76NRLq5AKYDEx5Su+2579KQyWRlNahusAYN71dktjFXZinkt
	wFGHV4rYDo0owEiV3pm9GX8ouDahmA0mDOAwqQmFyWU22zS+J6RQhvzMLAL/uENRzH
	SWtm/9tRCmVTA==
Subject: [PATCH] Add squashfs-lz4 support to IMAGE_TYPES.
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
X-List-Received-Date: Sun, 10 Jan 2016 21:25:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

 From 88993b84808dd7dc0549ea09b12bd4091f818889 Mon Sep 17 00:00:00 2001
From: Kevin Cribbs <kec_temp_wr@comcast.net>
Date: Sun, 10 Jan 2016 15:35:27 -0500
Subject: [PATCH] Add squashfs-lz4 support to IMAGE_TYPES.

---
  meta/classes/image_types.bbclass | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass 
b/meta/classes/image_types.bbclass
index dea3bb0..e44456b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -79,6 +79,7 @@ IMAGE_CMD_btrfs () {
  IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} 
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} 
-noappend"
  IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} 
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} 
-noappend -comp xz"
  IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} 
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} 
-noappend -comp lzo"
+IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} 
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lz4 ${EXTRA_IMAGECMD} 
-noappend -comp lz4"

  # By default, tar from the host is used, which can be quite old. If
  # you need special parameters (like --xattrs) which are only supported
@@ -227,6 +228,7 @@ IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
  IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
  IMAGE_DEPENDS_squashfs-xz = "squashfs-tools-native"
  IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
+IMAGE_DEPENDS_squashfs-lz4 = "squashfs-tools-native"
  IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
  IMAGE_DEPENDS_ubi = "mtd-utils-native"
  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
@@ -243,7 +245,7 @@ IMAGE_TYPES = " \
      btrfs \
      iso \
      hddimg \
-    squashfs squashfs-xz squashfs-lzo \
+    squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
      ubi ubifs multiubi \
      tar tar.gz tar.bz2 tar.xz tar.lz4 \
      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
-- 
1.9.1


