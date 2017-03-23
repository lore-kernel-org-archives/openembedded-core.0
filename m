Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 78AC777B12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:12:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u132so16139859wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=eTiCAMTq5/odvKSZnby3L/DynEMMjy7kRIesiruW/3yOUSAJICLI0IDYBpBliBE1TR
	NqpXHb03OHjzEZFgoH6z1f9i8Adh0RkOrsyVla6MHhRgg/dOXexVvwFPla38TRZyurKR
	RRrgam1DSpMgmh+aeGhcD1JiogwOc/pCMwsabrfWwGxyhgTge74gB5uTly5YG7vyPxY8
	GpQ26C3eCJt18GWLuNPyh0Ir+5KQ9+SH9eJV99/zo+1KNGJslvVR4fZDUyNng6lgmh6Y
	4gwtyDAZzvN7hHbaAI0CKZ6kOS8+6kaKzc7MzEtfqdGOCdiZ4Dq7pDBh3BW+g3hFLZEE
	lR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=HsJA9KTAfPAmQim/hDQjhklS1LQvC9e2uCBrS5VL5EC/z8vET/7t8aFKCc8mWv2DXm
	YoucREMGVfvwlgCkwDPN4lXQhCMRK6hPo2eBo4JwTQ41a2IaU5p7C/yHZpJYBWQINHSb
	IC61tOyQIn+l4B7dsxA+QuttNX7oemogmpYxIxT372EKF0YEyQEVTwuBT3NnQQS9mc7O
	QS6zHgpol8Pju32jAViBhKzO/EjK6EW8uI21XJQ1njajfMyDMCfe3gM0TKSmfYg9HxRa
	nHG/1qz0f3MC56WkkgEAA8GUW9wApLzP1FJoo/KYMLgCtbMb/5veuWUTij/qizk+O5Cj
	vyGg==
X-Gm-Message-State: AFeK/H3rJERB+DKnlieHBAWerWG8f5pEkGLHKJXeeiHz/3IRvwP9SfxXLfuZJXQfx6iZaQ==
X-Received: by 10.28.60.66 with SMTP id j63mr2648220wma.74.1490271122890;
	Thu, 23 Mar 2017 05:12:02 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	k190sm4093773wmg.10.2017.03.23.05.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 05:12:02 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:11:14 +0100
Message-Id: <1490271075-3490-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
References: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V4 3/4] image.bbclass: remove initramfs bundle related code
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
X-List-Received-Date: Thu, 23 Mar 2017 12:12:02 -0000

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


