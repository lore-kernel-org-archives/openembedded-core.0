Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0B27198F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:35 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n204so128808906qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DS9/qMxqHadY7aOxgDrVxERRSX95wsz4WkdnSSxJe4o=;
	b=SFyMmVO6w3T9sjmSMJ80z+6h4WEg+KRDv4atpIkapMrWMAxrwQ98jQwO8qr1Uw40hB
	drBx7emdpnYQjK6XqBJ7+SKXdDFOQ5uhFYWxXSkgE6ywE7CRrYvvdRdQrbCJrWidKZBS
	nKznhUPgbCgQ3jI9miuLSYuyWSjF4uQTYYwM7Lfro2FQzwSm0Db0EXQ1YENxSF2Fv5Bg
	2tZmAa69DGpxp0LeV7gkSwmS9J0c9r7/9ZVDM3sAPHGyRoRHDGMtSwkN744+VhCRckh6
	jYnK59ymkebsvNRMMtx9cU1zoNhwbBr/0xAxNesgJSP64AUvxkKBuIsJnbt6lbA/JhTE
	+VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=DS9/qMxqHadY7aOxgDrVxERRSX95wsz4WkdnSSxJe4o=;
	b=jlHiryAXzsstNffOwp1Ewl5PZi96NLRbSvNTonvFKmlGz8VXLpgT75ywE4Pi5VQLoh
	5gMWY7ExIp/JFp6xnzQG4djsPRDYxjcR+5srRfoDd1hsbNgXvhRi8cPytYotreTgb/Da
	bG/cJLBda5Htw3W3ba9oN1f58YwjRzW/BIM5oCWIa4FW07A/gkBIXgzxYszLcyTsrX4X
	FjkAJVdU8cZ/U03/N/Bfhp6Ouj+aeiqVdTQp2UiRG6VNcTYvR5W9OkCv7EiUGmGVIgic
	PLIo3DeT7TretZ09X2JQ/C7Uz0Nwrm61SaiJUJwaVafCqdiA3K+dknegiu+cUCVDEDRm
	LzgA==
X-Gm-Message-State: ABUngvfAtf76HBaWQR6ch3NwcnGLR/zOxWBmpWDo//fe65da8gTiDzPX4LBJecLUBI4XFQ==
X-Received: by 10.25.203.148 with SMTP id b142mr7989403lfg.145.1479203556857; 
	Tue, 15 Nov 2016 01:52:36 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:36 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:04 +0100
Message-Id: <aea6bc07e436ccb210bc6b5cc3204e27325e61b1.1479203195.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 04/11] wic: fix function comment typos
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:35 -0000

Fix typos in documentation of Image.add_partition() and
Image.__format_disks().

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index cb03009fc7e3c97305079629ded7d2ff01eba4c4..9e76487844eebfffc7227d053a65dc9fdab3678b 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -92,7 +92,7 @@ class Image():
     def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
                       label=None, fsopts=None, boot=False, align=None, no_table=False,
                       part_type=None, uuid=None, system_id=None):
-        """ Add the next partition. Prtitions have to be added in the
+        """ Add the next partition. Partitions have to be added in the
         first-to-last order. """
 
         ks_pnum = len(self.partitions)
@@ -292,7 +292,7 @@ class Image():
             # even number of sectors.
             if part['mountpoint'] == "/boot" and part['fstype'] in ["vfat", "msdos"] \
                and part['size'] % 2:
-                msger.debug("Substracting one sector from '%s' partition to " \
+                msger.debug("Subtracting one sector from '%s' partition to " \
                             "get even number of sectors for the partition" % \
                             part['mountpoint'])
                 part['size'] -= 1
-- 
2.5.0


