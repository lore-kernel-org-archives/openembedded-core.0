Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 854CD74740
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 03:31:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4N3Vv8u014904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 20:31:57 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 May 2018 20:31:56 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2018 11:31:54 +0800
Message-ID: <1527046314-454-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemu.inc: Change kernel provider assignment to a weaker one
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
X-List-Received-Date: Wed, 23 May 2018 03:31:56 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Currently we have local.conf included before qemu.inc, and ${DISTRO}.conf
after qemu.inc. They both possibly specify their expected kernel providers.
To let other config files override it in real use, this commit changes
kernel provider assignment to ??= .

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index aa332fe..5050e41 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -19,7 +19,7 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
 
 # Use a common kernel recipe for all QEMU machines
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
 
 EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
 
-- 
2.7.4


