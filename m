Return-Path: <tkilbourn@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 695126E667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 19:24:53 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e128so21124639pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 12:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OcfVo3G1d/DhuMrOY4HUA6jZVPwIK1HVtlD5A2nOGMk=;
	b=gt/sySy8bRLRFzI2BeXGuuABKps6NuPyqkhCIDEcDl5c+qcWM9tr500/CkKwuMbTdH
	zblM+2MwxsvDZmQHIbXm0QKOgLo2zZ/ykQqZQWPvN09s/hTuGCwflAvb19mFY2pUPnWI
	OdqITvAfz/BELK1SvLgDuT+B4ZxTUeOVdQxcZA9Ww9Hk8ttdbdoFl7DQYU/OGiiftbWU
	gk2XsHmVkk3AS9GpEb7sj2CVUBSEtL3kYWYuYwgU3E2OeYd1hifHgvgDFUyFpo2g9YXa
	lyVeWI9NYUxf0nbcdapbo+FVC+5RLQQiBlHF8auhSIkhuThl706dtoCk5qtdxP30aMXz
	bLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OcfVo3G1d/DhuMrOY4HUA6jZVPwIK1HVtlD5A2nOGMk=;
	b=I2T/vxoxlA9Q3LEohJv0BM87slOMDWi81gdbUC1/WyH5nioTsqtOKbdo4fFajRS6Aw
	A/aDhKzSGI1sdSbwuAV7O5RiHd46x+AXP29mqTqaY/tEp+lnTorV5IZH/PCVp1JD00kh
	mBrJ3gunuG0pjt/enxI4snufM0f6ASJRsIBLx58b8mHr3zASnCwPQX4hxvO8s2lMuKlH
	OygvkjrwxjuRT2Ha+YXWJ/49ra2vnrjydys3s7adLc+iNvQQSaW+5YvspTI4GrkzHwGl
	F0bR/RlP8AmTAXCWPPYDKStyFqmW9zjRjqwOOd4DudkoqzI/lL8LJOmOQzUt0hafQjRR
	118g==
X-Gm-Message-State: AOPr4FU/QPs6hrO3Bxmh8tLDCUeZiD25L2EIg44/THyl1j/4kIxu2nP9LcK4gSnSClq4Pw==
X-Received: by 10.98.10.202 with SMTP id 71mr3476317pfk.143.1461180294347;
	Wed, 20 Apr 2016 12:24:54 -0700 (PDT)
Received: from localhost.localdomain (c-69-181-67-47.hsd1.ca.comcast.net.
	[69.181.67.47]) by smtp.gmail.com with ESMTPSA id
	p26sm100095307pfi.84.2016.04.20.12.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 12:24:53 -0700 (PDT)
From: Tim Kilbourn <tkilbourn@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 12:25:03 -0700
Message-Id: <1461180303-2392-1-git-send-email-tkilbourn@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] [jethro] boot-directdisk.bbclass: remove HDDIMG before create
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
X-List-Received-Date: Wed, 20 Apr 2016 19:24:54 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed when rebuild:
mkdosfs: file /path/to/hdd.image already exists

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry-pick from 9abcd309c098558360cde2bff65be840ead25f83)
Signed-off-by: Tim Kilbourn <tkilbourn@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 600e21a..b324d89 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -121,6 +121,8 @@ build_boot_dd() {
 	# done in blocks, thus the mod by 16 instead of 32.
 	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
 
+	# Remove it since mkdosfs would fail when it exists
+	rm -f $HDDIMG
 	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
 	mcopy -i $HDDIMG -s $HDDDIR/* ::/
 
-- 
1.9.1


