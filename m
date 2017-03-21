Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD4A7776C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 14:35:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x124so3269060wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=m0IiRHKFuJeTFI852pU78VyLL1WVUdE16VAmb0KsL6GGXXKNIGXGcyBaptEn0PI+Ry
	Od+6ckQnUPugwHnu5/bjaTeazrjhdry+MjTASFkP1QGzehLXD0bVsM3m7IWmGSgRHYMa
	hS9BdP9yBa4SjB0DWAzeTSiKTOc48RHT2KNfjva+ETdWT/zc/rk22gl9gvT6pmORJa1R
	4v98HtPG2vPCUOgJ5mvtt+FAETQ7g4pEmTeJJ9M0irYR1Zv1F5kZQDrLQmELQdScj/9Z
	NVIdHQbwH/EiDhMYj0gM8MhTxjbrIsY8AanHubuqRP7RPON/d7ERzBz4rREoRMIEywfP
	NMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=R+DccZMhpwMHLm59HCvPFLyKAc96gL+vY0HNMKx/71nQikvLVzjAqbYVBFrG1CGADO
	+vxHFRz0vVEVtelak5Wm2N6QhjgmxsbhrfqrYR6EeVagX1m3qOx4Ei6CU9jMZdA0Nzlt
	NI5ONLbHEYCUjPKr4xNHYWgbQaxRR+/V9kehDbmePFrjMkh+7Oo+Gd2LISNk5OGcEDxj
	WSDJPjwjhOxzKrR3IlQlewOK3cr9ZGhxDRnr1wBBWed4P0FOpDIOfaAIlQSexDX5afu3
	giFWEZF3Ux5AxwjAAoMR7botXt344j3GahJf3aoKKUegGxMSY7F3Aj5tFOW0gFTXdcKY
	n+4w==
X-Gm-Message-State: AFeK/H2TZywvYHQZFavIE1OZ4fOTvWjacGNFUzPCZBU1sOgWvz4lmi+H/wxZVYSH3aC2Bw==
X-Received: by 10.28.16.149 with SMTP id 143mr2960874wmq.42.1490106919058;
	Tue, 21 Mar 2017 07:35:19 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	u41sm25225692wrc.24.2017.03.21.07.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 07:35:18 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 15:34:50 +0100
Message-Id: <1490106891-13909-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
References: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 3/4] image.bbclass: remove initramfs bundle related code
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
X-List-Received-Date: Tue, 21 Mar 2017 14:35:18 -0000

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


