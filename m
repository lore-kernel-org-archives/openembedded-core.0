Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPkzC-00063c-8t
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 03:37:38 +0200
Received: by obhx4 with SMTP id x4so1937942obh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 18:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=lep66r5epuvyEBM8dKx1DLBnWpzw5JObNaQNLsQzxdo=;
	b=pFCfk2N6uE9O+/ZdiHG8wQZmP9bu/xFP27PtsqJ5PGG+eI6e4kXQkElUqx5hNQqU4U
	GKayddrSGhiB/zu1HSZZ8QgB6IztCHKR1mrnV+BGvXS5vLWDBevNqA1LMgkzdwrpDqR7
	rh+8Ydw8JWmu8WscKhjYZx+Mk+M0lkKxinH+IvO4oyujZMuS+l2Ab3pPzpKuEl6Ph3E6
	6E3fUbtbH5hBNDl4yVLpNDp0aRz+OOgbledwYq0ozA2JDxqiTdNSS8ukd/JpULp7dSnC
	6tnTrMgRA+tT4Aj/OiMos69fFJIJsrLvnRqB153JKZi2GNo0SiZzlzrM6YMWj3sIhyZM
	KM1Q==
Received: by 10.60.2.6 with SMTP id 6mr412641oeq.21.1336008472689;
	Wed, 02 May 2012 18:27:52 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id il8sm4005546obc.18.2012.05.02.18.27.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 18:27:51 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 20:28:34 -0500
Message-Id: <1336008514-26806-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] kernel.bbclass: move kernel-vmlinux up in PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 01:37:38 -0000

If KERNEL_IMAGETYPE is vmlinux, the expectation is most likely that there will
be no kernel image package, but we still want a vmlinux package for debugging,
so move kernel-vmlinux in front of kernel-image in PACKAGES.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3519e7c..d81b33c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -247,7 +247,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux kernel-misc"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-misc"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
-- 
1.7.7



