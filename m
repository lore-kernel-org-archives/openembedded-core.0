Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFE977BDA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:19:21 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p52so9792517wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gYBm2skFa0rOKkamBmcUzl69zFLKOJBaQZcUBp2+O44=;
	b=VFErlPJ0dgzQKMzQkqFph1XaVsMODj5FVpuGCBtpzthFIG2ZHnEU3VSLJ1ALaDxDL2
	Mp8ERq1q3skKFxtcNozIiF6cw55+qbDOcXcm4CG6FtO/iXZNQ7Seh7bYbm+p+e99ShAE
	eNYuo2VUpQrW/p0IkcWlOZgrqDzRQLChVZPHhNY8znrEKp5TnBjuAEaCNC2cIvpwrjQq
	9HKLVbMraKiRBsKL8zZeqIS09ZcrjN3GzL2GAS3Tq1Cfwbm1r5cO+46dln0NlA4t7/pl
	XtkmqFbHHlGMdm2UEV56KeEHS7ZQ9La2ibYOLIX3TdCVBO5Bo6+j1GoT59LOn5hpnrZc
	0NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gYBm2skFa0rOKkamBmcUzl69zFLKOJBaQZcUBp2+O44=;
	b=VP8RraporR8wZmnCJSoawjXdKE4QT+MlhcaMbWcvK9ANbm3veVKxryV+ZzxXjtCnf1
	zpMeYOE2R2jsDQAzEn80brT72XCzGNBgVO4ef/Xb9VbZrAeEnlTFa1THQw40RYN2OIwv
	RV5JRB+NTI0Yj1731JRHhj5lVjVwheyxASPW7TlJRRwPmdjhklK0pY0IdYqcIfkNFm2C
	w+ys/S4tmmOlWekKHKEepGbxD/V90WhHybDlL/lG4NboPtuyMw8BUL2+6yczSp87b+rL
	+kkIVYT9c0u77h7/8cBy/aaZbXAVfs5AkbBesYQVWIrUxk0RDcKGQfjscA1+VC7YNDy5
	lJgg==
X-Gm-Message-State: AFeK/H3Cuj8GFZGG5yyprsudk5TEAhU9YhugY7F4PeAROv7Fd1rZrxmM0qBEBPrL9MDR+Q==
X-Received: by 10.223.151.217 with SMTP id t25mr4306257wrb.105.1490861963110; 
	Thu, 30 Mar 2017 01:19:23 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.149])
	by smtp.gmail.com with ESMTPSA id q29sm1816289wrc.1.2017.03.30.01.19.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 01:19:22 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 10:18:56 +0200
Message-Id: <1490861937-2394-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490861937-2394-1-git-send-email-liu.ming50@gmail.com>
References: <1490861937-2394-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V5 1/2] image.bbclass: remove initramfs bundle related code
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
X-List-Received-Date: Thu, 30 Mar 2017 08:19:22 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The original purpose of these code was to repackage initramfs bundled
kernel before image do_build, but it does not really work because the
initramfs bundled kernel images are not packaged at all after commit
a49569e3a7534779bbe3f01a0647fd076c95798d:
[ kernel.bbclass: do not copy bundled initramfs to /boot ]

[Yocto #9233]

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


