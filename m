Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0341F71994
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:51 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id t196so188555653lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DS9/qMxqHadY7aOxgDrVxERRSX95wsz4WkdnSSxJe4o=;
	b=kGwfArsqzmp5qJL3IO4b7Q7sEpu0k2yajNSNo6OW0nbE/I8r7rioSwZ/OKEHSsIqbt
	1iNpAR3L3Zk0S1GpkeNf1h+KiZ2hU4UTjDdrOhl/i7PXafiAxA7bb1bzWTj2yXsfq4gg
	VFjN4bNeVgunnzV0Ju1KJ87JFvg1xWn+Qz0SHrhWBYkrOHWeOFFvNKK07vSWajEKd9uZ
	3L0K1HuCMFOorBhC17ii8DArf3i+DaRDd+KNP8Pi2v1IN2+m8kq4OMaGJDjQ45YzuQSa
	+DIIjYw0Qxj4NhCx3gUeJClskvbOKRuWe2xtCKCKDVjpo9oJ27Q5HWYFnUZUvDDXUZAE
	i7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=DS9/qMxqHadY7aOxgDrVxERRSX95wsz4WkdnSSxJe4o=;
	b=cEgTfdLAcixUbM+9iDxpfad4TLAp+nnjoBzF84KuYmEhkyfT1KVeK8hKumsD5joK08
	X/j3JKycZ+++k0SaP4yWe1/+izihG6WVSz2S5QWDty157UxFuTAWzVWBMMjVV3Tkx85n
	LUsvnrpxghaCjLWgDruHfuUojBw6/adr12xLXhdJWdaoKK42jkKnO+xsrJDCv7L2czMR
	6FixALois5QkqNFWnCfD5RmrEPiiS23Zk/sgNyDhE37NG4AxJw8KquOzKGO7+NGgjSTc
	pM6LrfgDDji4jiPtkrpqemmTBTwjp+XPevnv++x6y+8/WAThaX0TjWhLGm3mAHa50kJn
	OAhw==
X-Gm-Message-State: ABUngvcVFL7nCVWNY1WgZD6zQy7ARHtAm3lFMQMp7Aj/8va1FNJA2q+o0Kn8R6OtDFUdQw==
X-Received: by 10.25.39.13 with SMTP id n13mr2715298lfn.34.1478780332968;
	Thu, 10 Nov 2016 04:18:52 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:52 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:35 +0100
Message-Id: <aea6bc07e436ccb210bc6b5cc3204e27325e61b1.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 04/10] wic: fix function comment typos
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:52 -0000

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


