Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4CB601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:56:27 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id c13so142838328lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 07:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DS9/qMxqHadY7aOxgDrVxERRSX95wsz4WkdnSSxJe4o=;
	b=K1KYCipfuVr8Vecazs1GqNQbSWS0VzDJaMjXXQN+X3EabwVP1PRnrJJDvLIZoxh2y7
	/Q5oHI1X8+OOFjDMrXlG3DqFPfitsju2TotnO6ONvTgYuWcSOms9RpiBUIsS/0dcM2Jo
	jAPmN+GFPChiVDONbF6P/1T021Vc3TR2g58PZEo0tH9lWZGNASmMaMvumAVmiJgCdVf+
	9C8qbfX29cTqwzCbYgqk3CdNU2cIG7s2QmIpovoTa53whGEa21fy6F3X5N21wmUQkob2
	OaO39dG+pJV/3k0cNmxdWtNy6RUAr5X3YO4ht8YYGzcYa+oQadbpkJquDg8atQiFaKbG
	kI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=DS9/qMxqHadY7aOxgDrVxERRSX95wsz4WkdnSSxJe4o=;
	b=PLZ0F6cJCuxKX4rZX/+v2w6upwG5nmK2jnPtjdWpbJV8JIzXEsGjA2ZnT2QkX1YLdc
	0AOPYKAS9pO/sdXDwwjzVe1ZcC+w4A3m8Ohk4qH3J3UmUs23X8OL+j4KrS3wFHA0MOi0
	c1MD0tKuhLPa8VbYkCIspDwPQPlRs61B5CrK86g7CSAxei/zIU5hp86ay/AUlWjOfCiW
	rZTFKsQg5G8Ajr2Whe65Qg1lT/PqvUNi3UyhUXT5MAibHmvgS84Ng7lP7n57cq2PboN/
	9rVPhieELvMNcYdpFuAilV9n6HHEZjgIICuFpM538AK0sUOEKx1YzRhG17vQgCvgIrYL
	Rzgg==
X-Gm-Message-State: ABUngvffc4wSYthH+PkWBHLx6fYgD37TpobHZMcWte5RIyMMBohBl0/wAF9Rxn37Lu15uA==
X-Received: by 10.25.198.132 with SMTP id w126mr7757920lff.175.1478620588819; 
	Tue, 08 Nov 2016 07:56:28 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	h95sm2976939ljh.13.2016.11.08.07.56.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 07:56:28 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 16:56:10 +0100
Message-Id: <23ece3e64cd55f674ab5b94de01f8dac0940512a.1478619682.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 4/5] wic: fix function comment typos
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
X-List-Received-Date: Tue, 08 Nov 2016 15:56:28 -0000

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


