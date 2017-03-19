Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8E777734
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 13:14:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x124so10219996wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=Ice/ZbHO69rL5JQl6uKNFM74D2dEPxTBYVSyWe5e3PXPP3crfbDuFmI+qq6Dy8m36f
	4Io42geP8rgI5NmGWnjHEmg3QSlyAtURezktBUtN5JbD/G7e1UeaCkbaMsz8LAW5GU/z
	cO19EX4VJS8eQgTmaLJ4g+2Ub/1fRwDNRjt1RhSwmkGfmZuR15mvSTwVZDAitKHsiFh+
	RPXIMqunm1DUYKrpmn/6/Y6yIhSw/WnGQGp9BEQh2qAAO1Yn8/CT+S8wQ887EAX9QZMR
	DyAW6Jfp3+6fCOWWTzzXVFtOYt9kQdRB8I6loVC1LMlFt7tXm5o0trIWKChg4Q3gnkIj
	juVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEL2yPU3PbqD7W/xxN5STv3coe/GTMf3YHqEgKEaTFU=;
	b=IrG7ipZmXdgVEkvddzD09CLGwElxzeQN5+qZWI0LM3SDVISIf8MviIwBjOXmKkyB3m
	kcnFiZQV4FjBQbvvjc3ramxlAkNYZXDFeFRu21jP9H6YlUEdTtIvaSeai2oFOaxopRnM
	LHOKV9Q8EiSFWzg+C/yX4BfuhrfT7oMhh3O/UFbmk0L6RYCxGlO9it/CGjyKR8HrenVi
	ugkmYQVbigZlkrGPLHKGIq7LJmTA2wt8wJtB2FVpq+UZyDMbw/v7lwY/jDuechK4EyP7
	c+6phLyD8npvAJuprXEnTQ/NQohDX31/tEIYXXWhcV+kfs8VWQYrTTq8kuRhgsYuGYln
	ZbJQ==
X-Gm-Message-State: AFeK/H0l48wNm7yFTWACj7NhEnSSoEGglC/bI0kqMa5SwDHnlWhZvHwtgNlRU959IWSZtQ==
X-Received: by 10.28.138.134 with SMTP id m128mr6128285wmd.121.1489929253880; 
	Sun, 19 Mar 2017 06:14:13 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162])
	by smtp.gmail.com with ESMTPSA id 36sm1114616wrk.15.2017.03.19.06.14.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Mar 2017 06:14:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Mar 2017 14:13:36 +0100
Message-Id: <1489929217-24568-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
References: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
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
X-List-Received-Date: Sun, 19 Mar 2017 13:14:12 -0000

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


