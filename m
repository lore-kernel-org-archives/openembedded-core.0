Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE2078305
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 17:14:34 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id t139so1645501ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=prebxu1LIied0XJDCmWT6w8jYtsvzmdsqBaDx3hOsHg=;
	b=JyLgSomR/MYKIwUdWWKnA8sQ1EBdq3EIm1uxzbEg6CuOeo0HKDRulVpwEf5hFdAwKI
	RbrrDNOaWSq5VvBdjFZn5D85VbdJYj0JeEc+RNRriPbZjv240+O09Wku4+QuJCepgt2n
	g9qX1iZPFEgnp+A73MfoNZlmVj3PMJv9oSRzYdjwejsYvBwtStpg4laWHZww3Qj7/Xji
	4L5xECKZupY9RYS2rGuCTclgGPF2AX+9X8ueMgsgNtqgLQFckSt08yS53GoARvmUg5gu
	WT3cUtgrAdYjAuyNgjYuzSpQENqDpmhPASyAEkSPCpN1EQhr2IgHC8Hqlx8Xk/5HHp9p
	AWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=prebxu1LIied0XJDCmWT6w8jYtsvzmdsqBaDx3hOsHg=;
	b=ErnESTlhfDHn6S48eeBNG0FxMqOx5HVfnVb7Tbw3HxBjSVLITstktZLewqFs0IIHBD
	VmunBC+gcKNG1cN7FEdp61mX2zxVvng/oDeamsbfM6c1FfLIEeKVPZr2cNKgkh1WYng1
	idotS8Y2mLSqp3B7bEW3sKrqGn8yBgSs+VL7NLhownuHMKUaQAvlVXrCVWQVaPHlnXnJ
	/Ll+NyXLFl3cvllmZCApldlFRYXxjYh1YfsOnqvuYnBlBryfe1hWl/giGvUOm6kRL0cd
	PyStec3m3SvJ2dtXVVf0krPeDGUniXlpGUd5z+RX04hkkQvmxqwPz3Aikbl6Ykzhopk5
	xUvA==
X-Gm-Message-State: AIVw112QbFGsG14o8Dy0twGho/BYGh3QUbupdEzWqrcCZu177BJnBBnC
	suJG0rLXQtM99dnv
X-Received: by 10.129.174.26 with SMTP id m26mr17161251ywh.340.1501607675868; 
	Tue, 01 Aug 2017 10:14:35 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	r64sm10946066ywd.107.2017.08.01.10.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 10:14:35 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 19:13:47 +0200
Message-Id: <1501607630-30241-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 1/4] wic-image-minimal: drop WKS_FILE_DEPENDS definition
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
X-List-Received-Date: Tue, 01 Aug 2017 17:14:35 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

It's being set in image_types_wic.bbclass, not need to double set it
here, furthermore, the dependencies are incomplete by missing
e2fsprogs-native.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index e1da203..af40d96 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -6,8 +6,6 @@ IMAGE_INSTALL = "packagegroup-core-boot"
 
 IMAGE_FSTYPES = "wic"
 
-WKS_FILE_DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gptfdisk-native"
-
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 IMAGE_ROOTFS_EXTRA_SPACE = "2000"
-- 
2.7.4


