Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5660277E5C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Apr 2017 16:43:57 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o21so18735999wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Apr 2017 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=jGxZqoCdA03+pHNrM4WlsWdfFWdTzXTGNj9MOMzLhAXj8PRepNi1xnK9Litxa/LKvT
	q0ZjXfcuQI1SzzFVr1JN7EhAzufUr2w/6U3aW0+1t7qCKWm1esv0XDqmS40JaUY0aQVl
	AAJ1Gje22ib50bXj+GGj2ZVcisadLoSzPLMSrQno8m6EnPhQ1KtuDO6zW8BnGAcx3kr8
	NVbsabO/RgBj/75QWJ44/A4IjXin6louDw81b0I5DE7wFIYjxB9LrribnxQE9dxFXfvc
	JnMnRnZMXXgoCyd5Nd/XunmA10+GmBEL3Y6iBMjLyATHiPpuAVnqV2Ze8xtt5lDVJMld
	OXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=nYwmlFFP250vOWXSx+E3KWHiIaI/Ebk356vcOkFaF1d3uMy8iIwVombQm52UejSsQ7
	tKMWdix94ZTY3i+8DY2R3+5P5d/M6iLsU4a9ZqaRPGk3QOojze6pifRi7yo4RIJeCFYU
	iVNJoOmihI6XiYIRGuITvrmBXZc1LTi6CwlK+F7iaHdc+hHxSp1rZHqGkM6cd7frlyEU
	2u424Fg3jrVwKwd5jVNriD4GCDhofOyI74JCm1p27X3hDIfxl9JsntxugXS0yubPHxJP
	FdqPgJrGGaAFO+Hj05KRc1PIpvI9bivc+n0kf4n76QXylAfrtJdXc3d3YJvaUb3DZQHG
	bJJA==
X-Gm-Message-State: AFeK/H2l3G2XHZ5rnniPFxSc2PUCDnMTamy3g3d//S71wnY+pDFziyWDlIxMFyp/L8H0Ig==
X-Received: by 10.223.153.18 with SMTP id x18mr17381305wrb.55.1491669838233;
	Sat, 08 Apr 2017 09:43:58 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	t16sm10441914wra.44.2017.04.08.09.43.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 08 Apr 2017 09:43:57 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Apr 2017 18:43:44 +0200
Message-Id: <1491669825-17958-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491669825-17958-1-git-send-email-liu.ming50@gmail.com>
References: <1491669825-17958-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V6 1/2] image.bbclass: remove initramfs bundle related code
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
X-List-Received-Date: Sat, 08 Apr 2017 16:43:57 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The original purpose of these code was to repackage initramfs bundled
kernel before image do_build, but it does not really work because the
initramfs bundled kernel images are not packaged at all after commit
a49569e3a7534779bbe3f01a0647fd076c95798d:
[ kernel.bbclass: do not copy bundled initramfs to /boot ]

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..bc00884 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -184,10 +184,6 @@ python () {
     d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
 
     check_image_features(d)
-    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
-    if initramfs_image != "":
-        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN'))
-        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
 }
 
 IMAGE_CLASSES += "image_types"
@@ -608,12 +604,3 @@ do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
-
-# Allow the kernel to be repacked with the initramfs and boot image file as a single file
-do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
-do_bundle_initramfs[nostamp] = "1"
-do_bundle_initramfs[noexec] = "1"
-do_bundle_initramfs () {
-	:
-}
-addtask bundle_initramfs after do_image_complete
-- 
2.7.4


