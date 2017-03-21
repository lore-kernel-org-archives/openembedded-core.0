Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id BD20D779DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 00:55:38 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g10so20508312wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 17:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=lJBk6E6LIQJRcezSbSPTZTKnJrmG0rpDZJCjVqJCd/B0qb8tZAAzjtnkmBaDhGo36G
	eQCX0vsG3ZCtsvWKIZEz+mIa7bFyykaigXL+kWEuUQQr17HCpnuweAOpGh6itH+b6UnL
	MPnyo5cxdbijDjd3P6PfRJVlEvB0iq0qUfRVBhAI3TaQQYVozLvATQRIcAGEnPAv8iLB
	lX2sFZZ6FhradjVauSxxLn/48WHF9ZtakgNnivEZXEqAVKnvmzLzWLKEEpTWvghELLgN
	ZjL8ZmxE1gQM7NV4IwCdF5O0pNTrSJi0yRwv6oVX/oCXhlSJJTSD8OxzVHIq9Ii9H6CA
	pl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=m+NU9fsGTq0tLXcUpOBuNUmZzUtPjF/SstSXzZ2UYORGLGG6Tzi4wGgtFpxxkXG1Ia
	yOsnWUAfMq9LThbfJPIWhbuOMVbof7SbeD8pjrx+jhq0IRqFHqjlJbjqKbArnTbuRsKN
	6ZXDkY3WVLDut7aiXrViUgY9JS67vSzh1jltyvZItnxGp+RI74da6CTbD1k9b2YC1zKn
	jPGo3CCSMzsBvst8/Rj1BD9x1Z7ZC8Ncm2M9n2EOD2SwOyJCyppdsn2lAYzMgwxkTwGv
	30Gw5jGpqmDYDr2Bykc2u989hBvpWY+zKt+plDPMNNF8UxQzhC+i8gOkz9wVpbtcfOSZ
	h/WA==
X-Gm-Message-State: AFeK/H0Xu0vwUyNBzt08Qk0PinsCz6WAaOWeA0otQRcEkz5Q8A6EtIWURGGWfbqwG0VZXA==
X-Received: by 10.223.165.74 with SMTP id j10mr26222061wrb.143.1490057739184; 
	Mon, 20 Mar 2017 17:55:39 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([223.104.101.84])
	by smtp.gmail.com with ESMTPSA id 10sm8882258wrz.44.2017.03.20.17.55.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 17:55:38 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 01:55:02 +0100
Message-Id: <1490057703-12819-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
References: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 4/5] image.bbclass: remove initramfs bundle related code
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
X-List-Received-Date: Tue, 21 Mar 2017 00:55:39 -0000

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


